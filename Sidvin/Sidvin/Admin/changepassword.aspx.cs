using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sidvin.Admin
{
    public partial class changepassword : System.Web.UI.Page
    {
        DAL.Class1 dalclass = new DAL.Class1();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try

            {

                int Id = int.Parse(Session["User_id"].ToString());
                String Pass = (txtPass.Text);
                dalclass.UpdatePass(Pass, Id);

                ScriptManager.RegisterStartupScript(this, this.GetType(), "redirect",
                      "alert('Successfully Password Changed.'); window.location='" + "Default.aspx';", true);


            }
            catch
            {
            }

        }
    }
}