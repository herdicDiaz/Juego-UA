using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniamazonia_Juego.Controllers;

namespace Uniamazonia_Juego.Views.Administrador.Sancion
{
    public partial class EditarSancion : System.Web.UI.Page
    {
        SancionController SancionC = new SancionController();
        String idsancion;
        String estado_consulta;
        protected void Page_Load(object sender, EventArgs e)
        {
            idsancion = Request.QueryString["idsancion"];
            DataTable consulta = SancionC.ConsultaParametroIdsancion(idsancion);
            estado_consulta = consulta.Rows[0]["estado_sancion"].ToString();
            if (Page.IsPostBack==false)
            {
                TxtDescripcion.Value = consulta.Rows[0]["descripcion"].ToString();
                TxtUrl.Value = consulta.Rows[0]["url_video"].ToString();
                if (estado_consulta == "D")
                {
                    var item = new List<String>
                    {
                    "A"
                    };
                    DropDownList.DataSource =item;
                    DropDownList.DataBind();
                }
                else
                {
                    var item = new List<String>
                    {
                    "D"
                    };
                    DropDownList.DataSource =item;
                    DropDownList.DataBind();
                }
               
            }
        }

        protected void guardarSancion(object sender, EventArgs e)
        {
            String descripcion = TxtDescripcion.Value;
            String url = TxtUrl.Value;
            String estado = DropDownList.SelectedValue;
            if (estado=="0")
            {
                estado = estado_consulta;
            }
            Boolean consulta = SancionC.updateSancion(descripcion,url,estado,idsancion);
            Response.Redirect("~/Views/Administrador/Sancion/ListarSancion.aspx");
        }


    }
}