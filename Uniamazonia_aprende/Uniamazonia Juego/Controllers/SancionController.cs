using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Models;

namespace Uniamazonia_Juego.Controllers
{


    public class SancionController
    {
        private int idsancion { get; set; }
        private String descripcion { get; set; }
        private String url { get; set; }
        private String estado_sancion { get; set; }
        Sancion sancionM = new Sancion();
        public SancionController(int idsancion, string descripcion, string url, string estado_sancion)
        {
            this.idsancion = idsancion;
            this.descripcion = descripcion;
            this.url = url;
            this.estado_sancion = estado_sancion;
        }

        public SancionController()
        {
        }

        public DataTable consulta_combox()
        {
            DataTable dt = sancionM.consulta_Combox_nombre();
            return dt;
        }

        public DataTable consultar_idSancion(String sancionP)
        {
            return sancionM.consultar_idSancion(sancionP);
        }

        public DataTable listarSancion()
        {
            return sancionM.listarSanciones();
        }

        public Boolean insertarSancion(String descripcion, String url, String estado)
        {
            Boolean consulta = sancionM.insertarSancion(descripcion, url, estado);
            return consulta;
        }

        public Boolean eliminarSancion(String idsancion)
        {
            Boolean consulta = sancionM.eliminarSancion(idsancion);
            return consulta;
        }

        public DataTable consultaGrid()
        {
            DataTable consulta = sancionM.consultaGrid();
            return consulta;
        }
        public DataTable ConsultaParametroIdsancion(String idsancion)
        {
            DataTable consulta = sancionM.ConsultaParametroIdsancion(idsancion);
            return consulta;
        }

        public Boolean updateSancion(String descripcion, String url, String estado, String id_sancion)
        {
            Boolean consulta = sancionM.updateSancion(descripcion, url, estado, id_sancion);
            return consulta;
        }

        //public Boolean UpdateSancionEstado(int idsancion)
        //{
        //    Boolean consulta = sancionM.UpdateSancionEstado(idsancion);
        //    return consulta;
        //}

            public DataTable ConsultaUrl(String idsancion)
        {
            DataTable consulta = sancionM.ConsultaUrl(idsancion);
            return consulta;
        }

        public DataTable buscarEnGrid(String palabra)
        {
            DataTable consulta = sancionM.buscarEnGrid(palabra);
            return consulta;
        }
    }
}