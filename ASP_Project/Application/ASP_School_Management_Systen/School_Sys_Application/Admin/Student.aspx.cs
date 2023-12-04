using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Diagnostics;

namespace School_Sys_Application.Admin
{
    public partial class Student : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            Debug.WriteLine("Inserting....");
            FileUpload fu = DetailsView1.FindControl("fuPicture") as FileUpload;
            if (fu.HasFiles)
            {
                if (fu.PostedFile.ContentLength > 0)
                {
                    string f = Guid.NewGuid() + Path.GetExtension(fu.PostedFile.FileName);
                    string fileName = Server.MapPath("~/Image/") + f;
                    fu.PostedFile.SaveAs(fileName);
                    e.Values["photo"] = f;
                }
                else
                {
                    e.Cancel = false;
                }
            }
            else
            {
                e.Cancel = true;
            }

        }

        protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {
            FileUpload fu = DetailsView1.FindControl("fuPictureUpdate") as FileUpload;

            if (fu.HasFiles)
            {
                if (fu.PostedFile.ContentLength > 0)
                {
                    string f = Guid.NewGuid() + Path.GetExtension(fu.PostedFile.FileName);
                    string fileName = Server.MapPath("~/Image/") + f;
                    fu.PostedFile.SaveAs(fileName);
                    e.NewValues["photo"] = f;
                }
                else
                {
                    e.NewValues["photo"] = e.OldValues["photo"];
                }
            }
            else
            {
                e.NewValues["photo"] = e.OldValues["photo"];
            }
        }
    }
}