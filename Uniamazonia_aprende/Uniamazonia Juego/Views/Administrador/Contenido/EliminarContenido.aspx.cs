using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniamazonia_Juego.Controllers;

namespace Uniamazonia_Juego.Views.Administrador
{
    public partial class EliminarContenido : System.Web.UI.Page
    {
        ContenidoController controlador_contenido;
        ModuloController controlador_modulos;

        DataTable consulta_lista_contenido = new DataTable();
        DataTable consulta_lista_modulos = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            cargar_modulos_BD();

        }



        public void actualizar_lista_contenido() {
            // actualizando campos
            this.lista_contenidoss.Items.Clear();
            this.lista_contenidoss.Items.Insert(0, new ListItem("-- Seleccione un Contenido -- "));
        }


        public void cargar_contenido_BD() {

            //if (Page.IsPostBack) return;
            controlador_contenido = new ContenidoController(0, "", "", "", "");
            consulta_lista_contenido = controlador_contenido.consulta_contenido_x_modulo_combox_nombre(Convert.ToInt32(ViewState["id_aux_modulo"].ToString()));
            this.lista_contenidoss.DataTextField = "nombre_contenido";
            this.lista_contenidoss.DataSource = consulta_lista_contenido;
            lista_contenidoss.DataBind();
        }

        public void cargar_modulos_BD()
        {
            if (Page.IsPostBack) return;
            controlador_modulos = new ModuloController(0, "", "", "");
            consulta_lista_modulos = controlador_modulos.consulta_combox_nombre();
            this.lista_modulos.DataTextField = "nombre_modulo";
            this.lista_modulos.DataSource = consulta_lista_modulos;
            lista_modulos.DataBind();
        }

        protected void lista_modulos_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!this.lista_modulos.SelectedValue.Equals(""))
            {
                actualizar_lista_contenido();
                cargar_contenido_x_prueba();
            }

        }

        public void cargar_contenido_x_prueba() {
            controlador_modulos = new ModuloController(0, "", "", "");
            consulta_lista_modulos = controlador_modulos.consulta_combox_nombre();

            foreach (DataRow fila_lista_modulos in consulta_lista_modulos.Rows)
            {
                // compara el estado

                if (fila_lista_modulos["nombre_modulo"].Equals(this.lista_modulos.SelectedValue) && fila_lista_modulos["estado_modulo"].Equals("A"))
                {
                    ViewState["id_aux_modulo"] = fila_lista_modulos["id_modulo"];
                }
            }
            cargar_contenido_BD();
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            // eliminar contenido
            controlador_contenido = new ContenidoController(0, this.lista_contenidoss.SelectedValue, "", "", "");
            if (controlador_contenido.eliminar_contenido())
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({position: 'center',type: 'success',title: 'Eliminacion Exitosa',showConfirmButton: false,timer: 2500}) </script>");

            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({type: 'error',title: 'Contenido No Eliminado',text: 'Algo salió mal!',timer: 3200}) </script>");

            }
            actualizar_lista_contenido();
        }
    }
}