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
    public class Contenido
    {
        private int id_contenido { set; get; }
        private String nombre_contenido { set; get; }
        private String descripcion_contenido { set; get; }
        private String estado_contenido { set; get; }
        private String url_img_contenido { set; get; }

        private Connection conexion=new Connection();

        private DataTable contenido_BD = new DataTable();

        // constructor
        public Contenido(int id_content, String name_content, String descrip_content, String state_content, String url_img_content) {
            this.id_contenido = id_content;
            this.nombre_contenido = name_content;
            this.descripcion_contenido = descrip_content;
            this.estado_contenido = state_content;
            this.url_img_contenido = url_img_content;
            this.conexion = new Connection();
        }

        public Contenido()
        {
        }

        // metodos
        public Boolean crear_contenido(String nombre_modulo) {
            // 1). buscar fk del contenido al que va amarrado
            String Query = "select modulo.id_modulo from modulo where nombre_modulo = '" + nombre_modulo + "' and estado_modulo='A';";
            int aux_fK_contenido = conexion.buscar_ID_BD(Query);




            // 2) crear el contenido
            if (aux_fK_contenido != 777)
            {
                String script = "insert into contenido(nombre_contenido,descripcion_contenido,url_img_contenido,estado_contenido,fk_id_modulo) " +
                    "values('" + nombre_contenido + "', '" + descripcion_contenido + "', '" + url_img_contenido + "', '" + estado_contenido + "', '" + aux_fK_contenido + "'); ";

                if (conexion.insert_BD(script))
                {
                    return true;
                }
            }

            return false;
        }

        public DataTable consultar_contenido() {
            DataTable cosulta = new DataTable();
            String Query = "select id_contenido, nombre_contenido,descripcion_contenido,estado_contenido from contenido where estado_contenido='A';";

            cosulta = conexion.consultar_BD(Query);


            return cosulta;
        }

        public DataTable consultar_contenido(int id_modulo)
        {
            DataTable cosulta = new DataTable();
            String Query = "select id_contenido, nombre_contenido,descripcion_contenido,estado_contenido from contenido where fk_id_modulo='"+id_modulo+"' and estado_contenido='A';";
            cosulta = conexion.consultar_BD(Query);
            return cosulta;
        }

        public DataTable filtrando_registros_contenido(String dato)
        {
            DataTable consulta = new DataTable();
            String Query = "select id_contenido, nombre_contenido, descripcion_contenido, estado_contenido from contenido where (estado_contenido='A' and nombre_contenido like '%" + dato + "%');";

            consulta = conexion.consultar_BD(Query);

            return consulta;
        }


        public DataTable consulta_combox_nombre()
        {
            DataTable consulta = new DataTable();
            String Query = "select id_contenido, nombre_contenido from contenido where estado_contenido = 'A';";
            consulta = conexion.consulta_comboBox(Query);

            return consulta;
        }

        public DataTable consulta_contenido_x_modulo_combox_nombre(int aux_fk_modulo)
        {
            DataTable consulta = new DataTable();
            String Query = "select id_contenido, nombre_contenido from contenido where (estado_contenido='A' and fk_id_modulo='" + aux_fk_modulo + "');";
            consulta = conexion.consulta_comboBox(Query);

            return consulta;
        }


        public Boolean editar_contenido() {
            String Query = "update contenido set nombre_contenido='" + nombre_contenido + "', descripcion_contenido='" + descripcion_contenido + "', " +
                "url_img_contenido='" + url_img_contenido + "' where id_contenido='" + id_contenido + "';";

            if (conexion.update_BD(Query))
            {
                return true;
            }
            return false;
        }

        public Boolean eliminar_contenido() {
            String Query = "update contenido set estado_contenido ='D' where nombre_contenido = '" + this.nombre_contenido + "';";
            if (conexion.delete_BD(Query))
            {
                return true;
            }

            return false;

        }

        public DataTable consulta_contenido_x_modulo(String nombre_modulo) {

            DataTable consulta = new DataTable();
            int aux_fk_modulo = 0;
            String query = "select id_modulo from modulo where nombre_modulo='" + nombre_modulo + "';";
            aux_fk_modulo = Convert.ToInt32(conexion.consulta_universal(query));
            String Query = "select contenido.id_contenido,contenido.nombre_contenido,contenido.descripcion_contenido, contenido.estado_contenido " +
                "from  contenido where fk_id_modulo= '" + aux_fk_modulo + "' and estado_contenido='A';";
            consulta = conexion.consultar_BD(Query);


            return consulta;
        }

        public DataTable consulta_contenido_x_modulo_nombre(String nombre_modulo) {

            DataTable consulta = new DataTable();
            int aux_fk_modulo = 0;
            String query = "select id_modulo from modulo where (nombre_modulo='" + nombre_modulo + "' and estado_modulo='A');";
            aux_fk_modulo = Convert.ToInt32(conexion.consulta_universal(query));
            String Query = "select contenido.nombre_contenido " +
                "from  contenido where (fk_id_modulo= '" + aux_fk_modulo + "' and estado_contenido='A');";
            consulta = conexion.consultar_BD(Query);


            return consulta;
        }




        // metodo para sacar todo el contenido a la bases de datos.

        public DataTable listar_contenido(int aux_fk_modulo) {
            DataTable consulta = new DataTable();
            String Query = "select nombre_contenido,descripcion_contenido,url_img_contenido from contenido where fk_id_modulo='"+aux_fk_modulo+"';";
            consulta = conexion.consultar_BD(Query);
            return consulta;

        }



        // mostrar contenido dinamico

        public void cargar_contenido_dinamico(HtmlContainerControl contenedor_contenidos,int aux_fk_modulo) {

            contenido_BD = listar_contenido(aux_fk_modulo);

            List<Contenidoss> lista_contenidoss = new List<Contenidoss>();

            // crear contenidoss
            foreach (DataRow elemento_BD in contenido_BD.Rows)
            {
                lista_contenidoss.Add(new Contenidoss(elemento_BD));
            }

            // todos los contenidos
            foreach (Contenidoss nuevo in lista_contenidoss)
            {
                contenedor_contenidos.Controls.Add(nuevo.crearHTML_contenidoss());
            }

        }



    }

    public class Contenidoss {
        String nombre_contenido = "", descripcion_contenido = "", url_img_contenido = "", nombre_boton="";
        StringBuilder HTML_contenidoss = new StringBuilder();

        public HtmlContainerControl li;

        public Contenidoss(DataRow fila) {
            this.nombre_contenido = fila["nombre_contenido"].ToString();
            this.descripcion_contenido = fila["descripcion_contenido"].ToString();
            this.url_img_contenido = fila["url_img_contenido"].ToString();
            this.nombre_boton = "Consultar prueba";
            li = new HtmlGenericControl("li");
        }




        public HtmlGenericControl crearHTML_contenidoss() {


            li.Attributes.Add("class", "media my-4");
            HTML_contenidoss.Append("<img class='mr-3' src="+url_img_contenido+" alt='Generic placeholder image' width='150' height='150'>");
            HTML_contenidoss.Append("<div class='media-body'>");
            HTML_contenidoss.Append("<h5 class='mt-0 mb-1'>"+nombre_contenido+"</h5>"+descripcion_contenido);
            HTML_contenidoss.Append("<hr />");
            HTML_contenidoss.Append("<button type='button' class='btn btn-success'>"+nombre_boton+"</button>");
            HTML_contenidoss.Append("</div>");

            li.InnerHtml = HTML_contenidoss.ToString();

            return  (HtmlGenericControl) li;

        }


    }
}