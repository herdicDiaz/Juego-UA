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
    public partial class ConsultarPrueba : System.Web.UI.Page
    {
        PruebaController controlador_prueba = new PruebaController(0,"",0,"",0);
        ModuloController controlador_modulo = new ModuloController(0,"","","");
        ContenidoController controlador_contenido = new ContenidoController(0,"","","","");
        DataTable consulta_prueba_general = new DataTable();
        DataTable consulta_modulos_BD = new DataTable();
        DataTable consulta_contenido_BD = new DataTable();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            this.cargar_pruebas_gridView();
            cargar_modulo_BD();


        }

        public void cargar_modulo_BD() {
            //if (Page.IsPostBack) return;
            consulta_modulos_BD = controlador_modulo.consulta_combox_nombre();
            this.lista_modulo.DataTextField = "nombre_modulo";
            this.lista_modulo.DataSource = consulta_modulos_BD;
            lista_modulo.DataBind();
        }

        public void cargar_contenido_BD(string nombre_modulo) {
            consulta_contenido_BD = controlador_contenido.consulta_contenido_x_modulo_nombre(nombre_modulo);
            this.lista_contenido.DataTextField = "nombre_contenido";
            this.lista_contenido.DataSource = consulta_contenido_BD;
            lista_contenido.DataBind();



        }

        public void cargar_pruebas_gridView() {
            consulta_prueba_general = controlador_prueba.consulta_pruebas_general();

            this.lista_filtro_pruebas.Visible = true;
            lista_filtro_pruebas.DataSource = consulta_prueba_general;
            lista_filtro_pruebas.DataBind();



         
        }

        public void actualizar_lista_modulos() {
          
     


        }

        public void actualizar_lista_contenido() {
            if (!Page.IsPostBack) return;
            this.lista_contenido.Items.Clear();
            this.lista_contenido.Items.Insert(0, new ListItem("-- Seleccione un Contenido -- "));



        }


        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.lista_filtro_pruebas.PageIndex = e.NewPageIndex;
            this.cargar_pruebas_gridView();
        }


        protected void buscar_pruebas_Click(object sender, EventArgs e)
        {
            // buscar
            realizar_filtrado();


        }


        private void realizar_filtrado() {
            if (String.IsNullOrWhiteSpace(this.filtro_prueba.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({type: 'error',title: 'Ingrese Un Dato',text: 'Algo salió mal!',timer: 2950}) </script>");

            }
            else
            {
                lista_filtro_pruebas.DataSource = controlador_prueba.filtrando_registros_prueba(this.filtro_prueba.Text);
                lista_filtro_pruebas.DataBind();

            }


        }

        protected void lista_contenido_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.contenido_actual.Text = this.lista_contenido.SelectedValue;
            lista_filtro_pruebas.DataSource = controlador_prueba.consulta_prueba_x_contenido(this.lista_contenido.SelectedValue);
            lista_filtro_pruebas.DataBind();
            
        }

        protected void lista_modulo_SelectedIndexChanged(object sender, EventArgs e)
        {
            actualizar_lista_contenido();
            cargar_contenido_BD(this.lista_modulo.SelectedValue);
           
        }

        protected void imgenButton_Click(object sender, ImageClickEventArgs e)
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "Pruebas", "window.open('/Web_forms_reports/ReporteListaPruebas.aspx', '_blank');", true);
        }
    }
}