using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sidvin
{
    public partial class Default : System.Web.UI.Page
    {
        DAL.Class1 dalclass = new DAL.Class1();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

       

        protected void Button1_Click1(object sender, EventArgs e)
        {
            try
            {
                string name = txtname.Text;
                string email = txtemail.Text;
                string subject = txtsubject.Text;
                string message = txtmessage.Text;
                string mobile = txtnumber.Text;
                int clientid = dalclass.insertclient(name, email, subject, message, mobile);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "redirect",
                                               "alert(' Message Sent Successfully.'); window.location='" + "Default.aspx';", true);

            }
            catch
            {

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                string name = txtmobname.Text;
                string email = txtmobemail.Text;
                string subject = txtmobsub.Text;
                string message = txtmobmess.Text;
                string mobile = txtmobnumber.Text;
                int clientid = dalclass.insertclient(name, email, subject, message, mobile);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "redirect",
                                             "alert('Message Sent Successfully.'); window.location='" + "Default.aspx';", true);

            }
            catch
            {

            }
        }
    }
}