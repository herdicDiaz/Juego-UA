using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniamazonia_Juego.Controllers;

namespace Uniamazonia_Juego.Views.Login
{
    public partial class Login : System.Web.UI.Page
    {
        UsuarioController controlador_usuario;
        JugadorController controlador_jugador;
        Rol_UsuarioController controlador_rol_usuario;
        AdministradorController AdministradorC=new AdministradorController();
        DataTable consulta_Administrador = new DataTable();
        DataTable datos_usuario;

        ProgramaController controlador_programa;
        DataTable programa_BD = new DataTable();


        protected void Page_Load(object sender, EventArgs e)
        {
            cargar_programas_BD();

        }

        public void cargar_programas_BD() {
            if (Page.IsPostBack) return;
            controlador_programa = new ProgramaController(0,"","");
            programa_BD = controlador_programa.lista_programas();
            this.lista_programas.DataTextField = "nombre_programa";
            this.lista_programas.DataSource = programa_BD;
            lista_programas.DataBind();


        }

        protected void iniciar_Click(object sender, EventArgs e)
        {
            controlador_usuario = new UsuarioController(0,this.usuario_actual.Text,"","");
            datos_usuario = controlador_usuario.datos_usuario_BD();
            int id_usuario=0, filas_bd=0,columnas_bd=0;
            String usuario_bd="", password_bd="", privilegio_bd="";

            try
            {
                columnas_bd = datos_usuario.Columns.Count;
                filas_bd = datos_usuario.Rows.Count;

                if (columnas_bd > 0 && filas_bd > 0)
                {
                    foreach (DataRow datos_unicos in datos_usuario.Rows)
                    {
                        id_usuario = Convert.ToInt16(datos_unicos[0]);
                        usuario_bd = Convert.ToString(datos_unicos[1]);
                        password_bd = Convert.ToString(datos_unicos[2]);
                        privilegio_bd = Convert.ToString(datos_unicos[3]);
                    }
                }

                if (this.usuario_actual.Text == usuario_bd)
                {
                    if (this.password_actual.Text == password_bd)
                    {
                        Session["privilegio"] = rol_usuario(privilegio_bd);
                        Session["id_usuario"] = id_usuario;
                        int fk_usuario =Convert.ToInt32( Session["id_usuario"].ToString());
                        //consulta_Administrador = AdministradorC.ConsultaParametroFkUsuario(fk_usuario);
                        //Session["usuario"] = consulta_Administrador.Rows[0]["nombres_admin"].ToString();
                        Response.Redirect("~/Views/Administrador/Welcome.aspx");
                    }
                    else {

                        ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({type: 'error',title: 'Cotraseña Incorrecta',text: 'Algo salió mal!',timer: 2200}) </script>");
                    }

                }
                else {
                    ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({type: 'error',title: ' X Usuario NO registrado',text: 'Algo salió mal!',timer: 2200}) </script>");
                }
            }
            catch (Exception)
            {
                //Response.Redirect("~/Views/Login/Login");

                throw;
            }
        }

    

        // metodos

        public String rol_usuario(String privilegio_bd) {
            String rol = "|| N N";
            if (privilegio_bd.Equals("J"))
            {
                rol = "<Strong style='color: green'> Rol: Jugador </Strong>";
            }
            else {
                if (privilegio_bd.Equals("A"))
                {
                    rol = "<Strong style='color: green'> Rol: Administrador </Strong>";
                }
            }
            return rol;
        }

        protected void registro1_Click(object sender, EventArgs e)
        {
            // realizar registro usuario
            int fk_programa = id_lista_semestre(this.lista_programas.SelectedValue);
            int fk_usuario = 0;
            // crear usuario para este jugador
            controlador_usuario = new UsuarioController(0,this.txt_correo.Text, this.txt_identificacion.Text, "J");
            if (controlador_usuario.crear_usuario())
            {
                fk_usuario = controlador_usuario.consultar_id_nuevo();
                int aux_numero_semestre = Convert.ToInt32(this.lista_semestres.SelectedValue);
                int aux_identificacion = Convert.ToInt32(this.txt_identificacion.Text);

                controlador_jugador = new JugadorController(aux_identificacion,0, txt_nombre_1.Text, txt_nombre_2.Text, txt_apellido_1.Text, txt_apellido_2.Text, "", aux_numero_semestre, txt_correo.Text, "A", fk_usuario);

                if (controlador_jugador.crear_jugador(fk_programa))
                {
                    // agregarle el menu
                    controlador_rol_usuario = new Rol_UsuarioController(2,aux_identificacion,"A","J");
                    if (controlador_rol_usuario.crear_rol_usuario())
                    {
                        // creado;



                        ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({position: 'center',type: 'success',title: 'Registro Exitoso',timer: 2500}) </script>");

                    }




                }
                else
                {
                    // no creado;
                    ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({type: 'error',title: 'No se realizo el registro',text: 'Algo salió mal!',timer: 2200}) </script>");
                }


            }
            else {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({type: 'error',title: 'No se realizo el registro',text: 'Algo salió mal!',timer: 2200}) </script>");
            }
             
        }


        public int id_lista_semestre(String nombre_semestre) {
            controlador_programa = new ProgramaController(0, "", "");
            programa_BD = controlador_programa.lista_programas();
            int id_aux = 0;

            foreach (DataRow fila in programa_BD.Rows)
            {
                if (fila["nombre_programa"].ToString().Equals(nombre_semestre))
                {
                    id_aux = Convert.ToInt32(fila["id_programa"].ToString());
                }

            }



            return id_aux;
        }


    }
}