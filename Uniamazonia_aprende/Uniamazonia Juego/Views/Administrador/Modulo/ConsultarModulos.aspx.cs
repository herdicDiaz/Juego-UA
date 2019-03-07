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
    public partial class ConsultarModulos : System.Web.UI.Page
    {
        ModuloController controlador_modulo = new ModuloController(0, "", "","");

        DataTable consulta_modulo_general = new DataTable();

       
        readonly PagedDataSource fuente = new PagedDataSource();


        private int CurrentPage
        {
            get
            {
                if (ViewState["CurrentPage"] == null)
                {
                    return 0;
                }
                return ((int)ViewState["CurrentPage"]);
            }
            set
            {
                ViewState["CurrentPage"] = value;
            }
        }

        public void imageButton_Click(object sender, EventArgs e)
        {

            ClientScript.RegisterClientScriptBlock(this.GetType(), "Pruebas", "window.open('/Web_forms_reports/ReporteModulo.aspx', '_blank');", true);
        }



        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            cargar_modulos_BD();


        }

        public void cargar_modulos_BD() {
            consulta_modulo_general = controlador_modulo.consulta_modulos();
            this.lista_filtro_modulo.DataSource = consulta_modulo_general;
            lista_filtro_modulo.DataBind();

        }
        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.lista_filtro_modulo.PageIndex = e.NewPageIndex;
            this.cargar_modulos_BD();
        }

        protected void buscar_modulo_Click(object sender, EventArgs e)
        {
            // buscar
            realizar_filtrado();
        }

        public void realizar_filtrado()
        {
            if (String.IsNullOrWhiteSpace(this.filtro_prueba.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({type: 'error',title: 'Ingrese Un Dato',text: 'Algo salió mal!',timer: 2950}) </script>");

            }
            else
            {
                lista_filtro_modulo.DataSource = controlador_modulo.filtrando_registros_modulo(this.filtro_prueba.Text);
                lista_filtro_modulo.DataBind();

            }


        }
    }
}