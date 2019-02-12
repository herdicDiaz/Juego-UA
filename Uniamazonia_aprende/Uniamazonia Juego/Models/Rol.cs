using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Conexion;

namespace Uniamazonia_Juego.Models
{
    public class Rol
    {
        private int id_rol { set; get; }
        private String nombre_rol { set; get; }
        private String descripcion_rol { set; get; }
        private Connection conexion { set; get; }

        public Rol(int id_role, String name_role, String description_role) {
            this.id_rol = id_role;
            this.nombre_rol = name_role;
            this.descripcion_rol = description_role;
            this.conexion = new Connection();
        }

        // metedos..

        public DataTable consulta_menu_unico() {
            DataTable consulta = new DataTable();
            String Query = "select vista.id_vista, vista.descripcion from rol inner join vista_rol on " +
                "id_rol = fk_id_rol inner join vista on id_vista = fk_id_vista where(rol.id_rol = '"+this.id_rol+"' and vista.url = '#'); ";
            consulta = conexion.consultar_BD(Query);
            return consulta;
        }

    }
}