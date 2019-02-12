using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Models;

namespace Uniamazonia_Juego.Controllers
{
    public class RolController
    {
        Rol rol;

        public RolController(int id_role, String name_role, String description_role) {
            rol = new Rol(id_role,name_role,description_role);

        }

        public DataTable consulta_menu_unico()
        {
            return rol.consulta_menu_unico();
        }

      }
}