using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.HtmlControls;
using Uniamazonia_Juego.Models;

namespace Uniamazonia_Juego.Controllers
{
    public class InicioController
    {
        Inicio inicio;

        // constructor
        public InicioController(int id_inicio, string titulo_inicio, string descripcion_inicio, string url_img_inicio, string estado_inicio, string privilegio_inicio)
        {
            inicio = new Inicio(id_inicio, titulo_inicio, descripcion_inicio, url_img_inicio, estado_inicio, privilegio_inicio);

        }

        // metodos
        public void cargar_inicio(HtmlContainerControl contenedor_inicio)
        {
            inicio.cargar_inicio(contenedor_inicio);
        }

        public void carga_numero_carusel(HtmlContainerControl contenedor_numero_carusel)
        {
           

            inicio.carga_numero_carusel(contenedor_numero_carusel);
        }

    }
}