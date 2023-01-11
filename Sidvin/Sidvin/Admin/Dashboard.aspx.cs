using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sidvin.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        DAL.Class1 dalclass = new DAL.Class1();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                String Users = dalclass.CountUsers();
                lblUsers.Text = Users;

                int visit = dalclass.visiter();
                lblVisit.Text = visit.ToString();
            }
            catch
            {

            }
        }
    }
}