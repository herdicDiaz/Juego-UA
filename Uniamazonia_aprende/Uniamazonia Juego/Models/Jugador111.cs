using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Conexion;


namespace Uniamazonia_Juego.Models
{
    public class Jugador111
    {
        private int id_jugador { set; get; }
        private int identificacion_jugador { set; get; }
        private String nombre1 { set; get; }
        private String nombre2 { set; get; }
        private String apellido1{ set; get; }
        private String apellido2 { set; get; }
        private String programa_academico { set; get;}
        private int semestre { set; get;}
        private String correo_electronico { set; get; }
        private String estado_jugador { set; get; }
        private int fk_usuario { set; get; }


        private Connection conexion { set; get; }




        // constructor
        public Jugador111(int id_player, int identificacion_player, String name_one, String name_two, String last_name_one, String last_name_two, String 
            programa_academic, int semester, String email, String state_player, int fk_user) {

            this.id_jugador = id_player;
            this.identificacion_jugador = identificacion_player;
            this.nombre1 = name_one;
            this.nombre2 = name_two;
            this.apellido1 = last_name_one;
            this.apellido2 = last_name_two;
            this.programa_academico = programa_academic;
            this.semestre = semester;
            this.correo_electronico = email;
            this.estado_jugador = state_player;
            this.fk_usuario = fk_user;
            this.conexion = new Connection();



        }

        // metodos 
        public int traer_id_jugador() {
            String Query = "select id_jugador from jugador where fk_usuario ='"+this.id_jugador+"';";
            int dato = 0;

            dato = conexion.buscar_ID_BD(Query);



            return dato;

        }



        public String consultar_nombre_BD() {
            String Query = "select concat_ws(' ',nombre_1,nombre_2,apellido_1,apellido_2) as nombres from jugador where id_jugador= '"+this.id_jugador+"';";
            String nombre_completo = "";

            nombre_completo = conexion.consulta_universal(Query);
            return nombre_completo;
        }


        public Boolean crear_jugador(int fk_programa) {
            String Query = "insert into jugador(identificacion_jugador,nombre_1,nombre_2,apellido_1,apellido_2,semestre,correo_electronico,estado_jugador,fk_usuario,fk_programa) " +
                "values('"+id_jugador+"','"+nombre1+"', '"+nombre2+"', '"+apellido1+"', '"+apellido2+"', '"+semestre+"', '"+correo_electronico+"', '"+estado_jugador+"', '"+fk_usuario+"', '"+fk_programa+"'); ";

            if (conexion.insert_BD(Query))
            {
                return true;
            }
            return false;
        }


        public DataTable consulta_unica_jugador() {
            DataTable consulta_BD = new DataTable();
            String Query = "select identificacion_jugador,nombre_1,nombre_2,apellido_1,apellido_2,semestre,nombre_programa,correo_electronico, password_usuario from programa inner join " +
                "jugador on programa.id_programa = jugador.fk_programa inner join usuario on jugador.fk_usuario = usuario.id_usuario where id_usuario = '"+fk_usuario+"';";

            consulta_BD = conexion.consultar_BD(Query);
            
            return consulta_BD;
        }

        public int fk_programa() {
            int dato = 0;
            String Query = "select fk_programa from jugador where fk_usuario='"+fk_usuario+"';";
            dato = conexion.buscar_ID_BD(Query);
            return dato;
        }


        public Boolean actualizar_jugador() {
            String Query = "update jugador set identificacion_jugador ='"+identificacion_jugador+"', nombre_1='"+nombre1+"',nombre_2='"+nombre2+"',apellido_1='"+apellido1+"',apellido_2='"+apellido2+"', " +
                "semestre='"+semestre+"',correo_electronico='"+correo_electronico+"' where fk_usuario='"+fk_usuario+"';";

            if (conexion.update_BD(Query))
            {
                return true;
            }

            return false;
        }
        

    }
}