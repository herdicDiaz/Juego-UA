using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Models;

namespace Uniamazonia_Juego.Controllers
{
    public class TiempoController
    {
        Tiempo tiempo;

        public TiempoController(int id_time, int time_start, int time_stop, int fk_proof) {
            tiempo = new Tiempo(id_time,time_start,time_stop,fk_proof);
        }
    }
}