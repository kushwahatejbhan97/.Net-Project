using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Collections;

namespace KiranaWorldApp
{
    public partial class ViewItems : System.Web.UI.Page
    {
        DAL.Class1 dalclass = new DAL.Class1();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                int ClientId = 0;
                if (!IsPostBack)
                {
                    try
                    {
                        ClientId = int.Parse(Session["ClientId"].ToString());
                    }
                    catch
                    {
                        HttpCookie cookie = Request.Cookies["TheOmartCustomerCookie"];
                        if (cookie != null)
                        {
                            int flag = Int32.Parse(cookie["loginstatus"].ToString());
                            if (flag == 1)
                            {
                                Session["flag"] = 1;
                                Session["ClientId"] = Int32.Parse(cookie["ClientId"].ToString());
                                ClientId = int.Parse(Session["ClientId"].ToString());
                            }
                        }
                    }
                    if (ClientId == 0)
                    {
                        Response.Redirect("Account.aspx", false);
                    }
                    else
                    {
                        try
                        {
                            String Status = Request.QueryString["Status"].ToString();
                            String Mobile = Request.QueryString["Mobile"].ToString();
                            if (Status == "1")
                            {
                                Button1.Visible = true;
                            }
                            if (Session["ItemCount"] != null)
                            {
                                cartCount.Text = Session["ItemCount"].ToString();
                            }
                            else
                            {
                                cartCount.Text = "0";
                            }
                        }
                        catch
                        {
                            Session["ItemCount"] = "0";
                            cartCount.Text = "0";
                        }
                    }


                }
            }
            catch
            {



            }




        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            try
            {
                String OrderId = Request.QueryString["OrderId"].ToString();
                String Status = Request.QueryString["Status"].ToString();
                String Mobile = Request.QueryString["Mobile"].ToString();
                            if (Status == "1")
                            {

                    ArrayList Details = dalclass.SelectOrderDetails(OrderId);
                    int rowUpdated = dalclass.CancelOrder(OrderId);
                    if (rowUpdated > 0)
                    {
                        //PaymentStatus, TotalAmount, Mobile, GrandTotal
                        String PaymentStatus = Details[0].ToString();
                        int TotalAmount = int.Parse(Details[1].ToString());
                        Mobile = Details[2].ToString();
                        String ClientId = (Session["ClientId"].ToString());
                        int GrandTotal = int.Parse(Details[3].ToString());

                        if (PaymentStatus == "success" || PaymentStatus == "Success")
                        {
                            dalclass.addValueToWallet(ClientId, TotalAmount);
                            SendOtpMessage(Mobile, "Your Order has been cancelled . For more details please contact our customer care.");
                        }
                        else
                        {
                            dalclass.addValueToWallet(ClientId, TotalAmount - GrandTotal);
                            SendOtpMessage(Mobile, "Your Order has been cancelled. For more details please contact our customer care.");
                        }
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert",
                                                             "alert('Order Canceled')", true);
                    }
                    
                                SendOtpMessage(Mobile, "Your Order with OrderId Kw-" + OrderId + "has been cancelled");
                                
                            }
                Response.Redirect("OrderDetails.aspx",false);
            }
            catch
            {
            }
        }


        public String SendOtpMessage(String mobno, String msge)
        {
            try
            {


                HttpWebRequest myReq = (HttpWebRequest)WebRequest.Create("http://mobicomm.dove-sms.com//submitsms.jsp?user=shantire&key=2ad16bc0f9XX&mobile=" + mobno + "&message=" + msge + "&senderid=KRNWLD&accusage=1");

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
                throw new Exception(msg);

            }


        }
    }
}