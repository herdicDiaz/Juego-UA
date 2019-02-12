using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Uniamazonia_Juego.Controllers;

namespace Uniamazonia_Juego.Views.Administrador.Sancion
{
    public partial class ListarSancion : System.Web.UI.Page
    {
        SancionController sancionC = new SancionController();


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
                ListarSanciones.AllowPaging = true;
                ListarSanciones.PageSize = 5;


                // Enable the GridView sorting option. 
                ListarSanciones.AllowSorting = true;


                // Initialize the sorting expression. 
                ViewState["SortExpression"] = "idsancion ASC";

                // Populate the GridView. 
                BindGridView();
            }
        }

        protected void Metodo_Paginacion(object sender, GridViewPageEventArgs e)
        {
            ListarSanciones.PageIndex = e.NewPageIndex;
            BindGridView();
        }

        protected void BindGridView()
        {
            DataTable consulta = sancionC.consultaGrid();
            ListarSanciones.DataSource = consulta;
            ListarSanciones.DataBind();
        }
        protected void eventosGrid(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "editar" || e.CommandName == "eliminar" || e.CommandName == "verSancion")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                string idsancion = ListarSanciones.DataKeys[index].Value.ToString();
                if (e.CommandName == "editar")
                {
                    Response.Redirect("~/Views/Administrador/Sancion/EditarSancion.aspx?idsancion=" + idsancion);
                }
                if (e.CommandName == "eliminar")
                {
                    Boolean delete = sancionC.eliminarSancion(idsancion);
                    BindGridView();
                    //ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "denegadoAlert('Esta seguro de eliminar la sancion " + idsancion + "');", true);

                }
                if (e.CommandName == "verSancion")
                {
                    DataTable consulta = sancionC.ConsultaUrl(idsancion);
                    String url = consulta.Rows[0]["url_video"].ToString();
                    cargaVideo.Src = url;
                    //cargaVideo.Attributes.Add("src",url);
                    //this.cargaVideo.Attributes("src") = url;
                    //((HtmlControl)(xx.FindControl("cargaVideo"))).Attributes["src"] =url;
                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#editModal').modal('show');");
                    sb.Append(@"</script>");
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "editModal", sb.ToString(), false);
                }
            }
        }

        protected void buscarSancion(object sender, EventArgs e)
        {
            String palabra = Txt_buscar_sancion.Value;
            DataTable consulta = sancionC.buscarEnGrid(palabra);
            ListarSanciones.DataSource = consulta;
            ListarSanciones.DataBind();
        }

        protected void limpiarGrid(object sender,EventArgs e){
            Txt_buscar_sancion.Value = "";
            BindGridView();
        }

        //protected void editarSancion(object sender, GridViewEditEventArgs e)
        //{
        //    ListarSanciones.EditIndex = e.NewEditIndex;
        //    BindGridView();
        //}

        //protected void updateSancion(object sender, GridViewUpdateEventArgs e)
        //{
        //    string id_sancion = ListarSanciones.Rows[e.RowIndex].Cells[0].Text;
        //    string descripcion = ((TextBox)ListarSanciones.Rows[e.RowIndex].FindControl("Txt_descripcion")).Text;
        //    string estado = ((TextBox)ListarSanciones.Rows[e.RowIndex].FindControl("Txt_estado")).Text;
        //    //Boolean update = sancionC.updateSancion(descripcion, estado, Convert.ToInt32(id_sancion));
        //    ListarSanciones.EditIndex = -1;
        //    BindGridView();
        //}

        //protected void deletingSancion(object sender, GridViewDeleteEventArgs e)
        //{
        //    string idasancion = ListarSanciones.Rows[e.RowIndex].Cells[0].Text;
        //    Boolean consulta = sancionC.eliminarSancion(Convert.ToInt32(idasancion));
        //    BindGridView();
        //}

        //protected void Cancelar_edicion(object sender, GridViewCancelEditEventArgs e)
        //{
        //    ListarSanciones.EditIndex = -1;
        //    BindGridView();
        //}

    }
}
    

