using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Models;

namespace Uniamazonia_Juego.Controllers
{
    public class prueba_sancionController
    {

        prueba_sancion prueba_sancionM = new prueba_sancion();
        public Boolean insert(String fk_prueba, String fk_sancion, String descripcion)
        {
            Boolean insert = prueba_sancionM.insert(fk_prueba, fk_sancion, descripcion);
            return insert;
        }

        public DataTable ConsultaGrid()
        {
            DataTable consulta = prueba_sancionM.ConsultaGrid();
            return consulta;
        }

        public DataTable buscarEnGrid(String palabra)
        {
            DataTable consulta = prueba_sancionM.buscarEnGrid(palabra);
            return consulta;
        }
        public DataTable ConsultaGridParametroNombrePrueba(String prueba)
        {
            DataTable consulta = prueba_sancionM.ConsultaGridParametroNombrePrueba(prueba);
            return consulta;
        }

        public DataTable buscarEnGridParametroPruebaPalabra(String palabra, String fk_prueba)
        {
            DataTable consulta = prueba_sancionM.buscarEnGridParametroPruebaPalabra(palabra,fk_prueba);
            return consulta;
        }

        public Boolean EliminarRegistros(int idprueba, int idsancion)
        {
            Boolean delete = prueba_sancionM.EliminarRegistros(idprueba, idsancion);
            return delete;
        }

        }
}