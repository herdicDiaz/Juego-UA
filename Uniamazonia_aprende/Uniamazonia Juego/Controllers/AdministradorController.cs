using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Models;

namespace Uniamazonia_Juego.Controllers
{
    public class AdministradorController
    {
        Administrador administrador;

        public AdministradorController(int id_adminstrator, String name_administrator, String last_name_administrator,
            String state_adminsitrator, int fk_user)
        {
            administrador = new Administrador(id_adminstrator, name_administrator, last_name_administrator, state_adminsitrator, fk_user);


        }
        // metodos
        public String nombre_bd()
        {
            return administrador.nombre_bd();

        }

        public int id_db_admin()
        {
            return administrador.id_db_admin();
        }
    }
}