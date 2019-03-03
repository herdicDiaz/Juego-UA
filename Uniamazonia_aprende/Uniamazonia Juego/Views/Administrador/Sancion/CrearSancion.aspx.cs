using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniamazonia_Juego.Controllers;

namespace Uniamazonia_Juego.Views.Administrador.Sancion
{
    public partial class CrearSancion : System.Web.UI.Page
    {
        SancionController SancionC = new SancionController();
    

        protected void btnCrearSancion(object sender, EventArgs e)
            {
            String descripcion = txtDescripcion.Value;
            String Url = TxtUrlVideo.Value;
            Boolean consulta = SancionC.insertarSancion(descripcion,Url ,"0");

            if (consulta==true)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({position: 'center',type: 'success',title: 'Exitoso!',text:'Sanción creada satisfatoriamente.',timer:3000}) </script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({position: 'center',type: 'error',title: 'Vaya!',text:'Algo salio mal.',timer:3000}) </script>");
            }

        }
    }
}