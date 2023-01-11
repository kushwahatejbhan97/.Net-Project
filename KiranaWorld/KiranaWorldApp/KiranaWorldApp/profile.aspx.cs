using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

namespace KiranaWorldApp
{
    public partial class profile : System.Web.UI.Page
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
                        ArrayList ClientDetails = dalclass.RetrieveClientDetails(ClientId);

                        if (ClientDetails.Count > 0)
                        {
                            


                            Session["ClientName"] = ClientDetails[0].ToString();
                            Session["ClientEmail"] = ClientDetails[1].ToString();
                            Session["ClientMobile"] = ClientDetails[2].ToString();
                            Wallet.Text = ClientDetails[3].ToString();
                        }


                        CName.Text = Session["ClientName"].ToString();
                        CEmail.Text = Session["ClientEmail"].ToString();
                        CMob.Text = Session["ClientMobile"].ToString();
                        NoofOrder.Text = dalclass.TotalOrderclient(ClientId);
                        LblReferId.Text = "KW" + ClientId.ToString();
                    }
                    


                }


            }
            catch
            {



            }




        }

        protected void logout(object sender, EventArgs e)
        {
            try
            {
                HttpCookie cookie = new HttpCookie("TheOmartCustomerCookie");
                Session["ClientId"] = null;

                Session["ClientName"] = null;
                Session["ClientEmail"] = null;
                Session["Address"] = null;
                Response.Cookies["TheOmartCustomerCookie"]["loginstatus"] = "0";
                cookie.Expires = DateTime.Now.AddMonths(12);
                Response.Cookies.Add(cookie);
                Response.Redirect("Default.aspx", false);
            }
            catch
            {
            }
        }
    }
}