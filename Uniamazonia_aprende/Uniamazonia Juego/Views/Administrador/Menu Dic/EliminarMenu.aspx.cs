using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniamazonia_Juego.Controllers;

namespace Uniamazonia_Juego.Views.Administrador.Menu_Dic
{
    public partial class EliminarMenu : System.Web.UI.Page
    {
        VistaController controlador_vista;

        DataTable consulta_menu_padre = new DataTable();
        DataTable consulta_menu_hijo = new DataTable();


        protected void Page_Load(object sender, EventArgs e)
        {
            cargar_menu_padre();
        }

        public void cargar_menu_padre() {
            controlador_vista = new VistaController(0, "", "", "", "", 0);
            consulta_menu_padre = controlador_vista.consulta_combox_nombre();
            this.lista_menu_padre.DataTextField = "descripcion";
            this.lista_menu_padre.DataSource = consulta_menu_padre;
            lista_menu_padre.DataBind();

        }



        public void actualizar_campos_padre() {
            if (!Page.IsPostBack) return;
            this.lista_menu_padre.Items.Clear();
            this.lista_menu_padre.Items.Insert(0, new ListItem("-- Seleccione un Menu-- "));
            cargar_menu_padre();
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            controlador_vista = new VistaController(0, "", "D", this.lista_menu_padre.SelectedValue, "", 0);
            if (controlador_vista.eliminar_menu())
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({position: 'center',type: 'success',title: 'Eliminacion Exitosa!',showConfirmButton: false,timer: 2500}) </script>");
         
            }
            else
            {

                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({type: 'error',title: 'Menu No! Eliminado',text: 'Algo salió mal!',timer: 3200}) </script>");
            }
            // actualziando los campos lista menu padre
            actualizar_campos_padre();
        }
    }
}