using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Conexion;

namespace Uniamazonia_Juego.Models
{
    public class Vista
    {
        private int id_vista { set; get; }
        private String url { set; get; }
        private String estado { set; get; }
        private String descripcion { set; get; }
        private String icono { set; get; }
        private int fk_master { set; get; }
        private Connection conexion { set; get; }

        // constructor 
        public Vista(int id_view, String url_in, String state, String description, String icon, int fk_master_in)
        {
            this.id_vista = id_view;
            this.url = url_in;
            this.estado = state;
            this.descripcion = description;
            this.icono = icon;
            this.fk_master = fk_master_in;
            this.conexion = new Connection();
        }

        // metodos
        public DataTable consulta_menu(String id_rol)
        {
            DataTable consulta = new DataTable();


            String Query = @"select DISTINCT vista.id_vista, vista.url,vista.estado, vista.descripcion, vista.icono, vista.fk_master from vista
                            inner join vista_rol on  vista.id_vista = vista_rol.fk_id_vista inner join rol on vista_rol.fk_id_rol = rol.id_rol 
                            inner join rol_usuario on rol.id_rol= rol_usuario.fk_id_rol inner join usuario on rol_usuario.fk_usuario = usuario.id_usuario
                            where rol.id_rol = '" + id_rol + "' and vista.estado = 'Activo';";

            //String Query = @"select vista.id_vista, vista.url,vista.estado, vista.descripcion, vista.icono, vista.fk_master from vista
            //                inner join vista_rol on  vista.id_vista = vista_rol.fk_id_vista inner join rol on vista_rol.fk_id_rol = rol.id_rol 
            //                inner join rol_usuario on rol.id_rol= rol_usuario.fk_id_rol inner join usuario on rol_usuario.fk_usuario = usuario.id_usuario
            //                where usuario.id_usuario = '" + id_rol + "' and vista.estado = 'Activo';";

            consulta = conexion.consultar_BD(Query);
            return consulta;
        }
        public Boolean crear_menu_padre()
        {

            // saber el siguiente id de la tabla vista
            String Query_min = "select max(id_vista) from vista where url='#'";
            int aux_fk_master = (conexion.buscar_ID_BD(Query_min)) + 1;
            if (aux_fk_master != 777)
            {
                String Query = "insert into vista(id_vista,url,estado,descripcion,icono,fk_master) values('" + aux_fk_master + "','" + this.url + "','" + this.estado + "','" + this.descripcion + "','" + this.icono + "','" + aux_fk_master + "');";

                if (conexion.insert_BD(Query))
                {


                    return true;
                }

            }

            return false;
        }


        public int id_vista_hija()
        {
            conexion = new Connection();
            String Query = "select max(id_vista) from vista;";
            int aux_nuevo_id = (conexion.buscar_ID_BD(Query)) + 1;
            return aux_nuevo_id;
        }

        public int id_menu_padre(String aux_nombre_padre)
        {
            conexion = new Connection();
            int aux_id = 0;
            String Query = "select id_vista from vista where descripcion='" + aux_nombre_padre + "';";

            aux_id = conexion.buscar_ID_BD(Query);

            return aux_id;

        }

        public Boolean crear_vista_hijas(String aux_nombre_padre)
        {
            //scar el id nuevo dela vista


            String Quer_min = "select id_vista from vista where descripcion='" + aux_nombre_padre + "';";
            this.fk_master = conexion.buscar_ID_BD(Quer_min);

            String Query_real = "insert into vista values('" + this.id_vista + "','" + this.url + "','" + this.estado + "','" + this.descripcion + "','" + this.icono + "','" + this.fk_master + "'); ";

            if (conexion.insert_BD(Query_real))
            {
                return true;
            }
            return false;


        }

        public DataTable consulta_combox_nombre()
        {
            DataTable consulta = new DataTable();
            String Query = "select descripcion from vista where url='#' and estado='activo';";
            consulta = conexion.consulta_comboBox(Query);

            return consulta;
        }
        public DataTable consulta_combox_nombre_menu_hijo()
        {
            DataTable consulta = new DataTable();
            String Query = "select descripcion from vista where url!='#' and estado='activo';";
            consulta = conexion.consulta_comboBox(Query);

            return consulta;
        }



        public DataTable consulta_menu_unico(int aux_rol)
        {
            String Query = "select vista.descripcion, vista.icono, vista.url from vista " +
                "inner join vista_rol on  vista.id_vista = vista_rol.fk_id_vista inner join rol on vista_rol.fk_id_rol = rol.id_rol " +
                "inner join rol_usuario on rol.id_rol = rol_usuario.fk_id_rol inner join usuario on rol_usuario.fk_usuario = usuario.id_usuario " +
                "where usuario.id_usuario = '" + aux_rol + "' and vista.fk_master = '" + this.fk_master + "'; ";
            DataTable consulta = new DataTable();

            consulta = conexion.consultar_BD(Query);

            return consulta;
        }

        public String url_BD()
        {
            String Query = "select vista.url from vista where descripcion='" + this.descripcion + "';";
            String consulta = conexion.consulta_universal(Query);
            return consulta;
        }

        public String icono_BD()
        {
            String Query = "select vista.icono from vista where descripcion='" + this.descripcion + "';";
            String consulta = conexion.consulta_universal(Query);
            return consulta;
        }


        public Boolean editar_menu_padre(String aux_nombre_padre)
        {
            String Query = "SET SQL_SAFE_UPDATES = 0;update vista set descripcion ='" + this.descripcion + "', icono ='" + this.icono + "' where descripcion='" + aux_nombre_padre + "';";
            if (conexion.update_BD(Query))
            {
                return true;
            }
            return false;

        }

        public Boolean editar_menu_hijos(String aux_nombre_hijo)
        {
            String Query = "SET SQL_SAFE_UPDATES = 0;update vista set descripcion ='" + this.descripcion + "', url ='" + this.url + "' where descripcion='" + aux_nombre_hijo + "';";

            if (conexion.update_BD(Query))
            {
                return true;
            }
            return false;
        }

        public Boolean eliminar_menu() {
            String query = "select id_vista from vista where descripcion='"+this.descripcion+"';";
            int id_eliminar = Convert.ToInt32(conexion.consulta_universal(query));

            String Query = "call eliminar_menu_padreHijo('"+id_eliminar+"');";
            if (conexion.delete_BD(Query))
            {
                return true;
            }
            return false;
        }



        public Boolean eliminar_sub_menu() {
            String Query = "SET SQL_SAFE_UPDATES = 0; update vista set estado = 'D' where descripcion = '"+this.descripcion+"'; ";

            if (conexion.delete_BD(Query))
            {
                return true;
            }



            return false;
        }

        public DataTable consulta_menu_hijo() {
            DataTable consulta = new DataTable();
            String Query = "select vista.id_vista, vista.descripcion, vista.url, vista.estado, vista.icono from vista where fk_master='"+this.id_vista+"' and url != '#';";
            consulta = conexion.consultar_BD(Query);
            return consulta;
        }
        public DataTable consulta_menu_hijo_general() {
            DataTable consulta = new DataTable();
            String Query = "select vista.id_vista, vista.descripcion, vista.url, vista.estado, vista.icono from vista where url != '#';";
            consulta = conexion.consultar_BD(Query);
            return consulta;
        }

        public DataTable filtro_menu_hijo(String dato) {
            DataTable consulta = new DataTable();
            String Query = "select vista.id_vista, vista.descripcion, vista.url, vista.estado, vista.icono from vista where descripcion like '%" + dato+"%';";

            consulta = conexion.consultar_BD(Query);



            return consulta;
        }

    }
}