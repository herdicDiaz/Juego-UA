using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.HtmlControls;
using Uniamazonia_Juego.Models;

namespace Uniamazonia_Juego.Controllers
{
    public class VistaController
    {
        Vista vista;
        DataTable datos_menu = new DataTable();
        public VistaController(int id_view, String url_in, String state, String description, String icon, int fk_master_in)
        {
            vista = new Vista(id_view, url_in, state, description, icon, fk_master_in);
        }


        // metodos


        public Boolean eliminar_sub_menu()
        {
            if (vista.eliminar_sub_menu())
            {
                return true;
            }
            return false;
        }
            public DataTable filtro_menu_hijo(String dato)
        {
            return vista.filtro_menu_hijo(dato);

        }


            public DataTable consulta_menu_hijo_general()
        {
            return vista.consulta_menu_hijo_general();
        }




            public DataTable consulta_menu_hijo()
        {
            return vista.consulta_menu_hijo();
        }


            public Boolean crear_menu_padre()
        {
            return vista.crear_menu_padre();
        }

        public DataTable consulta_combox_nombre()
        {
            return vista.consulta_combox_nombre();
        }

        public Boolean crear_vista_hijas(String aux_nombre_padre)
        {
            return vista.crear_vista_hijas(aux_nombre_padre);
        }
        public int id_vista_hija()
        {
            return vista.id_vista_hija();
        }
        public DataTable consulta_menu_unico(int aux_rol)
        {
            return vista.consulta_menu_unico(aux_rol);

        }

        public int id_menu_padre(String aux_nombre_padre)
        {
            return vista.id_menu_padre(aux_nombre_padre);
        }

        public DataTable consultar_menu(String id_rol)
        {
            return vista.consulta_menu(id_rol);
        }
        public DataTable consulta_combox_nombre_menu_hijo()
        {
            return vista.consulta_combox_nombre_menu_hijo();
        }
        public String url_BD()
        {
            return vista.url_BD();
        }
        public String icono_BD()
        {
            return vista.icono_BD();
        }
        public Boolean editar_menu_padre(String aux_nombre_padre)
        {
            if (vista.editar_menu_padre(aux_nombre_padre))
            {
                return true;
            }


            return false;
        }
        public Boolean editar_menu_hijos(String aux_nombre_hijo)
        {
            if (vista.editar_menu_hijos(aux_nombre_hijo))
            {
                return true;
            }


            return false;
        }
        public Boolean eliminar_menu()
        {
            if (vista.eliminar_menu())
            {
                return true;
            }
            return false;
        }






        public void abrir_menu(String id_rol, HtmlGenericControl divMenu)
        {
             datos_menu = consultar_menu(id_rol);

            List<Menu> nivel_menu = new List<Menu>();

            // crear menu
            foreach (DataRow dataR in datos_menu.Rows)
            {
                if (Convert.ToInt32(dataR[0]) == Convert.ToInt32(dataR[5]))
                {
                    nivel_menu.Add(new Menu(dataR));
                }
            }

            // asignar vistas al menu
            int index = 0;

            foreach (DataRow data in datos_menu.Rows)
            {
                int index2 = 0;
                foreach (Menu itemsM in nivel_menu)
                {
                    if (Convert.ToString(data[5]) == Convert.ToString(nivel_menu[index2].id) && Convert.ToInt32(data[0]) != Convert.ToInt32(data[5]))
                    {
                        nivel_menu[index2].ver_lista.Add(new Vistaa(data));
                        index++;
                    }
                    index2++;
                }
                HtmlGenericControl ulM = new HtmlGenericControl("ul");
                ulM.Attributes.Add("id", "sidebarnav");
                ulM.Attributes.Add("class", "nav side-menu");
                divMenu.Controls.Add(ulM);

                foreach (Menu it in nivel_menu)
                {
                    ulM.Controls.Add(it.crear_menu());
                }


            }

        }



    }

    public class Menu
    {
        public int id, padre;
        public String title, icon, state, asp = "hide-menu", estilo = "vertical-align:inherit;";
        public List<Vistaa> ver_lista = new List<Vistaa>();
        public HtmlContainerControl ul, li, a;

        public Menu(DataRow fila)
        {
            this.id = Convert.ToInt32(fila["id_vista"]);
            this.title = fila["descripcion"].ToString();
            this.padre = Convert.ToInt32(fila["fk_master"]);
            this.icon = fila["icono"].ToString();
            this.state = fila["estado"].ToString();
            ul = new HtmlGenericControl("ul");
            li = new HtmlGenericControl("li");
            a = new HtmlGenericControl("a");
        }

        public HtmlGenericControl crear_menu()
        {
            a.InnerHtml = "<i class='" + icon + "'></i> <span class='" + asp + "'> " + title + "</span>";
            a.Attributes.Add("href ", "#");
            a.Attributes.Add("class", "sidebar-link waves-effect waves-dark sidebar-link");
            a.Attributes.Add("aria-expanded", "false");
            ul.Attributes.Add("class", "collapse  first-level");
            ul.Attributes.Add("aria-expanded", "false");

            foreach (Vistaa view in ver_lista)
            {
                ul.Controls.Add(view.crear_vista());
            }



            li.Controls.Add(a);
            li.Controls.Add(ul);
            li.Attributes.Add("class", "sidebar-item");
            return (HtmlGenericControl)li;

        }

    }


    public class Vistaa
    {
        public String title, icon, url, state;
        public int parent;
        HtmlGenericControl li, a;

        // constructor
        public Vistaa(DataRow fila)
        {
            this.title = fila["descripcion"].ToString();
            this.parent = Convert.ToInt32(fila["fk_master"]);
            this.icon = fila["icono"].ToString();
            this.state = fila["estado"].ToString();
            this.url = fila["url"].ToString();
            li = new HtmlGenericControl("li");
            a = new HtmlGenericControl("a");
        }

        // metodos
        public HtmlGenericControl crear_vista()
        {


            a.InnerHtml = "<i class = '" + icon + "'></i>" + title;
            a.Attributes.Add("class", "sidebar-link");
            a.Attributes.Add("href", url);

            li.Attributes.Add("class", "sidebar-item");
            li.Controls.Add(a);
            return li;
        }

    }


}



