using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Conexion;

namespace Uniamazonia_Juego.Models
{
    public class Posicion
    {
        private int id_posicion { set; get; }
        private int puntaje { set; get; }
        private int numero_pruebas { set; get; }
        private int fk_id_jugador { set; get; }
        private Connection conexion { set; get; }

        //constructor
        public Posicion(int id_position, int score, int number_proof, int fK_id_player) {
            this.id_posicion = id_posicion;
            this.puntaje = score;
            this.numero_pruebas = number_proof;
            this.fk_id_jugador = fK_id_player;
            this.conexion = new Connection();

        }

        // metodos
    }
}