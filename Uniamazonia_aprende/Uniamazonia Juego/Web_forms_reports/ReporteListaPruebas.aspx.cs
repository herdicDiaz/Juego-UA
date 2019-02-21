using System;
using System.Collections.Generic;
using System.Data;
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
namespace Uniamazonia_Juego.Web_forms_reports
{
    public partial class ReporteListaPruebas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Connection con = new Connection();
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            CrystalReportListaPruebas cr = new CrystalReportListaPruebas();

            dt = con.consultaReportes("select id_prueba, nombre_prueba from prueba;");
            ds.Tables.Add(dt);
            cr.SetDataSource(ds.Tables[0]);
            cr.SetParameterValue("Nombre_autor", "Herdic Diaz Munevar");
            CrystalReportViewerListaPruebas.ReportSource = cr;

        }
    }
}