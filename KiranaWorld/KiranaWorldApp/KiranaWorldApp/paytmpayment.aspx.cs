using paytm;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace KiranaWorldApp
{
    public partial class paytmpayment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string name = Session["ClientName"].ToString();
            string email = Session["ClientEmail"].ToString();
            string mobileno = Session["ClientMobile"].ToString();
            string NetPayable = Session["amount"].ToString();
           
            int ClientId = int.Parse(Session["ClientId"].ToString());
            int orderid = Convert.ToInt32(Session["OrderId"]);
          
            String merchantMid = "SHANTI03800179145316";
            String merchantKey = "5uP5UMcOeaDg@aaY";
            Dictionary<string, string> parameters = new Dictionary<string, string>();
            parameters.Add("MID", merchantMid);
            parameters.Add("CHANNEL_ID", "WEB");
            parameters.Add("INDUSTRY_TYPE_ID", "Grocery");
            parameters.Add("WEBSITE", "DEFAULT");
            parameters.Add("EMAIL", email);
            parameters.Add("MOBILE_NO", mobileno);
            parameters.Add("CUST_ID", ClientId.ToString());
            parameters.Add("ORDER_ID", orderid.ToString());
            parameters.Add("TXN_AMOUNT", NetPayable);
          parameters.Add("CALLBACK_URL", "http://m.kiranaworld.in/PaymentSuccess.aspx"); //This parameter is not mandatory. Use this to pass the callback url dynamically.
          // parameters.Add("CALLBACK_URL", "https://localhost:44383/PaymentSuccess.aspx"); //This parameter is not mandatory. Use this to pass the callback url dynamically.
            string checksum_S = CheckSum.generateCheckSum(merchantKey, parameters);
            string paytmURL = "https://securegw.paytm.in/order/process";

            string outputHTML = "<html>";
            outputHTML += "<head>";
            outputHTML += "<title>Merchant Check Out Page</title>";
            outputHTML += "</head>";
            outputHTML += "<body>";
            outputHTML += "<center><h1>Please do not refresh this page...</h1></center>";
            outputHTML += "<form method='post' action='" + paytmURL + "' name='f1'>";
            outputHTML += "<table border='1'>";
            outputHTML += "<tbody>";
            foreach (string key in parameters.Keys)
            {
                outputHTML += "<input type='hidden' name='" + key + "' value='" + parameters[key] + "'>";
            }
            outputHTML += "<input type='hidden' name='CHECKSUMHASH' value='" + checksum_S + "'>";
            outputHTML += "</tbody>";
            outputHTML += "</table>";
            outputHTML += "<script type='text/javascript'>";
            outputHTML += "document.f1.submit();";
            outputHTML += "</script>";
            outputHTML += "</form>";
            outputHTML += "</body>";
            outputHTML += "</html>";

            Response.Write(outputHTML);


        }


    }
}