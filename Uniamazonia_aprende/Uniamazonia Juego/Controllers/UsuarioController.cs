using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.HtmlControls;
using Uniamazonia_Juego.Models;

namespace Uniamazonia_Juego.Controllers
{
    public class UsuarioController
    {
        Usuario usuario;


        // constructor
        public UsuarioController(int id_user, String name_user, String password_user, String privilege_user)
        {
            usuario = new Usuario(id_user, name_user, password_user, privilege_user);
        }

        // metodos
        public DataTable datos_usuario_BD()
        {
            return usuario.datos_usuario_BD();
        }

        public Boolean crear_usuario()
        {
            return usuario.crear_usuario();
        }
        public int consultar_id_nuevo()
        {
            return usuario.consultar_id_nuevo();
        }

        public Boolean actualizar_usuario()
        {
            if (usuario.actualizar_usuario())
            {
                return true;
            }
            return false;
        }


        public String password_BD()
        {
            return usuario.password_BD();
        }
        public Boolean actualizar_password()
        {
            if (usuario.actualizar_password())
            {
                return true;
            }
            return false;
        }

    }

}