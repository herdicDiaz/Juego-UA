using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniamazonia_Juego.Controllers;

namespace Uniamazonia_Juego.Views.VistasJugador.PerfilJugador
{
    public partial class VerPerfil : System.Web.UI.Page
    {


        JugadorController controlador_jugador;
        UsuarioController controlador_usuario;

        DataTable datos_usuario = new DataTable();

        int aux_id_usuario = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            aux_id_usuario = Convert.ToInt32(Session["id_usuario"].ToString());

            this.txt_nombre1.ReadOnly = true;
            this.txt_nombre2.ReadOnly = true;
            this.txt_apellido1.ReadOnly = true;
            this.txt_apellido2.ReadOnly = true;
            this.txt_identificacion.ReadOnly = true;
            this.txt_numero_semestre.ReadOnly = true;
            this.txt_carrera.ReadOnly = true;
            this.txt_usuario.ReadOnly = true;
            this.txt_password.ReadOnly = true;
            controlador_jugador = new JugadorController(0,0,"","","","","",0,"","", aux_id_usuario);

            datos_usuario = controlador_jugador.consulta_unica_jugador();

            foreach (DataRow fila_datos in datos_usuario.Rows)
            {
                this.txt_nombre1.Text = fila_datos["nombre_1"].ToString();
                this.txt_nombre2.Text = fila_datos["nombre_2"].ToString();
                this.txt_apellido1.Text = fila_datos["apellido_1"].ToString();
                this.txt_apellido2.Text = fila_datos["apellido_2"].ToString();
                this.txt_numero_semestre.Text = fila_datos["semestre"].ToString();
                this.txt_carrera.Text = fila_datos["nombre_programa"].ToString();
                this.txt_usuario.Text = fila_datos["correo_electronico"].ToString();
                this.txt_password.Text = fila_datos["password_usuario"].ToString();
                this.txt_identificacion.Text = fila_datos["identificacion_jugador"].ToString();
            }


        }





        protected void actualizar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/VistasJugador/PerfilJugador/ActualizarPerfil.aspx");

        }



        protected void guardar_password_Click(object sender, EventArgs e)
        {
            controlador_usuario = new UsuarioController(aux_id_usuario,"","","");
            String password_bd = controlador_usuario.password_BD();

            if (txt_password_actual.Text.Equals(password_bd))
            {
                if (txt_nueva_password.Text.Equals(txt_confirmar_password.Text))
                {
                    controlador_usuario = new UsuarioController(aux_id_usuario, "",txt_nueva_password.Text,"");
                    if (controlador_usuario.actualizar_password())
                    {
                        //
                        ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({position: 'center',type: 'success',title: 'Registro Exitoso',timer: 2500}) </script>");
                        txt_password_actual.Text = "";
                        txt_nueva_password.Text = "";
                        txt_confirmar_password.Text = "";
                    }

                }
                else {
                    ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({type: 'error',title: 'Las Contraseñas no son iguales',text: 'Algo salió mal!',timer: 3200}) </script>");
                    txt_nueva_password.Text = "";
                    txt_confirmar_password.Text = "";
                }

            }
            else {

                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({type: 'error',title: 'Su Contraseña no concide con la registrada',text: 'Algo salió mal!',timer: 3200}) </script>");
                txt_password_actual.Text = "";
            }



        }
    }
}