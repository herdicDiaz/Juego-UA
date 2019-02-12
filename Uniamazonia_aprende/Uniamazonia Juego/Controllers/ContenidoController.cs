using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.HtmlControls;
using Uniamazonia_Juego.Models;

namespace Uniamazonia_Juego.Controllers
{
    public class ContenidoController
    {
        Contenido contenido=new Contenido();

        public ContenidoController(int id_content, String name_content, String descrip_content, String state_content, String url_img_content)
        {

            contenido = new Contenido(id_content, name_content, descrip_content, state_content, url_img_content);
        }

        public ContenidoController()
        {
        }


        // metodos

        public DataTable consulta_contenido_x_modulo_combox_nombre(int aux_fk_modulo)
        {
           return contenido.consulta_contenido_x_modulo_combox_nombre(aux_fk_modulo);

        }


        public DataTable consulta_contenido_x_modulo_nombre(String nombre_modulo)
        {
            return contenido.consulta_contenido_x_modulo_nombre(nombre_modulo);
        }

        public DataTable consulta_contenido_x_modulo(String nombre_modulo)
        {
            return contenido.consulta_contenido_x_modulo(nombre_modulo);
        }

        public Boolean crear_contenido(String nombre_modulo)
        {
            return contenido.crear_contenido(nombre_modulo);
        }

        public DataTable filtrando_registros_contenido(String dato)
        {
            return contenido.filtrando_registros_contenido(dato);
        }

        public DataTable consultar_contenido()
        {
            return contenido.consultar_contenido();
        }

        public DataTable consultar_contenido(int id_modulo)
        {
            return contenido.consultar_contenido(id_modulo);
        }

        public DataTable consulta_combox_nombre()
        {
            return contenido.consulta_combox_nombre();
        }

        public Boolean editar_contenido()
        {
            return contenido.editar_contenido();
        }

        public Boolean eliminar_contenido()
        {
            return contenido.eliminar_contenido();
        }


        public void crear_contenido_dinamico(HtmlContainerControl contenedor_contenidos, int aux_fk_modulo) {

            contenido.cargar_contenido_dinamico(contenedor_contenidos,aux_fk_modulo);

        }



    }
}