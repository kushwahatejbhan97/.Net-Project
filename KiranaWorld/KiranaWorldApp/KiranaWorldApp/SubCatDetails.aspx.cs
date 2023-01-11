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
    public partial class SubCatDetails : System.Web.UI.Page
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


                    }
                    catch
                    {
                    }
                }
            }


            try
            {

                if (!Page.IsPostBack)
                {
                    Session["CheckOutVisit"] = 0;
                    int CatId = int.Parse(Request.QueryString["CatId"]);
                    catname.Text = dalclass.getcatname(CatId);
                    DataTable ShowProduct = dalclass.getCatItem(CatId.ToString());
                    Session["ShowProduct"] = ShowProduct;


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
                        dt.Columns.Add("TotalPrice", typeof(Double));
                        dt.Columns.Add("TotalCashback", typeof(Double));
                        dt.Columns.Add("Cashback", typeof(Boolean));
                        dt.Columns.Add("pcb1", typeof(Int32));
                        dt.Columns.Add("pcb2", typeof(Int32));
                        dt.Columns.Add("pcb3", typeof(Int32));


                       

                        Session["order"] = dt;
                        Session["ItemCount"] = "0";



                    }

                    else
                    {
                        DataTable dto = (DataTable)Session["order"];
                        Session["ItemCount"] = dto.Rows.Count;
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
                        }
                    }
                    cartCount.Text = Session["ItemCount"].ToString();
                    RepeaterProduct.DataSource = ShowProduct;
                    RepeaterProduct.DataBind();
                }
            }
            catch
            {
            }



        }


        

        protected void RepeaterProductCommand(object source, RepeaterCommandEventArgs e)
        {
            try
            {
                snackbar.Attributes.Add("class", "");
                closemeimg.Attributes.Add("class", "hideme");
                DataTable dt = (DataTable)Session["order"];
                if (e.CommandName.ToString() == "Add")
                {
                    HtmlContainerControl DivAddBtn = (HtmlContainerControl)e.Item.FindControl("DivAddBtn");
                    HtmlContainerControl DivQty = (HtmlContainerControl)e.Item.FindControl("DivQty");
                    Label LblQty = (Label)e.Item.FindControl("Qty");
                    DivAddBtn.Visible = false;
                    DivQty.Visible = true;
                    try
                    {


                        string[] Details = new string[14];
                        Details = e.CommandArgument.ToString().Split(';');
                        int ItemId = int.Parse(Details[0].ToString());
                        String ItemName = Details[1];
                        String PackSize = Details[2];
                        float Mrp = float.Parse(Details[3].ToString());
                        float Selling = float.Parse(Details[4].ToString());
                        int PackId = int.Parse(Details[5]);
                        String ImgMbl = Details[6];
                        int Qty = 0;

                        foreach (DataRow row in dt.Rows)
                        {
                            if (Int32.Parse(row["PackId"].ToString()) == PackId)
                            {
                                Qty = int.Parse(row["NoOfItems"].ToString());
                                LblQty.Text = Qty.ToString();
                            }
                        }


                        if (Qty == 0)
                        {
                            Qty = 1;

                            LblQty.Text = "1";

                            float TotalMrp = (Qty * Mrp);
                            float TotalPrice = (Qty * Selling);

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
                            Newrow["TotalPrice"] = TotalPrice; 
                            Newrow["TotalCashback"] = 0;
                            Newrow["Cashback"] = Details[10];
                            Newrow["Pcb1"] = Details[11];
                            Newrow["Pcb2"] = Details[12];
                            Newrow["Pcb3"] = Details[13];


                            dt.Rows.Add(Newrow);
                            Session["order"] = dt;
                            //databindme();
                            try
                            {
                                int ClientId = int.Parse(Session["ClientId"].ToString());

                                dalclass.InsertCartDefault(ItemId, ItemName, PackId, PackSize, Mrp, Selling, 1, ImgMbl, int.Parse(Details[7]), Details[8], Details[9], TotalMrp, TotalPrice, ClientId, bool.Parse(Details[10]), int.Parse(Details[11]), int.Parse(Details[12]), int.Parse(Details[13]));
                            }
                            catch
                            {
                            }
                        }


                        Session["ItemCount"] = dt.Rows.Count;
                        cartCount.Text = dt.Rows.Count.ToString();
                       



                    }
                    catch(Exception ex)
                    {
                        string massages;
                    }
                    
                }
                else if (e.CommandName.ToString() == "DecreaseQty")
                {

                    int Qty = 0;
                    int PackId = int.Parse(e.CommandArgument.ToString());
                    Label LblQty = (Label)e.Item.FindControl("Qty");
                    foreach (DataRow row in dt.Rows)
                    {
                        if (Int32.Parse(row["PackId"].ToString()) == PackId)
                        {
                            Qty = int.Parse(row["NoOfItems"].ToString());
                        }
                    }

                    if (Qty == 1)
                    {
                        HtmlContainerControl DivAddBtn = (HtmlContainerControl)e.Item.FindControl("DivAddBtn");
                        HtmlContainerControl DivQty = (HtmlContainerControl)e.Item.FindControl("DivQty");
                        DivAddBtn.Visible = true;
                        DivQty.Visible = false;
                        LblQty.Text = "0";



                        try
                        {
                            foreach (DataRow row in dt.Rows)
                            {
                                if (Int32.Parse(row["PackId"].ToString()) == PackId)
                                {
                                    dt.Rows.Remove(row);
                                    Session["ItemCount"] = dt.Rows.Count;
                                    cartCount.Text = dt.Rows.Count.ToString();
                                    try
                                    {
                                        int ClientId = int.Parse(Session["ClientId"].ToString());
                                        dalclass.RemoveCart(ClientId, PackId);
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
                    else if (Qty > 1)
                    {
                        LblQty.Text = (Qty - 1).ToString();


                        foreach (DataRow row in dt.Rows)
                        {
                            if (Int32.Parse(row["PackId"].ToString()) == PackId)
                            {
                                int NoOfItems = (Qty - 1);
                                row["NoOfItems"] = NoOfItems;
                                float Mrp = float.Parse(row["Mrp"].ToString());
                                float Price = float.Parse(row["Price"].ToString());
                                float TotMrp = Mrp * NoOfItems;
                                float TotPric = Price * NoOfItems;
                                row["TotalMrp"] = TotMrp;
                                row["TotalPrice"] = TotPric;


                            }

                        }

                       
                        try
                        {
                            int ClientId = int.Parse(Session["ClientId"].ToString());
                            dalclass.UpdateCart(PackId, Qty - 1, ClientId);
                        }
                        catch
                        {
                        }
                    }
                    Session["order"] = dt;
                    //databindme();

                }

                else if (e.CommandName.ToString() == "IncreaseQty")
                {
                    int Qty = 0;
                    int PackId = int.Parse(e.CommandArgument.ToString());
                    foreach (DataRow row in dt.Rows)
                    {
                        if (Int32.Parse(row["PackId"].ToString()) == PackId)
                        {
                            Qty = int.Parse(row["NoOfItems"].ToString());
                        }
                    }
                    if (Qty < 12)
                    {
                        Label LblQty = (Label)e.Item.FindControl("Qty");
                        LblQty.Text = (Qty + 1).ToString();



                        foreach (DataRow row in dt.Rows)
                        {
                            if (Int32.Parse(row["PackId"].ToString()) == PackId)
                            {
                                int NoOfItems = Qty + 1;
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
                        //databindme();

                        try
                        {
                            int ClientId = int.Parse(Session["ClientId"].ToString());
                            dalclass.UpdateCart(PackId, Qty + 1, ClientId);
                        }
                        catch
                        {
                        }
                    }
                    else
                    {
                        alertpop.Text = "Maximum Item Quanty is reached.";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "myalertPop", "myalertPop()", true);
                    }

                   

                }

                else if (e.CommandName.ToString() == "SizeMaker")
                {

                    string[] arg = new string[4];
                    arg = e.CommandArgument.ToString().Split(';');
                    int ItemId = int.Parse(arg[0]);
                    ItemName.Text = arg[1];

                    DataTable ShowSizes = dalclass.getSizeDetails(ItemId, arg[2], arg[3]);

                    DataTable dto = (DataTable)Session["order"];


                    foreach (DataRow row in dto.Rows)
                    {
                        int PackId = int.Parse(row["PackId"].ToString());

                        foreach (DataRow dr in ShowSizes.Rows)
                        {

                            if (Int32.Parse(dr["PackId"].ToString()) == PackId)
                            {
                                dr["NotInCart"] = false;
                                dr["InCart"] = true;

                                dr["NoOfItems"] = row["NoOfItems"];




                            }
                        }

                    }



                    RepeaterChooseQuantity.DataSource = ShowSizes;
                    RepeaterChooseQuantity.DataBind();
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "mytoast", "mytoast()", true);
                    snackbar.Attributes.Add("class", "show");
                    closemeimg.Attributes.Add("class", "show");





                }


                try
                {
                    DataTable dto = (DataTable)Session["order"];

                    DataTable ShowProduct = (DataTable)Session["ShowProduct"];
                    int itemcount = 0;
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
                                itemcount++;
                            }
                        }

                    }

                    cartCount.Text = Session["ItemCount"].ToString();
                    RepeaterProduct.DataSource = ShowProduct;
                    RepeaterProduct.DataBind();

                }
                catch
                {
                }
            }
            catch
            {
            }
           
        }





        protected void RepeaterProductChooseQuantity(object source, RepeaterCommandEventArgs e)
        {
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
                Label LblQty = (Label)e.Item.FindControl("Qty");

                if (e.CommandName.ToString() == "Add")
                {
                    HtmlContainerControl DivAddBtn = (HtmlContainerControl)e.Item.FindControl("DivAddBtn");
                    HtmlContainerControl DivQty = (HtmlContainerControl)e.Item.FindControl("DivQty");
                    DivAddBtn.Visible = false;
                    DivQty.Visible = true;
                    try
                    {

                        

                        ArrayList CashbackData = dalclass.CashbackDetails(ItemId);
                        bool Cashback = bool.Parse(CashbackData[0].ToString());
                        int Pcb1 = int.Parse(CashbackData[1].ToString());
                        int Pcb2 = int.Parse(CashbackData[2].ToString());
                        int Pcb3 = int.Parse(CashbackData[3].ToString());

                        int Qty = 0;

                        foreach (DataRow row in dt.Rows)
                        {
                            if (Int32.Parse(row["PackId"].ToString()) == PackId)
                            {
                                Qty = int.Parse(row["NoOfItems"].ToString());
                                LblQty.Text = Qty.ToString();
                            }
                        }


                        if (Qty == 0)
                        {
                            Qty = 1;

                            LblQty.Text = "1";

                            float TotalMrp = (Qty * Mrp);
                            float TotalPrice = (Qty * Selling);

                            var Newrow = dt.NewRow();
                            Newrow["ItemId"] = ItemId;
                            Newrow["ItemName"] = ItemName;
                            Newrow["PackId"] = PackId;
                            Newrow["PackSize"] = PackSize;
                            Newrow["Mrp"] = Mrp;
                            Newrow["Price"] = Selling;
                            Newrow["NoOfItems"] = "1";
                            Newrow["ImgUrl"] = ImgMbl;
                            Newrow["Discount"] = Details[7];
                            Newrow["Type"] = Details[8];
                            Newrow["Brand"] = Details[9];
                            Newrow["TotalMrp"] = TotalMrp;
                            Newrow["TotalPrice"] = TotalPrice; 
                            Newrow["TotalCashback"] = 0;
                            Newrow["Cashback"] = Cashback;
                            Newrow["Pcb1"] = Pcb1;
                            Newrow["Pcb2"] = Pcb2;
                            Newrow["Pcb3"] = Pcb3; 
                            





                            dt.Rows.Add(Newrow);
                            Session["order"] = dt;
                            //databindme();
                            try
                            {
                                int ClientId = int.Parse(Session["ClientId"].ToString());

                                dalclass.InsertCartDefault(ItemId, ItemName, PackId, PackSize, Mrp, Selling, 1, ImgMbl, int.Parse(Details[7]), Details[8], Details[9], TotalMrp, TotalPrice, ClientId, bool.Parse(Details[10]), int.Parse(Details[11]), int.Parse(Details[12]), int.Parse(Details[13]));
                            }
                            catch
                            {
                            }
                        }


                        Session["ItemCount"] = dt.Rows.Count;
                        cartCount.Text = dt.Rows.Count.ToString();

                    }
                    catch
                    {
                    }
                }
                else if (e.CommandName.ToString() == "DecreaseQty")
                {
                    int Qn = 0;
                   
                    foreach (DataRow row in dt.Rows)
                    {
                        if (Int32.Parse(row["PackId"].ToString()) == PackId)
                        {
                            Qn = int.Parse(row["NoOfItems"].ToString());
                        }
                    }

                    if (Qn == 1)
                    {
                        HtmlContainerControl DivAddBtn = (HtmlContainerControl)e.Item.FindControl("DivAddBtn");
                        HtmlContainerControl DivQty = (HtmlContainerControl)e.Item.FindControl("DivQty");
                        DivAddBtn.Visible = true;
                        DivQty.Visible = false;
                        LblQty.Text = "0";



                        try
                        {
                            foreach (DataRow row in dt.Rows)
                            {
                                if (Int32.Parse(row["PackId"].ToString()) == PackId)
                                {
                                    dt.Rows.Remove(row);
                                    Session["ItemCount"] = dt.Rows.Count;
                                    cartCount.Text = Session["ItemCount"].ToString();
                                    try
                                    {
                                        int ClientId = int.Parse(Session["ClientId"].ToString());
                                        dalclass.RemoveCart(ClientId, PackId);
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
                        Session["order"] = dt;

                    }
                    else if (Qn > 1)
                    {
                        LblQty.Text = (Qn - 1).ToString();


                        foreach (DataRow row in dt.Rows)
                        {
                            if (Int32.Parse(row["PackId"].ToString()) == PackId)
                            {
                                int NoOfItems = Qn - 1;
                                row["NoOfItems"] = NoOfItems;
                                float mrp = float.Parse(row["Mrp"].ToString());
                                float Price = float.Parse(row["Price"].ToString());
                                float TotMrp = mrp * NoOfItems;
                                float TotPric = Price * NoOfItems;
                                row["TotalMrp"] = TotMrp;
                                row["TotalPrice"] = TotPric;


                            }

                        }
                        Session["order"] = dt;
                        //databindme();
                        try
                        {
                            int ClientId = int.Parse(Session["ClientId"].ToString());
                            dalclass.UpdateCart(PackId, Qn - 1, ClientId);
                        }
                        catch
                        {
                        }
                    }
                }


                else if (e.CommandName.ToString() == "IncreaseQty")
                {

                    int Qn = 0;
                   
                    foreach (DataRow row in dt.Rows)
                    {
                        if (Int32.Parse(row["PackId"].ToString()) == PackId)
                        {
                            Qn = int.Parse(row["NoOfItems"].ToString());
                        }
                    }

                    if (Qn < 12)
                    {
                        LblQty.Text = (Qn + 1).ToString();

                        foreach (DataRow row in dt.Rows)
                        {
                            if (Int32.Parse(row["PackId"].ToString()) == PackId)
                            {
                                int NoOfItems = Qn + 1;
                                row["NoOfItems"] = NoOfItems;
                                float mrp = float.Parse(row["Mrp"].ToString());
                                float Price = float.Parse(row["Price"].ToString());
                                float TotMrp = mrp * NoOfItems;
                                float TotPric = Price * NoOfItems;
                                row["TotalMrp"] = TotMrp;
                                row["TotalPrice"] = TotPric;


                            }

                        }
                        try
                        {
                            //databindme();
                            int ClientId = int.Parse(Session["ClientId"].ToString());
                            dalclass.UpdateCart(PackId, Qn + 1, ClientId);
                        }
                        catch
                        {
                        }
                    }
                    else
                    {
                        alertpop.Text = "Maximum Item Quanty is reached.";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "myalertPop", "myalertPop()", true);
                    }


                    Session["order"] = dt;


                }



                {

                    

                    DataTable ShowSizes = dalclass.getSizeDetails(ItemId, Details[8].ToString(), Details[9].ToString());

                    DataTable dto = (DataTable)Session["order"];


                    foreach (DataRow row in dto.Rows)
                    {
                        int Packid = int.Parse(row["PackId"].ToString());

                        foreach (DataRow dr in ShowSizes.Rows)
                        {

                            if (Int32.Parse(dr["PackId"].ToString()) == PackId)
                            {
                                dr["NotInCart"] = false;
                                dr["InCart"] = true;

                                dr["NoOfItems"] = row["NoOfItems"];




                            }
                        }

                    }



                    RepeaterChooseQuantity.DataSource = ShowSizes;
                    RepeaterChooseQuantity.DataBind();
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "mytoast", "mytoast()", true);
                    snackbar.Attributes.Add("class", "show");
                    closemeimg.Attributes.Add("class", "show");





                }
            }
            catch
            {
            }

            try
            {
                DataTable dto = (DataTable)Session["order"];

                DataTable ShowProduct = (DataTable)Session["ShowProduct"];
                int itemcount = 0;
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
                            itemcount++;
                        }
                    }

                }

                cartCount.Text = Session["ItemCount"].ToString();
                RepeaterProduct.DataSource = ShowProduct;
                RepeaterProduct.DataBind();

            }
            catch
            {
            }
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "mytoast", "mytoast()", true);
            snackbar.Attributes.Add("class", "show");
            closemeimg.Attributes.Add("class", "show");

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
                Response.Redirect("ItemList.aspx?Offer=" + 1, false);
            }
            catch
            {
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Search.aspx", false);
        }


    }
}