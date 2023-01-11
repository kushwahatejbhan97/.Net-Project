using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KiranaWorldApp
{
    public partial class ItemDetails1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["CheckOutVisit"] = 0;

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtSearch.Text != "" || txtSearch.Text != " ")
                {
                    Response.Redirect("ItemList.aspx?Search=" + txtSearch.Text, false);
                }
            }
            catch
            {
            }

        }

       
    }
}