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
    public partial class EditarPrueba : System.Web.UI.Page
    {
        PruebaController controlador_prueba;
        DataTable consulta_lista_prueba = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            cargar_pruebas();
        }

        protected void guadar_edicion_Click(object sender, EventArgs e)
        {

            if (String.IsNullOrEmpty(this.nuevo_nombre_txt.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({type: 'error',title: 'Completo Todos Los Campos',text: 'Algo salió mal!',timer: 3200}) </script>");
            }
            else
            {
                controlador_prueba = new PruebaController(0, this.nuevo_nombre_txt.Text,0,"", 0);
                if (controlador_prueba.editar_pruebas(this.lista_pruebas.SelectedValue))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({position: 'center',type: 'success',title: 'Cambios Guardados',showConfirmButton: false,timer: 2500}) </script>");
                    this.nuevo_nombre_txt.Text = "";
                }
                else
                {

                    ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({type: 'error',title: 'Cambios No! Guardados',text: 'Algo salió mal!',timer: 3200}) </script>");

                }

                // actualziando los campos las pruebas

                if (!Page.IsPostBack) return;
                this.lista_pruebas.Items.Clear();
                this.lista_pruebas.Items.Insert(0, new ListItem("-- Seleccione una prueba -- "));
                cargar_pruebas();
            }
        }


        private void cargar_pruebas()
        {
            controlador_prueba = new PruebaController(0, "", 0, "", 0);
            consulta_lista_prueba = controlador_prueba.consulta_combox_nombre();
            this.lista_pruebas.DataTextField = "nombre_prueba";
            this.lista_pruebas.DataSource = consulta_lista_prueba;
            lista_pruebas.DataBind();


        }
    }
}