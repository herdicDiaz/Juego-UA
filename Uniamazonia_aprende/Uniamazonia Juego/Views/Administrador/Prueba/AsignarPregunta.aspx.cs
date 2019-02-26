using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniamazonia_Juego.Controllers;

namespace Uniamazonia_Juego.Views.Administrador.Prueba
{
    public partial class AsignarPregunta : System.Web.UI.Page
    {
        PreguntaController PreguntaC = new PreguntaController();
        PruebaController PruebaC = new PruebaController();
        public static List<DataTable> listaPreguntasAsignadas;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                listaPreguntasAsignadas = new List<DataTable>();
                DataTable pruebas = PruebaC.consulta_combox_nombre();
                DropListPrueba.DataTextField = "nombre_prueba";
                DropListPrueba.DataSource = pruebas;
                DropListPrueba.DataBind();
            }
            if (!IsPostBack)
            {
                // Enable the GridView paging option and  
                // specify the page size. 
                TblPreguntas.AllowPaging = true;
                TblPreguntas.PageSize = 5;


                // Enable the GridView sorting option. 
                TblPreguntas.AllowSorting = true;


                // Initialize the sorting expression. 
                ViewState["SortExpression"] = "id_pregunta ASC";

                // Populate the GridView. 
                BinGrid();
            }

        }

        public void BinGrid()
        {
            DataTable ConsultarContenido = PreguntaC.pregunta();
            if (ConsultarContenido.Rows.Count == 0)
            {
                Nohaypreguntas.InnerHtml = "No hay preguntas para mostrar!";
                Nohaypreguntas.Attributes.Add("Style", "display:Block");
            }
            TblPreguntas.DataSource = ConsultarContenido;
            TblPreguntas.DataBind();
        }

        protected void Metodo_Paginacion(object sender, GridViewPageEventArgs e)
        {
            TblPreguntas.PageIndex = e.NewPageIndex;
            BinGrid();
        }

        public String retornaIdPrueba(String NombrePrueb)
        {
            DataTable consulta = PruebaC.consultaParametroNombre(NombrePrueb);
            String id_prueba = consulta.Rows[0]["id_prueba"].ToString();
            return id_prueba;
        }

        public DataTable VerPreguntasAsignadas(String id_prueba)
        {
            //DataTable consulta = PreguntaC.Consulta_parametro_Id_pregunta(id_prueba);
            DataTable consulta = PreguntaC.consultaParametroFk_Prueba(id_prueba);
            return consulta;

        }

        public void agregarPregunta(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Agregar")
            {
                if (DropListPrueba.SelectedIndex == 0)
                {
                    //ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({position: 'center',type: 'error',title: 'Registro fallido',text:'No has seleccionado una prueba.',timer:3000}) </script>");
                }
                else
                {
                    String nombrePrueba = DropListPrueba.SelectedValue;
                    String id_prueba = retornaIdPrueba(nombrePrueba);
                    int index = Convert.ToInt32(e.CommandArgument);
                    String id_pregunta = TblPreguntas.DataKeys[index].Value.ToString();
                    if (e.CommandName == "Agregar")
                    {
                        Boolean update = PreguntaC.updateAggFkPrueba(id_pregunta, id_prueba);
                    }
                    DataTable preguntas = VerPreguntasAsignadas(id_prueba);
                    DivPreguntasAsignadas.InnerHtml = "Preguntas asignadas para la prueba selecionada.";
                    DivPreguntasAsignadas.Attributes.Add("style", "display: block");
                    BorderPreguntasAsignadas.Attributes.Add("Style","display:Block");
                    //listaPreguntasAsignadas.Add(preguntas);
                    //foreach (DataTable fpregunta in listaPreguntasAsignadas)
                    //{
                    //}
                    GridViewPreguntasAsignadas.DataSource = preguntas;
                    GridViewPreguntasAsignadas.DataBind();
                    BinGrid();

                }
            }
        }
    }
}
   