using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace icemmmt.admin
{
    public partial class LatestUpdates : System.Web.UI.Page
    {
        DAL.Class1 dalclass = new DAL.Class1();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                String heading = txtheadings.Text;
                String content = txtcontent.Text;
                String date = txtdate.Text;
                String url = "";
                int type = 2;
                bool btn = false;

                int noticeId = dalclass.insertNotice(heading, content, date, url, type, btn);
                if (noticeId > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "redirect",
                                                      "alert('Registration Successfully.'); window.location='" + "LatestUpdates.aspx';", true);

                }
            }
            catch
            {

            }
        }
    }
}