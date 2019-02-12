using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniamazonia_Juego.Controllers;
using Uniamazonia_Juego.Controllers.CotrollersJugador;

namespace Uniamazonia_Juego.Views.Administrador.Menu_Dic
{
    public partial class EditarMenu : System.Web.UI.Page
    {
        VistaController controlador_vista;
        IconoController controlador_icono;
        DataTable consulta_menu_Padre = new DataTable();
        DataTable consulta_menu_HIjo = new DataTable();
        DataTable consulta_iconos = new DataTable();
        String guardar_icono;


        protected void Page_Load(object sender, EventArgs e)
        {
            this.icono_actual.ReadOnly = true;

            // lista del menu padre
            if (Page.IsPostBack) return;
            cargar_lista_menu_padre();
            cargar_lista_iconos();
        }

        public void cargar_lista_menu_padre()
        {
            controlador_vista = new VistaController(0, "", "", "", "", 0);
            consulta_menu_Padre = controlador_vista.consulta_combox_nombre();
            this.lista_menu_padre.DataTextField = "descripcion";
            this.lista_menu_padre.DataSource = consulta_menu_Padre;
            lista_menu_padre.DataBind();
        }

        public void cargar_lista_iconos()
        {
            controlador_icono = new IconoController(0, "", "");
            consulta_iconos = controlador_icono.consulta_iconos();
            ; this.lista_iconos_menu_padre.DataTextField = "nombre_icono";
            this.lista_iconos_menu_padre.DataSource = consulta_iconos;
            lista_iconos_menu_padre.DataBind();

        }

        protected void actualizar_capos_padre(object sender, EventArgs e)
        {
            controlador_vista = new VistaController(0, "", "", this.lista_menu_padre.SelectedValue, "", 0);
            this.nuevo_nombre_menu_padre.Text = this.lista_menu_padre.SelectedValue;
            String icono_aux = controlador_vista.icono_BD();
            this.icono_actual.Text = icono_aux;


        }


        protected void guadar_menu_PADRE_Click(object sender, EventArgs e)
        {
            // guardar
            if (this.lista_iconos_menu_padre.SelectedItem.Text == (" -- Seleccione un Icono -- "))
            {
                controlador_vista = new VistaController(0, "", "", this.nuevo_nombre_menu_padre.Text, this.icono_actual.Text, 0);

            }
            else {
                controlador_vista = new VistaController(0, "", "", this.nuevo_nombre_menu_padre.Text, this.lista_iconos_menu_padre.SelectedValue, 0);
            }
            

            
            if (controlador_vista.editar_menu_padre(this.lista_menu_padre.SelectedValue))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({position: 'center',type: 'success',title: 'Proceso Exitoso!',showConfirmButton: false,timer: 2500}) </script>");

                //desacativar icono
                guardar_icono = this.icono_actual.Text;
                if (guardar_icono != "")
                {
                    if (this.lista_iconos_menu_padre.SelectedItem.Text == (" -- Seleccione un Icono -- "))
                    {
                        // desactivar un icono, el actual...
                        controlador_icono = new IconoController(0, guardar_icono, "");

                        if (controlador_icono.desactivar_icono())
                        {
                            // desactivado
                        }
                    }
                    else
                    {
                        controlador_icono = new IconoController(0, guardar_icono, "");

                        if (controlador_icono.desactivar_O_activar_icono(this.lista_iconos_menu_padre.SelectedValue))
                        {

                        }

                    }

                }

                //Response.Redirect("~/Views/Administrador/Welcome.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({type: 'error',title: 'No Actualizado! (Menu)',text: 'Algo salió mal!',timer: 3200}) </script>");

            }


            // actualziando los campos lista menu padre

            if (!Page.IsPostBack) return;
            this.lista_menu_padre.Items.Clear();
            this.lista_menu_padre.Items.Insert(0, new ListItem("-- Seleccione Menu-- "));
            cargar_lista_menu_padre();


            // actualizar campos iconos
            this.lista_iconos_menu_padre.Items.Clear();
            this.lista_iconos_menu_padre.Items.Insert(0, new ListItem("-- Seleccione Icono-- "));
            cargar_lista_iconos();




        }




    }
}