using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Conexion;

namespace Uniamazonia_Juego.Models
{
    public class Vista_Rol
    {
        private int id_vista_rol { set; get; }
        private int fk_id_vista { set; get; }
        private int fk_master { set; get; }
        private int fk_id_rol { set; get; }
        private Connection conexion { set; get; }


        public Vista_Rol(int id_vista_rol_new, int fk_id_vista_new, int fk_master_new, int fk_id_rol_new) {
            this.id_vista_rol = id_vista_rol_new;
            this.fk_id_vista = fk_id_vista_new;
            this.fk_master = fk_master_new;
            this.fk_id_rol = fk_id_rol_new;
            this.conexion = new Connection();

        }



        // metodos

        public Boolean crear_vista_rol(String aux_nombre_padre) {
            // traer id de la nueva vista
            String Query = "select max(id_vista_rol) from vista_rol;";
            this.id_vista_rol = (conexion.buscar_ID_BD(Query))+1;

            // traer id menu padre 
            String Query_new = "select id_vista from vista where descripcion ='"+aux_nombre_padre+"';";
            this.fk_id_vista = (conexion.buscar_ID_BD(Query_new)) ;
            this.fk_master = this.fk_id_vista;

            String Query_real = "insert into vista_rol values('"+this.id_vista_rol+"','"+this.fk_id_vista+"','"+this.fk_master+"','"+this.fk_id_rol+"');";

            if (conexion.insert_BD(Query_real))
            {
                return true;
            }
            return false;

        }

        public Boolean crear_vista_rol_hija(String aux_nombre_padre) {
            // traer id de la nueva vista
            String Query = "select max(id_vista_rol) from vista_rol;";
            this.id_vista_rol = (conexion.buscar_ID_BD(Query))+1;

            // traer id menu padre 
            String Query_new = "select id_vista from vista where descripcion ='"+aux_nombre_padre+"';";
            this.fk_master = (conexion.buscar_ID_BD(Query_new)) ;

            // traer el rol de la vista padre

            String query_rol = "select fk_id_rol from vista_rol where fk_id_vista='"+this.fk_master+"';";
            this.fk_id_rol = (conexion.buscar_ID_BD(query_rol));

            String Query_real = "insert into vista_rol values('"+this.id_vista_rol+"','"+this.fk_id_vista+"','"+this.fk_master+"','"+this.fk_id_rol+"');";

            if (conexion.insert_BD(Query_real))
            {
                return true;
            }
            return false;

        }


    }
}