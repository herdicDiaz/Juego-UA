using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniamazonia_Juego.Controllers;
namespace Uniamazonia_Juego.Views.Administrador.Puntuacion
{
    public partial class Puntuación : System.Web.UI.Page
    {
        PuntuacionController PuntuacionC = new PuntuacionController();
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable consulta = new DataTable();
            consulta = PuntuacionC.ConsultarPuntos();
            GridView.DataSource = consulta;
            GridView.DataBind();

        }

        protected void GridView_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName=="editar")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                int id_puntuacion =Convert.ToInt32( GridView.DataKeys[index].Value.ToString());
                Response.Redirect("~/Views/Administrador/Puntuacion/EditarPuntuacion.aspx?id_puntuacion="+ id_puntuacion);
            }
        }
    }
}