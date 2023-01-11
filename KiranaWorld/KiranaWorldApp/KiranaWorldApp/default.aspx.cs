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
    public partial class _default : System.Web.UI.Page
    {
        DAL.Class1 dalclass = new DAL.Class1();
        protected void Page_Load(object sender, EventArgs e)
        {


            try
            {
                Session["CheckOutVisit"] = 0;
                Session["CheckOutVisitAddress"] = 0;
                int ClientId = 0;

                if (!IsPostBack)
                {

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
                                Session["flag"] = 1;
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
                    else
                    {
                        try
                        {
                            shareme.HRef = "whatsapp://send?text=Get%20Rs.%2050%20off%20on%20your%20first%20order%20only%20on%20KiranaWorld.%20%0ADownload%20App%20Now%20https%3A%2F%2Frb.gy%2F3pgpcd%0AReferral%20Code%20%3A%20KW1037";
                            if (Session["order"] == null)
                            {
                                Session["ItemCount"] = "0";
                                cartCount.Text = "0";
                            }
                            else
                            {
                                cartCount.Text = "0";
                                Session["ItemCount"] = "0";
                                DataTable dto = (DataTable)Session["order"];
                                Session["ItemCount"] = dto.Rows.Count;
                                cartCount.Text = dto.Rows.Count.ToString();
                            }
                        }
                        catch
                        {
                            Session["ItemCount"] = "0";
                            cartCount.Text = "0";
                        }

                        try
                        {

                            ArrayList al = dalclass.getWebSettings();

                            lblAppMarque.Text = al[3].ToString();
                        }
                        catch
                        {

                        }
                    }

                }


            }
            catch
            {



            }




        }

        protected void Searchclick(object sender, EventArgs e)
        {
            try
            {
                if (txtSearch.Text != "" || txtSearch.Text != " ")
                {
                    Response.Redirect("ItemList.aspx?Type=2&Search=" + txtSearch.Text, false);
                }
            }
            catch
            {
            }

        }

    }
}