using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KiranaWorldApp
{
    public partial class ChangeAddre : System.Web.UI.Page
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
                            String CheckOutVisit = Session["CheckOutVisit"].ToString();
                            
                        }
                        catch
                        {
                            Session["CheckOutVisit"] = 0;
                        }
                    }


                }


            }
            catch
            {

                Response.Redirect("Default.aspx", false);

            }




        }


        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("Address.aspx", false);
            }
            catch
            {
            }
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.ToString() == "Delete")
                {
                    int AddId = int.Parse(e.CommandArgument.ToString());
                    dalclass.delAddress(AddId);
                    Response.Redirect("ChangeAddre.aspx", false);
                    
                }
                else if (e.CommandName.ToString() == "Checkboxchange")
                {
                    int AddId = int.Parse(e.CommandArgument.ToString());
                    int ClientId = int.Parse(Session["ClientId"].ToString());
                    dalclass.ChangePrimary(AddId, ClientId);
                    SqlDataSource1.DataBind();
                    Repeater1.DataBind();
                    try
                    {
                        String CheckOutVisit = Session["CheckOutVisit"].ToString();
                        if (CheckOutVisit == "1")
                        {
                            Response.Redirect("checkout.aspx", false);
                        }
                        else
                        {
                            Response.Redirect("Home.aspx", false);
                        }
                    }
                    catch
                    {
                        Session["CheckOutVisit"] = 0;
                    }


                }

            }
            catch
            {
            }
        }

       
    }
}