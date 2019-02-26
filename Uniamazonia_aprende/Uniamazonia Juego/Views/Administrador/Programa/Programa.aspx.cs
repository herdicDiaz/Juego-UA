using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniamazonia_Juego.Controllers;

namespace Uniamazonia_Juego.Views.Administrador.Programa
{
    public partial class Programa : System.Web.UI.Page
    {
        DataTable lista_programas = new DataTable();
        ProgramaController controlador_programa = new ProgramaController(0,"","");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindGridView();
            }

        }
        private void BindGridView()
        {
            {
                lista_programas = controlador_programa.lista_programas();
                DataTable consulta = lista_programas;
                Tabla_programas.DataSource = consulta;
                Tabla_programas.DataBind();
            }
        }


        protected void Metodo_Paginacion(object sender, GridViewPageEventArgs e)
        {
            Tabla_programas.PageIndex = e.NewPageIndex;
            BindGridView();
        }

        protected void crear_programa_Click(object sender, EventArgs e)
        {
            // crear programa
            controlador_programa = new ProgramaController(0,this.nombre_programa.Text,"A");
            if (controlador_programa.crear_programa())
            {
                BindGridView();


                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({position: 'center',type: 'success',title: 'Registro Exitoso!',showConfirmButton: false,timer: 2500}) </script>");
                this.nombre_programa.Text = "";

            }
            else {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({type: 'error',title: 'No Creado!',text: 'Algo salió mal!',timer: 3200}) </script>");

            }



        }

        protected void RowCancelEditEvent(object sender, GridViewCancelEditEventArgs e)
        {
            Tabla_programas.EditIndex = -1;
            BindGridView();


        }

        protected void RowEditing(object sender, GridViewEditEventArgs e)
        {
            // Editar programa

            Tabla_programas.EditIndex = e.NewEditIndex;
            BindGridView();

        }


        protected void RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // actualizar programa
            GridViewRow fila = Tabla_programas.Rows[e.RowIndex];

            int id_programa_aux = Convert.ToInt32(Tabla_programas.DataKeys[e.RowIndex].Values[0]);



            String nombre_aux = (fila.FindControl("nombre_programa") as TextBox).Text.ToUpper();


            controlador_programa = new ProgramaController(id_programa_aux,nombre_aux,"");

            if (controlador_programa.actualizar_programa())
            {
                Tabla_programas.EditIndex = -1;
                BindGridView();
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({position: 'center',type: 'success',title: 'Actulizacion Correcta!',showConfirmButton: false,timer: 2500}) </script>");
            }
            else {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({type: 'error',title: 'Programa No! Actualizado',text: 'Algo salió mal!',timer: 3200}) </script>");

            }


        }

        protected void RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Eliminar programa
            int id_programa_aux = Convert.ToInt32(Tabla_programas.DataKeys[e.RowIndex].Values[0]);

            controlador_programa = new ProgramaController(id_programa_aux,"","");

            if (controlador_programa.eliminar_programa())
            {
                BindGridView();
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({position: 'center',type: 'success',title: 'Eliminacion Exitosa!',showConfirmButton: false,timer: 2500}) </script>");

            }
            else {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({type: 'error',title: 'Programa No! Eliminado',text: 'Algo salió mal!',timer: 3200}) </script>");


            }


        }



        }
    }
