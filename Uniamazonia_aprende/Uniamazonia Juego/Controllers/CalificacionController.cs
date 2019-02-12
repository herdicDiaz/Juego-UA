using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Models;

namespace Uniamazonia_Juego.Controllers
{
    public class CalificacionController
    {
        Calificacion calificacion;

        public CalificacionController(int id_qualification, int value_qualification, int fk_question) {

            calificacion = new Calificacion(id_qualification,value_qualification,fk_question);

        }

       
    }
}