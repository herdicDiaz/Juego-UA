using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Models;

namespace Uniamazonia_Juego.Controllers
{
    public class RespuestaController
    {
        Respuesta respuestaM=new Respuesta();


        // metodos

        public Boolean insert_respuestas(String R1,String r2, string r3, String r4,string respuesta_correcta,String estado, int fk_pregunta)
        {
            return respuestaM.insert_respuestas(R1,r2,r3,r4,respuesta_correcta,estado,fk_pregunta);
        }

        public Boolean updateRespuesta(String r1, String r2, String r3, String r4, String resco,int fk_pregunta)
        {
            Boolean consulta = respuestaM.updateRespuesta(r1,r2,r3,r4,resco,fk_pregunta);
            return consulta;
        }
        public DataTable ConsultaParametroFk_pregunta(String fk_pregunta)
        {
            DataTable consulta = respuestaM.ConsultaParametroFk_pregunta(fk_pregunta);
            return consulta;
        }
        }
}