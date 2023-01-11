using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Collections;
using System.Data;
namespace DAL
{
    public class Class1
    {
        SqlCommand cmd;
        SqlConnection con;
        SqlDataAdapter da = new SqlDataAdapter();
        public int loginpage(string username, string password)
        {
            int userid = 0;
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand(" SELECT   userid  FROM login  WHERE (UserName  ='" + username + "' ) and (Password  ='" + password + "' )", con);

            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    userid = Convert.ToInt32(dr[0]);
                }
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
            return userid;
        }

        public int insertcontact(string name, string email, string phone, string message)
        {
            int contactid = 0;
            con = new SqlConnection(commm.GetConnectionString());
            String Sql = "Insert into ContactTable(Name, Email, PhoneNumber, Message) output inserted.ContactId  Values(@Name, @Email, @PhoneNumber, @Message)";

            try
            {

                con.Open();
                SqlCommand cmd = new SqlCommand(Sql, con);
                SqlParameter[] param = new SqlParameter[4];

                param[0] = new SqlParameter("@Name", SqlDbType.VarChar, 200);
                param[1] = new SqlParameter("@Email", SqlDbType.VarChar, 200);
                param[2] = new SqlParameter("@PhoneNumber", SqlDbType.VarChar, 200);
                param[3] = new SqlParameter("@Message", SqlDbType.VarChar, 1000);
               



                param[0].Value = name;
                param[1].Value = email;
                param[2].Value = phone;
                param[3].Value = message;
                

                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                cmd.CommandType = CommandType.Text;
                contactid = Convert.ToInt32(cmd.ExecuteScalar());

            }
            catch (SqlException ex)
            {
                String msg;
                msg = ex.Message;




            }
            finally
            {
                con.Close();
            }
            return contactid;
        }

        public void updatepass(int userId, string newpassword)
        {
            con = new SqlConnection(commm.GetConnectionString());

            cmd = new SqlCommand("UPDATE login SET  Password = '" + newpassword + "' Where(UserId='" + userId + "') ", con);


            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {

            }
            finally
            {
                con.Close();

            }
        }

        public int insertNotice(string heading, string content, string date, string url, int type, bool btn)
        {
            int noticeId = 0;
            con = new SqlConnection(commm.GetConnectionString());
            String Sql = "Insert into NoticeTable(Heading, Content, Date, URL, Type, Button) output inserted.NoticeId  Values(@Heading, @Content, @Date, @URL, @Type, @Button)";

            try
            {

                con.Open();
                SqlCommand cmd = new SqlCommand(Sql, con);
                SqlParameter[] param = new SqlParameter[6];

                param[0] = new SqlParameter("@Heading", SqlDbType.VarChar, 250);
                param[1] = new SqlParameter("@Content", SqlDbType.VarChar, 2000);
                param[2] = new SqlParameter("@Date", SqlDbType.VarChar, 250);
                param[3] = new SqlParameter("@URL", SqlDbType.VarChar, 250);
                param[4] = new SqlParameter("@Type", SqlDbType.Int);
                param[5] = new SqlParameter("@Button", SqlDbType.Bit);



                param[0].Value = heading;
                param[1].Value = content;
                param[2].Value = date;
                param[3].Value = url;
                param[4].Value = type;
                param[5].Value = btn;


                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                cmd.CommandType = CommandType.Text;
                noticeId = Convert.ToInt32(cmd.ExecuteScalar());

            }
            catch (SqlException ex)
            {
                String msg;
                msg = ex.Message;




            }
            finally
            {
                con.Close();
            }
            return noticeId;
        }
    }
}
