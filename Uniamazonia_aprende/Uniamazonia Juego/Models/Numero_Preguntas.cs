using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Conexion;

namespace Uniamazonia_Juego.Models
{
    public class Numero_Preguntas
    {
        private int id_numero_preguntas { set; get; }
        private int numero_pregunta { set; get; }
        private String estado_pregunta { set; get; }
        private Connection conexion { set; get; }
        // cosntructor
        public Numero_Preguntas(int id_question, int number_question, String state_question)
        {
            this.id_numero_preguntas = id_question;
            this.numero_pregunta = number_question;
            this.estado_pregunta = state_question;
            this.conexion = new Connection();

        }
        // metodos


    }
}