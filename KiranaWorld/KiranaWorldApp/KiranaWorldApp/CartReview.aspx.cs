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
    public partial class CartReview : System.Web.UI.Page
    {
        DAL.Class1 dalclass = new DAL.Class1();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                try
                {
                    TxtCoupon.Text = Session["CouponCode"].ToString();
                    Session["delivcharge"] = 40;

                }
                catch
                {

                }
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
                    

                    DataTable ShowProduct = (DataTable)Session["order"];
                    Session["discount"] = 0;
                    Session["CouponArr"] = null;
                    Session["CouponId"] = "0";
                    DataBindme();

                    RepeaterHotProducts.DataSource = ShowProduct;
                    RepeaterHotProducts.DataBind();
                   

                }
            }
            catch
            {
                
            }



        }
        public int DataBindme()
        {
            int allow = 0;
            int TotalCashbackAmount = 0; //this line
            String cashbackType = "Pcb1"; // this line
            try
            {
                
                DataTable table = (DataTable)Session["order"];
                int discount = 0;
                int delivcharge = 40;
                Session["delivcharge"] = 40;
                String coupontype = "10";
                int valuedis = 0;
                int maxdis = 0;
                DataTable ShowProduct = (DataTable)Session["order"];
                CouponChecker.Visible = true;

                if (ShowProduct.Rows.Count > 0)
                {
                    RepeaterHotProducts.Visible = true;
                    NoItemFound.Visible = false;
                    int TotalMrp = Convert.ToInt32(ShowProduct.Compute("Sum(TotalMrp)", string.Empty));
                    int subtotal = int.Parse(ShowProduct.Compute("Sum(TotalPrice)", string.Empty).ToString());
                    
                    if (subtotal >= 500)
                    {
                        delivcharge = 0;
                        DeliveryC.Text = "Free";
                        Session["delivcharge"] = 0;


                    }
                    else
                    {
                        delivcharge = 40;
                        DeliveryC.Text = "40";
                        Session["delivcharge"] = 40;
                    }
                    
                    if (TxtCoupon.Text.Trim() == "" || TxtCoupon.Text== "Apply Coupon")
                    {
                        CouponChecker.Visible = true;
                        CouponApplied.Visible = false;
                        NotApplied.Visible = false;
                        Session["TxtCoupon"] = "";
                    }
                    else
                    {

                        ArrayList CouponArr = dalclass.CouponCheck(TxtCoupon.Text);
                        if (CouponArr.Count > 1)
                        {


                            if (subtotal > Convert.ToInt32(CouponArr[4]))
                            {



                                CouponChecker.Visible = false;
                                CouponApplied.Visible = true;
                                LnkCouponApplied.Text = "*  Coupon Applied " + CouponArr[7].ToString() + " <img src='img/closeiconfafa.png' />";
                                NotApplied.Visible = false;
                                Session["CouponId"] = CouponArr[0];
                                Session["TxtCoupon"] = TxtCoupon.Text;
                                if (int.Parse(CouponArr[2].ToString()) == 0)
                                {
                                    //CouponId, Type, Times, MaxDisc, MinAmount, PaymentType

                                    coupontype = CouponArr[1].ToString();
                                    valuedis = int.Parse(CouponArr[6].ToString());
                                    maxdis = int.Parse(CouponArr[3].ToString());
                                    Session["TxtCoupon"] = TxtCoupon.Text;
                                    if (coupontype == "3")
                                    {
                                        delivcharge = 0;
                                        DeliveryC.Text = "Free";
                                        Session["delivcharge"] = 0;

                                    }

                                    else if (coupontype == "2")
                                    {
                                        discount = valuedis;

                                    }
                                    else if (coupontype == "1")
                                    {

                                        discount = int.Parse((subtotal * valuedis / 100).ToString());

                                        if (discount > maxdis)
                                        {
                                            discount = maxdis;
                                        }
                                    }

                                }
                                else if (int.Parse(CouponArr[2].ToString()) == 1)
                                {
                                    try
                                    {

                                        coupontype = CouponArr[1].ToString();
                                        valuedis = int.Parse(CouponArr[6].ToString());
                                        maxdis = int.Parse(CouponArr[3].ToString());
                                        if (coupontype == "4" && int.Parse( Session["ClientId"].ToString()) == int.Parse(CouponArr[8].ToString()))
                                        {
                                            discount = valuedis;
                                            Session["TxtCoupon"] = TxtCoupon.Text;
                                        }
                                        else
                                        {
                                            Session["CouponArr"] = null;
                                            Session["CouponId"] = "0";
                                            CouponChecker.Visible = true;
                                            CouponApplied.Visible = false;
                                            NotApplied.Visible = true;
                                            Session["TxtCoupon"] = "";
                                            NotApplied.Text = "*Coupon either expired or doesn't exists.";

                                        }
                                    }
                                    catch
                                    {
                                        Session["CouponArr"] = null;
                                        Session["CouponId"] = "0";
                                        CouponChecker.Visible = true;
                                        CouponApplied.Visible = false;
                                        NotApplied.Visible = true;
                                        Session["TxtCoupon"] = "";
                                        NotApplied.Text = "*Coupon either expired or doesn't exists.";


                                    }
                                }

                            }
                            else
                            {
                                CouponChecker.Visible = true;
                                CouponApplied.Visible = false;
                                NotApplied.Visible = true;
                                NotApplied.Text = "*Shop for &#8377;" + (Convert.ToInt32(CouponArr[4]) - subtotal).ToString() + " more to apply this coupon";
                                Session["CouponArr"] = null;
                                Session["CouponId"] = "0";
                                Session["TxtCoupon"] = "";



                            }


                        }
                        else
                        {
                            CouponChecker.Visible = true;
                            CouponApplied.Visible = false;
                            NotApplied.Visible = true;

                        }
                    }



                    TxtTotalMrp.Text = TotalMrp.ToString();
                    TxtSubtotal.Text = subtotal.ToString();
                    ArrayList Cashbackmount = dalclass.CashbackAmountCheck();
                    TotalCashbackAmount = subtotal;
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

                    foreach (DataRow row in ShowProduct.Rows)
                    {

                        if (bool.Parse(row["Cashback"].ToString()))
                        {
                            Double TotalPrice = Double.Parse(row["TotalPrice"].ToString());
                            int ptg = int.Parse(row[cashbackType].ToString());
                            row["TotalCashback"] = (TotalPrice * ptg) / 100;
                        }

                    }

                    // end

                    TSaved.Text = (TotalMrp - subtotal + discount ).ToString();
                    int payablebeforDelCharge = subtotal - discount;
                    if (payablebeforDelCharge > 100)
                    {
                        allow = 1;
                        Button1.Enabled = true;
                        Button1.Text = "Proceed To Checkout";
                       


                    }
                    else
                    {
                        allow = 0;
                        Button1.Enabled = false;
                        Button1.Text = "Minimum Amount to Checkout 100/-";
                    }
                    TxtPayable.Text = (payablebeforDelCharge + delivcharge).ToString();
                    TxtDiscount.Text = discount.ToString();
                    LblCashback.Text = "&#8377; " + Convert.ToInt32(Math.Round(Convert.ToDouble(table.Compute("Sum(TotalCashback)", "").ToString())));
                    Session["TotalCashback"] = LblCashback.Text;
                    Session["discount"] = discount;
                    Session["amount"] = TxtPayable.Text;
                    Session["delivcharge"] = delivcharge;
                    

                    BntCheckOutLeft.Visible = true;
                    
                   
                }
                else
                {
                    TxtTotalMrp.Text = "0";
                    TxtSubtotal.Text = "0";
                    TxtPayable.Text = "0";
                    DeliveryC.Text = "0";
                    TSaved.Text = "0";
                    TxtDiscount.Text = "0";
                    allow = 0;
                    Button1.Enabled = false;
                    BntCheckOutLeft.Visible = false;
                    CouponChecker.Visible = false;
                    CouponApplied.Visible = false;
                    NoItemFound.Visible = true;
                    LblCashback.Text = "&#8377; 0";
                    RepeaterHotProducts.Visible = false;
                    Session["TxtCoupon"] = "";



                }
                

            }
            catch
            {
                TxtTotalMrp.Text = "0";
                TxtSubtotal.Text = "0";
                TxtPayable.Text = "0";
                DeliveryC.Text = "0";
                TSaved.Text = "0";
                TxtDiscount.Text = "0";
                allow = 0;
                Button1.Enabled = false;
                BntCheckOutLeft.Visible = false;
                CouponChecker.Visible = false;
                CouponApplied.Visible = false;
                NoItemFound.Visible = true;
                RepeaterHotProducts.Visible = false;
                    
            }

            return allow;


        }
        protected void RepeaterCartCommand(object source, RepeaterCommandEventArgs e)
        {

            try
            {
                if (e.CommandName.ToString() == "DecreaseQty")
                {
                    Label Qty = (Label)e.Item.FindControl("Qty");
                    int Qn = int.Parse(Qty.Text);
                    if (Qn == 1)
                    {




                        DataTable dt = (DataTable)Session["order"];
                        int PackId = int.Parse(e.CommandArgument.ToString());
                        try
                        {
                            foreach (DataRow row in dt.Rows)
                            {
                                if (Int32.Parse(row["PackId"].ToString()) == PackId)
                                {
                                    dt.Rows.Remove(row);

                                    try
                                    {
                                        int ClientId = int.Parse(Session["ClientId"].ToString());
                                        dalclass.RemoveCart(ClientId, PackId);
                                    }
                                    catch
                                    {
                                    }
                                    Session["ItemCount"] = dt.Rows.Count;
                                }

                            }
                        }
                        catch
                        {

                        }
                        Session["order"] = dt;
                        RepeaterHotProducts.DataSource = dt;
                        RepeaterHotProducts.DataBind();
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
                        RepeaterHotProducts.DataSource = dt;
                        RepeaterHotProducts.DataBind();
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
                    Label Qty = (Label)e.Item.FindControl("Qty");
                    int Qn = int.Parse(Qty.Text);
                    if (Qn < 12)
                    {
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
                        RepeaterHotProducts.DataSource = dt;
                        RepeaterHotProducts.DataBind();
                        try
                        {
                            int ClientId = int.Parse(Session["ClientId"].ToString());
                            dalclass.UpdateCart(PackId, Qn + 1, ClientId);
                        }
                        catch
                        {
                        }

                    }


                }
                else if (e.CommandName.ToString() == "MoveToCart")
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


                    int Qty = 0;
                    try
                    {
                        foreach (DataRow row in dt.Rows)
                        {
                            if (Int32.Parse(row["PackId"].ToString()) == PackId)
                            {
                                Qty = int.Parse(row["NoOfItems"].ToString());
                                dt.Rows.Remove(row);
                            }

                        }
                    }
                    catch
                    {
                    }
                    
                    float TotalMrp = (Qty * Mrp);
                    float TotalPrice = (Qty * Selling);
                    
                    try
                    {
                        int ClientId = int.Parse(Session["ClientId"].ToString());
                        dalclass.InsertWishlist(ItemId, ItemName, PackId, PackSize, Mrp, Selling, Qty, ImgMbl, int.Parse(Details[7]), Details[8], Details[9], TotalMrp, TotalPrice, ClientId);
                        dalclass.RemoveCart(ClientId, PackId);
                    }
                    catch
                    {
                    }
                    
                    Session["order"] = dt;
                    RepeaterHotProducts.DataSource = dt;
                    RepeaterHotProducts.DataBind();
                    Session["ItemCount"] = dt.Rows.Count;
                }
            }
            catch
            {
            }
            finally
            {
                DataBindme();
            }
        }
        
        protected void Button1_Click1(object sender, EventArgs e)
        {
            try
            {
              int allow =  DataBindme();
              if (allow == 1)
              {
                  Response.Redirect("checkout.aspx", false);
              }


                
            }
            catch
            {
            }

        }

        protected void CouponApply(object sender, EventArgs e)
        {
            try
            {
                
                DataBindme();
            }
            catch
            {
            }
            
        }

        protected void ChangeCoupon(object sender, EventArgs e)
        {
            try
            {
                CouponChecker.Visible = true;
                CouponApplied.Visible = false;
                NotApplied.Visible = false;
                TxtCoupon.Text = "Apply Coupon";
                Session["CouponArr"] = false;
                DataBindme();
            }
            catch
            {
            }
        }



    }
}