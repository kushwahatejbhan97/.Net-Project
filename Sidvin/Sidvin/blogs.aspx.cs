using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sidvin
{
    public partial class blogs : System.Web.UI.Page
    {
        DAL.Class1 dalclass = new DAL.Class1();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                DataTable vlogdata = dalclass.getvlogdata();
                Repeater1.DataSource = vlogdata;
                Repeater1.DataBind();
            }
            catch
            {

            }
        }
    }
}