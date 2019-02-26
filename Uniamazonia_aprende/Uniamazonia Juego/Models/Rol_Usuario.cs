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
        private String tipo_rol_usuario { set; get; }
        private Connection conexion { set; get; }


        public Rol_Usuario(int fk_id_role, int fk_user, String state_role_user, String type_rol_usuario) {
            this.fk_id_rol = fk_id_role;
            this.fk_usuario = fk_user;
            this.estado_rol_usuario = state_role_user;
            this.tipo_rol_usuario = type_rol_usuario;
            this.conexion = new Connection();
        }

        // metodos..
        public String rol_usuario_menu(String aux_rol) {
            String Query = "select rol_usuario.fk_id_rol from rol_usuario where (rol_usuario.fk_usuario='"+this.fk_usuario+"' and rol_usuario.tipo_rol_usuario = '"+aux_rol+"');";

            String dato = conexion.consulta_universal(Query);
            return dato;
        }

        // crar rol_usuario
        public Boolean crear_rol_usuario() {

            // BUSCAR LE ID ORGINAL
            String query = "select id_jugador from jugador where identificacion_jugador ='"+fk_usuario+"';";

            int aux_fk_usuario = conexion.buscar_ID_BD(query);
            this.fk_usuario = aux_fk_usuario;

            String Query = "insert into rol_usuario values('"+fk_id_rol+"','"+fk_usuario+"','"+estado_rol_usuario+"','"+tipo_rol_usuario+"');";

            

          



            if (conexion.insert_BD(Query))
            {
                return true;
            }

            return false;
        }




    }
}