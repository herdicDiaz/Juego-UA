using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Conexion;

namespace Uniamazonia_Juego.Models
{
    public class Administrador
    {
        private int id_administrador { set; get; }
        private String  nombres_admin { set; get; }
        private String apellidos_admin { set; get; }
        private String estado_admin {set;get;}
        private int fk_usuario { set; get; }
        private Connection conexion;

        // constructor
        public Administrador(int id_adminstrator, String name_administrator, String last_name_administrator, 
            String state_adminsitrator, int fk_user) {

            this.id_administrador = id_adminstrator;
            this.nombres_admin = name_administrator;
            this.apellidos_admin = last_name_administrator;
            this.estado_admin = state_adminsitrator;
            this.fk_usuario = fk_user;
            this.conexion = new Connection();



        }



        // metodos
        public String nombre_bd() {
            String Query = "select concat_ws(' ',nombres_admin,apellidos_admin) as nombres from administrador where id_dministrador= '"+this.id_administrador+"';";
            String consulta = "";
            consulta = conexion.consulta_universal(Query);
            return consulta;
        }

        public int id_db_admin() {
            String Query = "select id_dministrador from administrador where fk_usuario='"+this.id_administrador+"';";
            int dato =conexion.buscar_ID_BD(Query);



            return dato;
        }


    }
}