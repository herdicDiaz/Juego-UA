using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Models;

namespace Uniamazonia_Juego.Controllers
{
    public class EmpresaController
    {
        private Empresa empresa;

        // constructor
        public EmpresaController(int id_company, String name_company, String descrip_company, int nit_company)
        {
            empresa = new Empresa(id_company, name_company, descrip_company, nit_company);

        }

        // metodos
        public Boolean estado_conexion_BD()
        {
            if (empresa.estado_conexion_BD())
            {

                return true;
            }
            return false;
        }
        public String consulta_nombre_BD()
        {
            return empresa.consulta_nombre_BD();
        }

        public String consulta_descripcion_BD()
        {
            return empresa.consulta_descripcion_BD();
        }

        public String consulta_nit_BD()
        {
            return empresa.consulta_nit_BD();
        }

        public Boolean actualizar_empresa()
        {
            if (empresa.actualizar_empresa())
            {
                return true;
            }


            return false;
        }







        }
}