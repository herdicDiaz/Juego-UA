using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniamazonia_Juego.Controllers;

namespace Uniamazonia_Juego.Views.Administrador
{
    public partial class Welcome : System.Web.UI.Page
    {
        InicioController controlador_inicio;





        protected void Page_Load(object sender, EventArgs e)
        {

            
            // pasarle el privilegio del jugador
            controlador_inicio = new InicioController(0, "", "", "", "", "J");
            controlador_inicio.carga_numero_carusel(this.numero_carusel);
            controlador_inicio.cargar_inicio(this.carusel_unico);

        }
    }
}