using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Models;

namespace Uniamazonia_Juego.Controllers
{
    public class PruebaController
    {
        private int id_prueba { get; set; }
        private String nombre_prueba { get; set; }
        private int numero_preguntas { get; set; }
        private string estado_prueba { get; set; }
        private int fk_contenido { get; set; }


        Prueba prueba = new Prueba();

        public PruebaController()
        {
        }

        public PruebaController(int id_proof, String name_proof, int number_proof, String state_proof, int fk_content)
        {

            prueba = new Prueba(id_proof, name_proof, number_proof, state_proof, fk_content);
        }
        // metodos


        public DataTable consultaParametroNombre(String nombre_prueba)
        {
            DataTable consulta = prueba.consultaParametroNombre(nombre_prueba);
            return consulta;
        }
        public DataTable consultaParametroId_prueba(String id_prueba)
        {
            DataTable consulta = prueba.consultaParametroId_prueba(id_prueba);
            return consulta;
        }

            public DataTable consulta_prueba_x_contenido_combox()
        {
            return prueba.consulta_prueba_x_contenido_combox();

        }

        public DataTable consulta_parametro_fk_contenido(int id_contenido)
        {
            return prueba.consulta_parametro_fk_contenido(id_contenido);

        }
        

            public DataTable consulta_prueba_x_contenido(String nombre_contenido)
        {

            return prueba.consulta_prueba_x_contenido(nombre_contenido);
        }

        public DataTable filtrando_registros_prueba(String dato)
        {
            return prueba.filtrando_registros_prueba(dato);
        }


        public Boolean crear_prueba(String aux_nombre_contenido)
        {
            return prueba.crear_prueba(aux_nombre_contenido);

        }

        public DataTable consultar_pruebas(String nombre_prueba)
        {
            return prueba.consultar_pruebas(nombre_prueba);
        }
        public DataTable consulta_pruebas_general()
        {
            return prueba.consulta_pruebas_general();
        }


        public DataTable consulta_combox_nombre()
        {
            return prueba.consulta_combox_nombre();
        }
        public Boolean editar_pruebas(String aux_nombre)
        {
            return prueba.editar_pruebas(aux_nombre);
        }

        public Boolean eliminar_pruebas()
        {
            return prueba.eliminar_pruebas();
        }
        public DataTable consultaGrid()
        {
            return prueba.consultaGrid();
        }

        //public int guardarPreguntasGeneradas(int numeroPreguntas, int numeroAleatorio)
        //{
        //   int valor=prueba.guardarPreguntasGeneradas(numeroPreguntas,numeroAleatorio);
        //   return valor;
        //}
        }
}