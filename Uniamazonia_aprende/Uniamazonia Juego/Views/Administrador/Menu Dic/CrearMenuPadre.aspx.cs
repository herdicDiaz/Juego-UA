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
    public partial class CrearMenu : System.Web.UI.Page
    {

        VistaController controlador_vista;
        Vista_RolController controlador_vista_rol;
        IconoController controlador_iconos;

        DataTable consulta_iconos = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
             cargar_iconos_BD();
            


            }

        protected void crear_menu_Click(object sender, EventArgs e)
        {

            controlador_vista = new VistaController(0,"#","Activo",this.nombre_menu_padre.Text,this.lista_icono.SelectedValue,0);
            int aux_rol=0;

            if (rd_admin.Checked)
            {
                // selecciono administrador
                aux_rol = 1;
            }
            else
            {
                if (rd_jugador.Checked)
                {
                    // selecciono jugador
                    aux_rol = 2;
                }

            }

            if (controlador_vista.crear_menu_padre())
            {
                // realizar inssert en la tabla vista_rol
                controlador_vista_rol = new Vista_RolController(0,0,0,aux_rol);
                if (controlador_vista_rol.crear_vista_rol(this.nombre_menu_padre.Text))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({position: 'center',type: 'success',title: 'Registro Exitoso',showConfirmButton: false,timer: 2500}) </script>");
                    this.nombre_menu_padre.Text = "";
                }


               
            }
            else {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({type: 'error',title: 'Menu Padre No! Creado',text: 'Algo salió mal!',timer: 3200}) </script>");

            }


            if (!Page.IsPostBack) return;
            this.lista_icono.Items.Clear();
            this.lista_icono.Items.Insert(0, new ListItem("-- Seleccione una Empresa -- "));
            cargar_iconos_BD();

        }

        public void cargar_iconos_BD() {
            controlador_iconos = new IconoController(0,"","");
            consulta_iconos = controlador_iconos.consulta_iconos();
            this.lista_icono.DataTextField = "nombre_icono";
            this.lista_icono.DataSource = consulta_iconos;
            lista_icono.DataBind();
        }

    }
}