using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Conexion;

namespace Uniamazonia_Juego.Models
{
    public class Usuario
    {
        private int id_usuario { get; set; }
        private String nombre_usuario { get; set; }
        private String password_usuario { get; set; }
        private String privilegio_usuario { set; get; }

        //private Connection conexion;
        Connection conexion;

        // constructor
        public Usuario(int id_user, String name_user, String password_user, String privilege_user)
        {
            this.id_usuario = id_user;
            this.nombre_usuario = name_user;
            this.password_usuario = password_user;
            this.privilegio_usuario = privilege_user;
            this.conexion = new Connection();

        }



        //metodos
        public DataTable datos_usuario_BD() {
            this.conexion = new Connection();
            String Query = "select * from usuario where nombre_usuario='"+nombre_usuario+"';";
            DataTable consulta = conexion.consultar_BD(Query);
            return consulta;
        }

        public Boolean crear_usuario() {

            String Query = "insert into usuario(nombre_usuario,password_usuario,privilegio_usuario) values('"+nombre_usuario+"','"+password_usuario+"','"+privilegio_usuario+"');";
            if (conexion.insert_BD(Query))
            {
                return true;
            }
            return false;
        }

        public int consultar_id_nuevo() {
            String Query = "select id_usuario from usuario where nombre_usuario='"+this.nombre_usuario+"';";
            int dato = 0;
            dato = conexion.buscar_ID_BD(Query);
            return dato;
        }

        public Boolean actualizar_usuario() {
            String Query = "update usuario set nombre_usuario='"+nombre_usuario+"' where id_usuario='"+id_usuario+"';";
            if (conexion.update_BD(Query))
            {
                return true;
            }
            return false;
        }


        public String password_BD() {
            String datos_bd = "";
            String Query= "select password_usuario from usuario where id_usuario='"+id_usuario+"';";
            
            datos_bd = conexion.consulta_universal(Query);
            

            return datos_bd;
        }

        public Boolean actualizar_password() {
            String Query = "update usuario set password_usuario = '"+password_usuario+"' where id_usuario='"+id_usuario+"';";

            if (conexion.update_BD(Query))
            {
                return true;
            }

            return false;
        }



        

    }
}