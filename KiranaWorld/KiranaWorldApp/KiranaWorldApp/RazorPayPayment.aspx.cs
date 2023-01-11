using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Razorpay.Api;
using System.Net;

namespace KiranaWorldApp
{
    public partial class RazorPayPayment : System.Web.UI.Page
    {
        public string orderId;
        public string amt;
        public string name;
        public string email;
        public string mobileno;
        public string key;
        public string kworderId;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                ServicePointManager.SecurityProtocol = SecurityProtocolType.Ssl3;
                key = "rzp_live_VIalvzfqfOPhvr";
                string secret = "dcemE9W3cyRc62OncoMO32Eu";
                //Response.aspx
                kworderId = Session["OrderId"].ToString();
                amt = (int.Parse(Session["amount"].ToString()) * 100).ToString();  // its 500 bec it multiple by 100 by default so to make rs 500 u have to write 5000
                name = Session["ClientName"].ToString();
                email = Session["ClientEmail"].ToString();
                mobileno = Session["ClientMobile"].ToString();

                Dictionary<string, object> input = new Dictionary<string, object>();
                input.Add("amount", amt); // this amount should be same as transaction amount
                input.Add("currency", "INR");
                input.Add("receipt", "KW-"+kworderId);
                input.Add("payment_capture", 1);

                RazorpayClient client = new RazorpayClient(key, secret);

                Razorpay.Api.Order order = client.Order.Create(input);
                string orderId = order["id"].ToString();

                lbl1.Text = orderId;









            }
            catch(Exception ex)
            {
            }
        }
    }
}