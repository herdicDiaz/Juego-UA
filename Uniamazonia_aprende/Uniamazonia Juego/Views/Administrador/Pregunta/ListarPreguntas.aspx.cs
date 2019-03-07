using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniamazonia_Juego.Controllers;

namespace Uniamazonia_Juego.Views.Administrador.Pregunta
{
    public partial class ListarPreguntas : System.Web.UI.Page
    {
        DataTable consulta_pruebas = new DataTable();
        DataTable consulta_preguntas = new DataTable();
        PruebaController pruebaC = new PruebaController();
        PreguntaController preguntaC = new PreguntaController();
        RespuestaController respuestaC = new RespuestaController();
        EditarPregunta parametroEditarPregunta = new EditarPregunta();
        readonly PagedDataSource fuente = new PagedDataSource();
        String id_pregunta;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                BindGridView();
            }

            //GridView
            if (!IsPostBack)
            {
                // Enable the GridView paging option and  
                // specify the page size. 
                Tabla_Preguntas.AllowPaging = true;
                Tabla_Preguntas.PageSize = 5;


                // Enable the GridView sorting option. 
                Tabla_Preguntas.AllowSorting = true;


                // Initialize the sorting expression. 
                ViewState["SortExpression"] = "id_pregunta ASC";

                // Populate the GridView. 
                BindGridView();
            }
        }

        private void BindGridView()
        {
            {
                DataTable consulta = preguntaC.Listar_grid();
                Tabla_Preguntas.DataSource = consulta;
                Tabla_Preguntas.DataBind();
            }
        }

        protected void Metodo_Paginacion(object sender, GridViewPageEventArgs e)
        {
            Tabla_Preguntas.PageIndex = e.NewPageIndex;
            BindGridView();
        }

        public void imageButton_Click(object sender, EventArgs e){
            ClientScript.RegisterClientScriptBlock(this.GetType(), "Pruebas", "window.open('/Web_forms_reports/ReportePreguntas.aspx', '_blank');", true);
        }


        protected void eventos_grid(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName=="editar" || e.CommandName=="eliminar")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                id_pregunta = Tabla_Preguntas.DataKeys[index].Value.ToString();
                Session["id_pregunta"]= id_pregunta;
                if (e.CommandName == "editar")
                {
                    Response.Redirect("~/Views/Administrador/Pregunta/EditarPregunta.aspx?id_pregunta=" + id_pregunta);
                }
                if (e.CommandName == "eliminar")
                {

                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#deleteModal').modal('show');");
                    sb.Append(@"</script>");
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "deleteModal", sb.ToString(), false);
               
                }
            }
   
        }


        public void btnEliminar_Click(object sender, EventArgs e)
        {
            String pk_pregunta = Session["id_pregunta"].ToString();
            Boolean Delete = preguntaC.Delete_pregunta(pk_pregunta);
            BindGridView();
        }



        protected void BuscarEnGrid(object sender, EventArgs e)
        {
            String palabra = Txt_busqueda.Text;
            DataTable consulta = preguntaC.buscarEnGridParametroPalabra(palabra);
            Tabla_Preguntas.DataSource = consulta;
            Tabla_Preguntas.DataBind();
        }
        protected void limpiarGrid(object sender, EventArgs e){
            Txt_busqueda.Text = "";
            BindGridView();
        }




    }
}