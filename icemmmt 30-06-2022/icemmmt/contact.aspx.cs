using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace icemmmt
{
    public partial class contact : System.Web.UI.Page
    {
        DAL.Class1 dalclass = new DAL.Class1();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                String name = txtname.Text;
                String email = txtemail.Text;
                String phone = txtphone.Text;
                String message = txtmsg.Text;

                int contactid = dalclass.insertcontact(name, email,phone, message);
                if (contactid > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "redirect",
                                                      "alert('Submission Successfully.'); window.location='" + "contact.aspx';", true);
                    
                }
            }
            catch
            {

            }
        }
    }
}