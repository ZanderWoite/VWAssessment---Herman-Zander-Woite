using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using VWNewsclipApp.Models;

namespace VWNewsclipApp.Models
{
    public class CarModelDB
    {
        string conString = ConfigurationManager.ConnectionStrings["VWModelsDBEntities"].ToString();
        public List<CarModel> SelectCarModel()
        {
            List<CarModel> listModels = new List<CarModel>();

            using (SqlConnection con = new SqlConnection(conString))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("SelectModels", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    listModels.Add(new CarModel
                    {
                        Model_ID = Convert.ToInt32(dr["Model_ID"]),
                        Model_Description = dr["Model_Description"].ToString(),
                        //SubModel_Description = dr["SubModel_Description"].ToString(),
                        //Feature_Description = dr["Feature_Description"].ToString(),
                    });
                }

                return listModels;
            }
        }

            public List<SubModel> SelectSubModel()
            {
                List<SubModel> listSubModels = new List<SubModel>();

                using (SqlConnection con = new SqlConnection(conString))
                {
                    con.Open();

                    SqlCommand cmd = new SqlCommand("SelectSubModels", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        listSubModels.Add(new SubModel
                        {
                            SubModel_ID = Convert.ToInt32(dr["SubModel_ID"]),
                            Model_ID = Convert.ToInt32(dr["Model_ID"]),
                            SubModel_Description = dr["SubModel_Description"].ToString(),
                            Stock = Convert.ToInt32(dr["Stock"]),
                             Price = Convert.ToInt32(dr["Price"])
                        });
                    }

                    return listSubModels;
                }
            }

        public List<Feature> SelectFeature()
        {
            List<Feature> listFeatures = new List<Feature>();

            using (SqlConnection con = new SqlConnection(conString))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("SelectFeatures", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    listFeatures.Add(new Feature
                    {
                        SubModel_ID = Convert.ToInt32(dr["SubModel_ID"]),
                        Feature_Description = dr["Feature_Description"].ToString(),
                    });
                }

                return listFeatures;
            }
        }

        public List<Car> SelectAll()
        {
            List<Car> listCar = new List<Car>();
            using (SqlConnection con = new SqlConnection(conString))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("SelectAll", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    listCar.Add(new Car
                    {
                        SubModel_ID = Convert.ToInt32(dr["SubModel_ID"]),
                        Model_Description = dr["Model_Description"].ToString(),
                        SubModel_Description = dr["SubModel_Description"].ToString(),
                        Stock = Convert.ToInt32(dr["Stock"]),
                        Price = Convert.ToInt32(dr["Price"])
                    });
                }

                return listCar;
            }
        }

        public int DeleteCar(int subModelId)
        {
            int i;
            using (SqlConnection con = new SqlConnection(conString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("DeleteCar", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@SubModel_ID", subModelId);

                i = cmd.ExecuteNonQuery();
            }

            return i;
        }

        public int InsertMake(Make make)
        {
            int i;
            using (SqlConnection con = new SqlConnection(conString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("InsertMake", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Model_Description", make.Model_Description);

                i = cmd.ExecuteNonQuery();
            }

            return i;
        }

        public int InsertFeature(Feature feature)
        {
            int i;
            using (SqlConnection con = new SqlConnection(conString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("InsertFeature", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Feature_Description", feature.Feature_Description);
                cmd.Parameters.AddWithValue("@SubModel_ID", feature.SubModel_ID);


                i = cmd.ExecuteNonQuery();
            }

            return i;
        }

        public int InsertSubModel(SubModel subModel)
        {
            int i;
            using (SqlConnection con = new SqlConnection(conString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("InsertSubModel", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Model_ID", subModel.Model_ID);
                cmd.Parameters.AddWithValue("@SubModel_Description", subModel.SubModel_Description);
                cmd.Parameters.AddWithValue("@Price", subModel.Price);
                cmd.Parameters.AddWithValue("@Stock", subModel.Stock);

                i = cmd.ExecuteNonQuery();
            }

            return i;
        }

        public List<CarModel> SelectAvailableModels()
        {
            List<CarModel> listAvailableModels = new List<CarModel>();

            using (SqlConnection con = new SqlConnection(conString))
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("SelectAvailableModels", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    listAvailableModels.Add(new CarModel
                    {
                        Model_ID = Convert.ToInt32(dr["Model_ID"]),
                        Model_Description = dr["Model_Description"].ToString(),
                        //SubModel_Description = dr["SubModel_Description"].ToString(),
                        //Feature_Description = dr["Feature_Description"].ToString(),
                    });
                }

                return listAvailableModels;
            }
        }

        public int UpdateSubModel(SubModel subModel)
        {
            int i;
            using (SqlConnection con = new SqlConnection(conString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("UpdateSubModel", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Model_ID", subModel.Model_ID);
                cmd.Parameters.AddWithValue("@SubModel_Description", subModel.SubModel_Description);
                cmd.Parameters.AddWithValue("@Price", subModel.Price);
                cmd.Parameters.AddWithValue("@Stock", subModel.Stock);

                i = cmd.ExecuteNonQuery();
            }

            return i;
        }

    }
}