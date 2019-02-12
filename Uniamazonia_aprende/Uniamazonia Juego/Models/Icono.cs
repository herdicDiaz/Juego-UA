using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Conexion;

namespace Uniamazonia_Juego.Models
{
    public class Icono
    {
        private int id_icono { get; set; }
        private String nombre_icono { get; set; }
        private String estado_icono { get; set; }
        private Connection conexion { set; get; }

        // constructor
        public Icono(int id_icono_in, string name_icon, string state_icon)
        {
            this.id_icono = id_icono_in;
            this.nombre_icono = name_icon;
            this.estado_icono = state_icon;
            this.conexion = new Connection();
        }

        // metodos
        public Boolean agregar_icono() {
            String Query = "insert into icono(nombre_icono,estado_icono) values('"+this.nombre_icono+"','"+this.estado_icono+"');";

            if (conexion.insert_BD(Query))
            {
                return true;
            }

            return false;

        }

        



        public DataTable consulta_iconos() {
            DataTable consulta = new DataTable();
            String Query = "select id_icono,nombre_icono from icono where estado_icono = 'A';";
            consulta = conexion.consultar_BD(Query);
            return consulta;
        }
        public DataTable consulta_iconos_aux() {
            DataTable consulta = new DataTable();
            String Query = "select id_icono,nombre_icono,estado_icono from icono where estado_icono = 'A';";
            consulta = conexion.consultar_BD(Query);
            return consulta;
        }


        public Boolean desactivar_icono() {
            String query = "select id_icono from icono where nombre_icono ='"+this.nombre_icono+"';";

            int aux_id = Convert.ToInt32(conexion.consulta_universal(query));

            String Query = "update icono set estado_icono='D' where id_icono='"+aux_id+"';";
            if (conexion.update_BD(Query))
            {
                return true;
            }
            return false;
        }

        public Boolean eliminar_icono() {


            String Query = "update icono set estado_icono='D' where id_icono='" + id_icono + "';";
            if (conexion.update_BD(Query))
            {
                return true;
            }
            return false;

        }
        


        public Boolean actualizar_nombre_icono() {
            String Query = "update icono set nombre_icono='"+this.nombre_icono+"' where id_icono='"+this.id_icono+"'; ";

            if (conexion.update_BD(Query))
            {
                return true;
            }
            else {
                return false;
            }
            
        }


        public Boolean desactivar_O_activar_icono(String nombre_icon_desact)
        {
            // icono a activar
            String query1 = "select id_icono from icono where nombre_icono ='"+this.nombre_icono+"';";
            int aux_id1 = Convert.ToInt32(conexion.consulta_universal(query1));
            // icono a desactivar
            String query2 = "select id_icono from icono where nombre_icono ='"+nombre_icon_desact+"';";
            int aux_id2 = Convert.ToInt32(conexion.consulta_universal(query2));
            
            String Query = "update icono set estado_icono='A' where id_icono='"+aux_id1+"';" +
                "update icono set estado_icono = 'D' where id_icono = '"+aux_id2+"'; ";
            if (conexion.update_BD(Query))
            {
                return true;
            }
            return false;
        }








    }
}