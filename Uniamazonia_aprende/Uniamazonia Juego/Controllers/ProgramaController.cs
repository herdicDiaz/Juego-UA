using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Models;

namespace Uniamazonia_Juego.Controllers
{
    public class ProgramaController
    {
        Programa programa;

        // constructor
        public ProgramaController(int id_programa, string nombre_programa, string estado_programa) {
            programa = new Programa(id_programa,nombre_programa,estado_programa);

        }
        // metodos
        public DataTable lista_programas()
        {
            return programa.lista_programas();
        }


        public Boolean actualizar_programa()
        {
            if (programa.actualizar_programa())
            {
                return true;
            }

            return false;
        }
        public Boolean eliminar_programa()
        {
            if (programa.eliminar_programa())
            {
                return true;
            }
            return false;
        }


        public Boolean crear_programa()
        {
            if (programa.crear_programa())
            {
                return true;
            }
            return false;
        }


        }
}