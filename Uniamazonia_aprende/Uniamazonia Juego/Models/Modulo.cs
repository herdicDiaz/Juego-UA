using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI.HtmlControls;
using Uniamazonia_Juego.Conexion;


namespace Uniamazonia_Juego.Models
{
    public class Modulo
    {
        private int id_modulo { set; get; }
        private String nombre_modulo { set; get; }
        private String estado_modulo { set; get; }
        private String url_img_modulo { set; get; }
        private Connection conexion { set; get; }


        private DataTable modulos_BD = new DataTable();

        public Modulo()
        {
            this.conexion = new Connection();
        }

        public Modulo(int id_module, String name_module, String state_module, String url_img_module)
        {
            this.id_modulo = id_module;
            this.nombre_modulo = name_module;
            this.estado_modulo = state_module;
            this.url_img_modulo = url_img_module;
            this.conexion = new Connection();
        }

        // metodos


        public String consulta_nombre_BD() {
            String Query = "select nombre_modulo from modulo where id_modulo= '"+this.id_modulo+"';";
            String consulta = conexion.consulta_universal(Query) ;
            return consulta;
        }






        public Boolean crear_modulo()
        {
            String Query = "insert  into modulo(nombre_modulo,estado_modulo,irl_img_modelo) values('" + nombre_modulo + "','" + estado_modulo + "','" + url_img_modulo + "'); ";
            if (conexion.insert_BD(Query))
            {
                return true;
            }
            return false;
        }


        public DataTable consultar_modulo()
        {
            DataTable consulta = new DataTable();
            String Query = "select modulo.id_modulo,modulo.nombre_modulo,modulo.estado_modulo, modulo.irl_img_modelo from modulo;";
            consulta = conexion.consultar_BD(Query);

            return consulta;

        }

        public DataTable filtrando_registros_modulo(String dato)
        {
            DataTable consulta = new DataTable();
            String Query = "select id_modulo,nombre_modulo,estado_modulo from modulo where nombre_modulo like '%" + dato + "%';";

            consulta = conexion.consultar_BD(Query);

            return consulta;
        }



        public DataTable consulta_combox_nombre()
        {
            DataTable consulta = new DataTable();
            String Query = "select id_modulo, nombre_modulo from modulo where estado_modulo = 'A';";
            consulta = conexion.consulta_comboBox(Query);

            return consulta;
        }

        public Boolean actualizar_nombre_modulo()
        {
            String Query = "update modulo set nombre_modulo='" + nombre_modulo + "', irl_img_modelo='" + url_img_modulo + "' where id_modulo='" + id_modulo + "';";

            if (conexion.update_BD(Query))
            {
                return true;
            }
            return false;
        }

        public Boolean eliminar_modulo()
        {
            String Query = "update modulo set estado_modulo='D' where nombre_modulo='" + nombre_modulo + "';";
            if (conexion.delete_BD(Query))

            {
                return true;
            }
            return false;
        }


        public DataTable consulta_modulosBD()
        {
            DataTable consulta_BD = new DataTable();
            String Query = "select nombre_modulo, irl_img_modelo from modulo where estado_modulo = 'A';";

            consulta_BD = conexion.consultar_BD(Query);
            return consulta_BD;
        }


        // cargar modulos dinamicos

        public void cargar_modulos(HtmlContainerControl contenedor_modulo)
        {
            modulos_BD = consulta_modulosBD();

            List<Modulos> lista_modulos = new List<Modulos>();

            // crear modulos
            foreach (DataRow elemento_BD in modulos_BD.Rows)
            {
                lista_modulos.Add(new Modulos(elemento_BD));
            }

            // todos los modulos
         

            foreach (Modulos nuevo in lista_modulos)
            {
                contenedor_modulo.Controls.Add(nuevo.crearHTML_modulo());
                

            }

        }
    }

  

    public class Modulos
    {
        public String nombre = "", url_imagen = "",descripcion="",nombre_btn="";
    
        StringBuilder HTML_modulos = new StringBuilder();

        public HtmlContainerControl div;

        public Modulos(DataRow fila) {
            this.nombre = fila["nombre_modulo"].ToString();
            this.url_imagen= fila["irl_img_modelo"].ToString();
            this.descripcion = "Sin Descripcion";
            this.nombre_btn = "Ver Contenidos";
            div = new HtmlGenericControl("div");
        }


        public HtmlGenericControl crearHTML_modulo() {
            div.Attributes.Add("class", "col-lg-4");
                HTML_modulos.Append("<div class='card text-center'>");
                HTML_modulos.Append("<img class='card-img-top' src='"+url_imagen +"' alt='Card image cap' width='297,983' height='148,983' >");
                HTML_modulos.Append("<div class='card-body'>");
                HTML_modulos.Append("<h5 class='card-title'>"+nombre);
                HTML_modulos.Append("</h5>");
                HTML_modulos.Append("<p class='card-text'>"+descripcion);
                HTML_modulos.Append("</p>");
                HTML_modulos.Append("</div>");
                HTML_modulos.Append("<div class='card-footer'>");
                HTML_modulos.Append("<button id='btnVerContenidos' class='btn btn-success' runat='server' type='submit' onserverclick='btnVerContenidos_Click'>" + nombre_btn);
                HTML_modulos.Append("</button>");
                HTML_modulos.Append("</div>");
                HTML_modulos.Append("</div>");
                HTML_modulos.Append("<script runat='server'>");
                HTML_modulos.Append("</script>");


            div.InnerHtml = HTML_modulos.ToString();

            return (HtmlGenericControl) div;
        }





    }

}












