using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Conexion;

namespace Uniamazonia_Juego.Models
{
    public class Ranking
    {

        Connection conexion;

        public Ranking()
        {

        }




        //consultas por parametros.
        public DataTable ConsultaParametroFk_Jugador(int fk_usuario)
        {
            this.conexion = new Connection();
            DataTable Consultas = new DataTable();
            String Query = "SELECT id_ranking, puntaje_acomulado, fk_jugador FROM ranking where fk_jugador = '" + fk_usuario + "';";
            Consultas = conexion.consultar_BD(Query);
            return Consultas;
        }

        public DataTable ConsultaReporteRanking()
        {
            this.conexion = new Connection();
            DataTable Consultas = new DataTable();
            String Query = "SELECT jugador.nombre_1, jugador.apellido_1, jugador.apellido_2, ranking.puntaje_acomulado FROM jugador INNER JOIN ranking WHERE jugador.id_jugador=ranking.fk_jugador  ORDER BY ranking.puntaje_acomulado Desc;";
            Consultas = conexion.consultar_BD(Query);
            return Consultas;
        }


        //Agregar registros
        public Boolean Insert(int puntaje, int fk_jugador)
        {
            this.conexion= new Connection();
            Boolean inserts = new Boolean();
            String Query = "INSERT INTO `aprender`.`ranking` (`puntaje_acomulado`, `fk_jugador`) VALUES (" + puntaje + ", " + fk_jugador + ");";
            inserts = conexion.insert_BD(Query);
            return inserts;
        }



        //Update 
        public Boolean Update(int puntos_prueba, int fk_usuario)
        {
            this.conexion = new Connection();
            Boolean up = new Boolean();
            String Query = "UPDATE `aprender`.`ranking` SET `puntaje_acomulado`='" + puntos_prueba + "' WHERE  `fk_jugador`='" + fk_usuario + "';";
            up = conexion.update_BD(Query);
            return up;
        }
    }
}