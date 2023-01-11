using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Collections;


namespace KiranaWorldApp
{
    public partial class main : System.Web.UI.Page
    {
        public String catname = "Foodgrains, Oil, & Masala";
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
                    if (ClientId != 0)
                    {

                        ArrayList arr = dalclass.RetrieveAddress(ClientId);

                        if (arr.Count > 0)
                        {
                            MyAdd.Text = arr[0].ToString();
                            Session["Address"] = arr[0].ToString();
                            Session["Pincode"] = arr[1].ToString();
                        }
                        else
                        {
                            Session["Address"] = "";
                            Session["Pincode"] = "";
                        }




                        ArrayList ClientDetails = dalclass.RetrieveClientDetails(ClientId);
                        if (ClientDetails.Count > 0)
                        {
                            CustName.Text = ClientDetails[0].ToString();

                            Session["ClientName"] = ClientDetails[0].ToString();
                            Session["ClientEmail"] = ClientDetails[1].ToString();
                            Session["ClientMobile"] = ClientDetails[2].ToString();
                        }
                        else
                        {
                            CustName.Text = "Customer";

                            Session["ClientName"] = "Customer";
                            Session["ClientEmail"] = "";
                            Session["ClientMobile"] = "";
                        }

                        if (Session["ClientName"] == null || Session["ClientName"].ToString() == "")
                        {
                            CustName.Text = "Customer";
                        }

                       

                    }
                    else
                    {
                        home.Attributes.Add("class", "hidepanel");
                        LoginPage.Attributes.Add("class", "showpanel");
                        
                       
                    }
                }


            }
            catch
            {
                home.Attributes.Add("class", "hidepanel");
                LoginPage.Attributes.Add("class", "showpanel");
                
            }


            //try
            //{
            //    if (!IsPostBack)
            //    {
            //        DataBindme();

            //        cartCount.Text = "0";

            //        if (Session["ItemCount"].ToString() != null)
            //        {
            //            cartCount.Text = Session["ItemCount"].ToString();
            //        }
            //    }
            //}
            //catch
            //{
            //    Session["ItemCount"] = 0;
            //    cartCount.Text = "0";
            //}

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
        protected void Search_Click(object sender, EventArgs e)
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

        protected void CatLink(object source, RepeaterCommandEventArgs e)
        {
            try
            {
                
                string[] Details = new string[2];
                Details = e.CommandArgument.ToString().Split(';');
                String CatId = Details[0].ToString();
                catname = Details[1].ToString();

                CatSubcat.Attributes.Add("class", "move");
                
                home.Attributes.Add("class", "hidepanel");

                SqlSubCategory.SelectCommand = "SELECT [SubCatId], [CatId], [SubCatName], [SubMobImg] FROM [SubCategory] WHERE ([CatId] = '" + CatId + "')";
                SqlSubCategory.DataBind();
                RepeaterSubCategory.DataBind();

                
            }
            catch
            {
            }

        }

        protected void SubCatLink(object source, RepeaterCommandEventArgs e)
        {
            try
            {

                string[] Details = new string[2];
                Details = e.CommandArgument.ToString().Split(';');
                String CatId = Details[0].ToString();
                catname = Details[1].ToString();

                CatSubcat.Attributes.Add("class", "move");
                home.Attributes.Add("class", "hidepanel");

                SqlSubCategory.SelectCommand = "SELECT [SubCatId], [CatId], [SubCatName], [SubMobImg] FROM [SubCategory] WHERE ([CatId] = '" + CatId + "')";
                SqlSubCategory.DataBind();
                RepeaterSubCategory.DataBind();


            }
            catch
            {
            }

        }


        protected void BacktoHomeClick(object sender, EventArgs e)
        {
            try
            {
                CatSubcat.Attributes.Add("class", "hidepanel");

                home.Attributes.Add("class", "moveback");
            }
            catch
            {
            }

        }

      
        

    

    }
}