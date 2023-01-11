using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sidvin
{
    public partial class blogdetails : System.Web.UI.Page
    {
        DAL.Class1 dalclass = new DAL.Class1();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                int Id = Convert.ToInt32(Page.RouteData.Values["BlogId"]);
                ArrayList vloglist = dalclass.getvloglist(Id);

                //DeskImgUrl, Date, Content, Headere
                string dateblog = vloglist[1].ToString();
                string contentlog = vloglist[2].ToString();
                string image = vloglist[0].ToString();
                string header = vloglist[3].ToString();
               
                content.InnerText = contentlog;
                Header.InnerText = header;
                imageblog.Src = "/Admin/blogs/Desktop/" + image;


            }
            catch
            {

            }
        }
    }
}