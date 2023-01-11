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
    public partial class WebForm3 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            string name = Session["ClientName"].ToString();
            string email = Session["ClientEmail"].ToString();
            string mobileno = Session["ClientMobile"].ToString();
            string NetPayable = Session["amount"].ToString();
            int ClientId = int.Parse(Session["ClientId"].ToString());
            int orderid = Convert.ToInt32(Session["OrderId"]);
            String merchantMid = "CPCGMS96439766079508";
            String merchantKey = "lF%DzjDu0xB#KbbM";
            Dictionary<string, string> parameters = new Dictionary<string, string>();
            parameters.Add("MID", merchantMid);
            parameters.Add("CHANNEL_ID", "WEB");
            parameters.Add("INDUSTRY_TYPE_ID", "Retail");
            parameters.Add("WEBSITE", "WEBSTAGING");
            parameters.Add("EMAIL", email);
            parameters.Add("MOBILE_NO", mobileno);
            parameters.Add("CUST_ID", ClientId.ToString());
            parameters.Add("ORDER_ID", orderid.ToString());
            parameters.Add("TXN_AMOUNT", NetPayable);
            parameters.Add("CALLBACK_URL", "http://m.kiranaworld.in/PaymentSuccess.aspx"); //This parameter is not mandatory. Use this to pass the callback url dynamically.

            string checksum_S = CheckSum.generateCheckSum(merchantKey, parameters);
            string paytmURL = "https://securegw-stage.paytm.in/theia/processTransaction?orderid=" + parameters.FirstOrDefault(x => x.Key == "ORDER_ID").Value;

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


          //  Native();

        }



        void Native()
        {
            int orderid = Convert.ToInt32(Session["OrderId"]);
            string MID = "SHANTI03800179145316";
            string order_id = orderid.ToString();
            string Website = "http://m.kiranaworld.in";
            string Merchant_key = "5uP5UMcOeaDg@aaY";
            string name = Session["ClientName"].ToString();
            string email = Session["ClientEmail"].ToString();
            string mobileno = Session["ClientMobile"].ToString();
            string NetPayable = Session["amount"].ToString();
            int ClientId = int.Parse(Session["ClientId"].ToString());
          
           
            string Amount = NetPayable;
            string value = "https://securegw-stage.paytm.in/theia/api/v1/initiateTransaction?mid=SHANTI03800179145316&orderId=" + order_id;
            
            string callback = "http://m.kiranaworld.in/PaymentSuccess.aspx";
            

            string json_for_checksum = "{\"requestType\":\"Payment\",\"mid\":\"" + MID + "\",\"orderId\":\"" + order_id + "\",\"websiteName\":\"" + Website + "\",\"txnAmount\":{\"value\":\"" + Amount + "\",\"currency\":\"INR\"},\"userInfo\":{\"custId\":\""+ ClientId + "\",\"mobile\":\""+mobileno+"\",\"email\":\""+email+"\",\"firstName\":\""+name+ "\"},\"splitSettlementInfo\":{\"splitMethod\":\"AMOUNT\",\"splitInfo\":{\"mid\":\""+MID+"\",\"amount\":{\"value\":\""+NetPayable+"\",\"currency\":\"INR\"}}}, \"extendInfo\":{\"udf1\":\"vivek1\",\"udf2\":\"vivek2\",\"udf3\":\"vivek3\",\"comments\":\"F.Y.BBA. (CBCS)\",\"mercUnqRef\":\"++\"},\"callbackUrl\":\"" + callback + "\"}";

            string Check = Paytm.Checksum.generateSignature(json_for_checksum, Merchant_key);

          

            String Second_jason = "{\"head\":{\"signature\":\"" + Check + "\"},\"body\":" + json_for_checksum + "}";
            try
            {
                String url = value;
                System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls12;
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
                request.ContentType = "application/json";
                request.Method = "POST";

                using (StreamWriter requestWriter2 = new StreamWriter(request.GetRequestStream()))
                {
                    requestWriter2.Write(Second_jason);
                }


                string responseData = string.Empty;
                using (StreamReader responseReader = new StreamReader(request.GetResponse().GetResponseStream()))
                {
                    responseData = responseReader.ReadToEnd();
                    Response.Write("Requested Json= " + Second_jason.ToString() + "<br/> ");
                    Response.Write("Response Json= " + responseData.ToString());

                }
            }
            catch (WebException ex)
            {

                System.IO.Stream s = ex.Response.GetResponseStream();
                StreamReader sr = new StreamReader(s);
                string m = sr.ReadToEnd();
                Response.Write("Requested Json= " + Second_jason.ToString() + " ");
                Response.Write("Response of expection= " + ex.Message.ToString());
            }

        }

    }
}