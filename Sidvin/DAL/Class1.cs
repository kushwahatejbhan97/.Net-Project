using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class Class1
    {

        SqlCommand cmd;
        SqlConnection con;
        SqlDataAdapter da = new SqlDataAdapter();
        private static TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");

        public DataTable getvlogdata()
        {
            DataTable Items = new DataTable();
            con = new SqlConnection(commm.GetConnectionString());
            try
            {
                con.Open();
                string query = "SELECT [BlogId], [Image], [Date], [Content], [Header] FROM [Blog]";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                da.Fill(Items);

            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                //throw new Exception(msg);
            }
            finally
            {

                con.Close();
            }
            return Items;
        }

        public ArrayList login(string UserName, string password)
        {
            ArrayList al = new ArrayList();
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand(" SELECT  Id, UserName, accesslevel, Enable, Mobile  FROM login  WHERE (UserName ='" + UserName + "' COLLATE SQL_Latin1_General_CP1_CS_AS) AND (Password ='" + password + "' COLLATE SQL_Latin1_General_CP1_CS_AS)", con);

            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    al.Add(dr[0]);
                    al.Add(dr[1]);
                    al.Add(dr[2]);
                    al.Add(dr[3]);
                    al.Add(dr[4]);

                }
            }
            catch
            {

            }
            finally
            {
                con.Close();
            }
            return al;
        }

        public void addcompletedproject(string fn1,int type, string header)
        {
          
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand(" Insert into Project(Type,image,Header) OUTPUT inserted.ProjectId VALUES ('" + type + "','" + fn1 + "','" + header + "') ", con);

            try
            {
                con.Open();




               cmd.ExecuteScalar();
            }
            catch (Exception ex)
            {
                string msg;
                msg = ex.Message;


            }
            finally
            {
                con.Close();
            }
           
        }

        public ArrayList getvloglist(int id)
        {
            ArrayList Details = new ArrayList();
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("SELECT Image, Date, Content, Header   FROM Blog WHERE (BlogId ='" + id + "') ", con);

            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    Details.Add(dr[0]);
                    Details.Add(dr[1]);
                    Details.Add(dr[2]);
                    Details.Add(dr[3]);




                }
            }
            catch (Exception ex)
            {

            }
            finally
            {
                con.Close();
            }
            return Details;
        }


        public int insertclientcontact(string name, string email, string subject, string message, string phone)
        {
            int inserted = 0;
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand(" Insert into Client(Name,Email,Subject,Message,PhoneNumber) OUTPUT inserted.ClientId VALUES ('" + name + "','" + email + "','" + subject + "', '" + message + "', '" + phone + "') ", con);

            try
            {
                con.Open();




                inserted = Int32.Parse(cmd.ExecuteScalar().ToString());
            }
            catch (Exception ex)
            {
                string msg;
                msg = ex.Message;


            }
            finally
            {
                con.Close();
            }
            return inserted;
        }

        public int insertclient(string name, string email, string subject, string message, string mobile)
        {
            int inserted = 0;
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand(" Insert into Client(Name,Email,Subject,Message,PhoneNumber) OUTPUT inserted.ClientId VALUES ('" + name + "','" + email + "','" + subject + "', '" + message + "', '"+mobile+"') ", con);

            try
            {
                con.Open();
              


              
                inserted = Int32.Parse(cmd.ExecuteScalar().ToString());
            }
            catch (Exception ex)
            {
                string msg;
                msg = ex.Message;


            }
            finally
            {
                con.Close();
            }
            return inserted;
        }




        public string InsertImage(string Location, int type)
        {
            String insertedid = "";
            con = new SqlConnection(commm.GetConnectionString());
            string sql = "INSERT INTO ImageResources (Location, Type)  output inserted.Id VALUES "
                   + "(@Location, @Type)";

            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);
                SqlParameter[] param = new SqlParameter[2];


                param[0] = new SqlParameter("@Location", SqlDbType.VarChar, 500);
                param[1] = new SqlParameter("@Type", SqlDbType.Int, 4);



                param[0].Value = Location;
                param[1].Value = type;



                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                cmd.CommandType = CommandType.Text;
                insertedid = cmd.ExecuteScalar().ToString();
            }
            catch
            {


            }
            finally
            {
                con.Close();
            }



            return insertedid;
        }



        public void addcontent(string input, string fn1, string date, string header)
        {

            con = new SqlConnection(commm.GetConnectionString());
            string sql = "INSERT INTO Blog ( Content,Image,Date, Header) OUTPUT inserted.BlogId VALUES ('" + input + "', '" + fn1 + "', '" + date + "', '" + header + "')";


            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);


                cmd.CommandType = CommandType.Text;
                cmd.ExecuteScalar().ToString();
            }
            catch (Exception ex)
            {
                string msg;
                msg = ex.Message;


            }
            finally
            {
                con.Close();
            }


        }


        public int UpdatePass(string pass, int Id)
        {
            int rowUpdated = 0;
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE login SET Password ='" + pass + "' WHERE  (Id = '" + Id + "')", con);
            try
            {
                con.Open();
                rowUpdated = cmd.ExecuteNonQuery();
            }
            catch
            {

            }
            finally
            {
                con.Close();
            }
            return rowUpdated;
        }
        public string CountUsers()
        {
            String al = "0";
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand(@" SELECT        COUNT(ClientId) AS Expr1
FROM            Client ", con);

            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    al = dr[0].ToString();


                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                //throw new Exception(msg);
            }
            finally
            {
                con.Close();
            }
            return al;

        }


        public int visiter()
        {
            int v = 0;

            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand(@" SELECT        COUNT(ClientId) AS Expr1
FROM            Client ", con);

            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    v = 16 + (2 * int.Parse(dr[0].ToString()));


                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                //throw new Exception(msg);
            }
            finally
            {
                con.Close();
            }
            return v;
        }

    }
}
