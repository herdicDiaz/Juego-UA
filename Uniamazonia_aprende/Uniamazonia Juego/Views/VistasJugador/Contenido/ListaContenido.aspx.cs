using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniamazonia_Juego.Controllers;

namespace Uniamazonia_Juego.Views.VistasJugador.ConsulraContenido
{
    public partial class ListaContenido : System.Web.UI.Page
    {
        ContenidoController ContenidoM = new ContenidoController();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack==false)
            {
                // saber el id del modulo que hizo clic.
                int id_modulo = Convert.ToInt32(Request.QueryString["id_modulo"]);
                DataTable Consulta = ContenidoM.consultar_contenido(id_modulo);
                ListView1.DataSource = Consulta;
                ListView1.DataBind();
            }
     

        }

        public void btnPrueba(object sender, EventArgs e)
        {
            Button button1 = (Button)sender;
            int id = Convert.ToInt32(button1.CommandArgument.ToString());
            Response.Redirect("~/Views/VistasJugador/Pruebas/ListaPruebas.aspx?id_contenido="+id);
            //Response.Redirect("~/Views/VistasJugador/Test/Test.aspx?id_contenido="+id);
        }

    }
}