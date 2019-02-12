using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Models;

namespace Uniamazonia_Juego.Controllers
{
    public class JugadorController
    {



        private Jugador111 jugador;


        public JugadorController(int id_player, int identificacion_player, String name_one, String name_two, String last_name_one, String last_name_two, String
            programa_academic, int semester, String email, String state_player, int fk_user)
        {

            jugador = new Jugador111(id_player,identificacion_player, name_one, name_two, last_name_one, last_name_two, programa_academic, semester, email, state_player, fk_user);



        }






        // metodos
        public int traer_id_jugador()
        {
            return jugador.traer_id_jugador();
        }



        public String consultar_nombre_BD()
        {
            return jugador.consultar_nombre_BD();

        }

        public Boolean crear_jugador(int fk_programa)
        {
            if (jugador.crear_jugador(fk_programa))
            {
                return true;
            }
            return false;
        }

        public DataTable consulta_unica_jugador()
        {

            return jugador.consulta_unica_jugador();
        }


        public int fk_programa()
        {
            return jugador.fk_programa();

        }


        public Boolean actualizar_jugador()
        {
            if (jugador.actualizar_jugador())
            {
                return true;
            }
            return false;

        }


        }
}