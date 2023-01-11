using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using System.Configuration;
using System.Text;
using System.Security.Cryptography;
using System.Data.SqlClient;
using System.Net;
using Paytm;
using System.IO;
using paytm;

namespace KiranaWorldApp
{
    public partial class checkout : System.Web.UI.Page
    {
        DAL.Class1 dalclass = new DAL.Class1();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            int ClientId = 0;
            int WalletBalance = 0;
            try
            {
                Session["CheckOutVisit"] = 1;


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
                    if (ClientId != 0)
                    {

                        ArrayList arr = dalclass.RetrieveAddress(ClientId);


                        if (arr.Count > 0)
                        {

                            Session["Address"] = arr[0].ToString();
                            lblAddr.Text = arr[0].ToString();

                        }
                        else
                        {
                            Session["CheckOutVisitAddress"] = 1;
                            Response.Redirect("Address.aspx", false);
                        }
                        ArrayList ClientDetails = dalclass.RetrieveClientDetails(ClientId);
                        if (ClientDetails.Count > 0)
                        {


                            Session["ClientName"] = ClientDetails[0].ToString();
                            Session["ClientEmail"] = ClientDetails[1].ToString();
                            Session["ClientMobile"] = ClientDetails[2].ToString();
                            Session["ClientWallet"] = ClientDetails[3].ToString();
                            ChkWallet.Text = "&#8377; " + ClientDetails[3].ToString() + ".00";
                            WalletBalance = 0;
                            try
                            {
                                WalletBalance = int.Parse(ClientDetails[3].ToString());
                            }
                            catch
                            {

                            }

                        }
                    }
                    else
                    {
                        Session["CheckOutLogin"] = 1;
                        Response.Redirect("Account.aspx", false);
                    }

                    try
                    {
                        
                        int TotalAmount = int.Parse(Session["amount"].ToString());
                        int delivcharge = int.Parse(Session["delivcharge"].ToString());
                        LblTAmount.Text = "&#8377; " + TotalAmount.ToString() + ".00";
                        LblCashback.Text =  Session["TotalCashback"].ToString() + ".00";
                        DeliveryC.Text = "&#8377; "  + delivcharge.ToString() + ".00";
                        if (delivcharge == 0)
                        {
                            DeliveryC.Text = "<span style=' color: Green;   '>Free</span>";
                        }
                        int netpayable = 0;
                        if (WalletBalance >= TotalAmount)
                        {
                            netpayable = 0;
                        }
                        else
                        {
                            netpayable = TotalAmount - WalletBalance;
                        }

                        LblNetPayable.Text = "&#8377; " + netpayable.ToString() + ".00";


                    }
                    catch
                    {
                        Response.Redirect("CartReview.aspx", false);
                    }



                }


            }
            catch
            {
                Response.Redirect("Account.aspx", false);
            }





        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("ChangeAddre.aspx", false);
            }
            catch
            {
            }
        }

        

        protected void AddNewOrder(object sender, EventArgs e)
        {
            try
            {
                DataTable table = (DataTable)Session["order"];
                int cashback = 0;
                try {
                    cashback= Convert.ToInt32(Math.Round(Convert.ToDouble(table.Compute("Sum(TotalCashback)", "").ToString())));
                    
                }
                catch
                {
                   
                }
               
                int TotalAmt = int.Parse(table.Compute("Sum(TotalPrice)", "").ToString());
                int TotaMrp = int.Parse(table.Compute("Sum(TotalMrp)", "").ToString());
                int discount = int.Parse(Session["discount"].ToString());
                int delivcharge = int.Parse(Session["delivcharge"].ToString());
                if (TotalAmt >= 100)
                {
                    if (TotalAmt >= 500)
                    {
                        delivcharge = 0;
                    }

                    int TotalAmount = TotalAmt + delivcharge - discount;
                    int NetPayable = 0;
                    int WalletBalance = 0;
                    if (ChkWallet.Checked == true)
                    {
                        WalletBalance = int.Parse(Session["ClientWallet"].ToString());

                    }
                    Session["amount"] = TotalAmount;
                    int TotalSave = (TotaMrp - TotalAmt + discount);
                    int ClientId = int.Parse(Session["ClientId"].ToString());

                    ArrayList al = dalclass.RetrieveName(ClientId);
                    String Email = al[1].ToString();
                    Session["ClientEmail"] = Email;
                    String ClientName = al[0].ToString();
                    Session["ClientName"] = ClientName;
                    String Address = Session["Address"].ToString();
                    String Slot = DropDownList1.SelectedItem.ToString();
                    String SlotId = DropDownList1.SelectedValue;
                    String Mobile = al[2].ToString();
                    Session["ClientMobile"] = Mobile;
                    String PayMode = Payselect.SelectedItem.Value;
                    Session["PayMode"] = PayMode;
                    int packcount = 0;
                    int Cupon = 0;
                    String TxtCoupon = "";
                    try
                    {
                        Cupon = int.Parse(Session["CouponId"].ToString());
                        TxtCoupon = Session["TxtCoupon"].ToString();
                    }
                    catch
                    {
                    }
                    String OrderDetails = "";

                    if (WalletBalance >= TotalAmount)
                    {
                        NetPayable = 0;
                        dalclass.DeductingValueFromWallet(ClientId.ToString(), TotalAmount);
                        PayMode = "Wallet";

                    }
                    else
                    {
                        NetPayable = TotalAmount - WalletBalance;
                        dalclass.DeductingValueFromWallet(ClientId.ToString(), WalletBalance);
                    }




                    int OrderId = dalclass.AddOrder(ClientId, TotalAmount, Email, delivcharge, Address, Mobile, ClientName, Slot, table.Rows.Count, NetPayable);

                    dalclass.updatecashbackorder(OrderId, cashback);

                    dalclass.updateSlot(SlotId);
                    if (OrderId > 0)
                    {
                        Session["OrderId"] = OrderId;


                        foreach (DataRow row in table.Rows)
                        {



                            int PackId = int.Parse(row["PackId"].ToString());
                            String ItemName = row["ItemName"].ToString();
                            float Price = float.Parse(row["Price"].ToString());
                            float Mrp = float.Parse(row["Mrp"].ToString());
                            float TotalPrice = float.Parse(row["TotalPrice"].ToString());
                            float TotalMrp = float.Parse(row["TotalMrp"].ToString());
                            int Qty = int.Parse(row["NoOfItems"].ToString());
                            int Discount = int.Parse(row["Discount"].ToString());
                            String Size = row["PackSize"].ToString();
                            float TotAmt = Qty * Price;
                            String Brand = row["Brand"].ToString();
                            String ImgUrl = row["ImgUrl"].ToString();

                            int OrderDetail = dalclass.OrderDetails(OrderId, PackId, ItemName, Price, Qty, TotAmt, Size, ImgUrl, Mrp, TotalPrice, TotalMrp, Discount, Brand);
                            packcount = packcount + Qty;
                            OrderDetails = row["ItemName"].ToString() + ", ";




                        }
                        if (OrderDetails.Length > 1)
                        {
                            OrderDetails = OrderDetails.Remove(OrderDetails.Length - 2, 2);
                        }


                    }

                    string CouponTitle = "";
                    string CouponDescription = "";
                    if (Cupon > 0)
                    {
                        ArrayList coupondetails = dalclass.getcouponDetails(Cupon);
                        CouponTitle = coupondetails[0].ToString();
                        CouponDescription = coupondetails[1].ToString();
                    }


                    Session["amount"] = NetPayable;
                    dalclass.updateOrderDetails(OrderDetails, TotalSave, Cupon, TxtCoupon, discount, TotalAmt, packcount, OrderId, CouponTitle, CouponDescription);
                    dalclass.RemoveClientCart(ClientId);
                    try
                    {
                        dalclass.DeleteCoupon(ClientId, TxtCoupon);
                    }
                    catch
                    {

                    }

                    Session["order"] = null;
                    Session["ItemCount"] = 0;
                    Session["CouponArr"] = null;


                    if (PayMode == "PayNow")
                    {
                        SendOtpMessage(Mobile, @"Your Order has been placed Successfully with order id kw-" + OrderId + @". For order details please visit https://rb.gy/intfzb or whatsapp 8877778770. Please ask delivery boy to match all products.
Regards
Team KiranaWorld");
                       //  Response.Redirect("WebForm3.aspx", false); // Test Environment
                       Response.Redirect("paytmpayment.aspx", false); // Production 

                    }
                    else if (PayMode == "COD")
                    {
                        SendOtpMessage(Mobile, @"Your Order has been placed Successfully with order id kw-" + OrderId + @". For order details please visit https://rb.gy/intfzb or whatsapp 8877778770. Please ask delivery boy to match all products.
Regards
Team KiranaWorld");
                        Response.Redirect("success.aspx", false);
                    }
                    else if (PayMode == "Wallet")
                    {

                        dalclass.PaymentWalletStaus(OrderId);
                        SendOtpMessage(Mobile, @"Your Order has been placed Successfully with order id kw-" + OrderId + @". For order details please visit https://rb.gy/intfzb or whatsapp 8877778770. Please ask delivery boy to match all products.
Regards
Team KiranaWorld");
                        Response.Redirect("success.aspx", false);

                    }



                }
                else
                {
                    string display = "Minimum order amount is Rs.100.";
                    //ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + display + "');", true);

                }
            }
            catch
            {
                Response.Redirect("CartReview.aspx", false);
            }





        }



     

       

        public String SendOtpMessage(String mobno, String msge)
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

        protected void Payselect_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (Payselect.SelectedValue == "PayNow")
                {
                    Pay.Text = "Place the order & Proceed to Pay";

                }
                else
                {
                    Pay.Text = "Place the order";

                }
            }
            catch
            {
            }
        }

        protected void ChkWallet_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                int grandTot = int.Parse(Session["amount"].ToString());
                int WalletBalance = 0;
                if (ChkWallet.Checked == true)
                {
                    WalletBalance = int.Parse(Session["ClientWallet"].ToString());
                }

                int netpayable = 0;
                if (WalletBalance >= grandTot)
                {
                    netpayable = 0;
                }
                else
                {
                    netpayable = grandTot - WalletBalance;
                }

                LblNetPayable.Text = "&#8377; " + netpayable.ToString() + ".00";


            }
            catch
            {

            }
        }
    }
}