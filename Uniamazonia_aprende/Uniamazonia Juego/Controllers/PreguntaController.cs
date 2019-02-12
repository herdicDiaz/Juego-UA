using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Conexion;
using Uniamazonia_Juego.Models;

namespace Uniamazonia_Juego.Controllers
{
    public class PreguntaController
    {
        Pregunta preguntaM = new Pregunta();
        Prueba prueba;
        //private Connection conexion;


        public PreguntaController(string nombre_pregunta, int calificacion, int fk_sancion, int fk_prueba, string estado_pregunta)
        {
            preguntaM = new Pregunta(nombre_pregunta, calificacion, fk_prueba, fk_sancion, estado_pregunta);
        }


        public PreguntaController()
        {

        }

        public Boolean Insertar_registro_pregunta(String nombre_pregunta, int calificacion)
        {
            return preguntaM.Insertar_registro_pregunta(nombre_pregunta, calificacion);
        }

        public DataTable Consultas_generales(String Query)
        {
            return preguntaM.Consultas_generales(Query);
        }

        public DataTable Listar_grid()
        {
            DataTable consulta = new DataTable();
            consulta = preguntaM.Listar_grid();
            return consulta;

        }

        public Boolean update_pregunta(String nombre, String calificacion,int id_pregunta)
        {
            Boolean update = preguntaM.update_pregunta(nombre, calificacion, id_pregunta);
            return update;
        }
        public Boolean updateAggFkPrueba(String id_pregunta, String fk_prueba)
        {
            Boolean consulta = preguntaM.updateAggFkPrueba(id_pregunta, fk_prueba);
            return consulta;
        }

        public Boolean DeletePreguntaDePrueba(String id_pregunta)
        {
            Boolean consulta = preguntaM.DeletePreguntaDePrueba(id_pregunta);
            return consulta;
        }
            
        public Boolean Delete_pregunta(String id_pregunta)
        {
            Boolean consulta = preguntaM.Delete_pregunta(id_pregunta);
            return consulta;
        }
        public DataTable pregunta()
        {
            DataTable consulta = preguntaM.pregunta();
            return consulta;
        }

        public DataTable PreguntasPrueba(int fk_prueba)
        {
            DataTable consulta = preguntaM.PreguntasPrueba(fk_prueba);
            return consulta;
        }

        public DataTable preguntaEditar(int id_pregunta)
        {
            DataTable consulta = preguntaM.preguntaEditar(id_pregunta);
            return consulta;

        }
        public DataTable buscarEnGridParametroPalabra(String palabra)
        {
            DataTable consulta = preguntaM.buscarEnGridParametroPalabra(palabra);
            return consulta;


        }
        public DataTable consultaParametroFk_Prueba(String fk_prueba)
        {
            DataTable consulta = preguntaM.consultaParametroFk_Prueba(fk_prueba);
            return consulta;
        }

        public DataTable consultaLikeNombre(String palabra)
        {
            DataTable consulta = preguntaM.consultaLikeNombre(palabra);
            return consulta;
        }

        public DataTable buscarEnGridParametroPruebaPalabra(String palabra, String id_prueba)
        {
            DataTable consulta = preguntaM.buscarEnGridParametroPruebaPalabra(palabra,id_prueba);
            return consulta;
        }
        }
}