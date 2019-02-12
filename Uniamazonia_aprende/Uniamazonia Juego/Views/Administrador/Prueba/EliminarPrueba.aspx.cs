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
    public partial class EliminarPrueba : System.Web.UI.Page
    {
        ModuloController controlador_modulos;
        ContenidoController controlador_contenido;

        PruebaController controlador_prueba;



        DataTable consulta_lista_modulo = new DataTable();
        DataTable consulta_lista_contenido = new DataTable();
        DataTable consulta_lista_prueba = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            cargar_modulos_BD();

        }

        protected void eliminar_prueba_Click(object sender, EventArgs e)
        {
            controlador_prueba = new PruebaController(0,this.lista_pruebas.SelectedValue,0,"",0);
            if (controlador_prueba.eliminar_pruebas())
            {

                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({position: 'center',type: 'success',title: 'Eliminacion Exitosa',showConfirmButton: false,timer: 2500}) </script>");
            }
            else {

                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({type: 'error',title: 'Prueba No Eliminada',text: 'Algo salió mal!',timer: 3200}) </script>");

            }

            // actualziando los campos de  la prueba

            //if (!Page.IsPostBack) return;

           



        }
        public void actualizar_lista_contenido() {
            this.lista_contenido.Items.Clear();
            this.lista_contenido.Items.Insert(0, new ListItem("-- Seleccione un Contenido -- "));
        }

        public void actualizar_lista_prueba() {
            this.lista_pruebas.Items.Clear();
            this.lista_pruebas.Items.Insert(0, new ListItem("-- Seleccione una Prueba -- "));
        }





        private void cargar_pruebas_BD() {

            controlador_prueba = new PruebaController(0, "", 0, "",Convert.ToInt32(ViewState["id_aux_contenido"].ToString()));
            consulta_lista_prueba = controlador_prueba.consulta_prueba_x_contenido_combox();
            this.lista_pruebas.DataTextField = "nombre_prueba";
            this.lista_pruebas.DataSource = consulta_lista_prueba;
            lista_pruebas.DataBind();
        }

        public void cargar_contenido_BD()
        {
            //if (Page.IsPostBack) return;
            controlador_contenido = new ContenidoController(0, "", "", "", "");
            consulta_lista_contenido = controlador_contenido.consulta_contenido_x_modulo_combox_nombre(Convert.ToInt32(ViewState["id_aux_modulo"].ToString()));
            this.lista_contenido.DataTextField = "nombre_contenido";
            this.lista_contenido.DataSource = consulta_lista_contenido;
            lista_contenido.DataBind();
        }



        public void cargar_modulos_BD()
        {
            if (Page.IsPostBack) return;
            controlador_modulos = new ModuloController(0, "", "", "");
            consulta_lista_modulo= controlador_modulos.consulta_combox_nombre();
            this.lista_modulos.DataTextField = "nombre_modulo";
            this.lista_modulos.DataSource = consulta_lista_modulo;
            lista_modulos.DataBind();
        }

        public void cargar_contenido_x_modulos() {

            controlador_modulos = new ModuloController(0, "", "", "");
            consulta_lista_modulo = controlador_modulos.consulta_combox_nombre();

            foreach (DataRow fila_modulo in consulta_lista_modulo.Rows)
            {
                if (fila_modulo["nombre_modulo"].Equals(this.lista_modulos.SelectedValue))
                {
                    ViewState["id_aux_modulo"] = fila_modulo["id_modulo"];
                }
            }
            if (ViewState["id_aux_modulo"].ToString().Equals(""))
            {
                ViewState["id_aux_modulo"] = 0;
            }

            cargar_contenido_BD();
        }


        public void cargar_pruebas_x_contenido() {
            controlador_contenido = new ContenidoController(0, "", "", "", "");
            consulta_lista_contenido = controlador_contenido.consulta_contenido_x_modulo_combox_nombre(Convert.ToInt32(ViewState["id_aux_modulo"].ToString()));
            ViewState["id_aux_contenido"] = 0;
            foreach (DataRow fila_contenido in consulta_lista_contenido.Rows)
            {
                if (fila_contenido["nombre_contenido"].Equals(this.lista_modulos.SelectedValue))
                {
                    ViewState["id_aux_contenido"] = fila_contenido["id_contenido"];
                }
            }

            


            cargar_pruebas_BD();




        }





        protected void listo_modulos_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!this.lista_modulos.SelectedValue.Equals(""))
            {
                actualizar_lista_contenido();
                cargar_contenido_x_modulos();
            }
            
            
        }

        protected void lista_contenido_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!this.lista_contenido.SelectedValue.Equals(""))
            {
                actualizar_lista_prueba();
                cargar_pruebas_x_contenido();

            }

        }
    }
}