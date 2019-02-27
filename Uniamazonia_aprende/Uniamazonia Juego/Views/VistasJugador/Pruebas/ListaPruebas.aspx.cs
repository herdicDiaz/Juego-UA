using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniamazonia_Juego.Controllers;

namespace Uniamazonia_Juego.Views.VistasJugador.Pruebas
{
    public partial class ListaPruebas : System.Web.UI.Page
    {
        PruebaController pruebaC = new PruebaController();
        Usuario_PruebaController usuario_pruebaC = new Usuario_PruebaController();
        PreguntaController preguntaC = new PreguntaController();
        DataTable Consulta = new DataTable();
        JugadorController JugadorC = new JugadorController();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack==false)
            {
                int id_contenido = Convert.ToInt32(Request.QueryString["id_contenido"]);
                Consulta = pruebaC.consulta_parametro_fk_contenido(id_contenido);
                ListPruebas.DataSource = Consulta;
                ListPruebas.DataBind();
            }
       


        }


        public void Metodo_inciar_prueba(object sender, EventArgs e)
        {
            Button boton_iniciar=(Button)sender;
            String id_prueba = boton_iniciar.CommandArgument.ToString();
            int id_usuario =Convert.ToInt32(Session["id_usuario"].ToString());
            DataTable consultaJugador = JugadorC.ConsultaFkUsuario(id_usuario);
            int id_jugador =Convert.ToInt32(consultaJugador.Rows[0]["id_jugador"].ToString());

            Consulta = usuario_pruebaC.Consulta_parametro_fk_prueba_fk_jugador(Convert.ToInt32(id_prueba),id_jugador);
            DataTable Consulta_pregunta = preguntaC.consultaParametroFk_Prueba(id_prueba);
            if (Consulta_pregunta.Rows.Count==0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({position: 'center',type: 'error',title: 'Vaya!',text:'Esta prueba no tiene preguntas asignadas.',timer:3000}) </script>");
            }
            else
            {
                if (Consulta.Rows.Count != 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({position: 'center',type: 'error',title: 'Vaya!',text:'Ya realizaste esta prueba.',timer:3000}) </script>");
                }
                else
                {
                    Response.Redirect("~/Views/VistasJugador/Test/Test.aspx?id_prueba=" + id_prueba);

                }
            }
       
        }
    }
}