using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Conexion;

namespace Uniamazonia_Juego.Models
{
    public class Respuesta
    {
        private String respuesta_a { set; get; }
        private String respuesta_b { set; get; }
        private String respuesta_c { set; get; }
        private String respuesta_d { set; get; }
        private String respuesta_correcta { set; get; }
        private String estado_respuesta { set; get; }
        private int fk_pregunta { set; get; }

        private Connection conexion = new Connection();

        public Respuesta(string respuesta_a, string respuesta_b, string respuesta_c, string respuesta_d, string respuesta_correcta, string estado_respuesta, int fk_pregunta)
        {
            this.respuesta_a = respuesta_a;
            this.respuesta_b = respuesta_b;
            this.respuesta_c = respuesta_c;
            this.respuesta_d = respuesta_d;
            this.respuesta_correcta = respuesta_correcta;
            this.estado_respuesta = estado_respuesta;
            this.fk_pregunta = fk_pregunta;
        }

        public Respuesta()
        {

        }

        public Boolean insert_respuestas(String r1, String r2, string r3, String r4, string respuesta_correcta, String estado, int fk_pregunta)
        {
            Boolean consulta = new Boolean();
            String Query = "INSERT INTO `aprender`.`respuesta` (`respuesta_a`, `respuesta_b`, `respuesta_c`, `respuesta_d`, `respuesta_correcta`, `estado_respuesta`, `fk_pregunta`) VALUES ('"+r1+"', '"+r2+"', '"+r3+"', '"+r4+"', '"+respuesta_correcta+"', '"+estado+"', '"+fk_pregunta+"');";
            consulta=conexion.insert_BD(Query);
            return consulta;

        }

        public Boolean updateRespuesta(String r1,String r2,String r3, String r4, String respuesta_correcta, int fk_pregunta)
        {
            Boolean consulta = new Boolean();
            String Query = "UPDATE `aprender`.`respuesta` SET `respuesta_a`='"+r1+"', `respuesta_b`='"+r2+"', `respuesta_c`='"+r3+"', `respuesta_d`='"+r4+"', `respuesta_correcta`='"+respuesta_correcta+ "', `estado_respuesta`='A' WHERE  `fk_pregunta`=" + fk_pregunta+";";
            consulta = conexion.update_BD(Query);
            return consulta;
        }

        public DataTable ConsultaParametroFk_pregunta(String fk_pregunta)
        {
            DataTable consulta = new DataTable();
            String Query = "Select *from respuesta where fk_pregunta='"+fk_pregunta+"';";
            consulta = conexion.consultar_BD(Query);
            return consulta;
        }
    }
}