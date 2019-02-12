using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.HtmlControls;
using Uniamazonia_Juego.Models;

namespace Uniamazonia_Juego.Controllers.Jugador
{
    public class ListaModuloController
    {
        Modulo lista_modulos;

        public ListaModuloController(int id_module, String name_module, String state_module, String url_img_module) {
            lista_modulos = new Modulo(id_module,name_module,state_module,url_img_module);
        }

        public void cargar_modulos(HtmlContainerControl contenedor_modulo) {

           lista_modulos.cargar_modulos( contenedor_modulo);
        }


    }
}