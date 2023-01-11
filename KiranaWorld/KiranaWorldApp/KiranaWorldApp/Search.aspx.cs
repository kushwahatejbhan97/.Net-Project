using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KiranaWorldApp
{
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
    }
}