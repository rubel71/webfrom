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
    public partial class StudentAttendanceUC : System.Web.UI.UserControl
    {
        Commmonfnx fn = new Commmonfnx();
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!IsPostBack)
            {
                GetClass();
            }
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

        protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
        {
            string classId = ddlClass.SelectedValue;
            DataTable dt = fn.Fetch("select * from Subject where classId ='" + classId + "'");
            ddlSubject.DataSource = dt;
            ddlSubject.DataTextField = "subjectName";
            ddlSubject.DataValueField = "subjectId";
            ddlSubject.DataBind();
            ddlSubject.Items.Insert(0, "select Subject");
        }

        protected void btnCheckAttendance_Click(object sender, EventArgs e)
        {
            DataTable dt;
            DateTime date = Convert.ToDateTime(txtMonth.Text);
            if(ddlSubject.SelectedValue == "select Subject")
            {
                 dt = fn.Fetch(@"select Row_NUMBER() over(order by(select 1)) as [Sr.No], s.name, ta.status, ta.date from StudentAttendance ta inner join Student s on s.rollNo  =ta.rollNo  where ta.classId='"+ddlClass.SelectedValue+ "' and ta.rollNo='"+txtRollNo.Text.Trim()+"' DATEPART(yy, Date)='" + date.Year + "' and DATEPART(M, Date)='" + date.Month + "' and ta.status =1");
            }
            else
            {
                dt = fn.Fetch(@"select Row_NUMBER() over(order by(select 1)) as [Sr.No], s.name, ta.status, ta.date from StudentAttendance ta inner join Student s on s.rollNo  =ta.rollNo  where ta.classId='" + ddlClass.SelectedValue + "' and ta.rollNo='" + txtRollNo.Text.Trim() + "'and ta.subjectId='"+ddlSubject.SelectedValue+"' and DATEPART(yy, Date)='" + date.Year + "' and DATEPART(M, Date)='" + date.Month + "' and ta.status =1");
            }
            
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }

}