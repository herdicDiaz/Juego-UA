using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Models;

namespace Uniamazonia_Juego.Controllers
{
    public class PosicionController
    {
        Posicion posicion;

        public PosicionController(int id_position, int score, int number_proof, int fK_id_player) {
            posicion = new Posicion(id_position,score,number_proof,fK_id_player);

        }

    }
}