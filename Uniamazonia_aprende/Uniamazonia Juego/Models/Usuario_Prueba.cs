using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Conexion;

namespace Uniamazonia_Juego.Models
{
    public class Usuario_Prueba
    {
        private int fk_pk_usuario { set; get; }
        private int fk_pk_prueba { set; get; }
        private String fecha_usuario_prueba { set; get; }
        //private Connection conexion { get; set; }
        Connection conexion = new Connection();
        // constructor
        public Usuario_Prueba(int fk_pk_user, int fk_pk_proof, String fecha_u_p) {
            this.fk_pk_usuario = fk_pk_user;
            this.fk_pk_prueba = fk_pk_proof;
            this.fecha_usuario_prueba = fecha_u_p;
            this.conexion = new Connection();

        }

        public Usuario_Prueba()
        {
        }


        // metodos
        public Boolean InsertarRegistro(int fk_prueba, int fk_jugador, String fecha, int puntos_prueba, int P_NoContestadas, int P_Contestadas, int P_Incorrectas, int P_Correctas)
        {
            Boolean insert = new Boolean();
            String Query = "INSERT INTO `aprender`.`usuario_prueba` (`fk_prueba`, `fk_jugador`, `fecha_prueba`, `puntos_prueba`, `P_NoContestadas`, `P_Contestadas`, `P_Incorrectas`, `P_Correctas`) VALUES ('" + fk_prueba + "', '" + fk_jugador+ "', '2018/02/07', '" + puntos_prueba + "', '" + P_NoContestadas + "', '" + P_Contestadas + "', '" + P_Incorrectas + "', '" + P_Correctas + "');";
            insert = conexion.insert_BD(Query);
            return insert;
        }

        public DataTable Consulta_parametro_fk_prueba_fk_usuario(int fk_prueba, int fk_usuario)
        {
            DataTable consulta = new DataTable();
            String Query = "SELECT fk_prueba, fk_usuario, fecha_prueba, puntos_prueba, P_NoContestadas, P_Contestadas, P_Incorrectas, P_Correctas from usuario_prueba WHERE usuario_prueba.fk_prueba='" + fk_prueba + "' AND usuario_prueba.fk_usuario='" + fk_usuario + "';";
            consulta = conexion.consultar_BD(Query);
            return consulta;
        }
        }
}