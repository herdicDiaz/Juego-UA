using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Models;

namespace Uniamazonia_Juego.Controllers
{
    public class PuntuacionController
    {
        Puntuacion premiacion;
        Puntuacion PuntuacionC = new Puntuacion();
        // contructor

        public PuntuacionController(int id_award, int points_domed, int stars_obtained, int diamonds_obtained, int fk_player)
        {
            premiacion = new Puntuacion(id_award,points_domed,stars_obtained,diamonds_obtained,fk_player);
        }

        public PuntuacionController()
        {
        }



        // metodos
        public String obtener_puntos_acomulados()
        {
            return premiacion.obtener_puntos_acomulados();
        }

        //actualizaciones 
        public Boolean UpdatePuntos(int valor)
        {
            Boolean update = new Boolean();
            update = PuntuacionC.UpdatePuntos(valor);
            return update;

        }

        // consultas.
        public DataTable ConsultarPuntos()
        {
            DataTable consulta = new DataTable();
            consulta = PuntuacionC.ConsultarPuntos();
            return consulta;
        }

        }
}