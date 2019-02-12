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
    public partial class CrearPrueba : System.Web.UI.Page
    {
        ContenidoController controlador_contenido;
        PruebaController controlador_prueba;
        DataTable consulta_lista_contenido = new DataTable();


        protected void Page_Load(object sender, EventArgs e)
        {
            cargar_contenido_BD();

        }

        protected void crear_prueba_Click(object sender, EventArgs e)
        {



            if (String.IsNullOrWhiteSpace(this.name_prueba.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({type: 'error',title: 'Complete Todos Los Campos',text: 'Algo salió mal!',timer: 3200}) </script>");
            }
            else
            {
                controlador_prueba = new PruebaController(0, this.name_prueba.Text, 0, "A", 0);
                if (controlador_prueba.crear_prueba(this.lista_contenidoss.SelectedValue))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({position: 'center',type: 'success',title: 'Registro Exitoso',timer: 2500}) </script>");

                    this.name_prueba.Text = "";
                }
                else
                {

                    ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({type: 'error',title: 'Prueba No Creada',text: 'Algo salió mal!',timer: 3200}) </script>");
                }
                
                // actualizando campos
                if (!Page.IsPostBack) return;
                this.lista_contenidoss.Items.Clear();
                this.lista_contenidoss.Items.Insert(0, new ListItem("-- Seleccionar Contenido -- "));
                cargar_contenido_BD();
            }

        }



        private void cargar_contenido_BD()
        {
            controlador_contenido = new ContenidoController(0, "", "", "", "");
            consulta_lista_contenido = controlador_contenido.consulta_combox_nombre();
            this.lista_contenidoss.DataTextField = "nombre_contenido";
            this.lista_contenidoss.DataSource = consulta_lista_contenido;
            lista_contenidoss.DataBind();


        }


    }
}
