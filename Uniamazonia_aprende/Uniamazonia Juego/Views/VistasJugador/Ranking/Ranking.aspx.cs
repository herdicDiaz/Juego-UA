using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniamazonia_Juego.Controllers;
using Uniamazonia_Juego.Controllers.Cotrollers;

namespace Uniamazonia_Juego.Views.VistasJugador.Ranking
{
    public partial class Ranking : System.Web.UI.Page
    {
        RankingController RankingC = new RankingController();
        //JugadorController JugadorC = new JugadorController();
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable ConsultaRanking =RankingC.ConsultaReporteRanking();
            GridViewRanking.DataSource = ConsultaRanking;
            GridViewRanking.DataBind();
        }
    }
}