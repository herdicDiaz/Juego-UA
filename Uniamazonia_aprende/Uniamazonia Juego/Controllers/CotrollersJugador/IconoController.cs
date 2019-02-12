using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Models;

namespace Uniamazonia_Juego.Controllers.CotrollersJugador
{
    public class IconoController
    {
        public Icono icono;

        // constructor
        public IconoController(int id_icono_in, string name_icon, string state_icon)
        {
            icono = new Icono(id_icono_in, name_icon, state_icon);
        }

        // metodos..
        public DataTable consulta_iconos_aux()
        {
            return icono.consulta_iconos_aux();
        }
        public Boolean desactivar_O_activar_icono(String nombre_icon_desact)
        {

            if (icono.desactivar_O_activar_icono(nombre_icon_desact))
            {
                return true;
            }
            return false;

        }

        public Boolean eliminar_icono()
        {
            if (icono.eliminar_icono())
            {
                return true;
            }
            return false;
        }
        
        public Boolean agregar_icono()
        {
            if (icono.agregar_icono())
            {
                return true;
            }
            return false;
        }
        public Boolean actualizar_nombre_icono()
        {
            if (icono.actualizar_nombre_icono())
            {
                return true;
            }
            else {
                return false;
            }

        }

            public Boolean desactivar_icono()
        {
            if (icono.desactivar_icono())
            {
                return true;
            }
            return false;
        }




        public DataTable consulta_iconos()
        {
            return icono.consulta_iconos();

        }

    }
}