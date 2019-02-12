using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Conexion;

namespace Uniamazonia_Juego.Models
{
    public class Programa
    {
        int id_programa { set; get; }
        String nombre_programa { set; get; }
        String estado_programa { set; get; }
        Connection conexion_BD { set; get; }


        // constructor
        public Programa(int id_programa, string nombre_programa, string estado_programa)
        {
            this.id_programa = id_programa;
            this.nombre_programa = nombre_programa;
            this.estado_programa = estado_programa;
            this.conexion_BD = new Connection();
        }
        // metodos

        public DataTable lista_programas() {
            DataTable consulta = new DataTable();
            String Query = "select id_programa,nombre_programa from programa where estado_programa='A';";

            consulta = conexion_BD.consulta_comboBox(Query);
            return consulta;

        }


        public Boolean actualizar_programa() {
            String Query = "update programa set nombre_programa='"+nombre_programa+"' where id_programa='"+id_programa+"';";

            if (conexion_BD.update_BD(Query))
            {
                return true;
            }
            

            return false;
        }

        public Boolean eliminar_programa() {
            String Query = "update programa set estado_programa='D' where id_programa = '"+id_programa+"';";

            if (conexion_BD.delete_BD(Query))
            {
                return true;
            }
            return false;

        }


        public Boolean crear_programa() {
            String Query = "insert into programa(nombre_programa,estado_programa) values('"+nombre_programa+"','"+estado_programa+"');";

            if (conexion_BD.insert_BD(Query))
            {
                return true;
            }

            return false;
        }


    }
}