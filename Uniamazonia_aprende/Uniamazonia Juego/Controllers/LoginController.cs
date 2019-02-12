using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Models;

namespace Uniamazonia_Juego.Controllers
{
    public class LoginController
    {
        private int id_usuario { get; set; }
        private String nombre_usuario { get; set; }
        private String password_usuario { get; set; }
        private String privilegio_usuario { set; get; }

        Usuario usuario_i = new Usuario();

        //constructor con parametros
        public LoginController(int id_usuario, string nombre_usuario, string password_usuario, string privilegio_usuario)
        {
            this.id_usuario = id_usuario;
            this.nombre_usuario = nombre_usuario;
            this.password_usuario = password_usuario;
            this.privilegio_usuario = privilegio_usuario;
        }

        //constructor vacio
        public  LoginController()
        {
        }


        //metodos
        public DataTable Login(String usuario, String password)
        {
            DataTable dt = usuario_i.validar_usuario(usuario, password);
            if (dt.Rows.Count != 0)
            {
                id_usuario = Int32.Parse(dt.Rows[0]["id_usuario"].ToString());
                nombre_usuario = dt.Rows[0]["nombre_usuario"].ToString();
                password = dt.Rows[0]["password_usuario"].ToString();


            }
            return dt;
        }
    }
}