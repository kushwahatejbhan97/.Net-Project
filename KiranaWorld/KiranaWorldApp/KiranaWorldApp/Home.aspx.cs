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
    public partial class Home : System.Web.UI.Page
    {
        DAL.Class1 dalclass = new DAL.Class1();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int ClientId = 0;
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
                        Response.Redirect("default.aspx", false);

                    }
                }
                if (ClientId > 0)
                {
                    try
                    {
                        shareme.HRef = "whatsapp://send?text=Get%20Rs.%2050%20off%20on%20your%20first%20order%20only%20on%20KiranaWorld.%20%0ADownload%20App%20Now%20https%3A%2F%2Frb.gy%2F3pgpcd%0AReferral%20Code%20%3A%20KW"+ ClientId;
                        if (Session["order"] == null)
                        {
                            DataTable dt = new DataTable();
                            dt.Columns.Add("ItemId");
                            dt.Columns.Add("ItemName");
                            dt.Columns.Add("PackId");
                            dt.Columns.Add("PackSize");
                            dt.Columns.Add("Mrp");
                            dt.Columns.Add("Price");
                            dt.Columns.Add("NoOfItems");
                            dt.Columns.Add("ImgUrl");
                            dt.Columns.Add("Discount");
                            dt.Columns.Add("Type");
                            dt.Columns.Add("Brand");
                            dt.Columns.Add("TotalMrp", typeof(Double));
                            dt.Columns.Add("TotalPrice", typeof(Double)); dt.Columns.Add("TotalCashback", typeof(Double)); dt.Columns.Add("Cashback", typeof(Boolean)); dt.Columns.Add("Pcb1"); dt.Columns.Add("Pcb2"); dt.Columns.Add("Pcb3");

                            Session["order"] = dt;
                            Session["ItemCount"] = "0";
                            cartCount.Text = "0";
                            dt = dalclass.cartRetrieve(ClientId);
                            Session["order"] = dt;

                        }
                        DataTable dto = (DataTable)Session["order"];
                        int ProductCount = dto.Rows.Count;
                        cartCount.Text = ProductCount.ToString();
                        if (ProductCount == 0)
                        {
                            DataTable cart = dalclass.cartRetrieve(ClientId);
                            Session["order"] = cart;
                            cartCount.Text = cart.Rows.Count.ToString();
                        }
                    }
                    catch
                    {
                    }


                    try
                    {

                        ArrayList al = dalclass.getWebSettings();

                        lblAppMarque.Text = al[3].ToString();
                    }
                    catch
                    {

                    }


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
                        CustName.InnerHtml = "Hello! " + ClientDetails[0].ToString();

                        Session["ClientName"] = ClientDetails[0].ToString();
                        Session["ClientEmail"] = ClientDetails[1].ToString();
                        Session["ClientMobile"] = ClientDetails[2].ToString();
                    }
                }
                else
                {
                    Response.Redirect("default.aspx", false);
                }
            }

        }




        protected void DataBindme()
        {
            try
            {
                DataTable ShowProduct = dalclass.get_itemHot();
                DataTable ShowProductTrending = dalclass.get_itemTrending();

                if (Session["order"] == null)
                {
                    DataTable dt = new DataTable();
                    dt.Columns.Add("ItemId");
                    dt.Columns.Add("ItemName");
                    dt.Columns.Add("PackId");
                    dt.Columns.Add("PackSize");
                    dt.Columns.Add("Mrp");
                    dt.Columns.Add("Price");
                    dt.Columns.Add("NoOfItems");
                    dt.Columns.Add("ImgUrl");
                    dt.Columns.Add("Discount");
                    dt.Columns.Add("Type");
                    dt.Columns.Add("Brand");
                    dt.Columns.Add("TotalMrp", typeof(Double));
                    dt.Columns.Add("TotalPrice", typeof(Double)); dt.Columns.Add("TotalCashback", typeof(Double)); dt.Columns.Add("Cashback", typeof(Boolean)); dt.Columns.Add("Pcb1"); dt.Columns.Add("Pcb2"); dt.Columns.Add("Pcb3");

                    Session["order"] = dt;






                }

                else
                {


                    DataTable dto = (DataTable)Session["order"];


                    foreach (DataRow row in dto.Rows)
                    {
                        int PackId = int.Parse(row["PackId"].ToString());

                        foreach (DataRow dr in ShowProduct.Rows)
                        {

                            if (Int32.Parse(dr["PackId"].ToString()) == PackId)
                            {
                                dr["NotInCart"] = false;
                                dr["InCart"] = true;

                                dr["NoOfItems"] = row["NoOfItems"];




                            }
                        }

                        foreach (DataRow dr in ShowProductTrending.Rows)
                        {

                            if (Int32.Parse(dr["PackId"].ToString()) == PackId)
                            {
                                dr["NotInCart"] = false;
                                dr["InCart"] = true;

                                dr["NoOfItems"] = row["NoOfItems"];




                            }
                        }

                    }
                }



                //RepeaterHotProducts.DataSource = ShowProduct;
                //RepeaterHotProducts.DataBind();
               // RepeaterTrending.DataSource = ShowProductTrending;
               // RepeaterTrending.DataBind();
            }
            catch
            {
            }
        }

        

        protected void RepeaterHotCommand(object source, RepeaterCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.ToString() == "Add")
                {
                    HtmlContainerControl DivAddBtn = (HtmlContainerControl)e.Item.FindControl("DivAddBtn");
                    HtmlContainerControl DivQty = (HtmlContainerControl)e.Item.FindControl("DivQty");
                    DivAddBtn.Visible = false;
                    DivQty.Visible = true;



                    try
                    {
                        DataTable dt = (DataTable)Session["order"];
                        string[] Details = new string[10];
                        Details = e.CommandArgument.ToString().Split(';');
                        int ItemId = int.Parse(Details[0].ToString());
                        String ItemName = Details[1];
                        String PackSize = Details[2];
                        float Mrp = float.Parse(Details[3].ToString());
                        float Selling = float.Parse(Details[4].ToString());
                        int PackId = int.Parse(Details[5]);
                        String ImgMbl = Details[6];
                        Label Qty = (Label)e.Item.FindControl("Qty");
                        //int Qn = int.Parse(Qty.Text);
                        int Qn = 1;
                        Qty.Text = "1";

                        float TotalMrp = (Qn * Mrp);
                        float TotalPrice = (Qn * Selling);

                        var Newrow = dt.NewRow();
                        Newrow["ItemId"] = ItemId;
                        Newrow["ItemName"] = ItemName;
                        Newrow["PackId"] = PackId;
                        Newrow["PackSize"] = PackSize;
                        Newrow["Mrp"] = Mrp;
                        Newrow["Price"] = Selling;
                        Newrow["NoOfItems"] = Qn;
                        Newrow["ImgUrl"] = ImgMbl;
                        Newrow["Discount"] = Details[7];
                        Newrow["Type"] = Details[8];
                        Newrow["Brand"] = Details[9];
                        Newrow["TotalMrp"] = TotalMrp;
                        Newrow["TotalPrice"] = TotalPrice; Newrow["TotalCashback"] = 0;Newrow["Cashback"] = Details[10]; Newrow["Pcb1"] = Details[11]; Newrow["Pcb2"] = Details[12]; Newrow["Pcb3"] = Details[13];


                        dt.Rows.Add(Newrow);
                        Session["order"] = dt;


                        Session["ItemCount"] = int.Parse(Session["ItemCount"].ToString()) + 1;
                        cartCount.Text = Session["ItemCount"].ToString();
                        DataBindme();
                       




                    }
                    catch
                    {
                    }


                }


            }
            catch
            {
            }
            try
            {
                if (e.CommandName.ToString() == "DecreaseQty")
                {
                    Label Qty = (Label)e.Item.FindControl("Qty");
                    int Qn = int.Parse(Qty.Text);
                    if (Qn == 1)
                    {
                        HtmlContainerControl DivAddBtn = (HtmlContainerControl)e.Item.FindControl("DivAddBtn");
                        HtmlContainerControl DivQty = (HtmlContainerControl)e.Item.FindControl("DivQty");
                        DivAddBtn.Visible = true;
                        DivQty.Visible = false;
                        Qty.Text = "0";


                        DataTable dt = (DataTable)Session["order"];
                        int PackId = int.Parse(e.CommandArgument.ToString());
                        try
                        {
                            foreach (DataRow row in dt.Rows)
                            {
                                if (Int32.Parse(row["PackId"].ToString()) == PackId)
                                {
                                    dt.Rows.Remove(row);
                                    Session["ItemCount"] = int.Parse(Session["ItemCount"].ToString()) - 1;
                                    cartCount.Text = Session["ItemCount"].ToString();


                                }

                            }
                        }
                        catch
                        {
                        }
                        Session["order"] = dt;
                        DataBindme();

                    }
                    else if (Qn > 1)
                    {
                        Qty.Text = (Qn - 1).ToString();
                        DataTable dt = (DataTable)Session["order"];
                        int PackId = int.Parse(e.CommandArgument.ToString());
                        foreach (DataRow row in dt.Rows)
                        {
                            if (Int32.Parse(row["PackId"].ToString()) == PackId)
                            {
                                int NoOfItems = Qn - 1;
                                row["NoOfItems"] = NoOfItems;
                                float Mrp = float.Parse(row["Mrp"].ToString());
                                float Price = float.Parse(row["Price"].ToString());
                                float TotMrp = Mrp * NoOfItems;
                                float TotPric = Price * NoOfItems;
                                row["TotalMrp"] = TotMrp;
                                row["TotalPrice"] = TotPric;


                            }

                        }
                        Session["order"] = dt;
                        DataBindme();
                    }


                }
            }
            catch
            {
            }
            try
            {
                if (e.CommandName.ToString() == "IncreaseQty")
                {


                    Label Qty = (Label)e.Item.FindControl("Qty");
                    int Qn = int.Parse(Qty.Text);
                    Qty.Text = (Qn + 1).ToString();

                    DataTable dt = (DataTable)Session["order"];
                    int PackId = int.Parse(e.CommandArgument.ToString());
                    foreach (DataRow row in dt.Rows)
                    {
                        if (Int32.Parse(row["PackId"].ToString()) == PackId)
                        {
                            int NoOfItems = Qn + 1;
                            row["NoOfItems"] = NoOfItems;
                            float Mrp = float.Parse(row["Mrp"].ToString());
                            float Price = float.Parse(row["Price"].ToString());
                            float TotMrp = Mrp * NoOfItems;
                            float TotPric = Price * NoOfItems;
                            row["TotalMrp"] = TotMrp;
                            row["TotalPrice"] = TotPric;


                        }

                    }
                    Session["order"] = dt;

                    DataBindme();
                }
            }
            catch
            {
            }
            
        }

        protected void RepeaterTrendingCommand(object source, RepeaterCommandEventArgs e)
        {
            try
            {
                if (e.CommandName.ToString() == "Add")
                {
                    HtmlContainerControl DivAddBtn = (HtmlContainerControl)e.Item.FindControl("DivAddBtn");
                    HtmlContainerControl DivQty = (HtmlContainerControl)e.Item.FindControl("DivQty");
                    DivAddBtn.Visible = false;
                    DivQty.Visible = true;



                    try
                    {
                        DataTable dt = (DataTable)Session["order"];
                        string[] Details = new string[10];
                        Details = e.CommandArgument.ToString().Split(';');
                        int ItemId = int.Parse(Details[0].ToString());
                        String ItemName = Details[1];
                        String PackSize = Details[2];
                        float Mrp = float.Parse(Details[3].ToString());
                        float Selling = float.Parse(Details[4].ToString());
                        int PackId = int.Parse(Details[5]);
                        String ImgMbl = Details[6];
                        Label Qty = (Label)e.Item.FindControl("Qty");
                        //int Qn = int.Parse(Qty.Text);
                        int Qn = 1;
                        Qty.Text = "1";

                        float TotalMrp = (Qn * Mrp);
                        float TotalPrice = (Qn * Selling);

                        var Newrow = dt.NewRow();
                        Newrow["ItemId"] = ItemId;
                        Newrow["ItemName"] = ItemName;
                        Newrow["PackId"] = PackId;
                        Newrow["PackSize"] = PackSize;
                        Newrow["Mrp"] = Mrp;
                        Newrow["Price"] = Selling;
                        Newrow["NoOfItems"] = Qn;
                        Newrow["ImgUrl"] = ImgMbl;
                        Newrow["Discount"] = Details[7];
                        Newrow["Type"] = Details[8];
                        Newrow["Brand"] = Details[9];
                        Newrow["TotalMrp"] = TotalMrp;
                        Newrow["TotalPrice"] = TotalPrice; Newrow["TotalCashback"] = 0;Newrow["Cashback"] = Details[10]; Newrow["Pcb1"] = Details[11]; Newrow["Pcb2"] = Details[12]; Newrow["Pcb3"] = Details[13];


                        dt.Rows.Add(Newrow);
                        Session["order"] = dt;


                        Session["ItemCount"] = int.Parse(Session["ItemCount"].ToString()) + 1;
                        cartCount.Text = Session["ItemCount"].ToString();
                        DataBindme();




                    }
                    catch
                    {
                    }


                }


            }
            catch
            {
            }
            try
            {
                if (e.CommandName.ToString() == "DecreaseQty")
                {
                    Label Qty = (Label)e.Item.FindControl("Qty");
                    int Qn = int.Parse(Qty.Text);
                    if (Qn == 1)
                    {
                        HtmlContainerControl DivAddBtn = (HtmlContainerControl)e.Item.FindControl("DivAddBtn");
                        HtmlContainerControl DivQty = (HtmlContainerControl)e.Item.FindControl("DivQty");
                        DivAddBtn.Visible = true;
                        DivQty.Visible = false;
                        Qty.Text = "0";


                        DataTable dt = (DataTable)Session["order"];
                        int PackId = int.Parse(e.CommandArgument.ToString());
                        try
                        {
                            foreach (DataRow row in dt.Rows)
                            {
                                if (Int32.Parse(row["PackId"].ToString()) == PackId)
                                {
                                    dt.Rows.Remove(row);
                                    Session["ItemCount"] = int.Parse(Session["ItemCount"].ToString()) - 1;
                                    cartCount.Text = Session["ItemCount"].ToString();


                                }

                            }
                        }
                        catch
                        {
                        }
                        Session["order"] = dt;
                        DataBindme();

                    }
                    else if (Qn > 1)
                    {
                        Qty.Text = (Qn - 1).ToString();
                        DataTable dt = (DataTable)Session["order"];
                        int PackId = int.Parse(e.CommandArgument.ToString());
                        foreach (DataRow row in dt.Rows)
                        {
                            if (Int32.Parse(row["PackId"].ToString()) == PackId)
                            {
                                int NoOfItems = Qn - 1;
                                row["NoOfItems"] = NoOfItems;
                                float Mrp = float.Parse(row["Mrp"].ToString());
                                float Price = float.Parse(row["Price"].ToString());
                                float TotMrp = Mrp * NoOfItems;
                                float TotPric = Price * NoOfItems;
                                row["TotalMrp"] = TotMrp;
                                row["TotalPrice"] = TotPric;


                            }

                        }
                        Session["order"] = dt;
                        DataBindme();
                    }


                }
            }
            catch
            {
            }
            try
            {
                if (e.CommandName.ToString() == "IncreaseQty")
                {


                    Label Qty = (Label)e.Item.FindControl("Qty");
                    int Qn = int.Parse(Qty.Text);
                    Qty.Text = (Qn + 1).ToString();

                    DataTable dt = (DataTable)Session["order"];
                    int PackId = int.Parse(e.CommandArgument.ToString());
                    foreach (DataRow row in dt.Rows)
                    {
                        if (Int32.Parse(row["PackId"].ToString()) == PackId)
                        {
                            int NoOfItems = Qn + 1;
                            row["NoOfItems"] = NoOfItems;
                            float Mrp = float.Parse(row["Mrp"].ToString());
                            float Price = float.Parse(row["Price"].ToString());
                            float TotMrp = Mrp * NoOfItems;
                            float TotPric = Price * NoOfItems;
                            row["TotalMrp"] = TotMrp;
                            row["TotalPrice"] = TotPric;


                        }

                    }
                    Session["order"] = dt;
                    DataBindme();


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

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("ItemList.aspx?Type=3", false);
            }
            catch
            {
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Search.aspx", false);
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