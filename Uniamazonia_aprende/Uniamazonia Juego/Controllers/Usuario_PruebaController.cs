using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Models;
using Uniamazonia_Juego.Views.VistasJugador.ConsulraContenido;

namespace Uniamazonia_Juego.Controllers
{
    public class Usuario_PruebaController
    {
        Usuario_Prueba usuario_prueba=new Usuario_Prueba();
        Boolean Insert=false;
        DataTable consulta = new DataTable();

        public Usuario_PruebaController(int fk_pk_user, int fk_pk_proof, String fecha_u_p) {
            usuario_prueba = new Usuario_Prueba(fk_pk_user,fk_pk_proof,fecha_u_p);
        }

        public Usuario_PruebaController()
        {
        }

        //insert
        public Boolean InsertarRegistro(int fk_prueba, int fk_usuario, String fecha,int puntos_prueba, int P_NoContestadas, int P_Contestadas, int P_Incorrectas, int P_Correctas)
        {
            Insert=usuario_prueba.InsertarRegistro(fk_prueba,  fk_usuario,  fecha,  puntos_prueba,  P_NoContestadas,  P_Contestadas,  P_Incorrectas,  P_Correctas);
            return Insert;
        }

        public DataTable Consulta_parametro_fk_prueba_fk_jugador(int fk_prueba, int fk_usuario)
        {
            consulta = usuario_prueba.Consulta_parametro_fk_prueba_fk_jugador(fk_prueba,fk_usuario);
            return consulta;
        }
        }
}