using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KiranaWorldApp
{
    public partial class OrderDetails : System.Web.UI.Page
    {
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
                            if (Session["ItemCount"] != null)
                            {
                                cartCount.Text = Session["ItemCount"].ToString();
                            }
                            else
                            {
                                cartCount.Text = "0";
                            }
                        }
                        catch
                        {
                            Session["ItemCount"] = "0";
                            cartCount.Text = "0";
                        }
                    }
                    

                }
            }
            catch
            {



            }




        }

        protected void RepeaterCartCommand(object source, RepeaterCommandEventArgs e)
        {
            DAL.Class1 dalclass = new DAL.Class1();

            try
            {
                if (e.CommandName.ToString() == "MoveToCart")
                {
                    if (Session["order"] == null)
                    {
                        DataTable dto = new DataTable();
                        dto.Columns.Add("ItemId");
                        dto.Columns.Add("ItemName");
                        dto.Columns.Add("PackId");
                        dto.Columns.Add("PackSize");
                        dto.Columns.Add("Mrp");
                        dto.Columns.Add("Price");
                        dto.Columns.Add("NoOfItems");
                        dto.Columns.Add("ImgUrl");
                        dto.Columns.Add("Discount");
                        dto.Columns.Add("Type");
                        dto.Columns.Add("Brand");
                        dto.Columns.Add("TotalMrp", typeof(Double));
                        dto.Columns.Add("TotalPrice", typeof(Double)); dto.Columns.Add("TotalPrice", typeof(Double)); dto.Columns.Add("TotalCashback", typeof(Double)); dto.Columns.Add("Cashback", typeof(Boolean)); dto.Columns.Add("Pcb1"); dto.Columns.Add("Pcb2"); dto.Columns.Add("Pcb3");

                        Session["order"] = dto;

                    }

                    try
                    {
                        DataTable dt = (DataTable)Session["order"];

                        DataTable orderItems = dalclass.ReOrderRerieve(int.Parse(e.CommandArgument.ToString()));
                        foreach (DataRow item in orderItems.Rows) //Iterate through each row of 2nd data table  
                        {
                            dt.ImportRow(item); //Import the row in 1st data table 
                            dalclass.InsertCart(int.Parse(item[0].ToString()), item[1].ToString(), int.Parse(item[2].ToString()), item[3].ToString(), float.Parse(item[4].ToString()), float.Parse(item[5].ToString()), int.Parse(item[6].ToString()), item[7].ToString(), int.Parse(item[8].ToString()), item[9].ToString(), item[10].ToString(), float.Parse(item[11].ToString()), float.Parse(item[12].ToString()), int.Parse(Session["ClientId"].ToString()));

                        }
                        Session["order"] = dt;
                        Session["ItemCount"] = dt.Rows.Count;
                        cartCount.Text = dt.Rows.Count.ToString();
                        Response.Redirect("CartReview.aspx", false);
                    }
                    catch
                    {

                    }


                    



                    
                }
            }
            catch (Exception ex)
            {
                string msg;
                msg = ex.Message;


            }
            

        }

    }
}