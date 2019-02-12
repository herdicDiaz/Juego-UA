using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Models;

namespace Uniamazonia_Juego.Controllers
{
    public class AyudaController
    {
        Ayuda ayuda;

        public AyudaController(int id_help, String title_help, String url_help) {
            ayuda = new Ayuda(id_help,title_help,url_help);
        }



    }
}