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
    public partial class ClassFees : System.Web.UI.Page
    {
        Commmonfnx fn = new Commmonfnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                GetClass();
                GetFees();
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
                DataTable dt = fn.Fetch("select* from Fees where classId='" +ddlClass.SelectedItem.Value+ "'");
                if (dt.Rows.Count == 0)
                {
                    string query = "insert into Fees values('"+ddlClass.SelectedItem.Value+"','" + txtFeeAmount.Text.Trim() + "')";
                    fn.Query(query);
                    lblMsg.Text = "Inserted Successfully!";
                    lblMsg.CssClass = "alert alert-success";
                    ddlClass.SelectedIndex = 0;
                    txtFeeAmount.Text = string.Empty;
                    GetFees();
                }
                else
                {
                    lblMsg.Text = "Entered fees already exist for <b>'"+classval+"'</b>";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            
        }
        private void GetFees()
        {
            DataTable dt = fn.Fetch("select * from Fees");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

    }
}