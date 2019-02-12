using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Models;

namespace Uniamazonia_Juego.Controllers
{
    public class Rol_UsuarioController
    {
        Rol_Usuario rol_usuario;

        public Rol_UsuarioController(int fk_id_role, int fk_user, String state_role_user) {
            rol_usuario = new Rol_Usuario(fk_id_role,fk_user,state_role_user);

        }

        // metodos

        public String rol_usuario_menu(String aux_rol)
        {
            return rol_usuario.rol_usuario_menu(aux_rol);

        }

        }
}