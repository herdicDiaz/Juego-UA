using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Conexion;

namespace Uniamazonia_Juego.Models
{
    public class Rol_Usuario
    {
        private int fk_id_rol { set; get; }  
        private int fk_usuario { set; get; }
        private String estado_rol_usuario { set; get; }
        private Connection conexion { set; get; }


        public Rol_Usuario(int fk_id_role, int fk_user, String state_role_user) {
            this.fk_id_rol = fk_id_role;
            this.fk_usuario = fk_user;
            this.estado_rol_usuario = state_role_user;
            this.conexion = new Connection();
        }

        // metodos..
        public String rol_usuario_menu(String aux_rol) {
            String Query = "select rol_usuario.fk_id_rol from rol_usuario where (rol_usuario.fk_usuario='"+this.fk_usuario+"' and rol_usuario.tipo_rol_usuario = '"+aux_rol+"');";

            String dato = conexion.consulta_universal(Query);
            return dato;
        }




    }
}