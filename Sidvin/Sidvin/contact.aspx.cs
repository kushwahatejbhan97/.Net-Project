using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sidvin
{
    public partial class contact : System.Web.UI.Page
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
                string phone = txtphone.Text;

                int clientid = dalclass.insertclientcontact(name, email, subject, message, phone);

            }
            catch
            {

            }
        }
    }
}