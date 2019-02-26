using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Models;


namespace Uniamazonia_Juego.Controllers.Cotrollers
{
    public class RankingController
    {
        private int id_posicion { get; set; }
        private int puntaje_acomulado { get; set; }
        private int fk_id_jugador { get; set; }

        Ranking RankinM = new Ranking();
        

        public RankingController(int id_posicion, int puntaje_acomulado, int fk_id_jugador)
        {
            this.id_posicion = id_posicion;
            this.puntaje_acomulado = puntaje_acomulado;
            this.fk_id_jugador = fk_id_jugador;
        }

        public RankingController()
        {
        }


        //Metodos.

        public Boolean Insert(int puntaje, int fk_jugador)
        {
            Boolean insert = new Boolean();
            insert = RankinM.Insert(puntaje, fk_jugador);
            return insert;
        }



        //consultas por parametros.
        public DataTable ConsultaParametroFk_Jugador(int fk_usuario)
        {
            DataTable consulta = RankinM.ConsultaParametroFk_Jugador(fk_usuario);
            return consulta;
        }

        public DataTable ConsultaReporteRanking()
        {
            DataTable consulta = RankinM.ConsultaReporteRanking();
            return consulta;
        }

            

            //Update
            public Boolean Update(int puntos_prueba,int fk_usuario)
        {
            Boolean up = RankinM.Update(puntos_prueba, fk_usuario);
            return up;
        }
        }
}