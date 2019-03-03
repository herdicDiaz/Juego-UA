using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniamazonia_Juego.Conexion;
using Uniamazonia_Juego.Reportes;
using System.Data.SqlClient;
using CrystalDecisions.CrystalReports.Engine;
using System.Configuration;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Drawing;
using CrystalDecisions.Web;
using CrystalDecisions.Shared;
using System.Data;
using Uniamazonia_Juego.Controllers;
namespace Uniamazonia_Juego.Web_forms_reports
{
    public partial class ReporteListaSancion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Connection con = new Connection();http://localhost:58475/Web_forms_reports/ReporteListaSancion.aspx.cs
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            CrystalReportSancion cr = new CrystalReportSancion();
            AdministradorController administradorC = new AdministradorController();

            dt = con.consultar_BD("Select *from sancion where estado_sancion=0;");
            ds.Tables.Add(dt);
            cr.SetDataSource(ds.Tables[0]);
            int id_administrador =Convert.ToInt32( Session["id_usuario"].ToString());
            DataTable consulta = administradorC.ConsultaParametroFkUsuario(id_administrador);
            String nombre1 = consulta.Rows[0]["nombres_admin"].ToString();
            String apellidos = consulta.Rows[0]["apellidos_admin"].ToString();
            cr.SetParameterValue("autor", nombre1 + apellidos );
            CrystalReportViewerSancion.ReportSource = cr;

        }
    }
}