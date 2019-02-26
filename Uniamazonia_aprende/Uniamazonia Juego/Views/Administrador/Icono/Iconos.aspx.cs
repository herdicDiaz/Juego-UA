using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniamazonia_Juego.Controllers.CotrollersJugador;

namespace Uniamazonia_Juego.Views.Administrador.Icono
{
    public partial class Iconos : System.Web.UI.Page
    {
        DataTable consulta_iconos = new DataTable();
        IconoController controlador_iconos = new IconoController(0, "", "");


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {

                BindGridView();
            }
            
        }

        protected void Metodo_Paginacion(object sender, GridViewPageEventArgs e)
        {
            Tabla_Iconos.PageIndex = e.NewPageIndex;
            BindGridView();
        }




        private void BindGridView()
        {
            {
                consulta_iconos = controlador_iconos.consulta_iconos_aux();
                DataTable consulta = consulta_iconos;
                Tabla_Iconos.DataSource = consulta;
                Tabla_Iconos.DataBind();
            }
        }

        protected void crear_icono_Click(object sender, EventArgs e)
        {
            // crear icono
            controlador_iconos = new IconoController(0,this.nombre_icono.Text,"A");
            if (controlador_iconos.agregar_icono())
            {
                BindGridView();
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({position: 'center',type: 'success',title: 'Registro Exitoso!',showConfirmButton: false,timer: 2500}) </script>");
                this.nombre_icono.Text = "";
            }
            else {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({type: 'error',title: 'No Creado!',text: 'Algo salió mal!',timer: 3200}) </script>");
            }

        }

        protected void RowCancelEditEvent(object sender, GridViewCancelEditEventArgs e)
        {
            Tabla_Iconos.EditIndex = -1;
            BindGridView();
        }

        protected void RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Eliminar icono
            int id_icono = Convert.ToInt32(Tabla_Iconos.DataKeys[e.RowIndex].Values[0]);
            controlador_iconos = new IconoController(id_icono, "", "");

            if (controlador_iconos.eliminar_icono())
            {
                BindGridView();
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({position: 'center',type: 'success',title: 'Eliminacion Exitosa!',showConfirmButton: false,timer: 2500}) </script>");

            }
            else {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({type: 'error',title: 'Icono No! Eliminado',text: 'Algo salió mal!',timer: 3200}) </script>");


            }
            Tabla_Iconos.EditIndex = -1;
            BindGridView();

        }

        protected void RowEditing(object sender, GridViewEditEventArgs e)
        {
            // Editar icono
            Tabla_Iconos.EditIndex = e.NewEditIndex;
            BindGridView();
        }

        protected void RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // actualizar icono

            GridViewRow fila = Tabla_Iconos.Rows[e.RowIndex];

            int id_icono = Convert.ToInt32(Tabla_Iconos.DataKeys[e.RowIndex].Values[0]);

            String nombre = (fila.FindControl("nombre_icono") as TextBox).Text.ToUpper();

            controlador_iconos = new IconoController(id_icono, nombre, "");

            if (controlador_iconos.actualizar_nombre_icono())

            {
                Tabla_Iconos.EditIndex = -1;
                BindGridView();
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({position: 'center',type: 'success',title: 'Actulizacion Correcta!',showConfirmButton: false,timer: 2500}) </script>");
            }
            else {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({type: 'error',title: 'Icono No! Actualizado',text: 'Algo salió mal!',timer: 3200}) </script>");

            }


        }

    }
}
