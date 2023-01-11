using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

namespace KiranaWorldApp
{
    public partial class EditAddress : System.Web.UI.Page
    {
        DAL.Class1 dalclass = new DAL.Class1();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
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
                                Response.Redirect("Account.aspx", false);
                            }
                        }
                        if (ClientId == 0)
                        {
                            Response.Redirect("Account.aspx", false);
                        }
                        else
                        {
                            int AddId = int.Parse(Request.QueryString["AddId"].ToString());
                            Session["AddId"] = AddId;
                            ArrayList arr = dalclass.SelectAddress(AddId);
                            Addresslin1.Text = arr[0].ToString();
                            Addresslin2.Text = arr[1].ToString();
                            SqlDataSource1.DataBind();
                            Pincd.DataBind();
                            SqlDataSource2.DataBind();
                            Areanm.DataBind();

                            Pincd.Text = arr[2].ToString();
                            Areanm.Text = arr[3].ToString();
                            Tag.Text = arr[4].ToString();
                            try
                            {
                                RadioButtonList1.SelectedValue = arr[6].ToString();
                                String Myaddress = arr[5].ToString();
                                Double mymobile = Double.Parse(Myaddress.Substring(Myaddress.Length - 10));
                                tb_mobileno.Text = mymobile.ToString();
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
            catch
            {
            }
        }

        protected void SelectAreaClick(object sender, EventArgs e)
        {
            try
            {
                Areanm.AppendDataBoundItems = false;
                Areanm.ClearSelection();
                SqlDataSource2.DataBind();
                Areanm.DataBind();
            }
            catch
            {
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {

                string address = Tag.Text + ", " + Addresslin1.Text + ", " + Addresslin2.Text + ", " + Areanm.Text + ",Jamshedpur. Mob- " + tb_mobileno.Text;
                int ClientId = int.Parse(Session["ClientId"].ToString());
                dalclass.primemanip(ClientId);

                dalclass.EditAddress(int.Parse(Session["AddId"].ToString()), ClientId, Addresslin1.Text, "", Addresslin2.Text, "", Areanm.Text, "Jamshedpur", Pincd.SelectedItem.ToString(), address, RadioButtonList1.SelectedValue.ToString(), Tag.Text);

                Session["Address"] = address;
                Response.Redirect("ChangeAddre.aspx", false);
                



            }
            catch
            {
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChangeAddre.aspx", false);
        }
    }
}