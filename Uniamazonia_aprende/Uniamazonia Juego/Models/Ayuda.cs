using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Conexion;

namespace Uniamazonia_Juego.Models
{
    public class Ayuda
    {
        private int id_ayuda { set; get; }
        private String titulo_ayuda { set; get; }
        private String link_ayuda { set; get; }
        private Connection conexion;

        // constructor
        public Ayuda(int id_help,String title_help, String url_help) {
            this.id_ayuda = id_help;
            this.titulo_ayuda = title_help;
            this.link_ayuda = url_help;
            this.conexion = new Connection();
        }
        // metodos


    }
}