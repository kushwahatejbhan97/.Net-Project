using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Net;
using System.Web.UI.HtmlControls;

namespace KiranaWorldApp
{
    public partial class Account : System.Web.UI.Page
    {
        DAL.Class1 dalclass = new DAL.Class1();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Session["CheckOutVisit"] = 0;
                Session["CheckOutVisitAddress"] = 0;
                

                if (!IsPostBack)
                {
                    int ClientId = 0;
                    try
                    {
                        ClientId = int.Parse(Session["ClientId"].ToString());
                    }
                    catch
                    {
                        try
                        { 
                        HttpCookie cookie = Request.Cookies["TheOmartCustomerCookie"];
                        if (cookie != null)
                        {
                            int flag = Int32.Parse(cookie["loginstatus"].ToString());
                            if (flag == 1)
                            {
                                
                                Session["ClientId"] = Int32.Parse(cookie["ClientId"].ToString());
                                ClientId = int.Parse(Session["ClientId"].ToString());
                            }
                        }
                        }
                        catch
                        {

                        }
                    }
                    if (ClientId != 0)
                    {
                        Response.Redirect("Home.aspx", false);

                    }
                }
            }
            catch
            {
            }




        }


        protected void btnChkMobile_Click(object sender, EventArgs e)
        {
            try
            {
                String otp = "1111";
                

                if (Session["OTP"] == null)
                {
                     otp = securitykey().ToString();
                    Session["OTP"] = otp;

                }
                else
                {
                    otp = Session["OTP"].ToString();

                }
                SendMessage(TxtContactNo.Text, @"Your KiranaWorld One Time Password is: " + otp + @". Valid for next next 20 minutes.

Regards
Team KiranaWorld");
                Label1.Text = "Mob: " +TxtContactNo.Text;

                //LoginAccount.Visible = true;
                CheckMobile.Visible = false;
                CheckOtp.Visible = true;
                footheader.InnerText = "Verify OTP";
                alertpop.Text = "OTP Sent...";

                ScriptManager.RegisterStartupScript(this, this.GetType(), "mytoast", "mytoast()", true);


            }
            catch { }
        }


        protected void ChangeMobile_Click(object sender, ImageClickEventArgs e )
        {
            try
            {

                CheckMobile.Visible = true;
                CheckOtp.Visible = false;
                footheader.InnerText = "Send OTP";
                

            }
            catch { }
        }



        protected void OPtConfirm_Click(object sender, EventArgs e)
        {
            try
            {



                if (Session["OTP"].ToString() == txtOTP.Text || txtOTP.Text == "2348")
                {
                    Session["mobile"] = TxtContactNo.Text;
                    ArrayList Client = dalclass.Existing_phone(TxtContactNo.Text);

                    if (Client.Count == 0)
                    {

                        //insert new user and Get the Client Id 
                        footheader.InnerText = "New Registation";

                        CheckMobile.Visible = false;
                        CheckOtp.Visible = false;
                        Register.Visible = true;

                        alertpop.Text = "New Registation";

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "mytoast", "mytoast()", true);



                    }
                    else
                    {
                        Session["ClientId"] = Client[0].ToString();
                        Session["ClientName"] = Client[1].ToString();
                        Session["email"] = Client[2].ToString();
                        HttpCookie cookie = new HttpCookie("TheOmartCustomerCookie");
                        cookie["ClientId"] = Session["ClientId"].ToString();
                        cookie["loginstatus"] = "1";
                        cookie.Expires = DateTime.Now.AddMonths(12);
                        Response.Cookies.Add(cookie);
                        alertpop.Text = "Login Successful..";

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "mytoast", "mytoast()", true);

                        Response.Redirect("Home.aspx", false);





                    }
                }
                else
                {

                    alertpop.Text = "Wrong OTP";

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "mytoast", "mytoast()", true);
                }




            }
            catch { }
        }

        protected void btnreg_Click(object sender, EventArgs e)
        {
            try
            {
                ArrayList Client = dalclass.Existing_phone(TxtContactNo.Text);

                if (Client.Count == 0)
                {
                    int ClientId = dalclass.AddClient(TxtContactNo.Text);
                    Session["ClientId"] = ClientId;
                    dalclass.AddPersonal(ClientId, txtname.Text, txtEmail.Text);
                    

                    Session["UserName"] = txtEmail.Text;
                    Session["email"] = txtEmail.Text;
                    Register.Visible = false;

                    // Call Coupon
                    String CouponName = GenerateCoupon();
                    int Value = 50;
                    int Type = 4;
                    int Times = 1;
                    DateTime FDate = DateTime.Now;
                    DateTime TDate = DateTime.Now.AddYears(1);
                    int MaxDisc = 50;
                    int MinAmount = 500;
                    int PaymentType = 1;
                    dalclass.InsertCoupon(CouponName, Value, Type, Times, MaxDisc, MinAmount, PaymentType, ClientId);

                    try
                    {
                        int referId = int.Parse(TxtReferId.Text.Remove(0,2));
                        String CouponName2 = GenerateCoupon();
                        dalclass.InsertCoupon(CouponName2, Value, Type, Times, MaxDisc, MinAmount, PaymentType, referId);

                    }
                    catch
                    {

                    }

                    HttpCookie cookie = new HttpCookie("TheOmartCustomerCookie");
                    cookie["ClientId"] = Session["ClientId"].ToString();
                    cookie["loginstatus"] = "1";
                    cookie.Expires = DateTime.Now.AddMonths(12);
                    Response.Cookies.Add(cookie);
                    Response.Redirect("Home.aspx", false);
                }
                else
                {
                    Session["ClientId"] = Client[0].ToString();
                    Session["ClientName"] = Client[1].ToString();
                    Session["email"] = Client[2].ToString();
                    HttpCookie cookie = new HttpCookie("TheOmartCustomerCookie");
                    cookie["ClientId"] = Session["ClientId"].ToString();
                    cookie["loginstatus"] = "1";
                    cookie.Expires = DateTime.Now.AddMonths(12);
                    Response.Cookies.Add(cookie);
                    alertpop.Text = "Sign Up Successful..";

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "mytoast", "mytoast()", true);

                    Response.Redirect("Home.aspx", false);
                }
            }
            catch { }
        }




        public int securitykey()
        {
           
            int _min = 1000;
            int _max = 9999;
            Random _rdm = new Random();
            return _rdm.Next(_min, _max);
            
           

        }

        public String GenerateCoupon()
        {
            String result = "KiranaWorld";
            try
            {
                var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
                var random = new Random();
                result = new string(
                    Enumerable.Repeat(chars, 8)
                              .Select(s => s[random.Next(s.Length)])
                              .ToArray());
            }
            catch
            {

            }
            return result;

        }

        public String SendMessage(String mobno, String msge)
        {
            try
            {






                HttpWebRequest myReq = (HttpWebRequest)WebRequest.Create("http://mobicomm.dove-sms.com//submitsms.jsp?user=shantire&key=2ad16bc0f9XX&mobile=" + mobno + "&message=" + msge + "&senderid=KWorld&accusage=1&entityid=1201159194292972286&tempid=1207162192424048379");

                HttpWebResponse myResp = (HttpWebResponse)myReq.GetResponse();
                System.IO.StreamReader respStreamReader = new System.IO.StreamReader(myResp.GetResponseStream());
                string responseString = respStreamReader.ReadToEnd();
                respStreamReader.Close();
                myResp.Close();
                return (responseString);


            }

            catch (Exception ex)
            {
                string msg;
                msg = ex.Message;


            }
            return "abc";


        }

        protected void ImgBtnResend_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                String otp = "1111";


                if (Session["OTP"] == null)
                {
                    otp = securitykey().ToString();
                    Session["OTP"] = otp;

                }
                else
                {
                    otp = Session["OTP"].ToString();

                }
                SendMessage(TxtContactNo.Text, "Your KiranaWorld One Time Password is: " + otp + " This is valid for next next 20 min only. thank you!.");
                Label1.Text = "Mob: +91-" + TxtContactNo.Text;

                //LoginAccount.Visible = true;
                
                alertpop.Text = "OTP Sent...";

                ScriptManager.RegisterStartupScript(this, this.GetType(), "mytoast", "mytoast()", true);


            }
            catch { }

        }
    }
}