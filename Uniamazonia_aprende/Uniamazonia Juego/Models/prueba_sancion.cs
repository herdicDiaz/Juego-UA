using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Conexion;

namespace Uniamazonia_Juego.Models
{
    public class prueba_sancion
    {
        private int fk_prueba{get;set;}
        private int fk_sancion { get; set; }
        private String descripcion { get; set; }
        Connection conexion = new Connection();
        public prueba_sancion(int fk_prueba, int fk_sancion, string descripcion)
        {
            this.fk_prueba = fk_prueba;
            this.fk_sancion = fk_sancion;
            this.descripcion = descripcion;
        }

        public prueba_sancion()
        {
        }

        //metodos 
        public DataTable consultaParametroFk_prueba(String fk_prueba)
        {
            DataTable consulta = new DataTable();
            String Query = "select fk_prueba,fk_sancion from prueba_sancion where fk_prueba='"+fk_prueba+"'";
            consulta = conexion.consultar_BD(Query);
            return consulta;
        }

        public Boolean insert(String fk_prueba, String fk_sancion, String descripcion)
        {
            Boolean insert = new Boolean();
            String Query = "INSERT INTO `aprender`.`prueba_sancion` (`fk_prueba`, `fk_sancion`, `descripcion`) VALUES ('"+fk_prueba+"', '"+fk_sancion+"', '"+descripcion+"');";
            insert = conexion.insert_BD(Query);
            return insert;
        }

        public DataTable ConsultaGrid()
        {
            DataTable insert = new DataTable();
            String Query = "select sancion.idsancion, sancion.descripcion from prueba  join prueba_sancion on prueba.id_prueba=prueba_sancion.fk_prueba join sancion on sancion.idsancion=prueba_sancion.fk_sancion;";
            insert = conexion.consultar_BD(Query);
            return insert;
        }

        public Boolean EliminarRegistros(int idprueba,int idsancion)
        {
            Boolean delete = new Boolean();
            String Query = "DELETE FROM `aprender`.`prueba_sancion` WHERE  `fk_prueba`= '"+idprueba+"' AND `fk_sancion`= '"+idsancion+"';";
            delete = conexion.delete_BD(Query);
            return delete;
            
        }

        public DataTable ConsultaGridParametroNombrePrueba(String prueba)
        {
            DataTable insert = new DataTable();
            String Query = "select sancion.idsancion, sancion.descripcion from prueba  join prueba_sancion on prueba.id_prueba=prueba_sancion.fk_prueba join sancion on sancion.idsancion=prueba_sancion.fk_sancion where prueba.nombre_prueba='"+prueba+"';";
            insert = conexion.consultar_BD(Query);
            return insert;
        }

        public DataTable ConsultaParametroFK_prueba(String fk_prueba)
        {
            DataTable insert = new DataTable();
            String Query = "SELECT fk_prueba, fk_sancion, descripcion from prueba_sancion WHERE fk_prueba='"+fk_prueba+"';";
            insert = conexion.consultar_BD(Query);
            return insert;
        }

            public DataTable buscarEnGrid(String palabra)
        {
            DataTable insert = new DataTable();
            String Query = "select sancion.idsancion, sancion.descripcion from prueba  join prueba_sancion on prueba.id_prueba=prueba_sancion.fk_prueba join sancion on sancion.idsancion=prueba_sancion.fk_sancion where sancion.descripcion like '%"+palabra+"%';";
            insert = conexion.consultar_BD(Query);
            return insert;
        }

        public DataTable buscarEnGridParametroPruebaPalabra(String palabra,String fk_prueba)
        {
            DataTable insert = new DataTable();
            String Query = "select sancion.idsancion, sancion.descripcion from prueba  join prueba_sancion on prueba.id_prueba=prueba_sancion.fk_prueba join sancion on sancion.idsancion=prueba_sancion.fk_sancion where sancion.descripcion like '%"+palabra+"%' and prueba_sancion.fk_prueba='"+fk_prueba+"';";
            insert = conexion.consultar_BD(Query);
            return insert;
        }
    }
}