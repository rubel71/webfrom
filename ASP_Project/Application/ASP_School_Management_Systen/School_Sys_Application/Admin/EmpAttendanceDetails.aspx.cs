using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using static School_Sys_Application.Models.Commonfn;


namespace School_Sys_Application.Admin
{
    public partial class EmpAttendanceDetails : System.Web.UI.Page
    {
        Commmonfnx fn = new Commmonfnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                GetTeacher();
            }
        }
        private void GetTeacher()
        {
            DataTable dt = fn.Fetch("Select* from Teacher");
            ddlTeacher.DataSource = dt;
            ddlTeacher.DataTextField = "name";
            ddlTeacher.DataValueField = "teacherId";
            ddlTeacher.DataBind();
            ddlTeacher.Items.Insert(0, "select Teacher");

        }
        protected void btnCheckAttendance_Click(object sender, EventArgs e)
        {
            DateTime date = Convert.ToDateTime(txtMonth.Text);
            DataTable dt = fn.Fetch(@"select Row_NUMBER() over(order by(select 1)) as [Sr.No], t.name, ta.status, ta.date from TeacherAttendance ta inner join Teacher t on t.teacherId =ta.teacherId where DATEPART(yy, Date)='"+date.Year+"' and DATEPART(M, Date)='"+date.Month+"' and ta.teacherId='"+ddlTeacher.SelectedValue+"' ");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        
    }
}