using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Models;

namespace Uniamazonia_Juego.Controllers
{
    public class PremiacionController
    {
        Premiacion premiacion;

        // contructor

        public PremiacionController(int id_award, int points_domed, int stars_obtained, int diamonds_obtained, int fk_player)
        {
            premiacion = new Premiacion(id_award,points_domed,stars_obtained,diamonds_obtained,fk_player);
        }

        // metodos
        public String obtener_puntos_acomulados()
        {
            return premiacion.obtener_puntos_acomulados();
        }


        }
}