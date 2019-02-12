using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Models;

namespace Uniamazonia_Juego.Controllers
{
    public class ModuloController
    {
        Modulo modulo;


        public ModuloController()
        {
            modulo = new Modulo();
        }


        // constructor
        public ModuloController(int id_module, String name_module, String state_module, String url_img_module)
        {
            modulo = new Modulo(id_module, name_module, state_module, url_img_module);
        }
        // metodos


        public String consulta_nombre_BD()
        {
            return modulo.consulta_nombre_BD();

        }


        public Boolean crear_modulo()
        {
            if (modulo.crear_modulo())
            {
                return true;
            }
            return false;
        }

        public DataTable consulta_modulos()
        {
            return modulo.consultar_modulo();

        }

        public DataTable filtrando_registros_modulo(String dato)
        {
            return modulo.filtrando_registros_modulo(dato);
        }

        public DataTable consulta_combox_nombre()
        {
            return modulo.consulta_combox_nombre();
        }
        public Boolean actualizar_nombre_modulo()
        {
            if (modulo.actualizar_nombre_modulo())
            {
                return true;
            }
            return false;
        }
        public Boolean eliminar_modulo()
        {
            if (modulo.eliminar_modulo())
            {
                return true;
            }
            return false;
        }
    }
}