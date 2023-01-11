using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace Sidvin
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            RegisterRoutes(RouteTable.Routes);
        }

        private void RegisterRoutes(RouteCollection routes)
        {
            routes.MapPageRoute("home", "home", "~/Default.aspx");
            routes.MapPageRoute("about", "about", "~/about.aspx");
            routes.MapPageRoute("blogs", "blogs", "~/blogs.aspx");
            routes.MapPageRoute("contact", "contact", "~/contact.aspx");
            routes.MapPageRoute("portfolio", "portfolio", "~/portfolio.aspx");
            routes.MapPageRoute("services", "services", "~/services.aspx");
            routes.MapPageRoute("testimonial", "testimonial", "~/testimonial.aspx");
            routes.MapPageRoute("vlogs", "vlogs", "~/vlogs.aspx");
            routes.MapPageRoute("ciril", "ciril", "~/ciril.aspx");
            routes.MapPageRoute("association", "association", "~/association.aspx");
            routes.MapPageRoute("blogdetails", "blogdetails/{BlogId}/", "~/blogdetails.aspx", true,
         new RouteValueDictionary
         {
                {"blogdetails","0" }

         });





        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            if (Request.AppRelativeCurrentExecutionFilePath == "~/Default.aspx")
                Response.Redirect("~/home");
        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}