using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniamazonia_Juego.Controllers;

namespace Uniamazonia_Juego.Views.Administrador
{
    public partial class EliminarModulo : System.Web.UI.Page
    {
        ModuloController controlador_modulo;
        DataTable consulta_lista_modulos = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {

            cargar_modulo_BD();



        }

   


      

        protected void Button1_Click(object sender, EventArgs e)
        {
            // eliminar 

            controlador_modulo = new ModuloController(0, this.lista_modulos.SelectedValue, "","");

            if (controlador_modulo.eliminar_modulo())
            {

                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({position: 'center',type: 'success',title: 'Eliminacion Exitosa!',showConfirmButton: false,timer: 2500}) </script>");
            }
            else
            {

                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({type: 'error',title: 'Modulo No! Eliminado',text: 'Algo salió mal!',timer: 3200}) </script>");
            }

            /// actualziando los campos

            if (!Page.IsPostBack) return;
            this.lista_modulos.Items.Clear();
            this.lista_modulos.Items.Insert(0, new ListItem("-- Seleccione un Modulo -- "));
            cargar_modulo_BD();



        }


        public void cargar_modulo_BD() {

            controlador_modulo = new ModuloController(0, "", "", "");
            consulta_lista_modulos = controlador_modulo.consulta_combox_nombre();
            this.lista_modulos.DataTextField = "nombre_modulo";
            this.lista_modulos.DataSource = consulta_lista_modulos;
            lista_modulos.DataBind();


        }
    }
}