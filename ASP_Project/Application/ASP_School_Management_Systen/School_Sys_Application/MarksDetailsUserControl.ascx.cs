using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static School_Sys_Application.Models.Commonfn;

namespace School_Sys_Application
{
    public partial class MarksDetailsUserControl : System.Web.UI.UserControl
    {
        Commmonfnx fn = new Commmonfnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                GetClass();
                GetMarks();
            }
        }
        private void GetMarks()
        {
            DataTable dt = fn.Fetch(@"select Row_NUMBER() over(order by(select 1)) as [Sr.No], e.ExamId, e.classId, c.className, e.subjectId ,s.subjectName ,e.rollNo ,e.totalMarks ,e.outOfMarks from Exam e inner join Class c on c.classId =e.classId inner join Subject s on s.subjectId =e.subjectId  ");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        private void GetClass()
        {
            DataTable dt = fn.Fetch("select* from Class");
            ddlClass.DataSource = dt;
            ddlClass.DataTextField = "className";
            ddlClass.DataValueField = "classId";
            ddlClass.DataBind();
            ddlClass.Items.Insert(0, "select Class");
        }

        protected void btngetMark_Click(object sender, EventArgs e)
        {
            try
            {
                string classId = ddlClass.SelectedValue;
                string rollno = txtRoll.Text.Trim();
                DataTable dt = fn.Fetch(@"select Row_NUMBER() over(order by(select 1)) as [Sr.No], e.ExamId, e.classId, c.className, e.subjectId ,s.subjectName ,e.rollNo ,e.totalMarks ,e.outOfMarks from Exam e inner join Class c on c.classId =e.classId inner join Subject s on s.subjectId =e.subjectId where e.classId='"+ classId + "' and e.rollNo='"+ rollno + "' ");
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            catch(Exception ex)
            {
                throw;
            }
        }
        private void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
        }
    }
   
}