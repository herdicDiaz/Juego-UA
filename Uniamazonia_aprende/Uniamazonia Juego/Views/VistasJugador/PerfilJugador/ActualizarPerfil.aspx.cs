using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniamazonia_Juego.Controllers;

namespace Uniamazonia_Juego.Views.VistasJugador.PerfilJugador
{
    public partial class ActualizarPerfil : System.Web.UI.Page
    {
        


        ProgramaController controlador_programa;

        JugadorController controlador_jugador;

        UsuarioController controlador_usuario;

        DataTable datos_usuario = new DataTable();
        DataTable carreras_bd = new DataTable();

        int aux_fk_usuario = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            aux_fk_usuario = Convert.ToInt32(Session["id_usuario"].ToString());

            cargar_programas_BD();

            cargar_datos_usuario();



        }
        public void cargar_datos_usuario() {

            if (Page.IsPostBack) return;
            controlador_jugador = new JugadorController(0, 0, "", "", "", "", "", 0, "", "", aux_fk_usuario);
            datos_usuario = controlador_jugador.consulta_unica_jugador();
            foreach (DataRow datos_fila in datos_usuario.Rows)
            {
                this.txt_nombre1.Text = datos_fila["nombre_1"].ToString();
                this.txt_nombre2.Text = datos_fila["nombre_2"].ToString();
                this.txt_apellido1.Text = datos_fila["apellido_1"].ToString();
                this.txt_apellido2.Text = datos_fila["apellido_2"].ToString();
                this.txt_semestre_actual.Text = datos_fila["semestre"].ToString();
                this.txt_carrera_actual.Text = datos_fila["nombre_programa"].ToString();
                txt_correo.Text = datos_fila["correo_electronico"].ToString();
                this.txt_identificacion.Text = datos_fila["identificacion_jugador"].ToString();


            }


        }


        public void cargar_programas_BD()
        {
            if (Page.IsPostBack) return;
            controlador_programa = new ProgramaController(0, "", "");
            carreras_bd = controlador_programa.lista_programas();
            this.lista_programas.DataTextField = "nombre_programa";
            this.lista_programas.DataSource = carreras_bd;
            lista_programas.DataBind();


        }

        protected void actualizar_Click(object sender, EventArgs e)
        {
            // hacer un update en la tabla usuario..
            controlador_usuario = new UsuarioController(aux_fk_usuario,txt_correo.Text,"","");
            int aux_fk_programa;
            String aux_programa = "";
            int aux_semestre = 0;

            // actualizar usuario
            if (controlador_usuario.actualizar_usuario())
            {
                controlador_jugador = new JugadorController(0,0, "", "", "", "", "",0,"","",aux_fk_usuario);

                aux_fk_programa = controlador_jugador.fk_programa();

                if (this.lista_programas.SelectedItem.Text.Equals(" -- Seleccione una Carrera -- "))
                {
                    aux_programa = this.txt_carrera_actual.Text;
                }
                else {
                    aux_programa = this.lista_programas.SelectedValue;
                }

                if (lista_semestres.SelectedItem.Text.Equals(" -- Seleccione un Semestre -- "))
                {
                    aux_semestre = Convert.ToInt32(txt_semestre_actual.Text);
                }
                else {
                    aux_semestre = Convert.ToInt32(lista_semestres.SelectedValue);

                }





                controlador_programa = new ProgramaController(aux_fk_programa,aux_programa,"");
                // actualizar programa
                if (controlador_programa.actualizar_programa())
                {
                    // actualizar jugador
                    controlador_jugador = new JugadorController(0,Convert.ToInt32(txt_identificacion.Text),txt_nombre1.Text,txt_nombre2.Text,txt_apellido1.Text,txt_apellido2.Text,"", aux_semestre, txt_correo.Text,"",aux_fk_usuario);

                    if (controlador_jugador.actualizar_jugador())
                    {
                        // actualizado
                        ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({position: 'center',type: 'success',title: 'Actulizacion Correcta',timer: 2500}) </script>");
                    }


                }



            }


        }
    }
}