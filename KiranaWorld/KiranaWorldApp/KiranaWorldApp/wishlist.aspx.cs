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
    public partial class wishlist : System.Web.UI.Page
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
                if (ClientId > 0)
                {
                    try
                    {
                        if (Session["order"] == null)
                        {
                            DataTable cart = dalclass.cartRetrieve(ClientId);
                            Session["order"] = cart;

                        }
                        DataTable dto = (DataTable)Session["order"];
                        int ProductCount = dto.Rows.Count;
                        if (ProductCount == 0)
                        {
                            DataTable cart = dalclass.cartRetrieve(ClientId);
                            Session["order"] = cart;
                        }

                        DataTable ShowProduct = dalclass.WishRetrieve(ClientId);
                        RepeaterHotProducts.DataSource = ShowProduct;
                        RepeaterHotProducts.DataBind();
                        cartCount.Text = dto.Rows.Count.ToString();
                    }
                    catch
                    {
                    }
                }
                else
                {
                    Response.Redirect("Default.aspx", false);
                }
            }


        }

        protected void RepeaterCartCommand(object source, RepeaterCommandEventArgs e)
        {

            try
            {
                if (e.CommandName.ToString() == "MoveToCart")
                {
                    DataTable dt = (DataTable)Session["order"];

                    string[] Details = new string[15];
                    Details = e.CommandArgument.ToString().Split(';');
                    int ItemId = int.Parse(Details[0].ToString());
                    String ItemName = Details[1];
                    String PackSize = Details[2];
                    float Mrp = float.Parse(Details[3].ToString());
                    float Selling = float.Parse(Details[4].ToString());
                    int PackId = int.Parse(Details[5]);
                    String ImgMbl = Details[6];


                    int Qty = int.Parse(Details[10].ToString());


                    float TotalMrp = (Qty * Mrp);
                    float TotalPrice = (Qty * Selling);
                    int ClientId = 0;

                    try
                    {
                        ClientId = int.Parse(Session["ClientId"].ToString());
                        var Newrow = dt.NewRow();
                        Newrow["ItemId"] = ItemId;
                        Newrow["ItemName"] = ItemName;
                        Newrow["PackId"] = PackId;
                        Newrow["PackSize"] = PackSize;
                        Newrow["Mrp"] = Mrp;
                        Newrow["Price"] = Selling;
                        Newrow["NoOfItems"] = Qty;
                        Newrow["ImgUrl"] = ImgMbl;
                        Newrow["Discount"] = Details[7];
                        Newrow["Type"] = Details[8];
                        Newrow["Brand"] = Details[9];
                        Newrow["TotalMrp"] = TotalMrp;
                        Newrow["TotalPrice"] = TotalPrice; Newrow["TotalCashback"] = 0;Newrow["Cashback"] = Details[10]; Newrow["Pcb1"] = Details[11]; Newrow["Pcb2"] = Details[12]; Newrow["Pcb3"] = Details[13];


                        dt.Rows.Add(Newrow);
                        Session["order"] = dt;
                        dalclass.InsertCartDefault(ItemId, ItemName, PackId, PackSize, Mrp, Selling, 1, ImgMbl, int.Parse(Details[7]), Details[8], Details[9], TotalMrp, TotalPrice, ClientId, bool.Parse(Details[11]), int.Parse(Details[12]), int.Parse(Details[13]), int.Parse(Details[14]));
                       // dalclass.InsertCart(ItemId, ItemName, PackId, PackSize, Mrp, Selling, Qty, ImgMbl, int.Parse(Details[7]), Details[8], Details[9], TotalMrp, TotalPrice, ClientId);
                        dalclass.RemoveWishList(ClientId, PackId);

                    }
                    catch
                    {
                    }

                    DataTable ShowProduct = dalclass.WishRetrieve(ClientId);
                    RepeaterHotProducts.DataSource = ShowProduct;
                    RepeaterHotProducts.DataBind();
                    Session["ItemCount"] = dt.Rows.Count;
                    cartCount.Text = dt.Rows.Count.ToString();
                }
            }
            catch
            {
            }

        }


    }
}