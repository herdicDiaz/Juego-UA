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
    public class Inicio
    {
        int id_inicio { set; get; }
        String titulo_inicio { set; get; }
        String descripcion_inicio { set; get; }
        String url_img_inicio { set; get; }
        String estado_inicio { set; get; }
        String privilegio_inicio { set; get; }

        Connection conexion_BD { set; get; }
        DataTable inicio_BD = new DataTable();
        int numero_carusel_BD = 0;

        // constructor
        public Inicio(int id_inicio, string titulo_inicio, string descripcion_inicio, string url_img_inicio, string estado_inicio, string privilegio_inicio)
        {
            this.id_inicio = id_inicio;
            this.titulo_inicio = titulo_inicio;
            this.descripcion_inicio = descripcion_inicio;
            this.url_img_inicio = url_img_inicio;
            this.estado_inicio = estado_inicio;
            this.privilegio_inicio = privilegio_inicio;
            conexion_BD = new Connection();
        }
        // metodos

       public DataTable consulta_inicio_bd() {
            DataTable consulta = new DataTable();
            String Query = "select titulo_inicio,descripcion_inicio,url_img_inicio,posicion_inicio from inicio where (estado_inicio='A' and privilegio_inicio='"+this.privilegio_inicio+"');";

            consulta = conexion_BD.consultar_BD(Query);
            return consulta;
        }

        public int numero_carusel_jugador() {
            int dato = 0;
            String Query = "select max(id_inicio) from inicio where (estado_inicio='A' and privilegio_inicio='"+privilegio_inicio+"');";
            dato = Convert.ToInt16(conexion_BD.consulta_universal(Query));
            return dato;
        }



        // mostrar inicio dinamico

        public void carga_numero_carusel(HtmlContainerControl contenedor_numero_carusel) {

            numero_carusel_BD = numero_carusel_jugador();

            List<Numero_Carusel> lista_numero = new List<Numero_Carusel>();

            for (int i = 0; i < numero_carusel_BD; i++)
            {
                lista_numero.Add(new Numero_Carusel());
            }

            int aux_num = 0;

            foreach (Numero_Carusel nuevo in lista_numero)
            {
                contenedor_numero_carusel.Controls.Add(nuevo.crear_numero_carusel(aux_num));
                aux_num++;
            }



        }

        

        public void cargar_inicio(HtmlContainerControl contenedor_inicio) {
            inicio_BD = consulta_inicio_bd();

            List<Inicio_aux> lista_corrusel = new List<Inicio_aux>();

            // crear corrusel
            foreach (DataRow elemento_bd in inicio_BD.Rows)
            {
                lista_corrusel.Add(new Inicio_aux(elemento_bd));
            }

            // darle diseño
            foreach (Inicio_aux nuevo in lista_corrusel)
            {
                contenedor_inicio.Controls.Add(nuevo.crearCarrusel());
            }

        }





    }


    public class Inicio_aux {
        public String titulo_aux = "", descripcion_aux = "", url_img_aux = "",inicio="";

        StringBuilder HTML_carrusel = new StringBuilder();

        public HtmlContainerControl div;

        public Inicio_aux(DataRow fila) {
            this.titulo_aux = fila["titulo_inicio"].ToString();
            this.descripcion_aux = fila["descripcion_inicio"].ToString();
            this.url_img_aux = fila["url_img_inicio"].ToString();
            this.inicio = fila["posicion_inicio"].ToString();

            div = new HtmlGenericControl("div");
            

        }

        public HtmlGenericControl crearCarrusel() {
            div.Attributes.Add("class", "carousel-item "+inicio);
            HTML_carrusel.Append("<img class='d-block w-100' src='"+url_img_aux+"' width='1024' height='492'>");
            HTML_carrusel.Append("<div class='carousel-caption d-none d-md-block'>");
            HTML_carrusel.Append("<h5>'" + titulo_aux + "'");
            HTML_carrusel.Append("</h5>");
            HTML_carrusel.Append("<p>'"+descripcion_aux+"'");
            HTML_carrusel.Append("</p>");
            HTML_carrusel.Append("</div>");

            div.InnerHtml = HTML_carrusel.ToString();

            return (HtmlGenericControl) div;
        }






    }

    public class Numero_Carusel
    {
        //StringBuilder HTML_numero_carusel; 
        public HtmlContainerControl li;

        public Numero_Carusel() {
            //HTML_numero_carusel = new StringBuilder();
            li = new HtmlGenericControl("li");
        }

        public HtmlGenericControl crear_numero_carusel(int numero) {
            li.Attributes.Add("data-target", "#carouselExampleIndicators");
            li.Attributes.Add("data-slide-to", ""+numero);
            return (HtmlGenericControl) li;


        }


    }


}