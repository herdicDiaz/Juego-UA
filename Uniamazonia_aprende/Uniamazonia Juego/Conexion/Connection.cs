using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;
using System.Configuration;
using System.Data;
using System.Web.UI.WebControls;
using Uniamazonia_Juego.Models;


namespace Uniamazonia_Juego.Conexion
{
    public class Connection
    {

        public String strConn { get; set; }
        public MySqlConnection connect { get; set; }
        public MySqlCommand cmd { get; set; }
        public String answer;
        public DataTable data;
        public MySqlDataAdapter mysqlAdap;

        public Connection()
        {
            strConn = ConfigurationManager.ConnectionStrings["connectionMysql"].ConnectionString;
            connect = new MySqlConnection(strConn);
            cmd = new MySqlCommand(); //Representa una instrucción SQL para ejecutar contra una base de datos MySQL.
            data = new DataTable();
        }

        public Boolean openConnection()
        {
            try
            {
                connect.Open();
                Console.WriteLine("Conexion Establecidad");
                return true;
            }
            catch
            {
                Console.WriteLine("Sin Conexionnn!!");
                return false;
            }

        }

        public Boolean closeConnection()
        {
            try
            {
                connect.Close();
                return true;
            }
            catch
            {
                return false;
            }
        }



        public Boolean insert_BD(String Query)
        {
            Boolean consulta = false;

            if (openConnection())
            {
                try
                {
                    cmd.Connection = connect;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = Query;

                    try
                    {
                        cmd.ExecuteNonQuery();
                        consulta = true;
                        closeConnection();
                    }
                    catch (Exception s)
                    {
                        Console.WriteLine("Error Consulta!!" + s);
                        consulta = false;
                    }
                }
                catch
                { }
            }
            else
            {
                consulta = false;

            }
            return consulta;
        }

        public Boolean update_BD(String Query)
        {
            Boolean consulta = false;

            if (openConnection())
            {
                try
                {
                    cmd.Connection = connect;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = Query;

                    try
                    {
                        cmd.ExecuteNonQuery();
                        consulta = true;
                        closeConnection();
                    }
                    catch
                    {
                        consulta = false;
                    }
                }
                catch
                { }
            }
            else
            {
                consulta = false; ;

            }
            return consulta;
        }





        public DataTable executeConsult(string sentencia, CommandType TipoComando)
        {
            MySqlDataAdapter adaptador = new MySqlDataAdapter();
            adaptador.SelectCommand = new MySqlCommand(sentencia, connect);
            adaptador.SelectCommand.CommandType = TipoComando;

            DataSet resultado = new DataSet();
            adaptador.Fill(resultado);

            return resultado.Tables[0];
        }





        public DataTable consultar_BD(String Query)
        {
            DataTable lreglas = new DataTable();
            if (openConnection())
            {
                cmd.Connection = connect;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = Query;
                try
                {
                    MySqlDataAdapter adaptador = new MySqlDataAdapter(cmd);
                    adaptador.Fill(lreglas);

                    closeConnection();
                }
                catch { }
            }
            return lreglas;
        }

        public Boolean delete_BD(String Query)
        {
            Boolean respuesta = false;
            if (openConnection())
            {
                try
                {
                    cmd.Connection = connect;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = Query;

                    try
                    {
                        cmd.ExecuteNonQuery();
                        respuesta = true;
                        closeConnection();
                    }
                    catch
                    {
                        return false;
                    }
                }
                catch { }
            }
            else
            {
                respuesta = false;

            }
            return respuesta;
        }


        public Boolean existe_en_BD(String Query)
        {
            Boolean respuesta = false;
            int estado_empresa = 0;
            if (openConnection())
            {
                try
                {
                    cmd.Connection = connect;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = Query;

                    try
                    {
                        object consulta_BD = cmd.ExecuteScalar().ToString();
                        estado_empresa = Convert.ToInt32(consulta_BD);

                        if (estado_empresa == 0)
                        {
                            // NO esta en la lista
                            respuesta = false;
                        }
                        else
                        {
                            // SI esta en la lista
                            respuesta = true;
                        }
                        closeConnection();
                    }
                    catch
                    {
                        return false;
                    }
                }
                catch { }
            }
            else
            {
                respuesta = false;

            }
            return respuesta;
        }

        public int buscar_ID_BD(String Query)
        {
            // resive de parametro es un varchar

            int ID_universal = 0;

            if (openConnection())
            {
                try
                {
                    cmd.Connection = connect;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = Query;

                    try
                    {
                        object consulta_BD = cmd.ExecuteScalar().ToString();
                        ID_universal = Convert.ToInt32(consulta_BD);

                        closeConnection();
                    }
                    catch
                    {
                        return 777;
                    }
                }
                catch { }
            }
            else
            {
                return 777;
            }
            return ID_universal;
        }

        public int buscar_ID_BD_2(String Query)
        {
            // resive de parametro es un entero
            int ID_universal = 0;

            if (openConnection())
            {
                try
                {
                    cmd.Connection = connect;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = Query;

                    try
                    {
                        object consulta_BD = cmd.ExecuteScalar().ToString();
                        ID_universal = Convert.ToInt32(consulta_BD);

                        closeConnection();
                    }
                    catch
                    {
                        return 777;
                    }
                }
                catch { }
            }
            else
            {
                return 777;
            }
            return ID_universal;
        }




        public String consulta_universal(String Query)
        {
            String consulta = "";
            if (openConnection())
            {
                try
                {
                    cmd.Connection = connect;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = Query;
                    try
                    {
                        object consulta_BD = cmd.ExecuteScalar().ToString();
                        consulta = Convert.ToString(consulta_BD);


                        closeConnection();
                    }
                    catch (Exception s)
                    {
                        Console.WriteLine("Error Consulta!!" + s);
                        return "N";
                    }
                }
                catch { }
            }
            else
            {
                return "N";
            }
            return consulta;
        }

        public DataTable consulta_comboBox(String Query)
        {
            DataTable consulta = new DataTable();
            if (openConnection())
            {
                try
                {
                    cmd.Connection = connect;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = Query;

                    try
                    {
                        MySqlDataAdapter BD_consulta = new MySqlDataAdapter(cmd);
                        BD_consulta.Fill(consulta);


                        closeConnection();
                    }
                    catch
                    {
                        return null;
                    }
                }
                catch { }
            }
            else
            {
                return null;
            }
            return consulta;
        }

        public DataTable consultaReportes(String Query)
        {
            DataTable ds = new DataTable();
            if (openConnection())
            {
                cmd.Connection = connect;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = Query;
                try
                {
                    MySqlDataAdapter adaptador = new MySqlDataAdapter(cmd);
                    adaptador.Fill(ds);

                    closeConnection();
                }
                catch { }
            }
            return ds;
        }
    }
}