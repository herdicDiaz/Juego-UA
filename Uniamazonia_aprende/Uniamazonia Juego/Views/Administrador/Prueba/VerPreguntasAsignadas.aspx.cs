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
    public partial class VerPreguntasAsignadas : System.Web.UI.Page
    {
        PruebaController pruebaC = new PruebaController();
        PreguntaController PreguntaC = new PreguntaController();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                DataTable consul = pruebaC.consulta_combox_nombre();
                DropNombrePruebas.DataTextField = "nombre_prueba";
                DropNombrePruebas.DataSource = consul;
                DropNombrePruebas.DataBind();
                DivNohaypreguntas.InnerHtml ="<Strong>Nota:</Strong> Debes seleccionar una prueba para ver la preguntas asignadas";
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
                //BindGrid();
            }
        }

        public void BindGrid()
        {
            DataTable consulta = pruebaC.consultaGrid();
            Tabla_Preguntas.DataSource = consulta;
            Tabla_Preguntas.DataBind();
        }

        public void BindGridView_SeleccionPrueba(object sender, EventArgs e)
        {
            String NombrePrueba = DropNombrePruebas.SelectedValue;
            DataTable consulta = pruebaC.consultaParametroNombre(NombrePrueba);
            if (consulta.Rows.Count!=0)
            {
                String id_prueba = consulta.Rows[0]["id_prueba"].ToString();
                DataTable consulta_pregunta = PreguntaC.consultaParametroFk_Prueba(id_prueba);
                if (consulta_pregunta.Rows.Count==0)
                {
                    Tabla_Preguntas.DataSource = consulta_pregunta;
                    Tabla_Preguntas.DataBind();
                    ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({position: 'center',type: 'error',title: '',text:'No hay preguntas asignadas para la prueba seleccionada',timer:3000}) </script>");

                }
                else
                {
                    Tabla_Preguntas.DataSource = consulta_pregunta;
                    Tabla_Preguntas.DataBind();
                    DivNohaypreguntas.Attributes.Add("Style", "Display:None");
                }

            }
            

        }

        public void buscarPregunta(object sender, EventArgs e)
        {
            String palabra = TxtBuscar.Value;
            if (DropNombrePruebas.SelectedIndex == 0)
            {
                DataTable consulta = PreguntaC.consultaLikeNombre(palabra);
       
                Tabla_Preguntas.DataSource = consulta;
                Tabla_Preguntas.DataBind();
            }
            else
            {
                DataTable consulta1 = pruebaC.consultaParametroNombre(DropNombrePruebas.SelectedValue);
                String id_prueba = consulta1.Rows[0]["id_prueba"].ToString();
                DataTable consulta = PreguntaC.buscarEnGridParametroPruebaPalabra(palabra, id_prueba);
                Tabla_Preguntas.DataSource = consulta;
                Tabla_Preguntas.DataBind();
            }

        }

        public void EventosGrid(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName=="Quitar")
            {
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#deleteModal').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "deleteModal", sb.ToString(), false);



                int index = Convert.ToInt32(e.CommandArgument);
                String id_preguntas = Tabla_Preguntas.DataKeys[index].Value.ToString();
                Session["id_preguntas"]=id_preguntas;
 
            }
        }

        public void btnEliminar_Click(object sender, EventArgs e)
        {
            String id =Session["id_preguntas"].ToString();
            Boolean DeletePregunta = PreguntaC.DeletePreguntaDePrueba(id);
            BindGridView_SeleccionPrueba(sender, e);
        }

        public void BtnLimpiarConsultas(object sender, EventArgs e){
            TxtBuscar.Value = "";
            BindGrid();
        }

        protected void Metodo_Paginacion(object sender, GridViewPageEventArgs e)
        {
            Tabla_Preguntas.PageIndex = e.NewPageIndex;
            BindGridView_SeleccionPrueba(sender, e);

            //BindGrid();

        }
    }
}