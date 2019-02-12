using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Conexion;

namespace Uniamazonia_Juego.Models
{
    public class Tiempo
    {
        private int id_tiempo { set; get; }
        private int tiempo_inicio { set; get; }
        private int tiempo_final { set; get; }
        private int fk_prueba { set; get; }
        private Connection conexion { set; get; }

        // constructor
        public Tiempo(int id_time, int time_start,int time_stop, int fk_proof) {
            this.id_tiempo = id_time;
            this.tiempo_inicio = time_start;
            this.tiempo_final = time_stop;
            this.fk_prueba = fk_proof;
            this.conexion = new Connection();
        }


        // metodos
    }
}