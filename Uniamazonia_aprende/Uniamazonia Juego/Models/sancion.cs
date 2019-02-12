using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Conexion;

namespace Uniamazonia_Juego.Models
{
    public class Sancion
    {
    //private int idsancion{ get; set; }
    //private String descripcion { get; set; }
    //private String url_video { get; set; }
    //private String estado_sancion { get; set; }

    private Connection conexion = new Connection();

        public DataTable consulta_Combox_nombre()
        {
            DataTable consulta = new DataTable();
            String query="select *from sancion where estado_sancion='A';";
            consulta = conexion.consulta_comboBox(query);
            return consulta;
        }

        public DataTable consultar_idSancion(String consultaQ)
        {
            DataTable consulta = new DataTable();
            String Query = "select idsancion from sancion where descripcion='"+consultaQ+"';";
            consulta = conexion.consultar_BD(Query);
            return consulta;
        }

        public DataTable consultaGrid()
         {
            DataTable consulta = new DataTable();
            String Query = "select *from sancion where estado_sancion='0';";
            consulta = conexion.consultar_BD(Query);
            return consulta;
        }

        public DataTable ConsultaParametroIdsancion(String idsancion)
        {
            DataTable consulta = new DataTable();
            String Query = "select idsancion,descripcion,url_video,estado_sancion from sancion where idsancion='"+idsancion+"'";
            consulta = conexion.consultar_BD(Query);
            return consulta;
        }



        public DataTable listarSanciones()
        {
            DataTable consulta = new DataTable();
            String Query = "select *from sancion;";
            consulta = conexion.consultar_BD(Query);
            return consulta;
        }

        public Boolean insertarSancion(String descripcion, String url, String estado)
        {
            Boolean consulta = new Boolean();
            String Query = "INSERT INTO `aprender`.`sancion` (`descripcion`, `url_video`, `estado_sancion`) VALUES ('"+descripcion+"', '"+url+"', '"+estado+"');";
            consulta = conexion.insert_BD(Query);
            return consulta;
        }

        public Boolean eliminarSancion(String idsancion)
        {
            Boolean consulta = new Boolean();
            String Query = "UPDATE `aprender`.`sancion` SET `estado_sancion`='1' WHERE  `idsancion`='"+idsancion+"';";
            consulta = conexion.insert_BD(Query);
            return consulta;
        }

        public Boolean updateSancion(String descripcion,String url, String estado, String id_sancion)
        {
            Boolean consulta = new Boolean();
            String Query = "UPDATE `aprender`.`sancion` SET `descripcion`='"+descripcion+"', `url_video`='"+url+"', `estado_sancion`='"+estado+"' WHERE  `idsancion`='"+id_sancion+"';";
            consulta = conexion.update_BD(Query);
            return consulta;
        }

        //public Boolean UpdateSancionEstado(int idsancion)
        //{
        //    Boolean consulta = new Boolean();
        //    String Query = "UPDATE `aprender`.`sancion` SET `estado_sancion`='D' WHERE  `idsancion`='"+idsancion+"';";
        //    consulta = conexion.update_BD(Query);
        //    return consulta;
        //}
            

        public DataTable ConsultaUrl(String idsancion)
        {
            DataTable consulta = new DataTable();
            String Query = "select url_video from sancion where idsancion='"+idsancion+"'";
            consulta = conexion.consultar_BD(Query);
            return consulta;
        }

        public DataTable buscarEnGrid(String palabra)
        {
            DataTable consulta = new DataTable();
            String Query="select *from sancion where sancion.descripcion like '%"+palabra+"%'";
            consulta = conexion.consultar_BD(Query);
            return consulta;
        }
    }
}