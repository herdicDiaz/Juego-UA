using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniamazonia_Juego.Controllers;

namespace Uniamazonia_Juego.Views.VistasJugador.ConsulraContenido
{
    public partial class ListaContenido : System.Web.UI.Page
    {
        public ContenidoController controlador_contenido;


        protected void Page_Load(object sender, EventArgs e)
        {
            // saber el id del modulo que hizo clic.
            controlador_contenido = new ContenidoController(0, "", "", "", "");

            controlador_contenido.crear_contenido_dinamico(this.contenidoo, 2);


        }
    }
}