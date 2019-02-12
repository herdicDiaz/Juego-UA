using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniamazonia_Juego.Controllers;
using Uniamazonia_Juego.Models;

namespace Uniamazonia_Juego.Views.Administrador.Prueba
{
    public partial class AsignarSancion : System.Web.UI.Page
    {
        PruebaController PruebaC = new PruebaController();
        SancionController SancionC = new SancionController();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack==false)
            {
                DataTable consulta = PruebaC.consulta_combox_nombre();
                DropPruebas.DataTextField = "nombre_prueba";
                DropPruebas.DataSource = consulta;
                DropPruebas.DataBind();
                BindGridView();
            }

            if (!IsPostBack)
            {
                // Enable the GridView paging option and  
                // specify the page size. 
                Tbl_sanciones.AllowPaging = true;
                Tbl_sanciones.PageSize = 5;


                // Enable the GridView sorting option. 
                Tbl_sanciones.AllowSorting = true;


                // Initialize the sorting expression. 
                ViewState["SortExpression"] = "id_pregunta ASC";

                // Populate the GridView. 
                BindGridView();
            }
        }


        private void BindGridView()
        {
            {
                DataTable consulta =SancionC.consultaGrid();
                Tbl_sanciones.DataSource = consulta;
                Tbl_sanciones.DataBind();
            }
        }

        protected void Metodo_Paginacion(object sender, GridViewPageEventArgs e)
        {
            Tbl_sanciones.PageIndex = e.NewPageIndex;
            BindGridView();
        }


        protected void EventosGrid(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            String id_sancion = Tbl_sanciones.DataKeys[index].Value.ToString();
            if (e.CommandName=="Agregar")
            {
                if (DropPruebas.SelectedIndex==0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({position: 'center',type: 'error',title: 'Registro fallido',text:'No has seleccionado una prueba.',timer:3000}) </script>");
                }
                else
                {
                    String Prueba = DropPruebas.SelectedValue;
                    //obtenemos el id de la prueba.
                    DataTable consulta = PruebaC.consultaParametroNombre(Prueba);
                    String id_prueba = consulta.Rows[0]["id_prueba"].ToString();
                    String nombre_prueba = consulta.Rows[0]["nombre_prueba"].ToString();
                    //obtenemos el id de la dancion
                    DataTable consultaIdSancion = SancionC.ConsultaParametroIdsancion(id_sancion);
                    String idsancion = consultaIdSancion.Rows[0]["idsancion"].ToString();

                    //obtenemos la descripcion de la sancion
                    String descripcionSancion = consultaIdSancion.Rows[0]["descripcion"].ToString();

                    prueba_sancion prueba_sancionC = new prueba_sancion();
                    Boolean insert = prueba_sancionC.insert(id_prueba, idsancion, descripcionSancion);
                    if (insert==false)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({position: 'center',type: 'error',title: 'Registro fallido.',text:'Esta sanción ya aplica para la prueba seleccionada.',timer:3000}) </script>");
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({position: 'center',type: 'success',title: 'Registro exitoso.',text:'Sanción asignada de forma satisfatoria.',timer:3000}) </script>");
                    }
                }
                
            }
        }
    }
}