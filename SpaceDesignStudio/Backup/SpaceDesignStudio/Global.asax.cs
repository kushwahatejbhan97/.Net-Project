using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.Routing;

namespace SpaceDesignStudio
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            RegisterRoutes(RouteTable.Routes);
        }


        static void RegisterRoutes(RouteCollection routes)
        {


            routes.MapPageRoute("best-interior-designer-in-hyderbad", "best-interior-designer-in-hyderbad", "~/default.aspx");
            routes.MapPageRoute("mission-vision", "mission-vision", "~/mission-vision.aspx");
            routes.MapPageRoute("about-us", "about-us", "~/About-Us.aspx");
            routes.MapPageRoute("why-us", "why-us", "~/why-us.aspx");
            routes.MapPageRoute("service", "service", "~/Services.aspx");
            routes.MapPageRoute("our-approach", "our-approach", "~/our-approach.aspx");
            routes.MapPageRoute("3d-design-concept", "3d-design-concept", "~/3d-design-concept.aspx");
            routes.MapPageRoute("project-execution", "project-execution", "~/project-execution.aspx");
            routes.MapPageRoute("interior-designers-in-hyderabad", "interior-designers-in-hyderabad", "~/Residential.aspx");
            routes.MapPageRoute("flat-interior-designers-in-hyderabad", "flat-interior-designers-in-hyderabad", "~/Flats.aspx");
            routes.MapPageRoute("interior-decorators-in-hyderabad", "interior-decorators-in-hyderabad", "~/Villas.aspx");
            routes.MapPageRoute("office-interior-designers-in-hyderabad", "office-interior-designers-in-hyderabad", "~/office-interior.aspx");
            routes.MapPageRoute("best-interior-designers-in-hyderabad", "best-interior-designers-in-hyderabad", "~/HotelResturant.aspx");
            routes.MapPageRoute("hyderabad-interior-designers", "hyderabad-interior-designers", "~/Hospital.aspx");
            routes.MapPageRoute("interior-design-companies-in-hyderabad", "interior-design-companies-in-hyderabad", "~/Shop.aspx");
            routes.MapPageRoute("interior-designer-in-hyderabad-for-home", "interior-designer-in-hyderabad-for-home", "~/Exteriors.aspx");
            routes.MapPageRoute("blog", "blog", "~/blog.aspx");
            routes.MapPageRoute("contact-us", "contact-us", "~/contact-us.aspx");
            routes.MapPageRoute("sitemap", "sitemap", "~/sitemap.aspx");

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

            if (Request.AppRelativeCurrentExecutionFilePath == "~/" || Request.AppRelativeCurrentExecutionFilePath == "~/default.aspx")
                Response.Redirect("~/best-interior-designer-in-hyderbad");
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