﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Conexion;

namespace Uniamazonia_Juego.Models
{
    public class Puntuacion
    {
        private int id_premiacion {set;get;}
        private int puntos_acomulados { set; get; }
        private int estrellas_obtenidas { set; get; }
        private int diamantes_obtenidos { set; get; }
        private int fk_jugador { set; get; }
        private Connection conexion { set; get; }
        // constructor

        public Puntuacion(int id_award, int points_domed, int stars_obtained, int diamonds_obtained, int fk_player ) {
            this.id_premiacion = id_award;
            this.puntos_acomulados = points_domed;
            this.estrellas_obtenidas = stars_obtained;
            this.diamantes_obtenidos = diamonds_obtained;
            this.fk_jugador = fk_player;
            this.conexion = new Connection();
        }

        public Puntuacion()
        {
        }


        // metodos

        public String obtener_puntos_acomulados() {
            this.conexion = new Connection();
            String Query = "select premiacion.puntos_acomulados from jugador inner join premiacion " +
                "on jugador.id_jugador = premiacion.fk_jugador where jugador.id_jugador = '"+this.fk_jugador+"'; ";
            String aux_puntos_obtenidos = "";
            aux_puntos_obtenidos =  conexion.consulta_universal(Query);
            return aux_puntos_obtenidos;

        }


        //actulizaciones
        public Boolean UpdatePuntos(int valor)
        {
            this.conexion = new Connection();
            Boolean update = new Boolean();
            String Query = "UPDATE `aprender`.`puntuacion` SET `valor_punto`='"+valor+"' WHERE  `id_puntuacion`='1';";
            update = conexion.update_BD(Query);
            return update;
        }


        //Consultas.
        public DataTable ConsultarPuntos()
        {
            this.conexion = new Connection();
            DataTable consulta = new DataTable();
            String Query = "select id_puntuacion, valor_punto from puntuacion;";
            consulta = conexion.consultar_BD(Query);
            return consulta;
        }




        }
}