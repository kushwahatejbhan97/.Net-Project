using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sidvin.Admin
{
    public partial class Site1 : System.Web.UI.MasterPage
    {

        DAL.Class1 dalclass = new DAL.Class1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                   
                   

                    if (Session["AID"] == null )
                    {

                        Response.Redirect("Default.aspx", false);
                    }
                }
                catch
                {
                    Response.Redirect("Default.aspx", false);
                }

            }
        }



        protected void logout(object sender, EventArgs e)
        {
            try
            {
                HttpCookie cookie = new HttpCookie("SidvinRealityAdminCookie");
                Session["AID"] = null;



                Response.Cookies["SidvinRealityCustomerCookie"]["loginstatus"] = "0";
                cookie.Expires = DateTime.Now.AddMonths(12);
                Response.Cookies.Add(cookie);
                Response.Redirect("Default.aspx", false);
            }
            catch
            {
            }
        }

    }
}