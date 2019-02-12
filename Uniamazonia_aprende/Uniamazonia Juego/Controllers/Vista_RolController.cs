using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Models;

namespace Uniamazonia_Juego.Controllers
{
    public class Vista_RolController
    {
        Vista_Rol vista_rol;

        public Vista_RolController(int id_vista_rol_new, int fk_id_vista_new, int fk_master_new, int fk_id_rol_new) {
            vista_rol = new Vista_Rol(id_vista_rol_new,fk_id_vista_new,fk_master_new,fk_id_rol_new);

        }

        // metodos

        public Boolean crear_vista_rol(String aux_nombre)
        {
            return vista_rol.crear_vista_rol(aux_nombre);
        }

        public Boolean crear_vista_rol_hija(String aux_nombre_padre)
        {
            return vista_rol.crear_vista_rol_hija(aux_nombre_padre);
        }

        }
}