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
    public partial class EditarSancion : System.Web.UI.Page
    {
         PuntuacionController PuntuaciónC = new PuntuacionController();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack==false)
            {
                int id_puntuacion = Convert.ToInt32(Request.QueryString["id_puntuacion"]);
                DataTable consulta = PuntuaciónC.ConsultarPuntos();
                String puntos = consulta.Rows[0]["valor_punto"].ToString();
                TexboxPuntos.Text = puntos;
            }
        }



        public void ButtonGuardar_Click(object sender, EventArgs e)
        {
            String puntos = TexboxPuntos.Text;
            Boolean update = PuntuaciónC.UpdatePuntos(Convert.ToInt32(puntos));
        }


    }
}