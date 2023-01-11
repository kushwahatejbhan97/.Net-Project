using System;
using System.Collections.Generic;
using System.Linq;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Net;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using System.Net.Mail;


namespace mindappraisers
{
    public partial class contact_us : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                send_email_details();
                send_email_user();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "redirect",
                        "alert('Submitted Sucessfully!!!'); window.location='" + " default.aspx';", true);
            }
            catch
            {
            }
        }
        public void send_email_details()
        {
            try
            {

                string from_Address = "mindappraisers@gmail.com";
                String pwd = "12345";
                String body = "<h2>Welcome to mindappraisers</h2> <br> <p> Subject :  mindappraisers Enquiry <br> <br> Name: " + txtName.Text + "<br>  Mobile : " + TextPhone.Text + "<br> Email: " + txtEmail.Text + "<br> Designation: " + DropDownList1.SelectedItem + "<br>  Message : " + txtMessage.Text + " </p><br><br> Thanks <br> Mind Appraisers";
                String to_Address = "info@mindappraisers.com";

                using (MailMessage mm = new MailMessage(from_Address, to_Address))
                {

                    mm.Subject = "mindappraisers Enquiry ";
                    mm.Body = body;
                    mm.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient();



                    smtp.Host = "relay-hosting.secureserver.net";

                    smtp.EnableSsl = false;
                    NetworkCredential NetworkCred = new NetworkCredential(from_Address, pwd);
                    smtp.UseDefaultCredentials = false;
                    //set it to false and then check

                    smtp.Credentials = NetworkCred;
                    smtp.Port = 25;


                    smtp.Send(mm);
                }
            }
            catch
            {

            }


        }
        public void send_email_user()
        {
            try
            {
                String from_Address = "mindappraisers Enquiry";
                String pwd = "12345";

                String body = "<h2>Welcome to mindappraisers</h2> <br> <p> Subject :  mindappraisers Enquiry <br> <br> <p>Thank You For Enquiry At mindappraisers , Our Team Will Contact You Soon.</p>";

                String to_Address = txtEmail.Text;


                using (MailMessage mm = new MailMessage(from_Address, to_Address))
                {

                    mm.Subject = "mindappraisers";
                    mm.Body = body;
                    mm.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient();



                    smtp.Host = "relay-hosting.secureserver.net";

                    smtp.EnableSsl = false;
                    NetworkCredential NetworkCred = new NetworkCredential(from_Address, pwd);
                    smtp.UseDefaultCredentials = false;
                    //set it to false and then check

                    smtp.Credentials = NetworkCred;
                    smtp.Port = 25;


                    smtp.Send(mm);
                }
            }
            catch
            {
            }
        }

    }
}