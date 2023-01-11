using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace icemmmt.admin
{
    public partial class ChangePass : System.Web.UI.Page
    {
        DAL.Class1 dalclass = new DAL.Class1();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                int UserId = Convert.ToInt32(Session["UserId"]);
                string newpassword = txtnewpass.Text;

                dalclass.updatepass(UserId, newpassword);




            }
            catch
            {

            }
        }
    }
}