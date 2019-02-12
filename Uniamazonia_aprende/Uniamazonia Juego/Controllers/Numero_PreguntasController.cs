using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Models;

namespace Uniamazonia_Juego.Controllers
{
    public class Numero_PreguntasController
    {
        private Numero_Preguntas numero_pregunta;

        // contructor
        public Numero_PreguntasController(int id_question, int number_question, String state_question) {
            numero_pregunta = new Numero_Preguntas(id_question,number_question,state_question);
        }
        // metodos

    }
}