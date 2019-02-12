using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniamazonia_Juego.Controllers;

namespace Uniamazonia_Juego.Views.Administrador.Menu_Dic
{
    public partial class CrearMenuHijo : System.Web.UI.Page
    {
        VistaController controlador_vista;

        Vista_RolController controlador_vista_rol;

        DataTable consulta = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            controlador_vista = new VistaController(0,"","","","",0);
            consulta = controlador_vista.consulta_combox_nombre();
            this.lista_menu_padre.DataTextField = "descripcion";
            this.lista_menu_padre.DataSource = consulta;
            lista_menu_padre.DataBind();


        }

        protected void crear_menu_hijo_Click(object sender, EventArgs e)
        {



            int aux_id_vista_nueva = controlador_vista.id_vista_hija(); ;

            controlador_vista = new VistaController(aux_id_vista_nueva,this.url_munu_hijo.Text,"Activo",this.nombre_menu_hijo.Text, "mdi mdi-check-all", 0);
            int aux_rol = 0;
            if (rd_admin.Checked)
            {
                aux_rol = 1;
            }
            else {
                if (rd_jugador.Checked)
                {
                    aux_rol = 2;
                }
            }

            if (controlador_vista.crear_vista_hijas(this.lista_menu_padre.SelectedValue))
            {
                controlador_vista_rol = new Vista_RolController(0,aux_id_vista_nueva,0,aux_rol);

                if (controlador_vista_rol.crear_vista_rol_hija(this.lista_menu_padre.SelectedValue))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({position: 'center',type: 'success',title: 'Registro Exitoso',showConfirmButton: false,timer: 2500}) </script>");
                    this.nombre_menu_hijo.Text = "";
                    Response.Redirect("~/Views/Administrador/Welcome.aspx");

                }
            }
            else {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({type: 'error',title: 'Menu Hijo No! Creado',text: 'Algo salió mal!',timer: 3200}) </script>");

            }






            // actualziando los campos lista menu padre

            if (!Page.IsPostBack) return;
            this.lista_menu_padre.Items.Clear();
            this.lista_menu_padre.Items.Insert(0, new ListItem("-- Seleccione Menu Padre -- "));


            controlador_vista = new VistaController(0, "", "", "", "", 0);
            consulta = controlador_vista.consulta_combox_nombre();
            this.lista_menu_padre.DataTextField = "descripcion";
            this.lista_menu_padre.DataSource = consulta;
            lista_menu_padre.DataBind();
        }
    }
}