using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KiranaWorldApp
{
    public partial class Response : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DAL.Class1 dalclass = new DAL.Class1();
            try
            {
                String txnid = Request.Form["txnid"].ToString();
                string orderid = Request.Form["productinfo"].ToString();
                String status = Request.Form["status"].ToString();
                dalclass.transactionUpdate(txnid, orderid, status);
                if (status == "success")
                {
                    Mysuccess.Visible = true;
                    MyFail.Visible = false;
                }
                else if (status == "failure")
                {
                    MyFail.Visible = true;
                    Mysuccess.Visible = false;

                }
                


               

            }
            catch
            {

                MyFail.Visible = true;
                Mysuccess.Visible = false;


            }

        }
    }
}