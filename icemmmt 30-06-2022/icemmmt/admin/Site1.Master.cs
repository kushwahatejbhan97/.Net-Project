using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace icemmmt.admin
{
    public partial class Site1 : System.Web.UI.MasterPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["UserId"] == null)
                {
                    Response.Redirect("default.aspx");
                }
            }
            catch
            {
                Response.Redirect("default.aspx");
            }
        }
        protected void logout(object sender, EventArgs e)
        {
            try
            {
                Session["UserId"] = null;
                Response.Redirect("Default.aspx", false);
            }
            catch
            {
            }
        }
    
    }

   
}