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
    public partial class EditarSubMenu : System.Web.UI.Page
    {
        VistaController controlador_vista;
        DataTable consulta_menu_Padre = new DataTable();
        DataTable consulta_menu_HIjo = new DataTable();


        protected void Page_Load(object sender, EventArgs e)
        {
            cargar_menu_padre();
        }


        public void cargar_menu_padre() {
            controlador_vista = new VistaController(0, "", "", "", "", 0);
            consulta_menu_Padre = controlador_vista.consulta_combox_nombre();
            this.lista_menu_padre_aux.DataTextField = "descripcion";
            this.lista_menu_padre_aux.DataSource = consulta_menu_Padre;
            lista_menu_padre_aux.DataBind();
        }





        protected void actualizar_capos_hijo(object sender, EventArgs e)
        {
            // se dispara al seleccionar un item en la lista submenu
            this.nombre_menu_hijo.Text = lista_menu_hijo.SelectedValue;
            controlador_vista = new VistaController(0, "", "", this.lista_menu_hijo.SelectedValue, "", 0);
            this.nueva_url_menu_hijo.Text = controlador_vista.url_BD();

            // actualziando los campos lista menu hijo

        }



        protected void guardar_menu_HIJO_Click(object sender, EventArgs e)
        {
            // guardar
            controlador_vista = new VistaController(0, this.nueva_url_menu_hijo.Text, "", this.nombre_menu_hijo.Text, "", 0);
            if (controlador_vista.editar_menu_hijos(this.lista_menu_hijo.SelectedValue))
            {

                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({position: 'center',type: 'success',title: 'Proceso Exitoso!',showConfirmButton: false,timer: 2500}) </script>");
                this.nombre_menu_hijo.Text = "";
                this.nueva_url_menu_hijo.Text = "";
                
                
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({type: 'error',title: 'No Actualizado (Sub Menu)!',text: 'Algo salió mal!',timer: 3200}) </script>");
            }

            // actualziando los campos lista menu padre
            actualizar_campos_menuPADRE();
            // actualziando los campos lista menu hijo

            actualizar_campos_menuHIJO();

        }
        public void actualizar_campos_menuPADRE()
        {
            if (!Page.IsPostBack) return;
            this.lista_menu_padre_aux.Items.Clear();
            this.lista_menu_padre_aux.Items.Insert(0, new ListItem("-- Seleccione Menu-- "));
            cargar_menu_padre();
        }

            public void actualizar_campos_menuHIJO()
        {
            if (!Page.IsPostBack) return;
            this.lista_menu_hijo.Items.Clear();
            this.lista_menu_hijo.Items.Insert(0, new ListItem("-- Seleccione -- "));


        }


        public void cargar_hijos_padre(String nombre_padre) {
            controlador_vista = new VistaController(0, "", "", "", "", 0);
            int aux_id = controlador_vista.id_menu_padre(nombre_padre);


            controlador_vista = new VistaController(aux_id, "", "", "", "", 0);
            consulta_menu_HIjo = controlador_vista.consulta_menu_hijo();
            this.lista_menu_hijo.DataTextField = "descripcion";
            this.lista_menu_hijo.DataSource = consulta_menu_HIjo;
            lista_menu_hijo.DataBind();

        }


        protected void actualizar_capos_padre(object sender, EventArgs e)
        {
            actualizar_campos_menuHIJO();
            cargar_hijos_padre(this.lista_menu_padre_aux.SelectedValue);
            actualizar_campos_menuPADRE();

        }

    }
        
}