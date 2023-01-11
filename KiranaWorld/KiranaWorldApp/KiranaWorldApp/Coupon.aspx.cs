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
    public partial class Coupon : System.Web.UI.Page
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



                DataTable Couponlist = dalclass.getcouponlist(ClientId);
                repeatercoupon.DataSource = Couponlist;
                repeatercoupon.DataBind();


                if (repeatercoupon.Items.Count == 0)
                {
                    NoCouponDisplay.Visible = true;
                    repeatercoupon.Visible = false;

                }
                else
                {
                    NoCouponDisplay.Visible = false;
                    repeatercoupon.Visible = true;

                }

            }
           

        }

        protected void repeatercouponapply(object source, RepeaterCommandEventArgs e)
        { 
            try
            {
                string couponcode = e.CommandArgument.ToString();
                ArrayList CouponArr = dalclass.CouponCheck(couponcode);
                DataTable table = (DataTable)Session["order"];
                int subtotal = int.Parse(table.Compute("Sum(TotalPrice)", "").ToString());
                if (CouponArr.Count > 1)
                {
                    if (subtotal < Convert.ToInt32(CouponArr[4]))
                    {

                        Session["CouponArr"] = CouponArr;

                        CouponChecker.Visible = true;
                        CouponApplied.Visible = false;
                        NotApplied.Visible = true;
                        NotApplied.Text = "*Shop for &#8377;" + (Convert.ToInt32(CouponArr[4]) - subtotal).ToString() + " more to apply this coupon";
                        Session["CouponArr"] = null;
                        Session["CouponId"] = "0";
                    }
                    else
                    {
                        Session["CouponCode"] = couponcode;
                        Response.Redirect("CartReview.aspx", false);

                    }

                }
                else
                {
                    CouponChecker.Visible = true;
                    CouponApplied.Visible = false;
                    NotApplied.Visible = true;

                }


            }
            catch
            {
            }
        }


    }
}