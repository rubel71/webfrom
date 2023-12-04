using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static School_Sys_Application.Models.Commonfn;
using System.Data;

namespace School_Sys_Application.Admin
{
    public partial class subject : System.Web.UI.Page
    {
        Commmonfnx fn = new Commmonfnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                GetClass();
                GetSubject();
            }
        }
        private void GetClass()
        {

            DataTable dt = fn.Fetch("select * from Class");
            ddlClass.DataSource = dt;
            ddlClass.DataTextField = "className";
            ddlClass.DataValueField = "classId";
            ddlClass.DataBind();
            ddlClass.Items.Insert(0, "select class");
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string classval = ddlClass.SelectedItem.Text;
                DataTable dt = fn.Fetch("select* from Subject where classId='" + ddlClass.SelectedItem.Value + "' and subjectName='"+txtsubject.Text.Trim()+"'");
                if (dt.Rows.Count == 0)
                {
                    string query = "insert into Subject values('" + ddlClass.SelectedItem.Value + "','" + txtsubject.Text.Trim() + "')";
                    fn.Query(query);
                    lblMsg.Text = "Inserted Successfully!";
                    lblMsg.CssClass = "alert alert-success";
                    ddlClass.SelectedIndex = 0;
                    txtsubject.Text = string.Empty;
                    GetSubject();
                }
                else
                {
                    lblMsg.Text = "Entered subject already exist for <b>'" + classval + "'</b>";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }
        private void GetSubject()
        {
            DataTable dt = fn.Fetch(@"select Row_NUMBER() over(order by(select 1)) as[Sr.No],s.subjectId,s.classId,c.className,s.subjectName from Subject s inner join Class c on c.classId=s.classId");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetSubject();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetSubject();

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int subId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string classId = ((DropDownList)GridView1.Rows[e.RowIndex].Cells[2].FindControl("DropDownList1")).SelectedValue;
                string subName = (row.FindControl("txtClassEdit") as TextBox).Text;
                fn.Query("update Subject set classId='" + classId + "',subjectName='"+ subName + "' where subjectId='" + subId + "' ");
                lblMsg.Text = "Updated Successfully!";
                lblMsg.CssClass = "alert alert-success";
                GridView1.EditIndex = -1;
                GetClass();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}