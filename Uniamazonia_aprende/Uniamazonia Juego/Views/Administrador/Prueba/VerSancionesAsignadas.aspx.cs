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
    public partial class VerSancionesAsignadas : System.Web.UI.Page
    {
        prueba_sancionController prueba_sancionC = new prueba_sancionController();
        PruebaController pruebaC = new PruebaController();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack==false)
            {
                DataTable consulta = pruebaC.consulta_combox_nombre();
                DropPruebas.DataTextField = "nombre_prueba";
                DropPruebas.DataSource = consulta;
                DropPruebas.DataBind();
                DivNohaysancionAsignadas.InnerHtml ="<Strong>Nota:</Strong> Debes seleccionar una prueba para ver la sanciones asignadas";
                DivNohaysancionAsignadas.Attributes.Add("Style","Display:Block");
                //BindGrid();
            }

            //GridView
            if (!IsPostBack)
            {
                // Enable the GridView paging option and  
                // specify the page size. 
                TblPrueba_sanciones.AllowPaging = true;
                TblPrueba_sanciones.PageSize = 5;


                // Enable the GridView sorting option. 
                TblPrueba_sanciones.AllowSorting = true;


                // Initialize the sorting expression. 
                ViewState["SortExpression"] = "id_pregunta ASC";

                // Populate the GridView. 
                //BindGrid();
            }

        }


        public void BindGrid()
        {
            DataTable consulta = prueba_sancionC.ConsultaGrid();
            TblPrueba_sanciones.DataSource = consulta;
            TblPrueba_sanciones.DataBind();
        }

        protected void Metodo_Paginacion(object sender, GridViewPageEventArgs e)
        {
            TblPrueba_sanciones.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        protected void Limpiar(object sender, EventArgs e)
        {
            TxtBuscardor.Value = "";
            BindGrid();
        }

        public void DropConsultaGrid(object sender,EventArgs e)
        {
            String prueba = DropPruebas.SelectedValue;
            DataTable consulta = prueba_sancionC.ConsultaGridParametroNombrePrueba(prueba);
            if (consulta.Rows.Count==0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({position: 'center',type: 'error',title: '',text:'No hay sanciones asignadas para la prueba seleccionada',timer:3000}) </script>");
            }
            else
            {
                if (prueba != "")
                {
                    DivNohaysancionAsignadas.Attributes.Add("Style", "Display:none");
                }
            }
   
            TblPrueba_sanciones.DataSource = consulta;
            TblPrueba_sanciones.DataBind();
        }

        public void ComandosGrid(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName=="Quitar")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                int idsancion =Convert.ToInt32( TblPrueba_sanciones.DataKeys[index].Value.ToString());
                Session["id_sancion"]= idsancion;
                
                String nombrePrueba = DropPruebas.SelectedValue.ToString();
                DataTable consulta = pruebaC.consultar_pruebas(nombrePrueba);
                int idprueba =Convert.ToInt32( consulta.Rows[0]["id_prueba"].ToString());
                Session["id_prueba"] =idprueba;
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#deleteModal').modal('show');");
                sb.Append(@"</script>");
                TextoModal.InnerHtml = "¿Está seguro que desea quitar la sanción "+idsancion+"?";
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "deleteModal", sb.ToString(), false);

            }
        }

        public void btnEliminar_Click(object sender, EventArgs e)
        {
            int id_sancion = Convert.ToInt32(Session["id_sancion"].ToString());
            int id_prueba = Convert.ToInt32(Session["id_prueba"].ToString());
            Boolean delete = prueba_sancionC.EliminarRegistros(id_prueba, id_sancion);
            DropConsultaGrid(sender, e);
        }

        protected void Buscar(object sender, EventArgs e)
        {
            String palabra = TxtBuscardor.Value;
            if (DropPruebas.SelectedIndex==0)
            {
                DataTable consulta = prueba_sancionC.buscarEnGrid(palabra);
                TblPrueba_sanciones.DataSource = consulta;
                TblPrueba_sanciones.DataBind();
            }
            else
            {
                DataTable consultaPrueba = pruebaC.consultaParametroNombre(DropPruebas.SelectedValue);
                String fk_prueba = consultaPrueba.Rows[0]["id_prueba"].ToString();
                DataTable consulGrid = prueba_sancionC.buscarEnGridParametroPruebaPalabra(palabra,fk_prueba);
                TblPrueba_sanciones.DataSource = consulGrid;
                TblPrueba_sanciones.DataBind();
            }
           

        }
    }
}