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

namespace Uniamazonia_Juego.Web_forms_reports
{
    public partial class ReporteListaSancion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Connection con = new Connection();
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            CrystalReportSancion cr = new CrystalReportSancion();

            dt = con.consultar_BD("Select *from sancion;");
            ds.Tables.Add(dt);
            cr.SetDataSource(ds.Tables[0]);
            CrystalReportViewerSancion.ReportSource = cr;

        }
    }
}