using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

namespace KiranaWorldApp
{
    public partial class Address : System.Web.UI.Page
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
                            Response.Redirect("Default.aspx", false);
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
                            String CheckOutVisit = Session["CheckOutVisitAddress"].ToString();
                            if (CheckOutVisit == "1")
                            {
                                bckbtn.Visible = false;
                            }
                        }
                        catch
                        {
                            Session["CheckOutVisitAddress"] = 0;
                        }

                    }

                    
                }
            }
            catch
            {

                Response.Redirect("Default.aspx", false);

            }




        }

        protected void SelectAreaClick(object sender, EventArgs e)
        {
            try
            {
                Area.AppendDataBoundItems = false;
                Area.ClearSelection();
                SqlDataSource2.DataBind();
                Area.DataBind();
            }
            catch
            {
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
                try
                {

                    string address = tb_name.Text + ", " + Addressline1.Text + ", " + Addressline2.Text + ", " + Area.Text + ", " + txtLandMark.Text + ",Jamshedpur. Mob- " + tb_mobileno.Text;
                    int ClientId = int.Parse(Session["ClientId"].ToString());
                    dalclass.primemanip(ClientId);
                    dalclass.AddAddress(ClientId, Addressline1.Text, "", Addressline2.Text, "", tb_mobileno.Text, Area.Text, "Jamshedpur", tb_pin.SelectedItem.ToString(), address, RadioButtonList1.SelectedValue.ToString(), tb_name.Text);

                    Session["Address"] = address;
                    String CheckOutVisit = Session["CheckOutVisitAddress"].ToString();
                    if (CheckOutVisit == "1")
                    {
                        Response.Redirect("checkout.aspx", false);
                    }
                    else
                    {
                        Response.Redirect("ChangeAddre.aspx", false);
                    }


                }
                catch
                {
                    Response.Redirect("ChangeAddre.aspx", false);
                }




                
               
           
        }
    }
}