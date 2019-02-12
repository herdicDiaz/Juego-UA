using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniamazonia_Juego.Controllers;

namespace Uniamazonia_Juego.Views.Administrador.Sub_Menu
{
    public partial class EliminarSubMenu : System.Web.UI.Page
    {
        VistaController controlador_vista;

        DataTable consulta_menu_padre = new DataTable();
        DataTable consulta_menu_hijo = new DataTable();


        protected void Page_Load(object sender, EventArgs e)
        {
           // https://lipis.github.io/bootstrap-sweetalert/%7D

            this.nombre_menu_padre.ReadOnly = true;
            cargar_menu_padre_aux();
        }

        public void cargar_menu_hijo(String nombre_padre)
        {
            controlador_vista = new VistaController(0, "", "", "", "", 0);
            int aux_id = controlador_vista.id_menu_padre(nombre_padre);
            controlador_vista = new VistaController(aux_id, "", "", "", "", 0);
            consulta_menu_hijo = controlador_vista.consulta_menu_hijo();
            this.lista_menu_hijo.DataTextField = "descripcion";
            this.lista_menu_hijo.DataSource = consulta_menu_hijo;
            lista_menu_hijo.DataBind();

        }
        public void cargar_menu_padre_aux()
        {
            controlador_vista = new VistaController(0, "", "", "", "", 0);
            consulta_menu_padre = controlador_vista.consulta_combox_nombre();
            this.menu_padre_aux.DataTextField = "descripcion";
            this.menu_padre_aux.DataSource = consulta_menu_padre;
            menu_padre_aux.DataBind();

        }

        protected void eliminar_menu_HIJO_Click(object sender, EventArgs e)
        {

            controlador_vista = new VistaController(0, "", "D", this.lista_menu_hijo.SelectedValue, "", 0);

            if (controlador_vista.eliminar_sub_menu())
            {

                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({position: 'center',type: 'success',title: 'Eliminacion Exitosa!',showConfirmButton: false,timer: 2500}) </script>");
               
            }
            else
            {

                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({type: 'error',title: 'Sub Menu No! Eliminado',text: 'Algo salió mal!',timer: 3200}) </script>");
            }

            // actualziando los campos lista menu hijo
            actualizar_campo_menu_hijo();


        }
        public void actualizar_campo_menu_hijo()
        {
            if (!Page.IsPostBack) return;
            this.lista_menu_hijo.Items.Clear();
            this.lista_menu_hijo.Items.Insert(0, new ListItem("-- Seleccione un Sub Menu -- "));


        }
        protected void menu_padre_aux_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.nombre_menu_padre.Text = this.menu_padre_aux.SelectedValue;
            actualizar_campo_menu_hijo();
            cargar_menu_hijo(this.menu_padre_aux.SelectedValue);


            if (!Page.IsPostBack) return;
            this.menu_padre_aux.Items.Clear();
            this.menu_padre_aux.Items.Insert(0, new ListItem("-- Seleccione un Menu-- "));
            cargar_menu_padre_aux();
        }


    }
}