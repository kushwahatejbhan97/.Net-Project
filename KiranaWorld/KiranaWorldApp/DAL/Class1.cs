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
        SqlCommand cmd1;
        SqlConnection con;
        SqlTransaction transaction;
        SqlDataAdapter da = new SqlDataAdapter();

        public ArrayList Admin_login(string username, string password)
        {
            ArrayList al = new ArrayList();
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand(" SELECT  userid, username, accesslevel, Enable  FROM Login  WHERE (username ='" + username + "') AND (password ='" + password + "')", con);

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

                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {
                con.Close();
            }
            return al;

        }

        public void feedback(string Name, string mobile, string Service, string Delivery, string App)
        {
            int insertedid = 0;
            con = new SqlConnection(commm.GetConnectionString());
            string sql = "INSERT INTO dbo.Feedback  (Name, mobile, Service, Delivery, App) output inserted.Id VALUES('"+Name + "', '" + mobile + "', '" + Service+"', '" + Delivery + "', '" + App + "')";

            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);
                

                cmd.CommandType = CommandType.Text;
                insertedid = Int32.Parse(cmd.ExecuteScalar().ToString());
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;


            }
            finally
            {
                con.Close();
            }



            
        }

        public int AddCatName(string txtCatName)
        {
            int insertedid = 0;
            con = new SqlConnection(commm.GetConnectionString());
            string sql = "INSERT INTO Category (CatName)  output inserted.CatId VALUES "
                   + "(@CatName)";

            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);
                SqlParameter[] param = new SqlParameter[1];


                param[0] = new SqlParameter("@CatName", SqlDbType.VarChar, 500);


                param[0].Value = txtCatName;


                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                cmd.CommandType = CommandType.Text;
                insertedid = Int32.Parse(cmd.ExecuteScalar().ToString());
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                

            }
            finally
            {
                con.Close();
            }



            return insertedid;

        }

        public void UpdateCatDeskImg(string fn, int CatId)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE Category  SET CatImgDesk='" + fn + ".jpg" + "' WHERE  (CatId = '" + CatId + "')", con);

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

        public void UpdateCatMblImg(string fn, int CatId)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE Category  SET CatImgMbl='" + fn + ".jpg" + "' WHERE  (CatId = '" + CatId + "')", con);

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

        public void UpdateBrandDeskImg(string fn, int BrandId)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE Brand  SET ImgUrlDesk='" + fn + ".jpg" + "' WHERE  (BrandId = '" + BrandId + "')", con);

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

        public void UpdateBrandMblImg(string fn, int BrandId)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE Brand  SET ImgUrlMbl='" + fn + ".jpg" + "' WHERE  (BrandId = '" + BrandId + "')", con);

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


        public void UpdateSubCatDeskImg(string fn, int SubCat)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE SubCategory SET  SubDeskImg = '" + fn + ".jpg" + "'  WHERE (SubCatId = '" + SubCat + "')", con);

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

        public void UpdateSubCatMblImg(string fn, int SubCat)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE SubCategory SET  SubMobImg = '" + fn + ".jpg" + "'  WHERE (SubCatId = '" + SubCat + "')", con);

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

        public ArrayList cat_Initialiser_all()
        {
            ArrayList list = new ArrayList();
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("select CatName, CatId from Category ORDER BY  NEWID()", con);
            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                    list.Add(dr[0].ToString());
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {
                con.Close();
            }
            return list;

        }

        public int AddSubCatName(string SubCat, string CatName)
        {
            int cat_id = cat_id_finder(CatName);
            int insertedid = 0;
            con = new SqlConnection(commm.GetConnectionString());
            string sql = "INSERT INTO SubCategory (SubCatName,CatId) output inserted.SubCatId VALUES "
                   + "(@sub_cat_Name,@cat_Id)";

            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);
                SqlParameter[] param = new SqlParameter[2];


                param[0] = new SqlParameter("@SubCatName", SqlDbType.VarChar, 500);
                param[1] = new SqlParameter("@CatId", SqlDbType.Int, 8);

                param[0].Value = SubCat;
                param[1].Value = cat_id;

                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }


                cmd.CommandType = CommandType.Text;
                insertedid = Int32.Parse(cmd.ExecuteScalar().ToString());

            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                

            }
            finally
            {
                con.Close();
            }

            return insertedid;
        }
        public int cat_id_finder(String CatName)
        {
            int id = 0;
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("select  CatId from Category where CatName='" + CatName + "'", con);
            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                    id = int.Parse(dr[0].ToString());
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {
                con.Close();
            }
            return id;
        }

        public int AddTag(string TagName, int SubCatId)
        {
            int st = 0;
            con = new SqlConnection(commm.GetConnectionString());
            string sql = "INSERT INTO Tag (SubcatId, TagName) OUTPUT inserted.TagId VALUES "
                   + "(@SubcatId, @TagName)";

            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);
                SqlParameter[] param = new SqlParameter[2];



                param[0] = new SqlParameter("@SubcatId", SqlDbType.Int, 8);
                param[1] = new SqlParameter("@TagName", SqlDbType.VarChar, 50);


                param[0].Value = SubCatId;
                param[1].Value = TagName;

                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                cmd.CommandType = CommandType.Text;
                st = Int32.Parse(cmd.ExecuteScalar().ToString());
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                

            }
            finally
            {
                con.Close();
            }

            return st;
        }

        public int sub_cat_id_finder(string sub_cat_name)
        {
            int id = 0;
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("select  SubCatId from SubCategory where SubCatName='" + sub_cat_name + "'", con);
            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    id = int.Parse(dr[0].ToString());

                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {
                con.Close();
            }
            return id;
        }



        public ArrayList company_name_finder()
        {
            {

                ArrayList list = new ArrayList();
                con = new SqlConnection(commm.GetConnectionString());
                cmd = new SqlCommand("SELECT  TagName from  Tag", con);
                try
                {
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        list.Add(dr[0].ToString());


                    }
                }
                catch (System.Data.SqlClient.SqlException ex)
                {
                    string msg;
                    msg = ex.Message;
                    
                }
                finally
                {
                    con.Close();
                }
                return list;

            }
        }

        public string add_NMobile_Daily_Needs_Item(String Category_m, String item_Name_m, float mrp_m, float price_m, String Description_m, String key_Words_m, int QUANT_M, int u_id, String BRAND_M, float ship_fee, String condition_m, int sub_cat_id, String AgeGroup, String Skils, String SubcatName)
        {
            ArrayList list = itemIdGenerator(Category_m);
            String item_id = "";
            int cat_Id = int.Parse(list[0].ToString());


            con = new SqlConnection(commm.GetConnectionString());
            string sql = "INSERT INTO [Priyamarketing].[dbo].[Mobile_Daily_Needs_item] (item_Name,mrp,price,Description,key_Words,cat_id,QUANT,BRAND,SHIPPING_CHARGE,CONDITION,sub_cat_Id,avaliable_qty,AgeGroup,Skils, SubcatName) VALUES "
                   + "(@item_Name,@mrp,@price,@Description,@key_Words,@cat_id,@QUANT,@BRAND,@SHIPPING_CHARGE,@CONDITION,@sub_cat_Id,@avaliable_qty,@AgeGroup,@Skils, @SubcatName)";

            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);
                SqlParameter[] param = new SqlParameter[15];


                param[0] = new SqlParameter("@item_Name", SqlDbType.VarChar, 100);
                param[1] = new SqlParameter("@mrp", SqlDbType.Money, 16);
                param[2] = new SqlParameter("@price", SqlDbType.Money, 16);
                param[3] = new SqlParameter("@Description", SqlDbType.VarChar, 2000);
                param[4] = new SqlParameter("@key_Words", SqlDbType.VarChar, 8000);
                param[5] = new SqlParameter("@cat_Id", SqlDbType.Int, 4);
                param[6] = new SqlParameter("@QUANT", SqlDbType.Int, 4);
                param[7] = new SqlParameter("@BRAND", SqlDbType.VarChar, 100);
                param[8] = new SqlParameter("@SHIPPING_CHARGE", SqlDbType.Float, 8);
                param[9] = new SqlParameter("@CONDITION", SqlDbType.VarChar, 50);
                param[10] = new SqlParameter("@sub_cat_Id", SqlDbType.Int, 4);
                param[11] = new SqlParameter("@avaliable_qty", SqlDbType.Int, 4);
                param[12] = new SqlParameter("@AgeGroup", SqlDbType.VarChar, 500);
                param[13] = new SqlParameter("@Skils", SqlDbType.VarChar, 500);
                param[14] = new SqlParameter("@SubcatName", SqlDbType.VarChar, 500);


                param[0].Value = item_Name_m;
                param[1].Value = mrp_m;
                param[2].Value = price_m;
                param[3].Value = Description_m;
                param[4].Value = key_Words_m;
                param[5].Value = cat_Id;
                param[6].Value = QUANT_M;
                param[7].Value = BRAND_M;
                param[8].Value = ship_fee;
                param[9].Value = condition_m;
                param[10].Value = sub_cat_id;
                param[11].Value = QUANT_M;
                param[12].Value = AgeGroup;
                param[13].Value = Skils;
                param[14].Value = SubcatName;

                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();
                item_id = itemId_finder(item_Name_m);
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {
                con.Close();
            }
            return item_id;

        }

        public String itemId_finder(String Itemname)
        {
            String item_id = "";
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("select ItemId from Item where ItemName='" + Itemname + "'", con);
            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                    item_id = dr[0].ToString();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {
                con.Close();
            }
            return item_id;

        }


        public ArrayList itemIdGenerator(String category)
        {
            ArrayList list = new ArrayList();
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("select cat_Id,current_Item_Id from [Priyamarketing].[dbo].[Mobile_Daily_Needs_category] where cat_Name=N'" + category + "'", con);
            try
            {
                con.Open();

                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    list.Add(int.Parse(dr[0].ToString()));
                    list.Add(int.Parse(dr[1].ToString()));

                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                

            }
            finally
            {
                //dr.Close();
                con.Close();
            }

            int item_Id = int.Parse(list[1].ToString()) + 1;

            cmd = new SqlCommand("update [Priyamarketing].[dbo].[Mobile_Daily_Needs_category] set  current_Item_Id ='" + item_Id + "'where cat_Name=N'" + category + "'", con);

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                

            }
            finally
            {
                con.Close();
            }

            return list;
        }



        public int SubCatAdd(int CatId, string SubCatName)
        {
            int insertedid = 0;
            con = new SqlConnection(commm.GetConnectionString());
            string sql = "INSERT INTO SubCategory (CatId, SubCatName)  output inserted.SubCatId VALUES "
                   + "(@CatId, @SubCatName)";

            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);
                SqlParameter[] param = new SqlParameter[2];

                param[0] = new SqlParameter("@CatId", SqlDbType.Int, 4);
                param[1] = new SqlParameter("@SubCatName", SqlDbType.VarChar, 500);


                param[0].Value = CatId;
                param[1].Value = SubCatName;


                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                cmd.CommandType = CommandType.Text;
                insertedid = Int32.Parse(cmd.ExecuteScalar().ToString());
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                

            }
            finally
            {
                con.Close();
            }



            return insertedid;

        }

        public int AddItem(int CatId, int SubCatId, string ItemName, string KeyWord, string Descrip, string About, string Ingredients, string ProductInfo, string Type, string Brand, string Rating)
        {
            int insertedid = 0;
            con = new SqlConnection(commm.GetConnectionString());
            string sql = "INSERT INTO Item (CatId, SubCatId, ItemName, KeyWords, Description, About, Ingredient, ProductInfo, Type, Rating, Brand)  output inserted.ItemId VALUES "
                   + "(@CatId, @SubCatId, @ItemName, @KeyWords, @Description, @About, @Ingredient, @ProductInfo, @Type, @Rating, @Brand)";

            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);
                SqlParameter[] param = new SqlParameter[11];


                param[0] = new SqlParameter("@CatId", SqlDbType.Int, 4);
                param[1] = new SqlParameter("@SubCatId", SqlDbType.Int, 4);
                param[2] = new SqlParameter("@ItemName", SqlDbType.VarChar, 1000);
                param[3] = new SqlParameter("@KeyWords", SqlDbType.VarChar, 8000);
                param[4] = new SqlParameter("@Description", SqlDbType.VarChar, 8000);
                param[5] = new SqlParameter("@About", SqlDbType.VarChar, 8000);
                param[6] = new SqlParameter("@Ingredient", SqlDbType.VarChar, 8000);
                param[7] = new SqlParameter("@ProductInfo", SqlDbType.VarChar, 8000);

                param[8] = new SqlParameter("@Type", SqlDbType.VarChar, 100);
                param[9] = new SqlParameter("@Rating", SqlDbType.Float, 8);
                param[10] = new SqlParameter("@Brand", SqlDbType.VarChar, 200);


                param[0].Value = CatId;
                param[1].Value = SubCatId;
                param[2].Value = ItemName;
                param[3].Value = KeyWord;
                param[4].Value = Descrip;
                param[5].Value = About;
                param[6].Value = Ingredients;
                param[7].Value = ProductInfo;

                param[8].Value = Type;
                param[9].Value = float.Parse(Rating.ToString());
                param[10].Value = Brand;


                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                cmd.CommandType = CommandType.Text;
                insertedid = Int32.Parse(cmd.ExecuteScalar().ToString());
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                

            }
            finally
            {
                con.Close();
            }



            return insertedid;

        }

        public int AddProdSize(int ItemId, string PackSize, float CostPrice, int CPGst, float SellingPrice, int SPGst, float Mrp, String ItemName, int pri, int discount)
        {
            int insertedid = 0;
            con = new SqlConnection(commm.GetConnectionString());
            string sql = "INSERT INTO PackSizes (ItemId, PackSize, CostPrc, GstCost, SellingPrice, GstSellPrc, Mrp, ItemName, Pri, Discount)  output inserted.PackId VALUES "
                   + "(@ItemId, @PackSize, @CostPrc, @GstCost, @SellingPrice, @GstSellPrc, @Mrp, @ItemName, @Pri, @Discount)";

            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);
                SqlParameter[] param = new SqlParameter[10];


                param[0] = new SqlParameter("@ItemId", SqlDbType.Int, 4);
                param[1] = new SqlParameter("@PackSize", SqlDbType.VarChar, 100);
                param[2] = new SqlParameter("@CostPrc", SqlDbType.Float, 8);
                param[3] = new SqlParameter("@GstCost", SqlDbType.Int, 4);
                param[4] = new SqlParameter("@SellingPrice", SqlDbType.Float, 8);
                param[5] = new SqlParameter("@GstSellPrc", SqlDbType.Int, 4);
                param[6] = new SqlParameter("@Mrp", SqlDbType.Float, 8);
                param[7] = new SqlParameter("@ItemName", SqlDbType.VarChar, 1000);
                param[8] = new SqlParameter("@Pri", SqlDbType.Bit);
                param[9] = new SqlParameter("@Discount", SqlDbType.Int, 4);

                param[0].Value = ItemId;
                param[1].Value = PackSize;
                param[2].Value = CostPrice;
                param[3].Value = CPGst;
                param[4].Value = SellingPrice;
                param[5].Value = SPGst;

                param[6].Value = Mrp;
                param[7].Value = ItemName;
                param[8].Value = pri;
                param[9].Value = discount;

                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                cmd.CommandType = CommandType.Text;
                insertedid = Int32.Parse(cmd.ExecuteScalar().ToString());
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                

            }
            finally
            {
                con.Close();

            }



            return insertedid;

        }
        public void updatemulti(int ItemId)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE Item  SET Multi='" + 1 + "', Single ='" + 0 + "' WHERE  (ItemId = '" + ItemId + "')", con);

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

        public void UpdateProDeskImg(string fn2, int fn)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE PackSizes  SET ImgUrlDesk='" + fn2 + "' WHERE  (PackId = '" + fn + "')", con);

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

        public void UpdateProMblImg(string fn1, int fn)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE PackSizes  SET ImgUrlMbl='" + fn1 + "' WHERE  (PackId = '" + fn + "')", con);

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

        public int AddSlider(string Slidername)
        {
            int insertedid = 0;
            con = new SqlConnection(commm.GetConnectionString());
            string sql = "INSERT INTO Slider (name)  output inserted.id VALUES "
                   + "(@name)";

            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);
                SqlParameter[] param = new SqlParameter[1];


                param[0] = new SqlParameter("@name", SqlDbType.VarChar, 50);


                param[0].Value = Slidername;


                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                cmd.CommandType = CommandType.Text;
                insertedid = Int32.Parse(cmd.ExecuteScalar().ToString());
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                

            }
            finally
            {
                con.Close();
            }



            return insertedid;

        }

        public int AddBanner(string txtName)
        {
            int insertedid = 0;
            con = new SqlConnection(commm.GetConnectionString());
            string sql = "INSERT INTO OffersBanner (Name)  output inserted.OfferId VALUES "
                   + "(@Name)";

            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);
                SqlParameter[] param = new SqlParameter[1];


                param[0] = new SqlParameter("@Name", SqlDbType.VarChar, 50);



                param[0].Value = txtName;



                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                cmd.CommandType = CommandType.Text;
                insertedid = Int32.Parse(cmd.ExecuteScalar().ToString());
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                

            }
            finally
            {
                con.Close();
            }



            return insertedid;

        }

        public void UpdateProductSize(int PackId, string PackSize, float SellingPrice, float Mrp, string fn, string fn_2, int ItemId, int discount)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE Item  SET PackId ='" + PackId + "', PackSize ='" + PackSize + "', SellingPrice ='" + SellingPrice + "', Mrp ='" + Mrp + "', ImgUrlMbl = '" + fn + "', ImgUrlDesk='" + fn_2 + "', Discount='" + discount + "' WHERE        (ItemId = '" + ItemId + "')", con);

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



        public int AddBrand(string Brand)
        {
            int st = 0;
            con = new SqlConnection(commm.GetConnectionString());
            string sql = "INSERT INTO Brand ( Brand) OUTPUT inserted.BrandId VALUES ('" + Brand + "')";


            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);


                cmd.CommandType = CommandType.Text;
                st = Int32.Parse(cmd.ExecuteScalar().ToString());
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                

            }
            finally
            {
                con.Close();
            }

            return st;

        }

        public DataTable get_item(int SubCatId, int top)
        {

            DataTable ShowProduct = new DataTable();
            ShowProduct.Columns.Add("ItemId");
            ShowProduct.Columns.Add("ItemName");
            ShowProduct.Columns.Add("Mrp");
            ShowProduct.Columns.Add("Discount");
            ShowProduct.Columns.Add("Multi", typeof(bool));
            ShowProduct.Columns.Add("Single", typeof(bool));
            ShowProduct.Columns.Add("Type");
            ShowProduct.Columns.Add("ImgUrlMbl");
            ShowProduct.Columns.Add("Rating");
            ShowProduct.Columns.Add("Brand");
            ShowProduct.Columns.Add("SellingPrice");
            ShowProduct.Columns.Add("PackSize");
            ShowProduct.Columns.Add("PackId");
            ShowProduct.Columns.Add("NotInCart", typeof(bool));
            ShowProduct.Columns.Add("InCart", typeof(bool));
            ShowProduct.Columns.Add("NoOfItems");
            ShowProduct.Columns.Add("OutofStack", typeof(bool));
            ShowProduct.Columns.Add("InStock", typeof(bool));
            ShowProduct.Columns.Add("Url");
            ShowProduct.Columns.Add("Cashback", typeof(Boolean));
            ShowProduct.Columns.Add("Pcb1");
            ShowProduct.Columns.Add("Pcb2");
            ShowProduct.Columns.Add("Pcb3");


            con = new SqlConnection(commm.GetConnectionString());
            try
            {
                con.Open();
                string query = "SELECT  TOP(" + top + ") [ItemId], [ItemName], CAST([Mrp] AS INT) as [Mrp] , [Discount], [Multi] ,[Single] , [Type],  [ImgUrlDesk], [Rating], [Brand], CAST([SellingPrice] AS INT) as [SellingPrice] , [PackSize], [PackId], 'True' AS NotInCart, 'False' AS InCart, '0' AS NoOfItems, [OutofStack],  ~ [OutofStack] AS InStock, [Url], [Cashback], [Pcb1], [Pcb2], [Pcb3]  FROM [Item] WHERE ([SubCatId] = '" + SubCatId + "')   ORDER BY OutofStack, SubCatId ASC , ItemName ASC";

                SqlDataAdapter da = new SqlDataAdapter(query, con);

                da.Fill(ShowProduct);

            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {

                con.Close();
            }
            return ShowProduct;

        }


        public DataTable get_itemBySearch(String Query)
        {

            DataTable ShowProduct = new DataTable();
            ShowProduct.Columns.Add("ItemId");
            ShowProduct.Columns.Add("ItemName");
            ShowProduct.Columns.Add("Mrp");
            ShowProduct.Columns.Add("Discount");
            ShowProduct.Columns.Add("Multi", typeof(bool));
            ShowProduct.Columns.Add("Single", typeof(bool));
            ShowProduct.Columns.Add("Type");
            ShowProduct.Columns.Add("ImgUrlMbl");
            ShowProduct.Columns.Add("Rating");
            ShowProduct.Columns.Add("Brand");
            ShowProduct.Columns.Add("SellingPrice");
            ShowProduct.Columns.Add("PackSize");
            ShowProduct.Columns.Add("PackId");
            ShowProduct.Columns.Add("NotInCart", typeof(bool));
            ShowProduct.Columns.Add("InCart", typeof(bool));
            ShowProduct.Columns.Add("NoOfItems");
            ShowProduct.Columns.Add("OutofStack", typeof(bool));
            ShowProduct.Columns.Add("InStock", typeof(bool));



            con = new SqlConnection(commm.GetConnectionString());
            try
            {
                con.Open();

                SqlDataAdapter da = new SqlDataAdapter(Query + "  ORDER BY OutofStack, SubCatId ASC , ItemName ASC", con);

                da.Fill(ShowProduct);

            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {

                con.Close();
            }
            return ShowProduct;

        }

        public DataTable selectSizesData(String SubCatid)
        {
            DataTable ShowProduct = new DataTable();

            ShowProduct.Columns.Add("ItemName");
            ShowProduct.Columns.Add("Brand");
            ShowProduct.Columns.Add("PackSize");
            ShowProduct.Columns.Add("SellingPrice");
            ShowProduct.Columns.Add("Mrp");
            ShowProduct.Columns.Add("CostPrc");
            ShowProduct.Columns.Add("OutofStack", typeof(bool));
            ShowProduct.Columns.Add("InStock", typeof(bool));





            con = new SqlConnection(commm.GetConnectionString());
            try
            {
                con.Open();
                string query = "SELECT PackSizes.ItemName, Item.Brand, PackSizes.PackSize, PackSizes.SellingPrice, PackSizes.Mrp, PackSizes.CostPrc, PackSizes.OutofStack,  ~ PackSizes.OutofStack AS InStock FROM PackSizes INNER JOIN Item ON PackSizes.ItemId = Item.ItemId WHERE  (Item.SubCatId = '" + SubCatid + "')";

                SqlDataAdapter da = new SqlDataAdapter(query, con);

                da.Fill(ShowProduct);

            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {

                con.Close();
            }
            return ShowProduct;

        }


        public DataTable SlotData(String Slot)
        {
            DataTable ShowProduct = new DataTable();

            ShowProduct.Columns.Add("OrderId");
            ShowProduct.Columns.Add("ItemName");
            ShowProduct.Columns.Add("Brand");
            ShowProduct.Columns.Add("PackSize");
            ShowProduct.Columns.Add("Qty");
            ShowProduct.Columns.Add("SellingPrice");
            ShowProduct.Columns.Add("TotalPrice");






            con = new SqlConnection(commm.GetConnectionString());
            try
            {
                con.Open();
                string query = "SELECT        Order_details.OrderId, Order_details.ItemName, Order_details.Brand, Order_details.PackSize, Order_details.Qty, Order_details.Price as SellingPrice, Order_details.TotalPrice FROM  Order_details INNER JOIN OrderDe ON Order_details.OrderId = OrderDe.OrderId WHERE        (OrderDe.DeliveredDate = '" + Slot + "') AND (OrderDe.Status > '0') AND (OrderDe.Status < '5')";

                SqlDataAdapter da = new SqlDataAdapter(query, con);

                da.Fill(ShowProduct);

            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {

                con.Close();
            }
            return ShowProduct;

        }


        public DataTable SubCatitemBySearch(String Search, int top)
        {
            DataTable Subcat = new DataTable();
            Subcat.Columns.Add("SubCatId");
            Subcat.Columns.Add("SubCatName");
            con = new SqlConnection(commm.GetConnectionString());
            try
            {
                con.Open();
                string query = "SELECT DISTINCT Item.SubCatId as SubCatId, SubCategory.SubCatName as SubCatName FROM Item INNER JOIN SubCategory ON Item.SubCatId = SubCategory.SubCatId  WHERE ((Item.ItemName Like '%" + Search + "%') OR (Item.KeyWords Like '%" + Search + "%')) ";

                SqlDataAdapter da = new SqlDataAdapter(query, con);

                da.Fill(Subcat);
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {

                con.Close();
            }
            return Subcat;
        }

        public DataTable get_itemHot()
        {

            DataTable ShowProduct = new DataTable();
            ShowProduct.Columns.Add("ItemId");
            ShowProduct.Columns.Add("ItemName");
            ShowProduct.Columns.Add("Mrp");
            ShowProduct.Columns.Add("Discount");
            ShowProduct.Columns.Add("Multi", typeof(bool));
            ShowProduct.Columns.Add("Single", typeof(bool));
            ShowProduct.Columns.Add("Type");
            ShowProduct.Columns.Add("ImgUrlMbl");
            ShowProduct.Columns.Add("Rating");
            ShowProduct.Columns.Add("Brand");
            ShowProduct.Columns.Add("SellingPrice");
            ShowProduct.Columns.Add("PackSize");
            ShowProduct.Columns.Add("PackId");
            ShowProduct.Columns.Add("NotInCart", typeof(bool));
            ShowProduct.Columns.Add("InCart", typeof(bool));
            ShowProduct.Columns.Add("NoOfItems");
            ShowProduct.Columns.Add("OutofStack", typeof(bool));
            ShowProduct.Columns.Add("InStock", typeof(bool));
            ShowProduct.Columns.Add("Url");
            ShowProduct.Columns.Add("Cashback", typeof(Boolean));
            ShowProduct.Columns.Add("Pcb1");
            ShowProduct.Columns.Add("Pcb2");
            ShowProduct.Columns.Add("Pcb3");


            con = new SqlConnection(commm.GetConnectionString());
            try
            {
                con.Open();
                string query = "SELECT  TOP(3) [ItemId], [ItemName], CAST([Mrp] AS INT) as [Mrp] , [Discount], [Multi] ,[Single] , [Type],  [ImgUrlDesk], [Rating], [Brand], CAST([SellingPrice] AS INT) as [SellingPrice] , [PackSize], [PackId], 'True' AS NotInCart, 'False' AS InCart, '0' AS NoOfItems, [OutofStack],  ~ [OutofStack] AS InStock, [Url], [Cashback], [Pcb1], [Pcb2], [Pcb3]  FROM [Item] WHERE [HotProducts]='True' AND ([OutofStack]='False')   ORDER BY OutofStack, SubCatId ASC , ItemName ASC";

                SqlDataAdapter da = new SqlDataAdapter(query, con);

                da.Fill(ShowProduct);

            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {

                con.Close();
            }
            return ShowProduct;

        }

        public DataTable get_itemTrending()
        {

            DataTable ShowProduct = new DataTable();
            ShowProduct.Columns.Add("ItemId");
            ShowProduct.Columns.Add("ItemName");
            ShowProduct.Columns.Add("Mrp");
            ShowProduct.Columns.Add("Discount");
            ShowProduct.Columns.Add("Multi", typeof(bool));
            ShowProduct.Columns.Add("Single", typeof(bool));
            ShowProduct.Columns.Add("Type");
            ShowProduct.Columns.Add("ImgUrlMbl");
            ShowProduct.Columns.Add("Rating");
            ShowProduct.Columns.Add("Brand");
            ShowProduct.Columns.Add("SellingPrice");
            ShowProduct.Columns.Add("PackSize");
            ShowProduct.Columns.Add("PackId");
            ShowProduct.Columns.Add("NotInCart", typeof(bool));
            ShowProduct.Columns.Add("InCart", typeof(bool));
            ShowProduct.Columns.Add("NoOfItems");
            ShowProduct.Columns.Add("OutofStack", typeof(bool));
            ShowProduct.Columns.Add("InStock", typeof(bool));
            ShowProduct.Columns.Add("Url");
            ShowProduct.Columns.Add("Cashback", typeof(Boolean));
            ShowProduct.Columns.Add("Pcb1");
            ShowProduct.Columns.Add("Pcb2");
            ShowProduct.Columns.Add("Pcb3");


            con = new SqlConnection(commm.GetConnectionString());
            try
            {
                con.Open();
                string query = "SELECT  TOP(3) [ItemId], [ItemName], CAST([Mrp] AS INT) as [Mrp] , [Discount], [Multi] ,[Single] , [Type],  [ImgUrlDesk], [Rating], [Brand], CAST([SellingPrice] AS INT) as [SellingPrice] , [PackSize], [PackId], 'True' AS NotInCart, 'False' AS InCart, '0' AS NoOfItems, [OutofStack],  ~ [OutofStack] AS InStock, [Url], [Cashback], [Pcb1], [Pcb2], [Pcb3]  FROM [Item] WHERE [Trending]='True' AND ([OutofStack]='False')  ORDER BY OutofStack, SubCatId ASC , ItemName ASC ";

                SqlDataAdapter da = new SqlDataAdapter(query, con);

                da.Fill(ShowProduct);

            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {

                con.Close();
            }
            return ShowProduct;

        }


        public DataTable getSizeDetails(int ItemId, String Typee, String Brand)
        {
            DataTable ShowSizes = new DataTable();
            ShowSizes.Columns.Add("ItemId");
            ShowSizes.Columns.Add("ItemName");
            ShowSizes.Columns.Add("Mrp");
            ShowSizes.Columns.Add("Discount");

            ShowSizes.Columns.Add("ImgUrlMbl");

            ShowSizes.Columns.Add("SellingPrice");
            ShowSizes.Columns.Add("PackSize");
            ShowSizes.Columns.Add("PackId");
            ShowSizes.Columns.Add("NotInCart", typeof(bool));
            ShowSizes.Columns.Add("InCart", typeof(bool));
            ShowSizes.Columns.Add("NoOfItems");
            ShowSizes.Columns.Add("Type");
            ShowSizes.Columns.Add("Brand");
            ShowSizes.Columns.Add("OutofStack", typeof(bool));
            ShowSizes.Columns.Add("InStock", typeof(bool));




            con = new SqlConnection(commm.GetConnectionString());
            try
            {
                con.Open();
                string query = "SELECT [ItemId], [ItemName], CAST([Mrp] AS INT) as [Mrp], [Discount] , [ImgUrlMbl], CAST([SellingPrice] AS INT) as [SellingPrice] ,  [PackSize], [PackId],  'True' AS NotInCart, 'False' AS InCart, '0' AS NoOfItems,'" + Typee + "' AS Type , '" + Brand + "' AS  Brand, [OutofStack],  ~ [OutofStack] AS InStock  FROM [PackSizes] WHERE ([ItemId] = '" + ItemId + "')  "; ;

                SqlDataAdapter da = new SqlDataAdapter(query, con);

                da.Fill(ShowSizes);

            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {

                con.Close();
            }
            return ShowSizes;

        }

        public int SlotInsert(string SlotCount, DateTime Date, string Value)
        {
            int insertedid = 0;
            con = new SqlConnection(commm.GetConnectionString());
            string sql = "INSERT INTO Slot (SlotCount, Date, Value)  output inserted.SlotId VALUES "
                   + "(@SlotCount, @Date, @Value)";

            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);
                SqlParameter[] param = new SqlParameter[3];


                param[0] = new SqlParameter("@SlotCount", SqlDbType.Int, 4);
                param[1] = new SqlParameter("@Date", SqlDbType.DateTime);
                param[2] = new SqlParameter("@Value", SqlDbType.VarChar, 500);


                param[0].Value = SlotCount;
                param[1].Value = Date;
                param[2].Value = Value;


                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                cmd.CommandType = CommandType.Text;
                insertedid = Int32.Parse(cmd.ExecuteScalar().ToString());
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                

            }
            finally
            {
                con.Close();
            }



            return insertedid;

        }

        public ArrayList Existing_phone(string mobile)
        {
            int ClientId = 0;
            ArrayList list = new ArrayList();
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("SELECT ClientId , Name, Email  FROM  Client WHERE  (Mobile = '" + mobile + "')", con);
            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    list.Add(dr[0].ToString());
                    list.Add(dr[1].ToString());
                    list.Add(dr[2].ToString());

                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {
                con.Close();
            }
            return list;

        }

        public int AddClient(string TxtContactNo)
        {
            int insertedid = 0;
            con = new SqlConnection(commm.GetConnectionString());
            string sql = "INSERT INTO Client (Mobile)  output inserted.ClientId VALUES (@Mobile)";

            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);
                SqlParameter[] param = new SqlParameter[1];


                param[0] = new SqlParameter("@Mobile", SqlDbType.VarChar, 100);





                param[0].Value = TxtContactNo;


                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                cmd.CommandType = CommandType.Text;
                insertedid = Int32.Parse(cmd.ExecuteScalar().ToString());
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                

            }
            finally
            {
                con.Close();
            }



            return insertedid;
        }

        public void AddPersonal(int ClientId, string Name, string Email)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE Client  SET Name='" + Name + "', Email ='" + Email + "' WHERE  (ClientId = '" + ClientId + "')", con);

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

        public int AddAddress(int ClientId, string HNo, string Apartment, string Street, string LandMark, string Number, string Area, string City, string Pincode, string Add, string Type, String Tag)
        {
            int insertedid = 0;

            con = new SqlConnection(commm.GetConnectionString());
            string sql = "INSERT INTO Address (ClientId, HNo, AName, StreetDet, LandMark, Number, AreaDet, City, Pincode,Address, Type, Tag)  output inserted.AddId VALUES (@ClientId, @HNo, @AName, @StreetDet, @LandMark, @Number, @AreaDet, @City, @Pincode, @Address, @Type, @Tag)";

            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);
                SqlParameter[] param = new SqlParameter[13];


                param[0] = new SqlParameter("@ClientId", SqlDbType.Int, 4);
                param[1] = new SqlParameter("@HNo", SqlDbType.VarChar, 200);
                param[2] = new SqlParameter("@AName", SqlDbType.VarChar, 500);
                param[3] = new SqlParameter("@StreetDet", SqlDbType.VarChar, 2000);
                param[4] = new SqlParameter("@LandMark", SqlDbType.VarChar, 1000);
                param[5] = new SqlParameter("@Number", SqlDbType.VarChar, 100);
                param[6] = new SqlParameter("@AreaDet", SqlDbType.VarChar, 2000);
                param[7] = new SqlParameter("@City", SqlDbType.VarChar, 100);
                param[8] = new SqlParameter("@Pincode", SqlDbType.Int, 4);
                param[9] = new SqlParameter("@Address", SqlDbType.VarChar, 5000);
                param[10] = new SqlParameter("@Type", SqlDbType.VarChar, 50);
                param[11] = new SqlParameter("@prime", SqlDbType.Bit);
                param[12] = new SqlParameter("@Tag", SqlDbType.VarChar, 100);



                param[0].Value = ClientId;
                param[1].Value = HNo;
                param[2].Value = Apartment;
                param[3].Value = Street;
                param[4].Value = LandMark;
                param[5].Value = Number;
                param[6].Value = Area;
                param[7].Value = City;
                param[8].Value = Pincode;
                param[9].Value = Add;
                param[10].Value = Type;
                param[11].Value = true;
                param[12].Value = Tag;





                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                cmd.CommandType = CommandType.Text;
                insertedid = Int32.Parse(cmd.ExecuteScalar().ToString());
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                

            }
            finally
            {
                con.Close();
            }

            return insertedid;



        }



        public ArrayList Address(int ClientId)
        {

            ArrayList list = new ArrayList();
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("SELECT  Address   FROM  Address WHERE  (ClientId = '" + ClientId + "')", con);
            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    list.Add(dr[0].ToString());

                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {
                con.Close();
            }
            return list;
        }

        public ArrayList RetrieveAddress(int ClientId)
        {
            String Address = "";
            ArrayList list = new ArrayList();

            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("SELECT Address, Pincode  FROM  Address WHERE  (ClientId = '" + ClientId + "') AND (prime = 'True' ) ", con);
            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    list.Add(dr[0]);
                    list.Add(dr[1]);
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {
                con.Close();
            }
            return list;

        }

        public ArrayList SelectAddress(int AddId)
        {

            ArrayList list = new ArrayList();

            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("SELECT HNo, StreetDet,  Pincode, AreaDet, Tag, Address, Type  FROM  Address WHERE  (AddId = '" + AddId + "')", con);
            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    list.Add(dr[0]);
                    list.Add(dr[1]);
                    list.Add(dr[2]);
                    list.Add(dr[3]);
                    list.Add(dr[4]);
                    list.Add(dr[5]);
                    list.Add(dr[6]);
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {
                con.Close();
            }
            return list;

        }

        public String SelectPrime(int ClientId)
        {
            String Address = "";


            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("SELECT Address FROM  Address WHERE  (ClientId = '" + ClientId + "') AND (prime = 'True' ) ", con);
            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    Address = dr[0].ToString();

                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {
                con.Close();
            }
            return Address;
        }

        public void primemanip(int ClientId)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE Address  SET prime= 'False' WHERE  (ClientId = '" + ClientId + "')", con);

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

        public ArrayList RetrieveName(int ClientId)
        {

            ArrayList name = new ArrayList();

            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("SELECT Name, Email, Mobile  FROM  Client WHERE  (ClientId = '" + ClientId + "') ", con);
            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    name.Add(dr[0]);
                    name.Add(dr[1]);
                    name.Add(dr[2]);
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {
                con.Close();
            }
            return name;

        }

        public void EditAddress(int AddId, int ClientId, string HNo, string Apartment, string Street, string LandMark, string Area, string City, string Pincode, string Add, string Type, String Tag)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE Address  SET HNo='" + HNo + "', AName ='" + Apartment + "', StreetDet ='" + Street + "', LandMark ='" + LandMark + "', AreaDet ='" + Area + "', Tag='" + Tag + "', City ='" + City + "', Pincode ='" + Pincode + "', Address ='" + Add + "', Type ='" + Type + "', prime= 'True' WHERE  (ClientId = '" + ClientId + "') AND (AddId = '" + AddId + "')", con);

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



        public void ChangePrimary(int AddId, int ClientId)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE Address  SET prime='False' WHERE  (ClientId = '" + ClientId + "')", con);

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();

                cmd = new SqlCommand("UPDATE Address  SET prime='True' WHERE  (ClientId = '" + ClientId + "') AND (AddId = '" + AddId + "')", con);
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



        public int CancelOrder(String OrderId)
        {
            int rowUpdated = 0;
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE OrderDe  SET Status='" + 0 + "', StatusText='Cancelled', Cancelled='" + 1 + "' WHERE  (OrderId = '" + OrderId + "')", con);

            try
            {
                con.Open();
                rowUpdated = cmd.ExecuteNonQuery();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {

            }
            finally
            {
                con.Close();
            }
            return rowUpdated;

        }

        public void delAddress(int AddId)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("DELETE FROM Address WHERE   (AddId = '" + AddId + "')", con);
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                

            }
            finally
            {
                con.Close();
            }

        }

        public int AddOrder(int ClientId, int TotalAmount, string Email, int DeliveryCharge, string Address, string Mobile, string ClientName, String Slot, int ProductCount, int GrandTotalAmt)
        {
            int insertedid = 0;

            con = new SqlConnection(commm.GetConnectionString());
            string sql = "INSERT INTO OrderDe (ClientId, Date, Status, TotalAmount, Email, DeliveryCharge, Address, Mobile, ClientName,DeliveredDate,ProductCount, GrandTotal)  output inserted.OrderId VALUES (@ClientId, @Date, @Status, @TotalAmount, @Email, @DeliveryCharge, @Address, @Mobile, @ClientName, @DeliveredDate, @ProductCount, @GrandTotal)";

            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);
                SqlParameter[] param = new SqlParameter[12];


                param[0] = new SqlParameter("@ClientId", SqlDbType.Int, 4);
                param[1] = new SqlParameter("@Date", SqlDbType.DateTime, 8);
                param[2] = new SqlParameter("@Status", SqlDbType.Int, 4);
                param[3] = new SqlParameter("@TotalAmount", SqlDbType.Float, 8);
                param[4] = new SqlParameter("@Email", SqlDbType.VarChar, 200);
                param[5] = new SqlParameter("@DeliveryCharge", SqlDbType.Float, 8);
                param[6] = new SqlParameter("@Address", SqlDbType.VarChar, 5000);
                param[7] = new SqlParameter("@Mobile", SqlDbType.VarChar, 50);

                param[8] = new SqlParameter("@ClientName", SqlDbType.VarChar, 100);
                param[9] = new SqlParameter("@DeliveredDate", SqlDbType.VarChar, 200);
                param[10] = new SqlParameter("@ProductCount", SqlDbType.Int, 4);
                param[11] = new SqlParameter("@GrandTotal", SqlDbType.Int, 4);


                param[0].Value = ClientId;
                param[1].Value = DateTime.Now.AddHours(12.5);
                param[2].Value = 1;
                param[3].Value = TotalAmount;
                param[4].Value = Email;
                param[5].Value = DeliveryCharge;
                param[6].Value = Address;
                param[7].Value = Mobile;

                param[8].Value = ClientName;
                param[9].Value = Slot;
                param[10].Value = ProductCount;
                param[11].Value = GrandTotalAmt;




                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                cmd.CommandType = CommandType.Text;
                insertedid = Int32.Parse(cmd.ExecuteScalar().ToString());
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                

            }
            finally
            {
                con.Close();
            }

            return insertedid;


        }

        public void DeductingValueFromWallet(string ClientId, int amt)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE Client SET   WalletBalance = WalletBalance - " + amt + " WHERE  (ClientId = '" + ClientId + "')", con);

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


        public int OrderDetails(int OrdId, int PackId, string ItemName, float Price, int Qty, float TotAmt, string Size, String ImgUrl, float Mrp, float TotalPrice, float TotalMrp, int Discount, String Brand)
        {
            int insertedid = 0;
            con = new SqlConnection(commm.GetConnectionString());
            string sql = "INSERT INTO Order_details (OrderId, PackId, ItemName, Price, Qty, TotalAmount, PackSize, ImgUrl , Mrp, TotalPrice, TotalMrp, Discount, Brand )  output inserted.Id VALUES (@OrderId, @PackId, @ItemName, @Price, @Qty, @TotalAmount, @PackSize, @ImgUrl , @Mrp, @TotalPrice, @TotalMrp, @Discount, @Brand)";

            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);
                SqlParameter[] param = new SqlParameter[14];


                param[0] = new SqlParameter("@OrderId", SqlDbType.Int, 4);
                param[1] = new SqlParameter("@PackId", SqlDbType.Int, 4);
                param[2] = new SqlParameter("@ItemName", SqlDbType.VarChar, 200);
                param[3] = new SqlParameter("@Price", SqlDbType.Float, 8);
                param[4] = new SqlParameter("@Qty", SqlDbType.Int, 4);
                param[5] = new SqlParameter("@TotalAmount", SqlDbType.Float, 8);
                param[6] = new SqlParameter("@Date", SqlDbType.VarChar, 50);
                param[7] = new SqlParameter("@PackSize", SqlDbType.VarChar, 100);
                param[8] = new SqlParameter("@ImgUrl", SqlDbType.VarChar, 200);
                param[9] = new SqlParameter("@Mrp", SqlDbType.Float, 8);
                param[10] = new SqlParameter("@TotalPrice", SqlDbType.Float, 8);
                param[11] = new SqlParameter("@TotalMrp", SqlDbType.Float, 8);
                param[12] = new SqlParameter("@Discount", SqlDbType.Int, 4);
                param[13] = new SqlParameter("@Brand", SqlDbType.VarChar, 100);


                param[0].Value = OrdId;
                param[1].Value = PackId;
                param[2].Value = ItemName;
                param[3].Value = Price;
                param[4].Value = Qty;
                param[5].Value = TotAmt;
                param[6].Value = DateTime.Now.AddHours(13.5);
                param[7].Value = Size;
                param[8].Value = ImgUrl;
                param[9].Value = Mrp;
                param[10].Value = TotalPrice;
                param[11].Value = TotalMrp;
                param[12].Value = Discount;
                param[13].Value = Brand;







                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                cmd.CommandType = CommandType.Text;
                insertedid = Int32.Parse(cmd.ExecuteScalar().ToString());
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                

            }
            finally
            {
                con.Close();
            }

            return insertedid;


        }

        public void UpdateStatus(int OrderId)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE OrderDe  SET Status='" + 2 + "', Processing='" + 1 + "', StatusText= 'Packing'  WHERE  (OrderId = '" + OrderId + "')", con);

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


        public void UpdateDelItem(int OrderId, int TotalA, int Qty)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE OrderDe  SET TotalAmount=TotalAmount - '" + TotalA + "', SubTotal=SubTotal - '" + TotalA + "', Packcount= Packcount -'" + Qty + "' , ProductCount= ProductCount - '1'  WHERE  (OrderId = '" + OrderId + "')", con);

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

        public void updateProcess(int OrderId)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE OrderDe  SET Status='" + 3 + "',  StatusText= 'Ready To Deliver' WHERE  (OrderId = '" + OrderId + "')", con);

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

        public void updateDelivered(int OrderId)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE OrderDe  SET Status='" + 5 + "',  StatusText= 'Delivered' WHERE  (OrderId = '" + OrderId + "')", con);

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

        public void updateDispatch(int OrderId)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE OrderDe  SET Dispatch='" + 1 + "', Status='" + 4 + "', StatusText= 'Out For Delivery' WHERE  (OrderId = '" + OrderId + "')", con);

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

        public void updateDeliver(int OrderId)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE OrderDe  SET Status='" + 0 + "', Cancelled='" + 1 + "' WHERE  (OrderId = '" + OrderId + "')", con);

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

        public DataTable get_itemByOffer(int percentage)
        {
            DataTable ShowProduct = new DataTable();
            ShowProduct.Columns.Add("ItemId");
            ShowProduct.Columns.Add("ItemName");
            ShowProduct.Columns.Add("Mrp");
            ShowProduct.Columns.Add("Discount");
            ShowProduct.Columns.Add("Multi", typeof(bool));
            ShowProduct.Columns.Add("Single", typeof(bool));
            ShowProduct.Columns.Add("Type");
            ShowProduct.Columns.Add("ImgUrlMbl");
            ShowProduct.Columns.Add("Rating");
            ShowProduct.Columns.Add("Brand");
            ShowProduct.Columns.Add("SellingPrice");
            ShowProduct.Columns.Add("PackSize");
            ShowProduct.Columns.Add("PackId");
            ShowProduct.Columns.Add("NotInCart", typeof(bool));
            ShowProduct.Columns.Add("InCart", typeof(bool));
            ShowProduct.Columns.Add("NoOfItems");
            ShowProduct.Columns.Add("OutofStack", typeof(bool));
            ShowProduct.Columns.Add("InStock", typeof(bool));
            ShowProduct.Columns.Add("Url");
            ShowProduct.Columns.Add("Cashback", typeof(Boolean));
            ShowProduct.Columns.Add("Pcb1");
            ShowProduct.Columns.Add("Pcb2");
            ShowProduct.Columns.Add("Pcb3");

            con = new SqlConnection(commm.GetConnectionString());
            try
            {
                con.Open();
                string query = "SELECT  TOP(20)   [ItemId], [ItemName], CAST([Mrp] AS INT) as [Mrp] , [Discount], [Multi] ,[Single] , [Type], [ImgUrlMbl], [Rating], [Brand], CAST([SellingPrice] AS INT) as [SellingPrice] , [PackSize], [PackId], 'True' AS NotInCart, 'False' AS InCart, '0' AS NoOfItems, [OutofStack],  ~ [OutofStack] AS InStock , [Url], [Cashback], [Pcb1], [Pcb2], [Pcb3]   FROM [Item] WHERE  (Discount >'" + percentage + "') AND ([OutofStack]='False')   ORDER BY OutofStack, [Discount] DESC, SubCatId ASC , ItemName ASC ";

                SqlDataAdapter da = new SqlDataAdapter(query, con);

                da.Fill(ShowProduct);

            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {

                con.Close();
            }
            return ShowProduct;

        }
        public DataTable SubCatitemByOffer(int percentage)
        {
            DataTable Subcat = new DataTable();
            Subcat.Columns.Add("SubCatId");
            Subcat.Columns.Add("SubCatName");
            con = new SqlConnection(commm.GetConnectionString());
            try
            {
                con.Open();
                string query = "SELECT DISTINCT Item.SubCatId as SubCatId, SubCategory.SubCatName as SubCatName FROM Item INNER JOIN SubCategory ON Item.SubCatId = SubCategory.SubCatId  WHERE (Item.Discount >'" + percentage + "') AND (Item.OutofStack = '0') ";

                SqlDataAdapter da = new SqlDataAdapter(query, con);

                da.Fill(Subcat);
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {

                con.Close();
            }
            return Subcat;
        }

        public void makeOffer(int ItemId)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE Item  SET Offers='" + 1 + "' WHERE  (ItemId = '" + ItemId + "')", con);

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

        public void makeOffePack(int ItemId)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE PackSizes  SET Offers='" + 1 + "' WHERE  (ItemId = '" + ItemId + "')", con);

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

        public void makeOffer1(int ItemId)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE Item  SET Offers='" + 0 + "' WHERE  (ItemId = '" + ItemId + "')", con);

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

        public void makeOffePack1(int ItemId)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE PackSizes  SET Offers='" + 0 + "' WHERE  (ItemId = '" + ItemId + "')", con);

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

        public ArrayList RetrieveClientDetails(int ClientId)
        {
            String Name = "";
            ArrayList name = new ArrayList();

            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("SELECT Name, Email, Mobile, WalletBalance  FROM  Client WHERE  (ClientId = '" + ClientId + "') ", con);
            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    name.Add(dr[0]);
                    name.Add(dr[1]);
                    name.Add(dr[2]);
                    name.Add(dr[3]);
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {

            }
            finally
            {
                con.Close();
            }
            return name;

        }



        public int AddDelivery(string txtname, string txtadd, string txtphn, string txtaddrpr, string txtPassword)
        {
            int insertedid = 0;
            con = new SqlConnection(commm.GetConnectionString());
            string sql = "INSERT INTO Delivery (Dname, Daddress, Dmobile, Daddressproof, Dpassword)  output inserted.DID VALUES (@Dname, @Daddress, @Dmobile, @Daddressproof, @Dpassword)";

            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);
                SqlParameter[] param = new SqlParameter[5];


                param[0] = new SqlParameter("@Dname", SqlDbType.VarChar, 100);
                param[1] = new SqlParameter("@Daddress", SqlDbType.VarChar, 200);
                param[2] = new SqlParameter("@Dmobile", SqlDbType.VarChar, 100);
                param[3] = new SqlParameter("@Daddressproof", SqlDbType.VarChar, 100);
                param[4] = new SqlParameter("@Dpassword", SqlDbType.VarChar, 100);




                param[0].Value = txtname;
                param[1].Value = txtadd;
                param[2].Value = txtphn;
                param[3].Value = txtaddrpr;
                param[4].Value = txtPassword;



                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                cmd.CommandType = CommandType.Text;
                insertedid = Int32.Parse(cmd.ExecuteScalar().ToString());
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                

            }
            finally
            {
                con.Close();
            }



            return insertedid;
        }

        public ArrayList ExisteingMobileDelivery(string username, string password)
        {
            ArrayList al = new ArrayList();
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand(" SELECT *  FROM Delivery  WHERE (Dmobile ='" + username + "') AND (Dpassword ='" + password + "')", con);

            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    al.Add(dr[0]);
                    al.Add(dr[1]);

                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {
                con.Close();
            }
            return al;
        }

        public string RetrieveNumber(int DID)
        {
            String al = "";
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand(" SELECT  Dmobile  FROM Delivery  WHERE (DID ='" + DID + "') ", con);

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
                
            }
            finally
            {
                con.Close();
            }
            return al;

        }

        public void AssignDeliver(int DID, string Dname, string Dmobile, int OrderId)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE OrderDe  SET  DID='" + DID + "', Dname='" + Dname + "', Dmobile='" + Dmobile + "' WHERE  (OrderId = '" + OrderId + "')", con);

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

        public void updateItem(int CatId, int SubCatId, int ItemId, string ItemName, string Brand, string Keyword, string Desc, string About, string Rating, string Inf0, string Ingre, string Type, bool HotProducts, bool Trending, bool OutOfStock, bool Offers)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE Item SET ItemName='" + ItemName + "', KeyWords='" + Keyword + "', Description='" + Desc + "', CatId='" + CatId + "', SubCatId='" + SubCatId + "', About='" + About + "', Ingredient='" + Ingre + "', ProductInfo='" + Inf0 + "', Type='" + Type + "', Rating='" + Rating + "', Brand='" + Brand + "', HotProducts = '" + HotProducts + "', Trending = '" + Trending + "', OutofStack = '" + OutOfStock + "', Offers = '" + Offers + "' WHERE  (ItemId = '" + ItemId + "')", con);

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

        public void updatePack(int ItemId, string ItemName, int PackId, string PackSize, float SellingPrice, float Mrp, int pri, int discount, bool OutofStack)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE PackSizes SET PackSize='" + PackSize + "', SellingPrice='" + SellingPrice + "', Mrp='" + Mrp + "', ItemId='" + ItemId + "', ItemName='" + ItemName + "', Pri='" + pri + "', Discount='" + discount + "', OutofStack='" + OutofStack + "' WHERE  (PackId = '" + PackId + "')", con);

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

        public void updateHot(int PackId, int Hot, int Tre, int Outof, int Offe)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE PackSizes SET HotProducts='" + Hot + "', Trending='" + Tre + "', OutofStack='" + Outof + "', Offers='" + Offe + "' WHERE  (PackId = '" + PackId + "')", con);

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

        public void updatePri(int ItemId, int Pri, int Pri2)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE PackSizes SET Pri='" + Pri + "' WHERE  (ItemId = '" + ItemId + "') AND (Pri='" + Pri2 + "') ", con);

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

        public void updatePri2(int ItemId, int Pri, int Pri2, int PackId)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE PackSizes SET Pri='" + Pri + "' WHERE  (ItemId = '" + ItemId + "') AND (Pri='" + Pri2 + "') AND (PackId=" + PackId + ") ", con);

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

        public void UpdatePass(string pass, int Id)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE Login SET password='" + pass + "' WHERE  (userid = '" + Id + "')", con);

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

        public string amount()
        {
            String al = "0";
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand(@"SELECT        SUM(TotalAmount) AS Quant
FROM            OrderDe  WHERE ([Status] = 5)    ", con);

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
                
            }
            finally
            {
                con.Close();
            }
            return al;
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
                FROM  Client ", con);

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
                
            }
            finally
            {
                con.Close();
            }
            return v;
        }

        public string Revenue()
        {
            String al = "0";
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand(@" SELECT        COUNT(OrderId) AS Expr1 FROM OrderDe ", con);

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
                
            }
            finally
            {
                con.Close();
            }
            return al;
        }

        public string TotalOrderclient(int ClientId)
        {
            String al = "0";
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand(@" SELECT COUNT(OrderId) AS Expr1 FROM OrderDe Where ClientId='" + ClientId + "' ", con);

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
                
            }
            finally
            {
                con.Close();
            }
            return al;
        }

        public int PinArea(string txtPin, string txtArea, String City)
        {
            int insertedid = 0;
            con = new SqlConnection(commm.GetConnectionString());
            string sql = "INSERT INTO Pin_Amount_Table (pin, Area, City )  output inserted.id VALUES "
                   + " (@pin, @Area, @City )";

            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);
                SqlParameter[] param = new SqlParameter[3];


                param[0] = new SqlParameter("@pin", SqlDbType.Int, 4);
                param[1] = new SqlParameter("@Area", SqlDbType.VarChar, 150);
                param[2] = new SqlParameter("@City", SqlDbType.VarChar, 150);


                param[0].Value = txtPin;
                param[1].Value = txtArea;
                param[2].Value = City;


                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                cmd.CommandType = CommandType.Text;
                insertedid = Int32.Parse(cmd.ExecuteScalar().ToString());
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                

            }
            finally
            {
                con.Close();
            }



            return insertedid;

        }

        public string InsertImage(string Location, int typ)
        {
            String insertedid = "";
            con = new SqlConnection(commm.GetConnectionString());
            string sql = "INSERT INTO ImageResources (Location, Type)  output inserted.ImageId VALUES "
                   + "(@Location, @Type)";

            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);
                SqlParameter[] param = new SqlParameter[2];


                param[0] = new SqlParameter("@Location", SqlDbType.VarChar, 500);
                param[1] = new SqlParameter("@Type", SqlDbType.Int, 4);



                param[0].Value = Location;
                param[1].Value = typ;



                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                cmd.CommandType = CommandType.Text;
                insertedid = cmd.ExecuteScalar().ToString();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                

            }
            finally
            {
                con.Close();
            }



            return insertedid;
        }

        public void UpdateUrl(string URL)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE ImageResources  SET URL=" + URL + " WHERE  (ImageId = '" + URL + "')", con);

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

        public ArrayList RetrivePro(int ItemId)
        {

            ArrayList list = new ArrayList();

            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("SELECT KeyWords, Description, About, Rating, Ingredient, ProductInfo, ItemName, HotProducts, Trending, OutofStack, Offers, Brand  FROM  Item WHERE  (ItemId = '" + ItemId + "') ", con);
            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    list.Add(dr[0]);
                    list.Add(dr[1]);
                    list.Add(dr[2]);
                    list.Add(dr[3]);
                    list.Add(dr[4]);
                    list.Add(dr[5]);
                    list.Add(dr[6]);
                    list.Add(dr[7]);
                    list.Add(dr[8]);
                    list.Add(dr[9]);
                    list.Add(dr[10]);
                    list.Add(dr[11]);

                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {
                con.Close();
            }
            return list;

        }

        public ArrayList RetriveSize(int PackId)
        {
            String Address = "";
            ArrayList list = new ArrayList();

            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("SELECT SellingPrice, Mrp, ImgUrlMbl, ImgUrlDesk, HotProducts, Trending, OutofStack, Offers, PackSize, Discount,Pri  FROM  PackSizes WHERE  (PackId = '" + PackId + "')", con);
            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    list.Add(dr[0]);
                    list.Add(dr[1]);
                    list.Add(dr[2]);
                    list.Add(dr[3]);
                    list.Add(dr[4]);
                    list.Add(dr[5]);
                    list.Add(dr[6]);
                    list.Add(dr[7]);
                    list.Add(dr[8]);
                    list.Add(dr[9]);
                    list.Add(dr[10]);


                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {
                con.Close();
            }
            return list;
        }



        public string GetItemId(int ItemID)
        {
            String PackId = "";


            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("SELECT   PackId FROM  Item WHERE   (ItemId = '" + ItemID + "')", con);
            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    PackId = dr[0].ToString();

                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {
                con.Close();
            }
            return PackId;
        }

        public void UpdateSubDeskImg(string fn1, int subcatid, int CatId)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE SubCategory  SET SubDeskImg='" + fn1 + ".jpg" + "' WHERE  (SubCatId = '" + subcatid + "') AND (CatId = '" + CatId + "')", con);

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

        public void UpdateSubMblImg(string fn2, int subcatid, int CatId)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE SubCategory  SET SubMobImg='" + fn2 + ".jpg" + "' WHERE  (SubCatId = '" + subcatid + "') AND (CatId = '" + CatId + "')", con);

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

        public void UpdateSlidDeskImg(string fn1, int SliderId)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE Slider  SET DeskImg='" + fn1 + ".jpg" + "' WHERE  (id = '" + SliderId + "')", con);

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

        public void UpdateSlidMblImg(string fn2, int SliderId)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE Slider  SET MblImg='" + fn2 + ".jpg" + "' WHERE  (id = '" + SliderId + "')", con);

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





        public void updateItemFrm(int PackId, string PackSize, float SellingPrice, float Mrp, string fn1, string fn2, int discount, bool OutofStack)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE Item  SET PackSize='" + PackSize + "', SellingPrice='" + SellingPrice + "', Mrp='" + Mrp + "', ImgUrlMbl='" + fn1 + "', ImgUrlDesk='" + fn2 + "', Discount='" + discount + "', OutofStack='" + OutofStack + "'   WHERE  (PackId = '" + PackId + "')", con);

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

        public void UpdateOffDeskImg(string fn1, int BannerId)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE OffersBanner SET  DeskImg = '" + fn1 + ".jpg" + "'  WHERE (OfferId = '" + BannerId + "')", con);

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

        public void UpdateOffMblImg(string fn2, int BannerId)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE OffersBanner SET  MobImg = '" + fn2 + ".jpg" + "'  WHERE (OfferId = '" + BannerId + "')", con);

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

        public ArrayList RetrieveBanner(int Banner)
        {
            ArrayList list = new ArrayList();

            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("SELECT Show, DeskImg, MobImg  FROM  OffersBanner WHERE  (OfferId = '" + Banner + "')", con);
            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    list.Add(dr[0]);
                    list.Add(dr[1]);
                    list.Add(dr[2]);


                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {
                con.Close();
            }
            return list;

        }

        public void UpdateBannerMblImg(string fn1, int Banner)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE OffersBanner  SET MobImg='" + fn1 + "' WHERE  (OfferId = '" + Banner + "')", con);

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

        public void UpdateBannerDeskImg(string fn2, int Banner)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE OffersBanner  SET DeskImg='" + fn2 + "' WHERE  (OfferId = '" + Banner + "')", con);

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

        public DataTable get_item1(int CatId)
        {


            DataTable ShowProduct = new DataTable();
            ShowProduct.Columns.Add("ItemId");
            ShowProduct.Columns.Add("ItemName");
            ShowProduct.Columns.Add("Mrp");
            ShowProduct.Columns.Add("Discount");
            ShowProduct.Columns.Add("Multi", typeof(bool));
            ShowProduct.Columns.Add("Single", typeof(bool));
            ShowProduct.Columns.Add("Type");
            ShowProduct.Columns.Add("ImgUrlMbl");
            ShowProduct.Columns.Add("Rating");
            ShowProduct.Columns.Add("Brand");
            ShowProduct.Columns.Add("SellingPrice");
            ShowProduct.Columns.Add("PackSize");
            ShowProduct.Columns.Add("PackId");
            ShowProduct.Columns.Add("NotInCart", typeof(bool));
            ShowProduct.Columns.Add("InCart", typeof(bool));
            ShowProduct.Columns.Add("NoOfItems");
            ShowProduct.Columns.Add("OutofStack", typeof(bool));
            ShowProduct.Columns.Add("InStock", typeof(bool));

            ShowProduct.Columns.Add("Url");
            ShowProduct.Columns.Add("Cashback", typeof(Boolean));
            ShowProduct.Columns.Add("Pcb1");
            ShowProduct.Columns.Add("Pcb2");
            ShowProduct.Columns.Add("Pcb3");


            con = new SqlConnection(commm.GetConnectionString());
            try
            {
                con.Open();
                string query = "SELECT [ItemId], [ItemName], CAST([Mrp] AS INT) as [Mrp] , [Discount], [Multi] ,[Single] , [Type], [ImgUrlMbl], [Rating], [Brand], CAST([SellingPrice] AS INT) as [SellingPrice] , [PackSize], [PackId], 'True' AS NotInCart, 'False' AS InCart, '0' AS NoOfItems, [OutofStack],  ~ [OutofStack] AS InStock, [Url], [Cashback], [Pcb1], [Pcb2], [Pcb3] FROM [Item] WHERE ([CatId] = '" + CatId + "')   ORDER BY OutofStack, SubCatId ASC , ItemName ASC ";

                SqlDataAdapter da = new SqlDataAdapter(query, con);

                da.Fill(ShowProduct);

            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {

                con.Close();
            }
            return ShowProduct;

        }


        public DataTable getCatItem(String CatId)
        {
            DataTable ShowProduct = new DataTable();
            ShowProduct.Columns.Add("ItemId");
            ShowProduct.Columns.Add("ItemName");
            ShowProduct.Columns.Add("Mrp");
            ShowProduct.Columns.Add("Discount");
            ShowProduct.Columns.Add("Multi", typeof(bool));
            ShowProduct.Columns.Add("Single", typeof(bool));
            ShowProduct.Columns.Add("Type");
            ShowProduct.Columns.Add("ImgUrlMbl");
            ShowProduct.Columns.Add("Rating");
            ShowProduct.Columns.Add("Brand");
            ShowProduct.Columns.Add("SellingPrice");
            ShowProduct.Columns.Add("PackSize");
            ShowProduct.Columns.Add("PackId");
            ShowProduct.Columns.Add("NotInCart", typeof(bool));
            ShowProduct.Columns.Add("InCart", typeof(bool));
            ShowProduct.Columns.Add("NoOfItems");
            ShowProduct.Columns.Add("OutofStack", typeof(bool));
            ShowProduct.Columns.Add("InStock", typeof(bool));
            ShowProduct.Columns.Add("Url");
            ShowProduct.Columns.Add("Cashback", typeof(Boolean));
            ShowProduct.Columns.Add("Pcb1");
            ShowProduct.Columns.Add("Pcb2");
            ShowProduct.Columns.Add("Pcb3");



            con = new SqlConnection(commm.GetConnectionString());
            try
            {
                con.Open();
                string query = "(SELECT [ItemId], [ItemName], CAST([Mrp] AS INT) as [Mrp] , [Discount], [Multi] ,[Single] , [Type],  [ImgUrlMbl], [Rating], [Brand], CAST([SellingPrice] AS INT) as [SellingPrice] , [PackSize], [PackId], 'True' AS NotInCart, 'False' AS InCart, '0' AS NoOfItems, [OutofStack],  ~ [OutofStack] AS InStock, [Url], [Cashback], [Pcb1], [Pcb2], [Pcb3]  FROM [Item] WHERE (CatId = '" + CatId + "') AND ([Trending]='True') AND ([OutofStack]='False')   )   ORDER BY  SubCatId ASC , ItemName ASC ";

                SqlDataAdapter da = new SqlDataAdapter(query, con);

                da.Fill(ShowProduct);

            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {

                con.Close();
            }
            return ShowProduct;
        }

        public DataTable Refined(String Query)
        {


            DataTable ShowProduct = new DataTable();
            ShowProduct.Columns.Add("ItemId");
            ShowProduct.Columns.Add("ItemName");
            ShowProduct.Columns.Add("Mrp");
            ShowProduct.Columns.Add("Discount");
            ShowProduct.Columns.Add("Multi", typeof(bool));
            ShowProduct.Columns.Add("Single", typeof(bool));
            ShowProduct.Columns.Add("Type");
            ShowProduct.Columns.Add("ImgUrlMbl");
            ShowProduct.Columns.Add("Rating");
            ShowProduct.Columns.Add("Brand");
            ShowProduct.Columns.Add("SellingPrice");
            ShowProduct.Columns.Add("PackSize");
            ShowProduct.Columns.Add("PackId");
            ShowProduct.Columns.Add("NotInCart", typeof(bool));
            ShowProduct.Columns.Add("InCart", typeof(bool));
            ShowProduct.Columns.Add("NoOfItems");
            ShowProduct.Columns.Add("OutofStack", typeof(bool));
            ShowProduct.Columns.Add("InStock", typeof(bool));



            con = new SqlConnection(commm.GetConnectionString());
            try
            {
                con.Open();
                string query = Query;

                SqlDataAdapter da = new SqlDataAdapter(query, con);

                da.Fill(ShowProduct);

            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {

                con.Close();
            }
            return ShowProduct;

        }

        public DataTable SubCatgetCatitem(int CatId)
        {
            DataTable Subcat = new DataTable();
            Subcat.Columns.Add("SubCatId");
            Subcat.Columns.Add("SubCatName");
            con = new SqlConnection(commm.GetConnectionString());
            try
            {
                con.Open();
                string query = "SELECT DISTINCT Item.SubCatId as SubCatId, SubCategory.SubCatName as SubCatName FROM Item INNER JOIN SubCategory ON Item.SubCatId = SubCategory.SubCatId  WHERE (Item.CatId = '" + CatId + "') AND (Item.OutofStack = '0') ";

                SqlDataAdapter da = new SqlDataAdapter(query, con);

                da.Fill(Subcat);
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {

                con.Close();
            }
            return Subcat;

        }

        public DataTable get_ItemsbyS(int SubCatId)
        {
            DataTable ShowProduct = new DataTable();
            ShowProduct.Columns.Add("ItemId");
            ShowProduct.Columns.Add("ItemName");
            ShowProduct.Columns.Add("Mrp");
            ShowProduct.Columns.Add("Discount");
            ShowProduct.Columns.Add("Multi", typeof(bool));
            ShowProduct.Columns.Add("Single", typeof(bool));
            ShowProduct.Columns.Add("Type");
            ShowProduct.Columns.Add("ImgUrlMbl");
            ShowProduct.Columns.Add("Rating");
            ShowProduct.Columns.Add("Brand");
            ShowProduct.Columns.Add("SellingPrice");
            ShowProduct.Columns.Add("PackSize");
            ShowProduct.Columns.Add("PackId");
            ShowProduct.Columns.Add("NotInCart", typeof(bool));
            ShowProduct.Columns.Add("InCart", typeof(bool));
            ShowProduct.Columns.Add("NoOfItems");
            ShowProduct.Columns.Add("OutofStack", typeof(bool));
            ShowProduct.Columns.Add("InStock", typeof(bool));
            ShowProduct.Columns.Add("Url");
            ShowProduct.Columns.Add("Cashback", typeof(Boolean));
            ShowProduct.Columns.Add("Pcb1");
            ShowProduct.Columns.Add("Pcb2");
            ShowProduct.Columns.Add("Pcb3");



            con = new SqlConnection(commm.GetConnectionString());
            try
            {
                con.Open();
                string query = "SELECT [ItemId], [ItemName], CAST([Mrp] AS INT) as [Mrp] , [Discount], [Multi] ,[Single] , [Type], [ImgUrlMbl] , [Rating], [Brand], CAST([SellingPrice] AS INT) as [SellingPrice] , [PackSize], [PackId], 'True' AS NotInCart, 'False' AS InCart, '0' AS NoOfItems, [OutofStack],  ~ [OutofStack] AS InStock, [Url], [Cashback], [Pcb1], [Pcb2], [Pcb3]  FROM [Item] WHERE ([SubCatId] = '" + SubCatId + "')   ORDER BY OutofStack, SubCatId ASC , ItemName ASC  ";

                SqlDataAdapter da = new SqlDataAdapter(query, con);

                da.Fill(ShowProduct);

            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {

                con.Close();
            }
            return ShowProduct;

        }

        public DataTable SubCatItemsbyS(int SubCatId)
        {
            DataTable Subcat = new DataTable();
            Subcat.Columns.Add("SubCatId");
            Subcat.Columns.Add("SubCatName");
            con = new SqlConnection(commm.GetConnectionString());
            try
            {
                con.Open();
                string query = "SELECT DISTINCT Item.SubCatId as SubCatId, SubCategory.SubCatName as SubCatName FROM Item INNER JOIN SubCategory ON Item.SubCatId = SubCategory.SubCatId  WHERE (Item.SubCatId = '" + SubCatId + "')";

                SqlDataAdapter da = new SqlDataAdapter(query, con);

                da.Fill(Subcat);
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {

                con.Close();
            }
            return Subcat;
        }

        public DataTable get_Items(int ItemId)
        {
            DataTable ShowProduct = new DataTable();
            ShowProduct.Columns.Add("ItemId");
            ShowProduct.Columns.Add("ItemName");
            ShowProduct.Columns.Add("Mrp");
            ShowProduct.Columns.Add("Discount");
            ShowProduct.Columns.Add("Multi", typeof(bool));
            ShowProduct.Columns.Add("Single", typeof(bool));
            ShowProduct.Columns.Add("Type");
            ShowProduct.Columns.Add("ImgUrlDesk");
            ShowProduct.Columns.Add("ImgUrlMbl");
            ShowProduct.Columns.Add("Rating");
            ShowProduct.Columns.Add("Brand");
            ShowProduct.Columns.Add("SellingPrice");
            ShowProduct.Columns.Add("PackSize");
            ShowProduct.Columns.Add("PackId");
            ShowProduct.Columns.Add("NotInCart", typeof(bool));
            ShowProduct.Columns.Add("InCart", typeof(bool));
            ShowProduct.Columns.Add("NoOfItems");
            ShowProduct.Columns.Add("OutofStack", typeof(bool));
            ShowProduct.Columns.Add("InStock", typeof(bool));
            ShowProduct.Columns.Add("KeyWords");
            ShowProduct.Columns.Add("Description");
            ShowProduct.Columns.Add("Ingredient");
            ShowProduct.Columns.Add("ProductInfo");
            ShowProduct.Columns.Add("About");
            ShowProduct.Columns.Add("Url");
            ShowProduct.Columns.Add("Cashback", typeof(Boolean));
            ShowProduct.Columns.Add("Pcb1");
            ShowProduct.Columns.Add("Pcb2");
            ShowProduct.Columns.Add("Pcb3");



            con = new SqlConnection(commm.GetConnectionString());
            try
            {
                con.Open();
                string query = "SELECT [ItemId], [ItemName], CAST([Mrp] AS INT) as [Mrp] , [Discount], [Multi] ,[Single] , [Type],  [ImgUrlDesk],[ImgUrlMbl], [Rating], [Brand], CAST([SellingPrice] AS INT) as [SellingPrice] , [PackSize], [PackId], 'True' AS NotInCart, 'False' AS InCart, '0' AS NoOfItems, [OutofStack],  ~ [OutofStack] AS InStock, KeyWords, Description, Ingredient, ProductInfo, About, [Url], [Cashback], [Pcb1], [Pcb2], [Pcb3]  FROM [Item] WHERE ([ItemId] = '" + ItemId + "')";

                SqlDataAdapter da = new SqlDataAdapter(query, con);

                da.Fill(ShowProduct);

            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {

                con.Close();
            }
            return ShowProduct;
        }



        public DataTable getFeatured()
        {
            DataTable ShowProduct = new DataTable();
            ShowProduct.Columns.Add("ItemId");
            ShowProduct.Columns.Add("ItemName");
            ShowProduct.Columns.Add("Mrp");
            ShowProduct.Columns.Add("Discount");
            ShowProduct.Columns.Add("Multi", typeof(bool));
            ShowProduct.Columns.Add("Single", typeof(bool));
            ShowProduct.Columns.Add("Type");
            ShowProduct.Columns.Add("ImgUrlMbl");
            ShowProduct.Columns.Add("Rating");
            ShowProduct.Columns.Add("Brand");
            ShowProduct.Columns.Add("SellingPrice");
            ShowProduct.Columns.Add("PackSize");
            ShowProduct.Columns.Add("PackId");
            ShowProduct.Columns.Add("NotInCart", typeof(bool));
            ShowProduct.Columns.Add("InCart", typeof(bool));
            ShowProduct.Columns.Add("NoOfItems"); 
            ShowProduct.Columns.Add("OutofStack", typeof(bool)); 
            ShowProduct.Columns.Add("InStock", typeof(bool));
            ShowProduct.Columns.Add("Url");
            ShowProduct.Columns.Add("Cashback", typeof(Boolean));
            ShowProduct.Columns.Add("Pcb1");
            ShowProduct.Columns.Add("Pcb2");
            ShowProduct.Columns.Add("Pcb3");


            con = new SqlConnection(commm.GetConnectionString());
            try
            {
                con.Open();
                string query = "SELECT  TOP(24) [ItemId], [ItemName], CAST([Mrp] AS INT) as [Mrp] , [Discount], [Multi] ,[Single] , [Type],  [ImgUrlMbl], [Rating], [Brand], CAST([SellingPrice] AS INT) as [SellingPrice] , [PackSize], [PackId], 'True' AS NotInCart, 'False' AS InCart, '0' AS NoOfItems, [OutofStack],  ~ [OutofStack] AS InStock, [Url], [Cashback], [Pcb1], [Pcb2], [Pcb3]  FROM [Item] WHERE ([HotProducts]='True') AND ([OutofStack]='False')   ORDER BY OutofStack, SubCatId ASC , ItemName ASC  ";

                SqlDataAdapter da = new SqlDataAdapter(query, con);

                da.Fill(ShowProduct);

            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {

                con.Close();
            }
            return ShowProduct;
        }

        public DataTable getFeaturedSubCat()
        {
            DataTable Subcat = new DataTable();
            Subcat.Columns.Add("SubCatId");
            Subcat.Columns.Add("SubCatName");
            con = new SqlConnection(commm.GetConnectionString());
            try
            {
                con.Open();
                string query = "SELECT DISTINCT Item.SubCatId as SubCatId, SubCategory.SubCatName as SubCatName FROM Item INNER JOIN SubCategory ON Item.SubCatId = SubCategory.SubCatId  WHERE (Item.HotProducts = 'True') AND (Item.OutofStack = '0') ";

                SqlDataAdapter da = new SqlDataAdapter(query, con);

                da.Fill(Subcat);
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {

                con.Close();
            }
            return Subcat;

        }


        public DataTable getDiscounted(int percent)
        {
            DataTable ShowProduct = new DataTable();
            ShowProduct.Columns.Add("ItemId");
            ShowProduct.Columns.Add("ItemName");
            ShowProduct.Columns.Add("Mrp");
            ShowProduct.Columns.Add("Discount");
            ShowProduct.Columns.Add("Multi", typeof(bool));
            ShowProduct.Columns.Add("Single", typeof(bool));
            ShowProduct.Columns.Add("Type");
            ShowProduct.Columns.Add("ImgUrlMbl");
            ShowProduct.Columns.Add("Rating");
            ShowProduct.Columns.Add("Brand");
            ShowProduct.Columns.Add("SellingPrice");
            ShowProduct.Columns.Add("PackSize");
            ShowProduct.Columns.Add("PackId");
            ShowProduct.Columns.Add("NotInCart", typeof(bool));
            ShowProduct.Columns.Add("InCart", typeof(bool));
            ShowProduct.Columns.Add("NoOfItems"); 
            ShowProduct.Columns.Add("OutofStack", typeof(bool)); 
            ShowProduct.Columns.Add("InStock", typeof(bool));
            ShowProduct.Columns.Add("Url");
            ShowProduct.Columns.Add("Cashback", typeof(Boolean));
            ShowProduct.Columns.Add("Pcb1");
            ShowProduct.Columns.Add("Pcb2");
            ShowProduct.Columns.Add("Pcb3");



            con = new SqlConnection(commm.GetConnectionString());
            try
            {
                con.Open();
                string query = "SELECT  TOP(6) [ItemId], [ItemName], CAST([Mrp] AS INT) as [Mrp] , [Discount], [Multi] ,[Single] , [Type],  [ImgUrlMbl], [Rating], [Brand], CAST([SellingPrice] AS INT) as [SellingPrice] , [PackSize], [PackId], 'True' AS NotInCart, 'False' AS InCart, '0' AS NoOfItems, [OutofStack],  ~ [OutofStack] AS InStock , [Url], [Cashback], [Pcb1], [Pcb2], [Pcb3]  FROM [Item] WHERE  (Discount >'" + percent + "') AND ([OutofStack]='False') ORDER BY [Discount] desc, OutofStack, SubCatId ASC , ItemName ASC";

                SqlDataAdapter da = new SqlDataAdapter(query, con);

                da.Fill(ShowProduct);

            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {

                con.Close();
            }
            return ShowProduct;
        }

        public string Banner1()
        {
            String list = "";

            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("SELECT DeskImg  FROM  OffersBanner WHERE  (OfferId = '" + 6 + "') AND (Show = 'True')", con);
            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    list = (dr[0].ToString());



                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {
                con.Close();
            }
            return list;

        }

        public DataTable getitemTrending()
        {
            DataTable ShowProduct = new DataTable();
            ShowProduct.Columns.Add("ItemId");
            ShowProduct.Columns.Add("ItemName");
            ShowProduct.Columns.Add("Mrp");
            ShowProduct.Columns.Add("Discount");
            ShowProduct.Columns.Add("Multi", typeof(bool));
            ShowProduct.Columns.Add("Single", typeof(bool));
            ShowProduct.Columns.Add("Type");
            ShowProduct.Columns.Add("ImgUrlMbl");
            ShowProduct.Columns.Add("Rating");
            ShowProduct.Columns.Add("Brand");
            ShowProduct.Columns.Add("SellingPrice");
            ShowProduct.Columns.Add("PackSize");
            ShowProduct.Columns.Add("PackId");
            ShowProduct.Columns.Add("NotInCart", typeof(bool));
            ShowProduct.Columns.Add("InCart", typeof(bool));
            ShowProduct.Columns.Add("NoOfItems");
            ShowProduct.Columns.Add("OutofStack", typeof(bool));
            ShowProduct.Columns.Add("InStock", typeof(bool));
            ShowProduct.Columns.Add("Url");
            ShowProduct.Columns.Add("Cashback", typeof(Boolean));
            ShowProduct.Columns.Add("Pcb1");
            ShowProduct.Columns.Add("Pcb2");
            ShowProduct.Columns.Add("Pcb3");



            con = new SqlConnection(commm.GetConnectionString());
            try
            {
                con.Open();
                string query = "SELECT  TOP(6)  [ItemId], [ItemName], CAST([Mrp] AS INT) as [Mrp] , [Discount], [Multi] ,[Single] , [Type],  [ImgUrlMbl], [Rating], [Brand], CAST([SellingPrice] AS INT) as [SellingPrice] , [PackSize], [PackId], 'True' AS NotInCart, 'False' AS InCart, '0' AS NoOfItems, [OutofStack],  ~ [OutofStack] AS InStock , [Url], [Cashback], [Pcb1], [Pcb2], [Pcb3]  FROM [Item] WHERE [Trending]='True' AND ([OutofStack]='False')   ORDER BY OutofStack, SubCatId ASC , ItemName ASC ";

                SqlDataAdapter da = new SqlDataAdapter(query, con);

                da.Fill(ShowProduct);

            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {

                con.Close();
            }
            return ShowProduct;

        }

        public string Banner2()
        {
            String list = "";

            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("SELECT DeskImg  FROM  OffersBanner WHERE  (OfferId = '" + 7 + "') AND (Show = 'True')", con);
            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    list = (dr[0].ToString());



                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {
                con.Close();
            }
            return list;

        }

        public string Banner3()
        {
            String list = "";

            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("SELECT DeskImg  FROM  OffersBanner WHERE  (OfferId = '" + 8 + "') AND (Show = 'True')", con);
            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    list = (dr[0].ToString());



                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {
                con.Close();
            }
            return list;

        }

        public DataTable get_ByItem()
        {
            DataTable ShowProduct = new DataTable();
            ShowProduct.Columns.Add("ItemId");
            ShowProduct.Columns.Add("ItemName");
            ShowProduct.Columns.Add("Mrp");
            ShowProduct.Columns.Add("Discount");
            ShowProduct.Columns.Add("Multi", typeof(bool));
            ShowProduct.Columns.Add("Single", typeof(bool));
            ShowProduct.Columns.Add("Type");
            ShowProduct.Columns.Add("ImgUrlMbl");
            ShowProduct.Columns.Add("Rating");
            ShowProduct.Columns.Add("Brand");
            ShowProduct.Columns.Add("SellingPrice");
            ShowProduct.Columns.Add("PackSize");
            ShowProduct.Columns.Add("PackId");
            ShowProduct.Columns.Add("NotInCart", typeof(bool));
            ShowProduct.Columns.Add("InCart", typeof(bool));
            ShowProduct.Columns.Add("NoOfItems"); ShowProduct.Columns.Add("OutofStack", typeof(bool)); ShowProduct.Columns.Add("InStock", typeof(bool));

            ShowProduct.Columns.Add("Url");
            ShowProduct.Columns.Add("Cashback", typeof(Boolean));
            ShowProduct.Columns.Add("Pcb1");
            ShowProduct.Columns.Add("Pcb2");
            ShowProduct.Columns.Add("Pcb3");


            con = new SqlConnection(commm.GetConnectionString());
            try
            {
                con.Open();
                string query = "SELECT [ItemId], [ItemName], [Mrp], [Discount], [Multi] ,[Single] , [Type],[ImgUrlMbl] , [Rating], [Brand], [SellingPrice], [PackSize], [PackId], 'True' AS NotInCart, 'False' AS InCart, '0' AS NoOfItems, [OutofStack],  ~ [OutofStack] AS InStock, [Url], [Cashback], [Pcb1], [Pcb2], [Pcb3]  FROM [Item] WHERE OutofStack = '0' AND (Discount >20)   ORDER BY OutofStack, SubCatId ASC , ItemName ASC";

                SqlDataAdapter da = new SqlDataAdapter(query, con);

                da.Fill(ShowProduct);

            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {

                con.Close();
            }
            return ShowProduct;

        }

        public void UpdateCatDeskTileImg(string fn3, int CatId)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE Category  SET CatImgDeskTile='" + fn3 + ".jpg" + "' WHERE  (CatId = '" + CatId + "')", con);

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

        public void UpdateSubDeskTileImg(string fn3, int subcatid, int CatId)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE SubCategory  SET SubDeskImgTile='" + fn3 + ".jpg" + "' WHERE  (SubCatId = '" + subcatid + "') AND (CatId = '" + CatId + "')", con);

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





        //--------------------------------------------






        public int Insert_login_details(String password, String user_name, int user_type, String email, String mobile)
        {

            int id = 0;

            ArrayList list = new ArrayList();
            con = new SqlConnection(commm.GetConnectionString());
            string sql = "INSERT INTO Mobile_EW_user_temp (password, user_name,user_type,email,mobile) OUTPUT inserted.user_id   VALUES (@password, @user_name,@user_type,@email,@mobile)";
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);
                SqlParameter[] param = new SqlParameter[5];



                param[0] = new SqlParameter("@password", SqlDbType.VarChar, 50);
                param[1] = new SqlParameter("@user_name", SqlDbType.VarChar, 50);
                param[2] = new SqlParameter("@user_type", SqlDbType.Int, 4);
                param[3] = new SqlParameter("@email", SqlDbType.VarChar, 500);
                param[4] = new SqlParameter("@mobile", SqlDbType.VarChar, 500);
                //user_name
                //user_name

                param[0].Value = password;
                param[1].Value = user_name;
                param[2].Value = user_type;
                param[3].Value = email;
                param[4].Value = mobile;


                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                cmd.CommandType = CommandType.Text;
                id = Int32.Parse(cmd.ExecuteScalar().ToString());

            }
            catch (Exception ex)
            {

                throw new Exception(ex.Message);
            }
            finally
            {
                con.Close();
            }

            return id;

        }

        public int insert_login_info(int USSER_ID, String NAME, String MAIL_ID, String USSER_NAME, String PASSWORD, long MOBLIE_No, String DISTRICT, String STATE, String ADDRESS_LINE_1, int USSER_ACCESS_LEVEL, int pin)
        {

            int user_id = 0;
            try
            {
                con = new SqlConnection(commm.GetConnectionString());
                string sql = "INSERT INTO Mobile_EW_LOGIN_PRESONAL_INFO_TABLE (USSER_ID, NAME, MAIL_ID, USSER_NAME, PASSWORD, MOBLIE_No, DISTRICT, STATE, ADDRESS_LINE_1, USSER_ACCESS_LEVEL, PINCODE)  VALUES ('" + USSER_ID + "','" + NAME + "', '" + MAIL_ID + "', '" + USSER_NAME + "', '" + PASSWORD + "', '" + MOBLIE_No + "', '" + DISTRICT + "', '" + STATE + "', '" + ADDRESS_LINE_1 + "', '" + USSER_ACCESS_LEVEL + "', '" + pin + "')";

                con.Open();
                transaction = con.BeginTransaction();
                SqlCommand cmd = new SqlCommand(sql, con);
                SqlParameter[] param = new SqlParameter[11];
                param[0] = new SqlParameter("@USSER_ID", SqlDbType.Int, 4);
                param[1] = new SqlParameter("@NAME", SqlDbType.VarChar, 50);
                param[2] = new SqlParameter("@MAIL_ID", SqlDbType.VarChar, 100);
                param[3] = new SqlParameter("@USSER_NAME", SqlDbType.VarChar, 50);
                param[4] = new SqlParameter("@PASSWORD", SqlDbType.VarChar, 50);
                param[5] = new SqlParameter("@MOBLIE_No", SqlDbType.BigInt, 8);
                param[6] = new SqlParameter("@DISTRICT", SqlDbType.VarChar, 100);
                param[7] = new SqlParameter("@STATE", SqlDbType.VarChar, 100);
                param[8] = new SqlParameter("@ADDRESS_LINE_1", SqlDbType.VarChar, 100);
                param[9] = new SqlParameter("@USSER_ACCESS_LEVEL", SqlDbType.Int, 4);
                param[10] = new SqlParameter("@PINCODE", SqlDbType.Int, 4);

                param[0].Value = USSER_ID;
                param[1].Value = NAME;
                param[2].Value = MAIL_ID;
                param[3].Value = USSER_NAME;
                param[4].Value = PASSWORD;
                param[5].Value = MOBLIE_No;
                param[6].Value = DISTRICT;
                param[7].Value = STATE;
                param[8].Value = ADDRESS_LINE_1;
                param[9].Value = USSER_ACCESS_LEVEL;
                param[10].Value = pin;



                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                cmd.CommandType = CommandType.Text;
                cmd.Transaction = transaction;
                cmd.ExecuteNonQuery();

                cmd = new SqlCommand("SELECT USSER_ID FROM   Mobile_EW_LOGIN_PRESONAL_INFO_TABLE WHERE   (MAIL_ID = '" + MAIL_ID + "')", con);
                cmd.Transaction = transaction;
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    user_id = int.Parse(dr[0].ToString());
                }
                dr.Close();
                transaction.Commit();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                transaction.Rollback();
                string msg;
                msg = ex.Message;
                
            }
            finally
            {
                con.Close();
            }
            return user_id;
        }


        public ArrayList user_information(int cust_id)
        {

            ArrayList list = new ArrayList();
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("SELECT        NAME, MAIL_ID, MOBLIE_No, STATE, DISTRICT, ADDRESS_LINE_1, PINCODE FROM            Mobile_EW_LOGIN_PRESONAL_INFO_TABLE WHERE    (USSER_ID = '" + cust_id + "')", con);

            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    list.Add(dr[0].ToString());
                    list.Add(dr[1].ToString());
                    list.Add(dr[2].ToString());
                    list.Add(dr[3].ToString());
                    list.Add(dr[4].ToString());
                    list.Add(dr[5].ToString());
                    list.Add(dr[6].ToString());


                }
                if (list.Count == 0)
                {

                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {
                con.Close();
            }
            return list;

        }
        public ArrayList Select_Final_Payment_Information(int orderid)
        {

            ArrayList list = new ArrayList();
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("SELECT        TOTAL_AMOUNT, deliverycharge, GrandTotal,name,MAIL_ID,contact_no    FROM  Mobile_EW_OREDER_DET WHERE   (ORDER_ID = '" + orderid + "')", con);

            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    list.Add(dr[0].ToString());
                    list.Add(dr[1].ToString());
                    list.Add(dr[2].ToString());
                    list.Add(dr[3].ToString());
                    list.Add(dr[4].ToString());
                    list.Add(dr[5].ToString());



                }

            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {
                con.Close();
            }
            return list;

        }




        public ArrayList Mobile_EW_usser_Type_Finder(String username, String password)
        {

            ArrayList al = new ArrayList();
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("SELECT user_id, user_type, user_name, email FROM  Mobile_EW_user_temp WHERE        (email = '" + username + "') AND (password = '" + password + "')", con);
            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {

                    al.Add(dr[0].ToString());
                    al.Add(dr[1].ToString());
                    al.Add(dr[2].ToString());
                    al.Add(dr[3].ToString());

                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {

                con.Close();
            }
            return al;

        }




        public int insert_Order_det(int Id, float total, String ORDER_Details)
        {

            int order_id = 0;
            try
            {
                con = new SqlConnection(commm.GetConnectionString());
                string sql = "INSERT INTO Mobile_EW_OREDER_DET  (USER_ID, DATE, TOTAL_AMOUNT, ORDER_Details) output inserted.ORDER_ID VALUES    (@USER_ID, @DATE, @TOTAL_AMOUNT, @ORDER_Details)  ";

                con.Open();

                SqlCommand cmd = new SqlCommand(sql, con);
                SqlParameter[] param = new SqlParameter[4];

                param[0] = new SqlParameter("@USER_ID", SqlDbType.Int, 4);
                param[1] = new SqlParameter("@DATE", SqlDbType.DateTime, 8);
                param[2] = new SqlParameter("@TOTAL_AMOUNT", SqlDbType.Float, 8);
                param[3] = new SqlParameter("@ORDER_Details", SqlDbType.VarChar, 2000);


                param[0].Value = Id;
                param[1].Value = DateTime.Now;
                param[2].Value = total;
                param[3].Value = ORDER_Details;




                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                cmd.CommandType = CommandType.Text;
                order_id = Int32.Parse(cmd.ExecuteScalar().ToString());



            }
            catch (System.Data.SqlClient.SqlException ex)
            {

                string msg;
                msg = ex.Message;
                
            }
            finally
            {
                con.Close();
            }
            return order_id;
        }


        public void update_order_detail(String name, String MAIL_ID, String contact_no, String state, String city, String address, String pin, int orderid, int userid)
        {
            ArrayList list = new ArrayList();
            con = new SqlConnection(commm.GetConnectionString());

            cmd = new SqlCommand("UPDATE Mobile_EW_OREDER_DET SET USER_ID = '" + userid + "', name = '" + name + "', MAIL_ID = '" + MAIL_ID + "', contact_no = '" + contact_no + "', state = '" + state + "', city = '" + city + "', address = '" + address + "', pin = '" + pin + "' WHERE (ORDER_ID = '" + orderid + "')", con);

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                

            }
            finally
            {
                con.Close();
            }


        }

        public int insert_Order_details(int order_id, int item_id, String item_name, float price, int qty, float tot_amt, string description)
        {

            int id = 0;
            try
            {
                con = new SqlConnection(commm.GetConnectionString());
                string sql = "INSERT INTO Mobile_EW_Order_Details (order_id, item_id, item_name, price, qty, tot_amt, description, date) OUTPUT inserted.id   VALUES  (@order_id,@item_id,@item_name,@price,@qty,@tot_amt,@description,@date)";

                con.Open();

                SqlCommand cmd = new SqlCommand(sql, con);
                SqlParameter[] param = new SqlParameter[8];

                param[0] = new SqlParameter("@order_id", SqlDbType.Int, 4);
                param[1] = new SqlParameter("@item_id", SqlDbType.Int, 4);
                param[2] = new SqlParameter("@item_name", SqlDbType.VarChar, 500);
                param[3] = new SqlParameter("@price", SqlDbType.Float, 8);
                param[4] = new SqlParameter("@qty", SqlDbType.Int, 4);
                param[5] = new SqlParameter("@tot_amt", SqlDbType.Float, 8);
                param[6] = new SqlParameter("@description", SqlDbType.VarChar, 8000);
                param[7] = new SqlParameter("@date", SqlDbType.VarChar, 50);


                param[0].Value = order_id;
                param[1].Value = item_id;
                param[2].Value = item_name;
                param[3].Value = price;
                param[4].Value = qty;
                param[5].Value = tot_amt;
                param[6].Value = description;
                param[7].Value = DateTime.Now;



                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                cmd.CommandType = CommandType.Text;
                id = Int32.Parse(cmd.ExecuteScalar().ToString());



            }
            catch (System.Data.SqlClient.SqlException ex)
            {

                string msg;
                msg = ex.Message;
                
            }
            finally
            {
                con.Close();
            }
            return id;
        }



        public ArrayList Mobile_EW_addres_updator(int cust_id)
        {

            ArrayList list = new ArrayList();
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("SELECT        fname, email, mobile_no, state, city, address, pincode FROM            Mobile_EW_custumer_details_T_n_pay WHERE    (cust_id = '" + cust_id + "')", con);

            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    list.Add(dr[0].ToString());
                    list.Add(dr[1].ToString());
                    list.Add(dr[2].ToString());
                    list.Add(dr[3].ToString());
                    list.Add(dr[4].ToString());
                    list.Add(dr[5].ToString());
                    list.Add(dr[6].ToString());


                }
                if (list.Count == 0)
                {

                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {
                con.Close();
            }
            return list;

        }





        public float Mobile_EW_wallet_checker(int cust_id)
        {

            float wall = 0;
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("SELECT   wallet_amt FROM   Mobile_EW_custumer_details_T_n_pay WHERE    (cust_id = '" + cust_id + "')", con);
            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {

                    wall = float.Parse(dr[0].ToString());

                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {

                con.Close();
            }
            return wall;

        }

        public int CreditWallet(float amt, int custid)
        {
            int st = 0;
            con = new SqlConnection(commm.GetConnectionString());

            cmd = new SqlCommand("UPDATE Mobile_EW_custumer_details_T_n_pay   SET wallet_amt = wallet_amt + '" + amt + "'  WHERE (cust_id = '" + custid + "')", con);

            try
            {
                con.Open();
                st = cmd.ExecuteNonQuery();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                

            }
            finally
            {
                con.Close();
            }

            return st;
        }

        public int DebitWallet(float amt, int custid)
        {
            int st = 0;
            con = new SqlConnection(commm.GetConnectionString());

            cmd = new SqlCommand("UPDATE Mobile_EW_custumer_details_T_n_pay   SET wallet_amt = wallet_amt - '" + amt + "'  WHERE (cust_id = '" + custid + "')", con);

            try
            {
                con.Open();
                st = cmd.ExecuteNonQuery();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                

            }
            finally
            {
                con.Close();
            }
            return st;

        }

        public void InsertWalletLog(int from_id, int to_id, float amount, string type, string remark)
        {
            int x;
            DateTime curDateTime = DateTime.Now;
            con = new SqlConnection(commm.GetConnectionString());
            string sql = "INSERT INTO Mobile_EW_Wallet (from_id, to_id, amount, type, date, remark) VALUES (@from_id, @to_id, @amount, @type, @date, @remark)";
            try
            {
                DateTime dt = DateTime.Now;
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);
                SqlParameter[] param = new SqlParameter[6];

                param[0] = new SqlParameter("@from_id", SqlDbType.Int, 4);
                param[1] = new SqlParameter("@to_id", SqlDbType.Int, 4);
                param[2] = new SqlParameter("@amount", SqlDbType.Money);
                param[3] = new SqlParameter("@type", SqlDbType.VarChar, 50);
                param[4] = new SqlParameter("@date", SqlDbType.VarChar, 50);
                param[5] = new SqlParameter("@remark", SqlDbType.VarChar, 5000);


                param[0].Value = from_id;
                param[1].Value = to_id;
                param[2].Value = amount;
                param[3].Value = type;
                param[4].Value = dt;
                param[5].Value = remark;

                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                cmd.CommandType = CommandType.Text;
                x = cmd.ExecuteNonQuery();


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

        public ArrayList CashbackDetails(int itemId)
        {
            ArrayList al = new ArrayList();
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("SELECT  Cashback, Pcb1, Pcb2, Pcb3 FROM Item WHERE (ItemId = '" + itemId + "')", con);

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

        public void update_OREDER_DET_status(int ORDER_ID, int USER_ID)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd1 = new SqlCommand("UPDATE   Mobile_EW_OREDER_DET SET   payment_status ='1'   WHERE        (ORDER_ID = '" + ORDER_ID + "') AND (USER_ID = '" + USER_ID + "')", con);
            try
            {
                con.Open();
                cmd1.ExecuteNonQuery();
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

        public void update_OREDER_DET_mode(int ORDER_ID, String mode)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd1 = new SqlCommand("UPDATE   Mobile_EW_OREDER_DET SET   payment_mode ='" + mode + "'   WHERE        (ORDER_ID = '" + ORDER_ID + "')", con);
            try
            {
                con.Open();
                cmd1.ExecuteNonQuery();
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



        public void update_user_add_detail(int uid, String Address_1, String dist, String state, int pincode)
        {
            ArrayList list = new ArrayList();
            con = new SqlConnection(commm.GetConnectionString());

            cmd = new SqlCommand("UPDATE       Mobile_EW_LOGIN_PRESONAL_INFO_TABLE  SET     ADDRESS_LINE_1 ='" + Address_1 + "', DISTRICT ='" + dist + "', STATE ='" + state + "', PINCODE ='" + pincode + "'  WHERE        (USSER_ID = '" + uid + "')", con);

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                

            }
            finally
            {
                con.Close();
            }


        }

        public int pin_available(int pincode)
        {


            int id = 0;
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("SELECT  id  FROM  Mobile_EW_pin_amount_table   WHERE   (pin = '" + pincode + "')", con);
            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                    id = int.Parse(dr[0].ToString());
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {
                con.Close();
            }
            return id;
        }
        public int Update_New_delivery_and_Grand_total_Amount(int order_id, float grdamt, float delamt)
        {
            int st = 0;
            con = new SqlConnection(commm.GetConnectionString());
            cmd1 = new SqlCommand("UPDATE Mobile_EW_OREDER_DET SET deliverycharge = '" + delamt + "', GrandTotal = '" + grdamt + "' WHERE (ORDER_ID = '" + order_id + "')", con);
            try
            {
                con.Open();
                st = cmd1.ExecuteNonQuery();
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
            return st;
        }
        public ArrayList user_information_by_addreddid(int delivaddid)
        {

            ArrayList list = new ArrayList();
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("SELECT       USSER_ID, NAME, MAIL_ID, MOBLIE_No, STATE, DISTRICT, ADDRESS_LINE_1, PINCODE FROM            Mobile_EW_LOGIN_PRESONAL_INFO_TABLE WHERE    (ADD_ID = '" + delivaddid + "')", con);

            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    list.Add(dr[0].ToString());
                    list.Add(dr[1].ToString());
                    list.Add(dr[2].ToString());
                    list.Add(dr[3].ToString());
                    list.Add(dr[4].ToString());
                    list.Add(dr[5].ToString());
                    list.Add(dr[6].ToString());
                    list.Add(dr[7].ToString());


                }
                if (list.Count == 0)
                {

                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {
                con.Close();
            }
            return list;

        }
        public int update_payment_mode(int order_id, string mode)
        {
            int st = 0;
            con = new SqlConnection(commm.GetConnectionString());
            cmd1 = new SqlCommand("UPDATE Mobile_EW_OREDER_DET SET payment_mode = '" + mode + "' WHERE (ORDER_ID = '" + order_id + "')", con);
            try
            {
                con.Open();
                st = cmd1.ExecuteNonQuery();
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
            return st;
        }

        public int update_Purchase_Status_COD(int orderid)
        {
            int st = 0;
            con = new SqlConnection(commm.GetConnectionString());
            cmd1 = new SqlCommand("UPDATE Mobile_EW_OREDER_DET SET STATUS = 1 WHERE (ORDER_ID = '" + orderid + "')", con);
            try
            {
                con.Open();
                st = cmd1.ExecuteNonQuery();
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
            return st;
        }


        public String get_ClientId(int OrderId)
        {
            String al = "";
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("SELECT ClientId FROM  OrderDe WHERE (OrderId = '" + OrderId + "')", con);
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
                
            }
            finally
            {
                con.Close();
            }
            return al;
        }

        public int updateTxnid(String txnid, int order_id)
        {
            int st = 0;
            con = new SqlConnection(commm.GetConnectionString());
            cmd1 = new SqlCommand("UPDATE Mobile_EW_OREDER_DET SET txnid = '" + txnid + "' WHERE (ORDER_ID = '" + order_id + "')", con);
            try
            {
                con.Open();
                st = cmd1.ExecuteNonQuery();
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
            return st;
        }
        public int update_payment_txnid(string txid, int status)
        {
            int st = 0;
            con = new SqlConnection(commm.GetConnectionString());
            cmd1 = new SqlCommand("UPDATE Mobile_EW_OREDER_DET SET payment_status = '" + status + "' WHERE (txnid = '" + txid + "')", con);
            try
            {
                con.Open();
                st = cmd1.ExecuteNonQuery();
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
            return st;
        }



        public ArrayList packInfo(int packid)
        {
            ArrayList al = new ArrayList();
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("SELECT PackId, PackSize, CAST([SellingPrice] AS INT) as [SellingPrice], CAST([Mrp] AS INT) as [Mrp], Discount, ImgUrlDesk, ImgUrlMbl, [OutofStack],  ~ [OutofStack] AS InStock FROM PackSizes WHERE (PackId = '" + packid + "')", con);
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
                    al.Add(dr[5]);
                    al.Add(dr[6]);
                    al.Add(dr[7]);
                    al.Add(dr[8]);
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {
                con.Close();
            }
            return al;
        }

        public DataTable getcouponlist(int ClientId)
        {
            DataTable OrderTable = new DataTable();
            con = new SqlConnection(commm.GetConnectionString());
            try
            {
                con.Open();
                string query = @"SELECT        CouponId, CouponName, Value, Type, Times, FDate, TDate, MaxDisc, MinAmount, PaymentType, ClientId, Title, Description
FROM            Coupon
WHERE        (Times = '0') AND (FDate <= GETDATE()) AND (TDate >= GETDATE()) OR
                         (FDate <= GETDATE()) AND (TDate >= GETDATE()) AND (ClientId = '" + ClientId + "')";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                da.Fill(OrderTable);

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
            return OrderTable;
        }

        public ArrayList CouponCheck(String Coupon)
        {
            ArrayList al = new ArrayList();
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("SELECT CouponId, Type, Times, MaxDisc, MinAmount, PaymentType,Value , CouponName, ClientId FROM Coupon WHERE       ( (CouponName = '" + Coupon + "') AND (FDate <= GETDATE()) AND (TDate >= GETDATE()))", con);
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
                    al.Add(dr[5]);
                    al.Add(dr[6]);
                    al.Add(dr[7]);
                    al.Add(dr[8]);

                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {
                con.Close();
            }
            return al;
        }


        public ArrayList getcouponDetails(int cuponId)
        {
            ArrayList list = new ArrayList();
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("SELECT Title, Description  FROM  Coupon WHERE (CouponId = '" + cuponId + "')", con);
            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    list.Add(dr[0].ToString());
                    list.Add(dr[1].ToString());

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
            return list;
        }
        public void transactionUpdate(string txnid, string orderId, string Status)
        {
            try
            {
                con = new SqlConnection(commm.GetConnectionString());
                cmd = new SqlCommand("UPDATE OrderDe SET  TxnId = '" + txnid + "', PaymentMode='PayuMoney', PaymentStatus = '" + Status + "' WHERE (OrderId = '" + orderId + "')", con);

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
            catch
            {
            }
        }

        public void transactionUpdatepaytm(string txnid, string orderId, string Status)
        {
            try
            {
                con = new SqlConnection(commm.GetConnectionString());
                cmd = new SqlCommand("UPDATE OrderDe SET  TxnId = '" + txnid + "', PaymentMode='Paytm', PaymentStatus = '" + Status + "' WHERE (OrderId = '" + orderId + "')", con);

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
            catch
            {
            }
        }

        public void updateSlot(string SlotId)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE Slot SET SlotCount = SlotCount - 1 WHERE (SlotId = '" + SlotId + "')", con);

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

        public void updateOrderDetails(string OrderDetails, int TotalSave, int Cupon, string cuponCode, int discount, int SubTotal, int packcount, int OrderId, String CouponTitle, String CouponDescription)
        {

            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE OrderDe SET  OrderDetails = '" + OrderDetails + "', Saving = '" + TotalSave + "', cupon = '" + Cupon + "', cuponCode = '" + cuponCode + "', couponDis = '" + discount + "', SubTotal = '" + SubTotal + "', Packcount = '" + packcount + "', CouponTitle = '" + CouponTitle + "' , CouponDescription = '" + CouponDescription + "' WHERE (OrderId = '" + OrderId + "')", con);

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

        public ArrayList productinfo(int ItemId)
        {
            ArrayList al = new ArrayList();
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand(" SELECT ItemName, KeyWords, Description, ImgUrlDesk FROM  Item WHERE  (ItemId = '" + ItemId + "')", con);

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

                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {
                con.Close();
            }
            return al;
        }

        public ArrayList RetrieveClientDetailsByClient(int OrderId)
        {
            ArrayList al = new ArrayList();
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand(" SELECT  Client.ClientId, Client.Name, Client.Email, Client.Mobile, OrderDe.PaymentStatus, Client.WalletBalance FROM  Client INNER JOIN OrderDe ON Client.ClientId = OrderDe.ClientId WHERE   (OrderDe.OrderId = '" + OrderId + "')", con);

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
                    al.Add(dr[5]);

                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {
                con.Close();
            }
            return al;
        }

        public void DeleteOrderItem(int Id)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("DELETE FROM Order_details WHERE (Id = '" + Id + "')", con);
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                

            }
            finally
            {
                con.Close();
            }

        }

        public void addValueToWallet(string ClientId, int Wallet)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE Client SET   WalletBalance = '" + Wallet + "' WHERE  (ClientId = '" + ClientId + "')", con);

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

        public void PaymentWalletStaus(int orderId)
        {
            try
            {
                con = new SqlConnection(commm.GetConnectionString());
                cmd = new SqlCommand("UPDATE OrderDe SET   PaymentMode='Wallet', PaymentStatus = 'Success' WHERE (OrderId = '" + orderId + "')", con);

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
            catch
            {
            }
        }
        public void updateProdSizeOutOfStock(int ItemId, bool OutOfStock)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE PackSizes SET   OutofStack  = '" + OutOfStock + "' FROM PackSizes INNER JOIN Item ON PackSizes.ItemId = Item.ItemId WHERE (Item.ItemId  = '" + ItemId + "')", con);

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

        public string getcatname(int CatId)
        {
            String CatName = "";
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("SELECT   CatName FROM Category WHERE  (CatId = '" + CatId + "')", con);
            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                    CatName = dr[0].ToString();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {
                con.Close();
            }
            return CatName;
        }

        public string getSubCatname(int SubCatId)
        {
            String SubCat = "";
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("SELECT   SubCatName FROM SubCategory WHERE  (SubCatId = '" + SubCatId + "')", con);
            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                    SubCat = dr[0].ToString();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {
                con.Close();
            }
            return SubCat;
        }


        public void InsertCart(int ItemId, String ItemName, int PackId, String PackSize, float Mrp, float Price, int NoOfItems, String ImgUrl, int Discount, String Type, String Brand, float TotalMrp, float TotalPrice, int ClientId)
        {

            DateTime curDateTime = DateTime.Now;
            con = new SqlConnection(commm.GetConnectionString());
            string sql = "INSERT INTO MyCart (ItemId, ItemName, PackId, PackSize, Mrp, Price, NoOfItems, ImgUrl, Discount, Type, Brand, TotalMrp, TotalPrice, ClientId) VALUES (@ItemId, @ItemName, @PackId, @PackSize, @Mrp, @Price, @NoOfItems, @ImgUrl, @Discount, @Type, @Brand, @TotalMrp, @TotalPrice, @ClientId)";
            try
            {
                DateTime dt = DateTime.Now;
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);
                SqlParameter[] param = new SqlParameter[14];

                param[0] = new SqlParameter("@ItemId", SqlDbType.Int, 4);
                param[1] = new SqlParameter("@ItemName", SqlDbType.VarChar, 500);
                param[2] = new SqlParameter("@PackId", SqlDbType.Int, 4);
                param[3] = new SqlParameter("@PackSize", SqlDbType.VarChar, 200);
                param[4] = new SqlParameter("@Mrp", SqlDbType.Float, 8);
                param[5] = new SqlParameter("@Price", SqlDbType.Float, 8);
                param[6] = new SqlParameter("@NoOfItems", SqlDbType.Int, 4);
                param[7] = new SqlParameter("@ImgUrl", SqlDbType.VarChar, 300);
                param[8] = new SqlParameter("@Discount", SqlDbType.Int, 4);
                param[9] = new SqlParameter("@Type", SqlDbType.VarChar, 50);
                param[10] = new SqlParameter("@Brand", SqlDbType.VarChar, 300);
                param[11] = new SqlParameter("@TotalMrp", SqlDbType.Float, 8);
                param[12] = new SqlParameter("@TotalPrice", SqlDbType.Float, 8);
                param[13] = new SqlParameter("@ClientId", SqlDbType.Int, 4);



                param[0].Value = ItemId;
                param[1].Value = ItemName;
                param[2].Value = PackId;
                param[3].Value = PackSize;
                param[4].Value = Mrp;
                param[5].Value = Price;
                param[6].Value = NoOfItems;
                param[7].Value = ImgUrl;
                param[8].Value = Discount;
                param[9].Value = Type;
                param[10].Value = Brand;
                param[11].Value = TotalMrp;
                param[12].Value = TotalPrice;
                param[13].Value = ClientId;


                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();


            }
            catch (Exception ex)
            {
                string msg;
                msg = ex.Message;
                //

            }
            finally
            {
                con.Close();
            }

        }

        public void InsertWishlist(int ItemId, String ItemName, int PackId, String PackSize, float Mrp, float Price, int NoOfItems, String ImgUrl, int Discount, String Type, String Brand, float TotalMrp, float TotalPrice, int ClientId)
        {

            DateTime curDateTime = DateTime.Now;
            con = new SqlConnection(commm.GetConnectionString());
            string sql = "INSERT INTO Wishlist (ItemId, ItemName, PackId, PackSize, Mrp, Price, NoOfItems, ImgUrl, Discount, Type, Brand, TotalMrp, TotalPrice, ClientId) VALUES (@ItemId, @ItemName, @PackId, @PackSize, @Mrp, @Price, @NoOfItems, @ImgUrl, @Discount, @Type, @Brand, @TotalMrp, @TotalPrice, @ClientId)";
            try
            {
                DateTime dt = DateTime.Now;
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);
                SqlParameter[] param = new SqlParameter[14];

                param[0] = new SqlParameter("@ItemId", SqlDbType.Int, 4);
                param[1] = new SqlParameter("@ItemName", SqlDbType.VarChar, 500);
                param[2] = new SqlParameter("@PackId", SqlDbType.Int, 4);
                param[3] = new SqlParameter("@PackSize", SqlDbType.VarChar, 200);
                param[4] = new SqlParameter("@Mrp", SqlDbType.Float, 8);
                param[5] = new SqlParameter("@Price", SqlDbType.Float, 8);
                param[6] = new SqlParameter("@NoOfItems", SqlDbType.Int, 4);
                param[7] = new SqlParameter("@ImgUrl", SqlDbType.VarChar, 300);
                param[8] = new SqlParameter("@Discount", SqlDbType.Int, 4);
                param[9] = new SqlParameter("@Type", SqlDbType.VarChar, 50);
                param[10] = new SqlParameter("@Brand", SqlDbType.VarChar, 300);
                param[11] = new SqlParameter("@TotalMrp", SqlDbType.Float, 8);
                param[12] = new SqlParameter("@TotalPrice", SqlDbType.Float, 8);
                param[13] = new SqlParameter("@ClientId", SqlDbType.Int, 4);



                param[0].Value = ItemId;
                param[1].Value = ItemName;
                param[2].Value = PackId;
                param[3].Value = PackSize;
                param[4].Value = Mrp;
                param[5].Value = Price;
                param[6].Value = NoOfItems;
                param[7].Value = ImgUrl;
                param[8].Value = Discount;
                param[9].Value = Type;
                param[10].Value = Brand;
                param[11].Value = TotalMrp;
                param[12].Value = TotalPrice;
                param[13].Value = ClientId;


                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();


            }
            catch (Exception ex)
            {
                string msg;
                msg = ex.Message;
                //

            }
            finally
            {
                con.Close();
            }

        }


        public DataTable cartRetrieve(int ClientId)
        {

            DataTable ShowProduct = new DataTable();
            ShowProduct.Columns.Add("ItemId");
            ShowProduct.Columns.Add("ItemName");
            ShowProduct.Columns.Add("PackId");
            ShowProduct.Columns.Add("PackSize");
            ShowProduct.Columns.Add("Mrp");
            ShowProduct.Columns.Add("Price");
            ShowProduct.Columns.Add("NoOfItems");
            ShowProduct.Columns.Add("ImgUrl");
            ShowProduct.Columns.Add("Discount");
            ShowProduct.Columns.Add("Type");
            ShowProduct.Columns.Add("Brand");
            ShowProduct.Columns.Add("TotalMrp", typeof(Double));
            ShowProduct.Columns.Add("TotalPrice", typeof(Double));
            ShowProduct.Columns.Add("TotalCashback", typeof(Double));
            ShowProduct.Columns.Add("Cashback", typeof(Boolean));
            ShowProduct.Columns.Add("Pcb1");
            ShowProduct.Columns.Add("Pcb2");
            ShowProduct.Columns.Add("Pcb3");



            con = new SqlConnection(commm.GetConnectionString());
            try
            {
                con.Open();
                string query = "SELECT  ItemId, ItemName, PackId, PackSize, Mrp, Price, NoOfItems, ImgUrl, Discount, Type, Brand, TotalMrp, TotalPrice, ClientId, Cashback, Pcb1, Pcb2, Pcb3  FROM  MyCart WHERE  (ClientId = '" + ClientId + "')";

                SqlDataAdapter da = new SqlDataAdapter(query, con);

                da.Fill(ShowProduct);

            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {

                con.Close();
            }
            return ShowProduct;
        }

        public DataTable WishRetrieve(int ClientId)
        {

            DataTable ShowProduct = new DataTable();
            ShowProduct.Columns.Add("ItemId");
            ShowProduct.Columns.Add("ItemName");
            ShowProduct.Columns.Add("PackId");
            ShowProduct.Columns.Add("PackSize");
            ShowProduct.Columns.Add("Mrp");
            ShowProduct.Columns.Add("Price");
            ShowProduct.Columns.Add("NoOfItems");
            ShowProduct.Columns.Add("ImgUrl");
            ShowProduct.Columns.Add("Discount");
            ShowProduct.Columns.Add("Type");
            ShowProduct.Columns.Add("Brand");
            ShowProduct.Columns.Add("TotalMrp", typeof(Double));
            ShowProduct.Columns.Add("TotalPrice", typeof(Double));
            ShowProduct.Columns.Add("Cashback", typeof(Boolean));
            ShowProduct.Columns.Add("Pcb1");
            ShowProduct.Columns.Add("Pcb2");
            ShowProduct.Columns.Add("Pcb3");



            con = new SqlConnection(commm.GetConnectionString());
            try
            {
                con.Open();
                string query = "SELECT  ItemId, ItemName, PackId, PackSize, Mrp, Price, NoOfItems, ImgUrl, Discount, Type, Brand, TotalMrp, TotalPrice, ClientId, , Cashback, Pcb1, Pcb2, Pcb3 FROM  Wishlist WHERE  (ClientId = '" + ClientId + "')";

                SqlDataAdapter da = new SqlDataAdapter(query, con);

                da.Fill(ShowProduct);

            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                
            }
            finally
            {

                con.Close();
            }
            return ShowProduct;
        }

        public DataTable ReOrderRerieve(int OrderId)
        {

            DataTable ShowProduct = new DataTable();
            ShowProduct.Columns.Add("ItemId");
            ShowProduct.Columns.Add("ItemName");
            ShowProduct.Columns.Add("PackId");
            ShowProduct.Columns.Add("PackSize");
            ShowProduct.Columns.Add("Mrp");
            ShowProduct.Columns.Add("Price");
            ShowProduct.Columns.Add("NoOfItems");
            ShowProduct.Columns.Add("ImgUrl");
            ShowProduct.Columns.Add("Discount");
            ShowProduct.Columns.Add("Type");
            ShowProduct.Columns.Add("Brand");
            ShowProduct.Columns.Add("TotalMrp", typeof(Double));
            ShowProduct.Columns.Add("TotalPrice", typeof(Double));



            con = new SqlConnection(commm.GetConnectionString());
            try
            {
                con.Open();
                string query = @"SELECT        PackSizes.ItemId, Order_details.ItemName, Order_details.PackId, PackSizes.PackSize, PackSizes.Mrp, PackSizes.SellingPrice AS Price, Order_details.Qty AS NoOfItems, Order_details.ImgUrl, PackSizes.Discount, 
                         'Veg' AS Type, Order_details.Brand, Order_details.Qty * PackSizes.Mrp AS TotalMrp, Order_details.Qty * PackSizes.SellingPrice AS TotalPrice
FROM            Order_details LEFT OUTER JOIN
                         PackSizes ON Order_details.PackId = PackSizes.PackId
WHERE(Order_details.OrderId = '" + OrderId + "')";

                SqlDataAdapter da = new SqlDataAdapter(query, con);

                da.Fill(ShowProduct);

            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;

            }
            finally
            {

                con.Close();
            }
            return ShowProduct;
        }

        public void RemoveCart(int ClientId, int PackId)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("DELETE FROM MyCart WHERE  (PackId = '" + PackId + "') AND (ClientId = '" + ClientId + "')", con);
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                

            }
            finally
            {
                con.Close();
            }
        }

        public void RemoveWishList(int ClientId, int PackId)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("DELETE FROM Wishlist WHERE  (PackId = '" + PackId + "') AND (ClientId = '" + ClientId + "')", con);
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                

            }
            finally
            {
                con.Close();
            }
        }

        public void UpdateCart(int PackId, int NoOfItems, int ClientId)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE MyCart SET  NoOfItems = '" + NoOfItems + "', TotalPrice =" + NoOfItems + " * Price  , TotalMrp =" + NoOfItems + " * Mrp   WHERE (ClientId = '" + ClientId + "') AND (PackId = '" + PackId + "')", con);
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

        public void RemoveClientCart(int ClientId)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("DELETE FROM MyCart WHERE (ClientId = '" + ClientId + "')", con);
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                

            }
            finally
            {
                con.Close();
            }
        }

        public ArrayList getWebSettings()
        {
            ArrayList al = new ArrayList();
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("SELECT WebOTP, AppOTP, WebMarque, AppMarque FROM Login  WHERE userid= 1", con);

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
        public void InsertCoupon(String CouponName, int Value, int Type, int Times, int MaxDisc, int MinAmount, int PaymentType, int ClientId)
        {

            DateTime FDate = DateTime.Now;
            DateTime TDate = DateTime.Now.AddYears(1);
            con = new SqlConnection(commm.GetConnectionString());
            string sql = "INSERT INTO Coupon (CouponName, Value, Type, Times, MaxDisc, MinAmount, PaymentType, ClientId, FDate, TDate, Title, Description) VALUES (@CouponName, @Value, @Type, @Times, @MaxDisc, @MinAmount, @PaymentType, @ClientId,  @FDate, @TDate, @Title, @Description)";
            try
            {

                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);
                SqlParameter[] param = new SqlParameter[12];

                param[0] = new SqlParameter("@CouponName", SqlDbType.VarChar, 100);
                param[1] = new SqlParameter("@Value", SqlDbType.Int, 4);
                param[2] = new SqlParameter("@Type", SqlDbType.Int, 4);
                param[3] = new SqlParameter("@Times", SqlDbType.Int, 4);
                param[4] = new SqlParameter("@MaxDisc", SqlDbType.Int, 4);
                param[5] = new SqlParameter("@MinAmount", SqlDbType.Int, 4);
                param[6] = new SqlParameter("@PaymentType", SqlDbType.Int, 4);
                param[7] = new SqlParameter("@ClientId", SqlDbType.Int, 4);
                param[8] = new SqlParameter("@FDate", SqlDbType.Date);
                param[9] = new SqlParameter("@TDate", SqlDbType.Date);
                param[10] = new SqlParameter("@Title", SqlDbType.VarChar, 150);
                param[11] = new SqlParameter("@Description", SqlDbType.VarChar, 500);

                

                param[0].Value = CouponName;
                param[1].Value = Value;
                param[2].Value = Type;
                param[3].Value = Times;
                param[4].Value = MaxDisc;
                param[5].Value = MinAmount;
                param[6].Value = PaymentType;
                param[7].Value = ClientId;
                param[8].Value = FDate;
                param[9].Value = TDate;
                param[10].Value = "Referral Coupon";
                param[11].Value = "Get Rs. 50 Instant Discount";


                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();


            }
            catch (Exception ex)
            {
                string msg;
                msg = ex.Message;
                //

            }
            finally
            {
                con.Close();
            }

        }

        public void DeleteCoupon(int ClientId, String CouponName )
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("DELETE FROM Coupon WHERE   (ClientId = '" + ClientId + "') AND  (CouponName = '" + CouponName + "')  ", con);
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                string msg;
                msg = ex.Message;
                

            }
            finally
            {
                con.Close();
            }

        }

        public void InsertCartDefault(int ItemId, String ItemName, int PackId, String PackSize, float Mrp, float Price, int NoOfItems, String ImgUrl, int Discount, String Type, String Brand, float TotalMrp, float TotalPrice, int ClientId, bool Cashback, int Pcb1, int Pcb2, int Pcb3)
        {

            DateTime curDateTime = DateTime.Now;
            con = new SqlConnection(commm.GetConnectionString());
            string sql = "INSERT INTO MyCart (ItemId, ItemName, PackId, PackSize, Mrp, Price, NoOfItems, ImgUrl, Discount, Type, Brand, TotalMrp, TotalPrice, ClientId,   Pcb1, Pcb2, Pcb3, Cashback) VALUES (@ItemId, @ItemName, @PackId, @PackSize, @Mrp, @Price, @NoOfItems, @ImgUrl, @Discount, @Type, @Brand, @TotalMrp, @TotalPrice, @ClientId, @Pcb1, @Pcb2, @Pcb3, @Cashback)";
            try
            {
                DateTime dt = DateTime.Now;
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);
                SqlParameter[] param = new SqlParameter[18];

                param[0] = new SqlParameter("@ItemId", SqlDbType.Int, 4);
                param[1] = new SqlParameter("@ItemName", SqlDbType.VarChar, 500);
                param[2] = new SqlParameter("@PackId", SqlDbType.Int, 4);
                param[3] = new SqlParameter("@PackSize", SqlDbType.VarChar, 200);
                param[4] = new SqlParameter("@Mrp", SqlDbType.Float, 8);
                param[5] = new SqlParameter("@Price", SqlDbType.Float, 8);
                param[6] = new SqlParameter("@NoOfItems", SqlDbType.Int, 4);
                param[7] = new SqlParameter("@ImgUrl", SqlDbType.VarChar, 300);
                param[8] = new SqlParameter("@Discount", SqlDbType.Int, 4);
                param[9] = new SqlParameter("@Type", SqlDbType.VarChar, 50);
                param[10] = new SqlParameter("@Brand", SqlDbType.VarChar, 300);
                param[11] = new SqlParameter("@TotalMrp", SqlDbType.Float, 8);
                param[12] = new SqlParameter("@TotalPrice", SqlDbType.Float, 8);
                param[13] = new SqlParameter("@ClientId", SqlDbType.Int, 4);
                param[14] = new SqlParameter("@Pcb1", SqlDbType.Int, 4);
                param[15] = new SqlParameter("@Pcb2", SqlDbType.Int, 4);
                param[16] = new SqlParameter("@Pcb3", SqlDbType.Int, 4);
                param[17] = new SqlParameter("@Cashback", SqlDbType.Bit);




                param[0].Value = ItemId;
                param[1].Value = ItemName;
                param[2].Value = PackId;
                param[3].Value = PackSize;
                param[4].Value = Mrp;
                param[5].Value = Price;
                param[6].Value = NoOfItems;
                param[7].Value = ImgUrl;
                param[8].Value = Discount;
                param[9].Value = Type;
                param[10].Value = Brand;
                param[11].Value = TotalMrp;
                param[12].Value = TotalPrice;
                param[13].Value = ClientId;
                param[14].Value = Pcb1;
                param[15].Value = Pcb2;
                param[16].Value = Pcb3;
                param[17].Value = Cashback;


                for (int i = 0; i < param.Length; i++)
                {
                    cmd.Parameters.Add(param[i]);
                }

                cmd.CommandType = CommandType.Text;
                cmd.ExecuteNonQuery();


            }
            catch (Exception ex)
            {
                string msg;
                msg = ex.Message;
                ////throw new Exception(msg);

            }
            finally
            {
                con.Close();
            }

        }

        public void updatecashbackorder(int orderId, int cashback)
        {
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("UPDATE OrderDe  SET  Cashback ='" + cashback + "' WHERE  (OrderId = '" + orderId + "')", con);

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

        public ArrayList CashbackAmountCheck()
        {
            ArrayList al = new ArrayList();
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("SELECT CashbackAmount, CashbackAmount1 FROM Login", con);

            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    al.Add(dr[0]);
                    al.Add(dr[1]);


                }
            }
            catch (Exception ex)
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

        public ArrayList SelectOrderDetails(String orderId)
        {
            ArrayList al = new ArrayList();
            con = new SqlConnection(commm.GetConnectionString());
            cmd = new SqlCommand("SELECT PaymentStatus, TotalAmount, Mobile, GrandTotal FROM OrderDe WHERE (OrderId = '" + orderId + "')", con);

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
    }
}


