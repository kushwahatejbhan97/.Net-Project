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
    public partial class PaymentSuccess : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DAL.Class1 dalclass = new DAL.Class1();
            try
            {

                string orderid = Request.Form["ORDERID"].ToString();
                
               // dalclass.transactionUpdatepaytm("", orderid, "success"); 
              
                String txnid = Request.Form["TXNID"].ToString();
                //  string orderid = Request.Form["ORDERID"].ToString();
                String status = Request.Form["STATUS"].ToString();

                if (status == "TXN_SUCCESS")
                {
                    status = "success";
                    Mysuccess.Visible = true;
                    //MyFail.Visible = false;
                }
                else if (status == "TXN_FAILURE")
                {
                    status = "failed";
                    MyFail.Visible = true;
                    //  Mysuccess.Visible = false;

                }
                else if (status == "PENDING")
                {
                    status = "pending";
                    Mysuccess.Visible = true;
                }
                dalclass.transactionUpdatepaytm(txnid, orderid, status);



            }
            catch(Exception ex)
            {

                //  MyFail.Visible = true;
                Mysuccess.Visible = true;



            }
        }
    }
}