using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Net;
using System.Web.UI.HtmlControls;

namespace KiranaWorldApp
{
    public partial class feedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DAL.Class1 dalclass = new DAL.Class1();
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
                            ArrayList ClientDetails = dalclass.RetrieveClientDetails(ClientId);
                            if (ClientDetails.Count > 0)
                            {
                                tb_name.Text = ClientDetails[0].ToString();
                                tb_mobileno.Text = ClientDetails[2].ToString();
                                tb_name.Enabled = false;
                                tb_mobileno.Enabled = false;

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

        protected void BtnFeedback_Click(object sender, EventArgs e)
        {
            try
            {
                DAL.Class1 dalclass = new DAL.Class1();
                dalclass.feedback(tb_name.Text, tb_mobileno.Text, RdBtnService.SelectedItem.Text, RdBtnDel.SelectedItem.Text, RdBtnfriendly.SelectedItem.Text);

                SendMessage(tb_mobileno.Text, "Thanks for your feedback");
                alertpop.Text = "Thanks for your feedback";

                ScriptManager.RegisterStartupScript(this, this.GetType(), "mytoast", "mytoast()", true);

                Response.Redirect("Home.aspx", false);
            }
            catch
            {

            }

        }

        public String SendMessage(String mobno, String msge)
        {
            try
            {

                HttpWebRequest myReq = (HttpWebRequest)WebRequest.Create("http://mobicomm.dove-sms.com//submitsms.jsp?user=shantire&key=2ad16bc0f9XX&mobile=" + mobno + "&message=" + msge + "&senderid=KWorld&accusage=1&entityid=1201159194292972286&tempid=1207162192424048379");

                HttpWebResponse myResp = (HttpWebResponse)myReq.GetResponse();
                System.IO.StreamReader respStreamReader = new System.IO.StreamReader(myResp.GetResponseStream());
                string responseString = respStreamReader.ReadToEnd();
                respStreamReader.Close();
                myResp.Close();
                return (responseString);


            }

            catch (Exception ex)
            {
                string msg;
                msg = ex.Message;


            }
            return "abc";


        }


    }
}