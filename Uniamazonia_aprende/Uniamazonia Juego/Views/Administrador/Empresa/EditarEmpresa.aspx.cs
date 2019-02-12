using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniamazonia_Juego.Conexion;
using Uniamazonia_Juego.Controllers;

namespace Uniamazonia_Juego.Views.Administrador.Empresa
{
    public partial class CrearEmpresa : System.Web.UI.Page
    {
       private EmpresaController controlador_empresa = new EmpresaController(0,"","",0);



        protected void Page_Load(object sender, EventArgs e)
        {
            this.nombre_actual.ReadOnly = true;
            this.nit_actual.ReadOnly = true;
           


            this.nombre_actual.Text = controlador_empresa.consulta_nombre_BD();
            this.descripcion_actual.InnerText = controlador_empresa.consulta_descripcion_BD();
            this.nit_actual.Text = controlador_empresa.consulta_nit_BD();


            if (Page.IsPostBack) return;
            if (controlador_empresa.estado_conexion_BD())
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({position: 'center',type: 'success',title: 'Conexion Establecida BD',showConfirmButton: false,timer: 1500}) </script>");
            }
            else {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({type: 'error',title: 'Conexion BD NO establecidad!',text: 'Algo salió mal!',timer: 2200}) </script>");

            }



        }
        // metodos

        protected void editar_empresa_Click(object sender, EventArgs e)
        {
            controlador_empresa = new EmpresaController(0,this.nuevo_nombre.Text,this.nueva_descripcion.InnerText, Convert.ToInt32(this.nuevo_nit_empresa.Text));
            if (controlador_empresa.actualizar_empresa())
            {


                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({position: 'center',type: 'success',title: 'Registro Exitoso',showConfirmButton: false,timer: 2500}) </script>");
                this.nuevo_nombre.Text = "";
                this.nueva_descripcion.InnerText = "";
                this.nuevo_nit_empresa.Text = "";

              
                
                Response.Redirect("~/Views/Administrador/Welcome.aspx");

            }
            else {

                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({type: 'error',title: 'No Actualizado!',text: 'Algo salió mal!',timer: 3200}) </script>");
            }



        }

      

    }
}