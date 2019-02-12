using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Conexion;

namespace Uniamazonia_Juego.Models
{
    public class Calificacion
    {
        private int id_calificacion { set; get; }
        private int valor_calificacion { set; get; }
        private int fk_pregunta { set; get; }
        private Connection conexion;

        // constructor
        public Calificacion(int id_qualification, int value_qualification,int fk_question) {
            this.id_calificacion = id_qualification;
            this.valor_calificacion = value_qualification;
            this.fk_pregunta = fk_question;
            this.conexion = new Connection();
        }


        //metodos

    }
}