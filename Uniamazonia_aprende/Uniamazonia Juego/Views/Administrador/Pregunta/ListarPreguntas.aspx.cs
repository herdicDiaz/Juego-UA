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
                //consulta_pruebas = pruebaC.consulta_combox_nombre();
                //this.Lista_pruebas.DataTextField = "nombre_prueba";
                //this.Lista_pruebas.DataSource = consulta_pruebas;
                //this.Lista_pruebas.DataBind();
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
                if (e.CommandName == "editar")
                {
                    Response.Redirect("~/Views/Administrador/Pregunta/EditarPregunta.aspx?id_pregunta=" + id_pregunta);
                }
                if (e.CommandName == "eliminar")
                {
                    Boolean Delete = preguntaC.Delete_pregunta(id_pregunta);
                    BindGridView();
                    //ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "denegadoAlert('Esta seguro de eliminar la pregunta " + id_pregunta + "');", true);
                }
            }
   
        }

        

        protected void BuscarEnGrid(object sender, EventArgs e)
        {
            String palabra = Txt_busqueda.Text;
            //int id_prueba;
            //if (Lista_pruebas.Text=="0")
            //{
            //    id_prueba = 1;
            //}
            //else
            //{
            //    DataTable consultaPrueba = pruebaC.consultar_pruebas(Lista_pruebas.Text);
            //    id_prueba = Convert.ToInt32(consultaPrueba.Rows[0]["id_prueba"].ToString());
            //}
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