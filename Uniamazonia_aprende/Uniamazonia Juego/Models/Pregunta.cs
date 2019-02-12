using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Conexion;

namespace Uniamazonia_Juego.Models
{
    public class Pregunta
    {
      
        private String nombre_pregunta { get; set; }
        private int calificacion { get; set; }
        private int fk_prueba { get; set; }
        private int fk_sancion { get; set; }
        private String estado_pregunta { get; set; }

        Connection conexion = new Connection();
        public Pregunta(string nombre_pregunta, int calificacion, int fk_prueba, int fk_sancion, string estado_pregunta)
        {
            this.nombre_pregunta = nombre_pregunta;
            this.calificacion = calificacion;
            this.fk_prueba = fk_prueba;
            this.fk_sancion = fk_sancion;
            this.estado_pregunta = estado_pregunta;
        }

        public Pregunta()
        {
        }

        public  Boolean Insertar_registro_pregunta(String nombre_pregunta,int calificacion)
        {
            Boolean consulta = new Boolean();
            String Query = "INSERT INTO `aprender`.`pregunta` (`nombre_pregunta`, `calificacion`, `estado_pregunta`) VALUES ('"+nombre_pregunta+"', '"+calificacion+"', '0');";
            consulta = conexion.insert_BD(Query);
            return consulta;
        }

        public DataTable Consultas_generales(String Query)
        {
            DataTable consulta = new DataTable();
            consulta = conexion.consultar_BD(Query);
            return consulta;
        }

        public DataTable Listar_grid()
        {
            DataTable consulta = new DataTable();
            String Query = "select  pregunta.id_pregunta,pregunta.nombre_pregunta,pregunta.estado_pregunta,pregunta.calificacion, respuesta.respuesta_a,respuesta.respuesta_b,respuesta.respuesta_c,respuesta.respuesta_d,respuesta.respuesta_correcta from pregunta inner join respuesta where pregunta.id_pregunta=respuesta.fk_pregunta and pregunta.estado_pregunta='0';";
            consulta = conexion.consultar_BD(Query);
            return consulta;
        }

        public DataTable pregunta()
        {
            DataTable consulta = new DataTable();
            String Query = "select id_pregunta,nombre_pregunta,estado_pregunta, pregunta.fk_prueba from pregunta where pregunta.estado_pregunta='0' and pregunta.Estado_asignacion='0'";
            consulta = conexion.consultar_BD(Query);
            return consulta;
        }

        public Boolean update_pregunta(String nombre,String calificacion,int id_pregunta)
        {
            Boolean consulta = new Boolean();
            String Query = "UPDATE `aprender`.`pregunta` SET `nombre_pregunta`='"+nombre+"', `calificacion`='"+calificacion+"', WHERE  `id_pregunta`='"+id_pregunta+"';";
            consulta = conexion.update_BD(Query);
            return consulta;
        }

        public Boolean updateAggFkPrueba(String id_pregunta, String fk_prueba)
        {
            Boolean consulta = new Boolean();
            String Query = "UPDATE `aprender`.`pregunta` SET `Estado_asignacion`='1',  `fk_prueba`='" + fk_prueba+"' WHERE  `id_pregunta`='"+id_pregunta+"';";
            consulta = conexion.update_BD(Query);
            return consulta;
        }

        public Boolean Delete_pregunta(String id_pregunta)
        {
            Boolean consulta = new Boolean();
            String Query = "UPDATE `aprender`.`pregunta` SET `estado_pregunta`='1' WHERE  `id_pregunta`='"+id_pregunta+"';";
            consulta = conexion.delete_BD(Query);
            return consulta;
        }

        public DataTable PreguntasPrueba(int fk_prueba)
        {
            DataTable consulta = new DataTable();
            String Query = "select  pregunta.id_pregunta,pregunta.nombre_pregunta,pregunta.estado_pregunta,pregunta.calificacion, respuesta.respuesta_a,respuesta.respuesta_b,respuesta.respuesta_c,respuesta.respuesta_d,respuesta.respuesta_correcta from pregunta inner join respuesta where pregunta.fk_prueba = '"+fk_prueba+"' and pregunta.id_pregunta=respuesta.fk_pregunta; ";
            consulta = conexion.consultar_BD(Query);
            return consulta;
        }

        //este metodo permite traer los datos de la pregunta que se desea editar
        public DataTable preguntaEditar(int id_pregunta)
        {
            DataTable consulta = new DataTable();
            String Query = "select  pregunta.id_pregunta,pregunta.nombre_pregunta,pregunta.estado_pregunta,pregunta.calificacion, respuesta.respuesta_a,respuesta.respuesta_b,respuesta.respuesta_c,respuesta.respuesta_d,respuesta.respuesta_correcta from pregunta inner join respuesta where pregunta.id_pregunta = '" + id_pregunta + "' and pregunta.id_pregunta=respuesta.fk_pregunta; ";
            consulta = conexion.consultar_BD(Query);
            return consulta;
        }

        public DataTable buscarEnGridParametroPalabra(String palabra)
        {
            DataTable consulta = new DataTable();
            String Query = "select  pregunta.id_pregunta,pregunta.nombre_pregunta,pregunta.estado_pregunta,pregunta.calificacion, respuesta.respuesta_a,respuesta.respuesta_b,respuesta.respuesta_c,respuesta.respuesta_d,respuesta.respuesta_correcta from pregunta inner join respuesta where pregunta.nombre_pregunta like '%"+palabra+"%' and pregunta.id_pregunta=respuesta.fk_pregunta;"; 
            consulta = conexion.consultar_BD(Query);
            return consulta;
        }

        public DataTable consultaParametroFk_Prueba(String fk_prueba)
        {
            DataTable consulta = new DataTable();
            String Query = "select *from pregunta where pregunta.fk_prueba='"+fk_prueba+"';";
            consulta = conexion.consultar_BD(Query);
            return consulta;
        }

        public Boolean DeletePreguntaDePrueba(String id_pregunta)
        {
            Boolean consulta = new Boolean();
            String Query = "UPDATE `aprender`.`pregunta` SET `estado_pregunta`='A', `fk_prueba`=NULL WHERE  `id_pregunta`='"+id_pregunta+"';";
            consulta = conexion.update_BD(Query);
            return consulta;
        }

        public DataTable consultaLikeNombre(String palabra)
        {
            DataTable consulta = new DataTable();
            String Query = "select *from pregunta where pregunta.nombre_pregunta like '%"+palabra+"%';";
            consulta = conexion.consultar_BD(Query);
            return consulta;
        }

        public DataTable buscarEnGridParametroPruebaPalabra(String palabra, String id_prueba)
        {
            DataTable consulta = new DataTable();
            String Query = "select pregunta.id_pregunta, pregunta.nombre_pregunta from prueba inner join pregunta where pregunta.nombre_pregunta like '%"+palabra+"%' and pregunta.fk_prueba='1' and prueba.id_prueba='"+id_prueba+"';";
            consulta = conexion.consultar_BD(Query);
            return consulta;
        }


    }
}