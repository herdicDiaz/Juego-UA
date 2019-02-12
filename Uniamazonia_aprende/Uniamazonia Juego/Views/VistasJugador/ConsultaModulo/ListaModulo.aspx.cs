using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniamazonia_Juego.Controllers;
using Uniamazonia_Juego.Controllers.Jugador;

namespace Uniamazonia_Juego.Views.VistasJugador
{
    public partial class ListaModulo : System.Web.UI.Page
    {
        public DataTable datos;
        ListaModuloController controlador_lista_modulo;
        ModuloController moduloController = new ModuloController();
        protected void Page_Load(object sender, EventArgs e)
        {
            //controlador_lista_modulo = new ListaModuloController(0, "", "", "");
            //controlador_lista_modulo.cargar_modulos(lista_modulos);
            if (!IsPostBack)
            {
                datos = moduloController.consulta_modulos();
                listView1.DataSource = datos;
                listView1.DataBind();
           
            }
        }



        public void btnVerContenidos(object sender, EventArgs e)

        {
            Button btn = (Button)sender;
            int id_modelo = Convert.ToInt32(btn.CommandArgument.ToString());
            Response.Redirect("~/Views/VistasJugador/Contenido/ListaContenido.aspx?id_modulo="+ id_modelo);
        }

        protected void btnIngresarModulo_Command(object sender, CommandEventArgs e)
        {

        }
    }
}