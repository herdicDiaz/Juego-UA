using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniamazonia_Juego.Controllers;

namespace Uniamazonia_Juego.Views.Administrador.Sancion
{
    public partial class EditarSancion : System.Web.UI.Page
    {
        SancionController SancionC = new SancionController();
        String idsancion;
        String estado_consulta;
        protected void Page_Load(object sender, EventArgs e)
        {
            idsancion = Request.QueryString["idsancion"];
            DataTable consulta = SancionC.ConsultaParametroIdsancion(idsancion);
            estado_consulta = consulta.Rows[0]["estado_sancion"].ToString();
            if (Page.IsPostBack==false)
            {
                TxtDescripcion.Value = consulta.Rows[0]["descripcion"].ToString();
                TxtUrl.Value = consulta.Rows[0]["url_video"].ToString();

               
            }
        }

        protected void guardarSancion(object sender, EventArgs e)
        {
            String descripcion = TxtDescripcion.Value;
            String url = TxtUrl.Value;
            Boolean consulta = SancionC.updateSancion(descripcion, url, idsancion);
            if (consulta==true)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({position: 'center',type: 'success',title: 'Exitoso!',text:'Sanción actualizada satisfatoriamente.',timer:3000}) </script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({position: 'center',type: 'error',title: 'Vaya!',text:'Algo salio mal.',timer:3000}) </script>");
            }
        }


    }
}