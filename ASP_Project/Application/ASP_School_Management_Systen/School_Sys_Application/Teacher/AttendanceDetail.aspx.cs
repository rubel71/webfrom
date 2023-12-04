using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static School_Sys_Application.Models.Commonfn;

namespace School_Sys_Application.Teacher
{
    public partial class AttendanceDetail : System.Web.UI.Page
    {
        Commmonfnx fn = new Commmonfnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                GetClass();
                //GetTeacher();
                btnAten.Visible = true;
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            lblTime.Text = DateTime.Now.ToString();
        }
        //private void GetTeacher()
        //{
        //    DataTable dt = fn.Fetch("Select* from Subject");
        //    ddlSubject.DataSource = dt;
        //    ddlSubject.DataTextField = "subjectName";
        //    ddlSubject.DataValueField = "subjectId";
        //    ddlSubject.DataBind();
        //    ddlSubject.Items.Insert(0, "select Subject");

        //}
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

        protected void btnAttendance_Click(object sender, EventArgs e)
        {
            DataTable dt = fn.Fetch(@"select studentId ,rollNo ,name ,mobile from Student where classId='"+ddlClass.SelectedValue+"'");
            GridView1.DataSource = dt;
            GridView1.DataBind();
            if(dt.Rows.Count>0)
            {
                btnAten.Visible = true;
            }
            else
            {
                btnAten.Visible = false;
            }
        }

        protected void btnAten_Click(object sender, EventArgs e)
        {
            bool isTrue = false;
            foreach (GridViewRow row in GridView1.Rows)
            {
                string rollno = row.Cells[2].Text.Trim();

                RadioButton rb1 = (row.Cells[0].FindControl("RadioButton1") as RadioButton);
                RadioButton rb2 = (row.Cells[0].FindControl("RadioButton2") as RadioButton);
                int status = 0;
                if (rb1.Checked)
                {
                    status = 1;
                }
                else if (rb2.Checked)
                {
                    status = 0;
                }
                fn.Query(@" insert into StudentAttendance values('"+ddlClass.SelectedValue+"','"+ddlSubject.SelectedValue+"','" + rollno + "','" + status + "','" + DateTime.Now.ToString("yyyy/MM/dd") + "')");
                isTrue = true;
                
            }
            if(isTrue)
            {
                lblMsg.Text = "Saved Successfully";
                lblMsg.CssClass = "alert alert-success";
            }
            else
            {
                lblMsg.Text = "Saved Failed";
                lblMsg.CssClass = "alert alert-warning";
            }
        }

        
    }
}