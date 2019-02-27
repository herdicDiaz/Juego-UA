using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using CrystalDecisions.CrystalReports.Engine;
using System.Configuration;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Drawing;
using CrystalDecisions.Web;
using CrystalDecisions.Shared;
using Uniamazonia_Juego.Conexion;
using Uniamazonia_Juego.Models;
using Uniamazonia_Juego.Reportes;

namespace Uniamazonia_Juego.Web_forms_reports
{
    public partial class ReportePreguntas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Connection con = new Connection();
            DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            CrystalReportPreguntas cr = new CrystalReportPreguntas();

            dt = con.consultaReportes("select id_pregunta, nombre_pregunta from pregunta where estado_pregunta=0;");
            ds.Tables.Add(dt);
            cr.SetDataSource(ds.Tables[0]);
            cr.SetParameterValue("Autordelarchivo1", "Herdic Diaz Munevar");
            IDreportePreguntas.ReportSource = cr;
        }
    }
}