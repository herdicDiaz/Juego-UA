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
    public partial class ConsultarContenido : System.Web.UI.Page
    {
        ContenidoController controlador_contenido = new ContenidoController(0,"","","","");
        DataTable consulta_contenido_general = new DataTable();
        DataTable consulta_modulos_BD = new DataTable();
        ModuloController controlador_modulo = new ModuloController(0,"","","");




        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            cargar_contenido_BD();
            cargar_modulo_BD();
        }

        public void cargar_modulo_BD() {
            consulta_modulos_BD = controlador_modulo.consulta_combox_nombre();
            this.lista_modulo.DataTextField = "nombre_modulo";
            this.lista_modulo.DataSource = consulta_modulos_BD;
            lista_modulo.DataBind();


        }

        public void imageButton_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "Pruebas", "window.open('/Web_forms_reports/ReporteContenido.aspx', '_blank');", true);
        }

        public void cargar_contenido_BD()
        {
            consulta_contenido_general = controlador_contenido.consultar_contenido();
            this.lista_filtro_contenido.DataSource = consulta_contenido_general;
            lista_filtro_contenido.DataBind();
        }

        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.lista_filtro_contenido.PageIndex = e.NewPageIndex;
            this.cargar_contenido_BD();
        }

        public void realizar_filtrado()
        {
            if (String.IsNullOrWhiteSpace(this.filtro_contenido.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({type: 'error',title: 'Ingrese Un Dato',text: 'Algo salió mal!',timer: 2950}) </script>");

            }
            else
            {
                lista_filtro_contenido.DataSource = controlador_contenido.filtrando_registros_contenido(this.filtro_contenido.Text);
                lista_filtro_contenido.DataBind();
            }


        }

        protected void lista_modulo_SelectedIndexChanged(object sender, EventArgs e)
        {
            // al seleccionar un modulo
            if (!this.lista_modulo.SelectedValue.Equals(""))
            {
                lista_filtro_contenido.DataSource = controlador_contenido.consulta_contenido_x_modulo(this.lista_modulo.SelectedValue);
                lista_filtro_contenido.DataBind();

            }


        }

        protected void buscar_contenido_Click1(object sender, EventArgs e)
        {
            // filtro
            realizar_filtrado();
        }
    }
}