using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sidvin.Admin
{
    public partial class Blog : System.Web.UI.Page
    {
        DAL.Class1 dalclass = new DAL.Class1();
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Button1_Click1(object sender, EventArgs e)
        {
            String input = FirstCharToUpper(txtcontent.Text);
            string date = DateTime.Now.ToString("dddd, dd MMMM yyyy");
            string header = txtheading.Text;

            try
            {
                if (txtcontent.Text != "")
                {
                    if ((FileUpload1.PostedFile != null) && (FileUpload1.PostedFile.ContentLength > 0))
                    {
                        string filext1 = System.IO.Path.GetExtension(FileUpload1.FileName);
                        if (filext1 == ".jpg" || filext1 == ".jpeg"  || filext1 == ".png")
                        {




                            string fn1 = dalclass.InsertImage("\\blogs\\Desktop\\", 12) + filext1;
                            string SaveLocation = Server.MapPath("~/Admin") + "\\blogs\\" + "\\Desktop\\" + fn1;
                            FileUpload1.PostedFile.SaveAs(SaveLocation);



                            dalclass.addcontent(input, fn1, date, header);
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "redirect",
                                                "alert('Successfully Inserted.'); window.location='" + "Blog.aspx';", true);



                        }
                        else
                        {
                        }
                    }

                    else
                    {

                    }





                }
            }
            catch { }



        }
        private string FirstCharToUpper(string input)
        {
            try
            {
                input = input.Trim();
                string formatedString = "";

                string[] tokens = input.Split(' ');
                for (int i = 0; i < tokens.Length; i++)
                {
                    string a = tokens[i].First().ToString().ToUpper();
                    string b = tokens[i].ToLower();
                    formatedString += a + String.Join("", b.Skip(1));
                    formatedString += " ";
                }



                return formatedString.Trim();
            }
            catch
            {
                return input.Trim();
            }


        }
    }
}