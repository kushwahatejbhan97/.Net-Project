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
    public partial class ItemDetails : System.Web.UI.Page
    {
        DAL.Class1 dalclass = new DAL.Class1();

       


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                int ClientId =0;
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
                if(ClientId>0)
                {
                try
                {
                    if (Session["order"] == null )
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

                databindme();
            }

            
        }


        private void databindme()
        {
            try
            {
                Session["CheckOutVisit"] = 0;
                
                    snackbar.Attributes.Add("class", "");
                    DataTable ShowProduct = new DataTable();

                    DataTable SubCat = new DataTable();
                    int TotalCashbackAmount = 0; //this line
                    String cashbackType = "Pcb1"; // this line

                    int Type = 0;
                    try
                    {
                        Type = int.Parse(Request.QueryString["Type"].ToString());
                    }
                    catch
                    {
                    }

                    Session["Type"] = Type;

                    if (Type == 1)
                    {
                        int CatId = int.Parse(Request.QueryString["CatId"].ToString());
                        ShowProduct = dalclass.get_item1(CatId);
                        SubCat = dalclass.SubCatgetCatitem(CatId);
                        Session["CatId"] = CatId;
                        catname.Text = dalclass.getcatname(CatId);
                    }
                    else if (Type == 2)
                    {
                        String Search = (Request.QueryString["Search"].ToString().Trim());
                        Session["Search"] = Search;

                        ShowProduct = dalclass.get_itemBySearch(searchQueryMaker());
                        SubCat = dalclass.SubCatitemBySearch(Search, 40);
                    if(!IsPostBack)
                    {
                        catname.Text = Search;
                        txtSearch.Text = Search;
                    }
                        
                    }
                    else if (Type == 3)
                    {
                        ShowProduct = dalclass.get_itemByOffer(20);
                        SubCat = dalclass.SubCatitemByOffer(20);
                        catname.Text = "Offers";
                    }
                    else if (Type == 4 || Type == 0)
                    {

                        ShowProduct = dalclass.get_itemByOffer(20);
                        SubCat = dalclass.SubCatitemByOffer(20);
                        catname.Text = "Offers";

                    }
                    else if (Type == 5)
                    {
                        int SubCatId = int.Parse(Request.QueryString["SubCatId"].ToString());
                        ShowProduct = dalclass.get_ItemsbyS(SubCatId);
                        SubCat = dalclass.SubCatItemsbyS(SubCatId);
                        Session["SubCat"] = SubCatId;
                        catname.Text = dalclass.getSubCatname(SubCatId);

                    }
                    Session["ShowProduct"] = ShowProduct;
                    Chkscat.DataTextField = "SubCatName";
                    Chkscat.DataValueField = "SubCatId";
                    Chkscat.DataSource = SubCat;
                    Chkscat.DataBind();
                    foreach (DataRow dr in ShowProduct.Rows)
                    {
                        if (!ChksBrand.Items.Contains(new ListItem(dr["Brand"].ToString())))
                        {
                            ListItem li = new ListItem();
                            li.Text = dr["Brand"].ToString();
                            li.Value = dr["Brand"].ToString();
                            ChksBrand.Items.Add(li);
                        }

                    }



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
                        dt.Columns.Add("Pcb1");
                        dt.Columns.Add("Pcb2");
                        dt.Columns.Add("Pcb3");

                        Session["order"] = dt;

                        Session["ItemCount"] = 0;
                        cartCount.Text = "0";




                    }
                    else
                    {

                        DataTable dto = (DataTable)Session["order"];
                        Session["ItemCount"] = dto.Rows.Count;
                        cartCount.Text = dto.Rows.Count.ToString();

                        foreach (DataRow row in dto.Rows)
                        {
                            int PackId = int.Parse(row["PackId"].ToString());

                            //start
                            if (bool.Parse(row["Cashback"].ToString()))
                            {
                                TotalCashbackAmount = TotalCashbackAmount + int.Parse(row["TotalPrice"].ToString());

                            }
                            //end

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

                        // start
                        ArrayList Cashbackmount = dalclass.CashbackAmountCheck();

                        int CashbackAmount = int.Parse(Cashbackmount[0].ToString());
                        int CashbackAmount1 = int.Parse(Cashbackmount[1].ToString());

                        if (TotalCashbackAmount < CashbackAmount)
                        {
                            cashbackType = "Pcb1";
                        }
                        else if (TotalCashbackAmount >= CashbackAmount && TotalCashbackAmount < CashbackAmount1)
                        {
                            cashbackType = "Pcb2";
                        }
                        else if (TotalCashbackAmount >= CashbackAmount1)
                        {
                            cashbackType = "Pcb3";
                        }

                        foreach (DataRow row in dto.Rows)
                        {

                            if (bool.Parse(row["Cashback"].ToString()))
                            {
                                Double TotalPrice = Double.Parse(row["TotalPrice"].ToString());
                                int ptg = int.Parse(row[cashbackType].ToString());
                                row["TotalCashback"] = (TotalPrice * ptg) / 100;
                            }

                        }

                        // end

                    }

                    RepeaterProduct.DataSource = ShowProduct;
                    RepeaterProduct.DataBind();



                    if (RepeaterProduct.Items.Count == 0)
                    {
                        NoItemDisplay.Visible = true;
                    }
                    else
                    {
                        NoItemDisplay.Visible = false;
                    }

                    DataTable ShowSizes = dalclass.getSizeDetails(0, "", "");
                    RepeaterChooseQuantity.DataSource = ShowSizes;
                    RepeaterChooseQuantity.DataBind();


            

            }
            catch
            {
            }
        }

            protected String searchQueryMaker()
        {
            String Query = "SELECT [ItemId], [ItemName], CAST([Mrp] AS INT) as [Mrp] , [Discount], [Multi] ,[Single] , [Type], [ImgUrlMbl], [Rating], [Brand], CAST([SellingPrice] AS INT) as [SellingPrice] , [PackSize], [PackId], 'True' AS NotInCart, 'False' AS InCart, '0' AS  NoOfItems, [OutofStack],  ~ [OutofStack] AS InStock, [Url], [Cashback], [Pcb1], [Pcb2], [Pcb3]  FROM [Item]  WHERE (( OutofStack = '0' ) OR ( OutofStack = '1' )) ";
            String Query1 = "";

            String Query3 = "";
            String Query4 = "";

            String Search = Session["Search"].ToString();

            if (Search != "")
            {
                string[] cusinearr1 = Search.Split(' ');
                ArrayList cusinearr = new ArrayList(cusinearr1);
                if (cusinearr.Count > 0)
                {

                    Query1 = Query1 + "(";



                    Query3 = Query3 + " (";

                    Query4 = Query4 + " (";

                    for (int i = 0; i < cusinearr.Count; i++)
                    {
                        if (i > 0)
                        {
                            Query1 = Query1 + " AND ";

                            Query3 = Query3 + " AND ";
                            Query4 = Query4 + " AND ";


                        }
                        Query1 = Query1 + " ( ItemName LIKE '" + cusinearr[i].ToString() + "%'" + " ) OR " + " ( ItemName LIKE '% " + cusinearr[i].ToString() + "%') ";



                        Query3 = Query3 + " ( Brand LIKE '" + cusinearr[i].ToString() + "%'" + " ) OR " + " ( Brand LIKE '% " + cusinearr[i].ToString() + "%')";

                        Query4 = Query4 + " ( KeyWords LIKE '" + cusinearr[i].ToString() + "%'" + " ) OR " + " ( KeyWords LIKE '% " + cusinearr[i].ToString() + "%')";




                    }
                    Query1 = Query1 + " )";

                    Query3 = Query3 + " )";
                    Query4 = Query4 + " )";

                    Query = Query + " AND ( " + Query1 + " OR " + Query3 + " OR " + Query4 + " )";



                }

            }



            return Query;
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
                            databindme();
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
                        Session["order"] = dt;

                    }
                    else if (Qty > 1)
                    {
                        LblQty.Text = (Qty -1).ToString();
                        
                        
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

                        Session["order"] = dt;
                        try
                        {
                            int ClientId = int.Parse(Session["ClientId"].ToString());
                            dalclass.UpdateCart(PackId, Qty - 1, ClientId);
                        }
                        catch
                        {
                        }
                    }
                    databindme();

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
                        databindme();
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
            }
            catch
            {
            }
        }







        protected void clearSelect(object sender, EventArgs e)
        {
            try
            {
                
                Chkscat.ClearSelection();
                ChksBrand.ClearSelection();
                RdsPice.ClearSelection();
                Chk_SelectedIndexChanged(sender, e);


            }
            catch
            {
            }
        }


        protected void Chk_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["filter"] = "";

            try
            {
                MoboFilter.Attributes.Add("class","");

                DataTable ShowProduct = new DataTable();

                DataTable SubCat = new DataTable();
                int Type = 3;
                String Query = "SELECT [ItemId], [ItemName], CAST([Mrp] AS INT) as [Mrp] , [Discount], [Multi] ,[Single] , [Type], [ImgUrlMbl], [Rating], [Brand], CAST([SellingPrice] AS INT) as [SellingPrice] , [PackSize], [PackId], 'True' AS NotInCart, 'False' AS InCart, '0' AS NoOfItems FROM [Item] WHERE OutofStack = '0' ";
                try
                {
                    Type = int.Parse(Session["Type"].ToString());
                }
                catch
                {

                }

                if (Type == 1)
                {


                    int CatId = int.Parse(Session["CatId"].ToString());
                    Query = "SELECT [ItemId], [ItemName], CAST([Mrp] AS INT) as [Mrp] , [Discount], [Multi] ,[Single] , [Type], [ImgUrlMbl], [Rating], [Brand], CAST([SellingPrice] AS INT) as [SellingPrice] , [PackSize], [PackId], 'True' AS NotInCart, 'False' AS InCart, '0' AS NoOfItems, [OutofStack],  ~ [OutofStack] AS InStock FROM [Item] WHERE ([CatId] = '" + CatId + "')  ";
                }
                else if (Type == 2)
                {
                    String Search = Session["Search"].ToString();
                    Query = searchQueryMaker();

                }
                else if (Type == 3)
                {
                    Query = "SELECT TOP(20) [ItemId], [ItemName], CAST([Mrp] AS INT) as [Mrp] , [Discount], [Multi] ,[Single] , [Type], [ImgUrlMbl], [Rating], [Brand], CAST([SellingPrice] AS INT) as [SellingPrice] , [PackSize], [PackId], 'True' AS NotInCart, 'False' AS InCart, '0' AS NoOfItems, [OutofStack],  ~ [OutofStack] AS InStock FROM [Item] WHERE  (Discount >'20')";

                }
                else if (Type == 4 || Type == 0)
                {
                    Query = "SELECT TOP(20)  [ItemId], [ItemName], CAST([Mrp] AS INT) as [Mrp] , [Discount], [Multi] ,[Single] , [Type], [ImgUrlMbl], [Rating], [Brand], CAST([SellingPrice] AS INT) as [SellingPrice] , [PackSize], [PackId], 'True' AS NotInCart, 'False' AS InCart, '0' AS NoOfItems, [OutofStack],  ~ [OutofStack] AS InStock FROM [Item] WHERE  (Discount >'20')";

                }
                else if (Type == 5)
                {
                    int SubCatId = int.Parse(Session["SubCat"].ToString());
                    Query = "SELECT [ItemId], [ItemName], CAST([Mrp] AS INT) as [Mrp] , [Discount], [Multi] ,[Single] , [Type], [ImgUrlMbl] , [Rating], [Brand], CAST([SellingPrice] AS INT) as [SellingPrice] , [PackSize], [PackId], 'True' AS NotInCart, 'False' AS InCart, '0' AS NoOfItems, [OutofStack],  ~ [OutofStack] AS InStock FROM [Item] WHERE ([SubCatId] = '" + SubCatId + "')   ";

                }


                String ChkSubSelected = "";
                
                foreach (ListItem item in Chkscat.Items)
                {
                    if (item.Selected)
                        ChkSubSelected = ChkSubSelected + ", '" + item.Value + "'";
                }

                if (ChkSubSelected.Length >= 2)
                {
                    ChkSubSelected = ChkSubSelected.Substring(2, ChkSubSelected.Length - 2);
                }

                if (ChkSubSelected != "")
                {
                    Query = Query + " and  SubCatId  IN ( " + ChkSubSelected + " ) ";
                }


                String ChkBrandsSelected = "";
                

                foreach (ListItem item in ChksBrand.Items)
                {
                    if (item.Selected)
                        ChkBrandsSelected = ChkBrandsSelected + ", '" + item.Value + "'";
                }
                if (ChkBrandsSelected.Length >= 2)
                {
                    ChkBrandsSelected = ChkBrandsSelected.Substring(2, ChkBrandsSelected.Length - 2);
                }

                if (ChkBrandsSelected != "")
                {
                    Query = Query + " and Brand  IN ( " + ChkBrandsSelected + " )";
                }
                String RdPriceSelected = "";
                
                RdPriceSelected = RdsPice.SelectedValue;

                if (RdPriceSelected != "")
                {


                    Query = Query + "and SellingPrice <= " + RdPriceSelected;
                }
                else
                {
                    RdPriceSelected = RdsPice.SelectedValue;
                    if (RdPriceSelected != "")
                    {


                        Query = Query + "and SellingPrice <= " + RdPriceSelected;
                    }

                }

                if (Type == 1)
                {
                    Query = Query + " ORDER BY [ItemId]  DESC ";
                }
                if (Type == 3 || Type == 4 || Type == 0)
                {
                    Query = Query + " ORDER BY [Discount] DESC ";
                }

                ShowProduct = dalclass.Refined(Query);


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

                    }

                    


                }

                RepeaterProduct.DataSource = ShowProduct;
                RepeaterProduct.DataBind();
                if (RepeaterProduct.Items.Count == 0)
                {
                    NoItemDisplay.Visible = true;
                }
                else
                {
                    NoItemDisplay.Visible = false;
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
                            
                            databindme();
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
                                    Session["ItemCount"] = int.Parse(Session["ItemCount"].ToString()) - 1;
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
                        try
                        {
                            int ClientId = int.Parse(Session["ClientId"].ToString());
                            dalclass.UpdateCart(PackId, Qn - 1, ClientId);
                        }
                        catch
                        {
                        }
                    }

                    databindme();
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
                        Session["order"] = dt;
                        databindme();
                        try
                        {
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


                    


                }
            }
            catch
            {
            }

            try
            {
                 DataTable dto = (DataTable)Session["order"];

                DataTable ShowProduct = (DataTable)Session["ShowProduct"] ;
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

                    RepeaterProduct.DataSource = ShowProduct;
                    RepeaterProduct.DataBind();
                    
            }
            catch
            {
            }
            snackbar.Attributes.Add("class", "show");
            closemeimg.Attributes.Add("class", "show");

        }

        

        protected void basketReview(object sender, EventArgs e)
        {
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            try
            {
                Session["top"] = int.Parse(Session["top"].ToString()) + 10;
                Page_Load(sender, e);
                
            }
            catch
            {
                Session["top"] = 20;
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
                Response.Redirect("ItemList.aspx?Offer=" + 1, false);
            }
            catch
            {
            }
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Search.aspx", false);
        }



    }
}