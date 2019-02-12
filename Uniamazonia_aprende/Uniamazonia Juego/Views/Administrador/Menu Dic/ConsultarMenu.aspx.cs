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
    public partial class ConsultarMenu : System.Web.UI.Page
    {
        VistaController controlador_vista;
        DataTable consulta = new DataTable();
        DataTable consulta_menu_hijo = new DataTable();

        RolController controlador_rol;


        readonly PagedDataSource fuente = new PagedDataSource();

        protected void Page_Load(object sender, EventArgs e)
        {

            cargar_gridview();
        }



        public void cargar_menu_padre(int aux_rol)
        {
            controlador_rol = new RolController(aux_rol, "", "");
            consulta = controlador_rol.consulta_menu_unico();
            this.lista_menu_padre.DataTextField = "descripcion";
            this.lista_menu_padre.DataSource = consulta;
            lista_menu_padre.DataBind();
        }

        protected void mostrar_menu_hijo(object sender, EventArgs e)
        {
            cargar_menu_hijo_gridview();
        }

        public void cargar_gridview()
        {
            controlador_vista = new VistaController(0, "", "", "", "", 0);

            consulta_menu_hijo = controlador_vista.consulta_menu_hijo_general();
            this.lista_menu_hijo.Visible = true;
            this.lista_menu_hijo.DataSource = consulta_menu_hijo;
            lista_menu_hijo.DataBind();


        }

        public void cargar_menu_hijo_gridview()
        {
            controlador_vista = new VistaController(0, "", "", "", "", 0);
            int aux_id = controlador_vista.id_menu_padre(lista_menu_padre.SelectedValue);
            controlador_vista = new VistaController(aux_id, "", "", "", "", 0);
            consulta_menu_hijo = controlador_vista.consulta_menu_hijo();
            this.lista_menu_hijo.Visible = true;
            this.lista_menu_hijo.DataSource = consulta_menu_hijo;
            lista_menu_hijo.DataBind();

        }


        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.lista_menu_hijo.PageIndex = e.NewPageIndex;
            this.cargar_gridview();

        }

        protected void rd_jugador_CheckedChanged(object sender, EventArgs e)
        {
            // realizar filtro de menu prueba para el rol jugador
            actualizar_lista();
            cargar_menu_padre(2);

        }

        protected void rd_admin_CheckedChanged(object sender, EventArgs e)
        {
            // realizar filtro para el rol administrador
            cargar_menu_padre(1);
        }

        public void actualizar_lista()
        {
            if (!Page.IsPostBack) return;
            this.lista_menu_padre.Items.Clear();
            this.lista_menu_padre.Items.Insert(0, new ListItem("-- Seleccione Menu Padre -- "));
        }

        protected void traer_menu_hijo_Click(object sender, EventArgs e)
        {
            realizar_filtrado();
        }

        public void realizar_filtrado() {
            if (String.IsNullOrWhiteSpace(this.filtro_menu_hijo.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({type: 'error',title: 'Ingrese Un Dato',text: 'Algo salió mal!',timer: 2950}) </script>");
            }
            else {

                lista_menu_hijo.DataSource = controlador_vista.filtro_menu_hijo(this.filtro_menu_hijo.Text);
                lista_menu_hijo.DataBind();
            }


        }
    }
}