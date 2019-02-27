using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Uniamazonia_Juego.Controllers;
using Uniamazonia_Juego.Controllers.Cotrollers;

namespace Uniamazonia_Juego
{
    public partial class Principal : System.Web.UI.MasterPage
    {
        int id_aux_usuario;
        UsuarioController UsuarioC = new UsuarioController();
        JugadorController JugadorC = new JugadorController();
        RankingController RankingC = new RankingController();

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                id_aux_usuario = Convert.ToInt32(Session["id_usuario"].ToString());
            }
            catch
            {
                if (Session["id_usuario"] == null)
                {
                    Response.Redirect("~/Views/Login/Login");
                }
            }
           

            // sacar id por separado.. de la tabla 
            JugadorController controlador_jugador = new JugadorController(id_aux_usuario, 0, "", "", "", "", "", 0, "", "", 0);
            int id_jugador_bd = controlador_jugador.traer_id_jugador();

            AdministradorController controlador_administrador = new AdministradorController(id_aux_usuario, "", "", "", 0);
            int id_administrador_bd = controlador_administrador.id_db_admin();




            VistaController controlador_vista = new VistaController(0, "", "", "", "", 0);
            EmpresaController controlador_empresa = new EmpresaController(0, "", "", 0);
            controlador_jugador = new JugadorController(id_jugador_bd, 0, "", "", "", "", "", 0, "", "", 0);
            PremiacionController controlador_premiacion = new PremiacionController(0, 0, 0, 0, id_jugador_bd);
            controlador_administrador = new AdministradorController(id_administrador_bd, "", "", "", 0);

            Rol_UsuarioController controlador_rol_usuario = new Rol_UsuarioController(0, 0, "","");


            // -----> activar con el login
            try
            {
                this.rol_usuario.Text = Session["privilegio"].ToString();
            }
            catch
            {

            }

            int puntos_actuales = 0;
            String rol_usuario_actual = "";
            // traer por cada rol
            if (rol_usuario.Text.Equals("<Strong style='color: green'> Rol: Administrador </Strong>"))
            {
                // *nombre *tipo de rol *
                this.nombre_jugador_actual.Text = controlador_administrador.nombre_bd();
                controlador_rol_usuario = new Rol_UsuarioController(0, id_administrador_bd, "","");
                rol_usuario_actual = controlador_rol_usuario.rol_usuario_menu("A");


            }
            else
            {
                if (rol_usuario.Text.Equals("<Strong style='color: green'> Rol: Jugador </Strong>"))
                {
                    // *nombre *tipo de rol *putos *estrellas
                    controlador_rol_usuario = new Rol_UsuarioController(0, id_jugador_bd, "", "");
                    rol_usuario_actual = controlador_rol_usuario.rol_usuario_menu("J");
                    this.nombre_jugador_actual.Text = controlador_jugador.consultar_nombre_BD();
                    //puntos_actuales = Convert.ToInt32(controlador_premiacion.obtener_puntos_acomulados());
                    //pintar_premiacion(0);
                    DataTable ConsultaJugador = JugadorC.ConsultaFkUsuario(Convert.ToInt32(Session["id_usuario"]));
                    int id_jugador = Convert.ToInt32(ConsultaJugador.Rows[0]["id_jugador"].ToString());
                    DataTable ConsultaRanking = RankingC.ConsultaParametroFk_Jugador(id_jugador);
                    if (ConsultaRanking.Rows.Count!=0)
                    {
                        String Puntaje = ConsultaRanking.Rows[0]["puntaje_acomulado"].ToString();
                        this.puntos_jugador.Text = "SCORE : " + Puntaje;
                    }
                    else
                    {
                        this.puntos_jugador.Text = "SCORE : " + 0;
                    }
  

                }

            }


            String nombre_aux_empresa = controlador_empresa.consulta_nombre_BD();

            Page.Header.Description = nombre_aux_empresa;
            this.nombre_empresa.Text = nombre_aux_empresa;

            controlador_vista.abrir_menu(rol_usuario_actual, menu);
        }

        public void CerrarSesion(object sender, EventArgs e)
        {
            Session.Abandon();
     
            Response.Redirect("~/Views/Login/Login");
        }

        public void pintar_premiacion(int puntos_bd)
        {

            //  asignar estrellas
            if (puntos_bd != 0 && puntos_bd >= 100)
            {
                if (puntos_bd < 400)
                {
                    // pintar estrellas
                    if (puntos_bd >= 100 && puntos_bd < 200)
                    {

                        this.Estrellas.Controls.Add(crear_estrella());
                    }
                    else
                    {

                        if (puntos_bd >= 200 && puntos_bd < 300)
                        {
                            this.Estrellas.Controls.Add(crear_estrella());
                            this.Estrellas.Controls.Add(crear_estrella());
                        }
                        else
                        {
                            if (puntos_bd >= 300 && puntos_bd < 400)
                            {
                                this.Estrellas.Controls.Add(crear_estrella());
                                this.Estrellas.Controls.Add(crear_estrella());
                                this.Estrellas.Controls.Add(crear_estrella());
                            }

                        }
                    }


                }
                else
                {
                    // pintar diamantes
                    if (puntos_bd >= 400 && puntos_bd < 800)
                    {
                        this.Estrellas.Controls.Add(crear_diamantes());
                    }
                    else
                    {
                        if (puntos_bd >= 800 && puntos_bd < 1200)
                        {
                            this.Estrellas.Controls.Add(crear_diamantes());
                            this.Estrellas.Controls.Add(crear_diamantes());
                        }
                        else
                        {
                            if (puntos_bd >= 1200 && puntos_bd < 1600)
                            {
                                this.Estrellas.Controls.Add(crear_diamantes());
                                this.Estrellas.Controls.Add(crear_diamantes());
                                this.Estrellas.Controls.Add(crear_diamantes());
                            }

                        }

                    }

                }

            }



        }

        public HtmlGenericControl crear_estrella()
        {
            HtmlGenericControl img = new HtmlGenericControl("img");
            StringBuilder codigo_estrella = new StringBuilder();

            codigo_estrella.Append("<img src='/Images/iconos%20con/pemioEstrella.png' alt='user' class='rounded - circle' width='31'>");

            img.InnerHtml = codigo_estrella.ToString();

            return img;
        }

        public HtmlGenericControl crear_diamantes()
        {
            HtmlGenericControl img = new HtmlGenericControl("img");
            StringBuilder codigo_estrella = new StringBuilder();

            codigo_estrella.Append("<img src='/Images/diamante.png' alt='user' class='rounded - circle' width='31'>");

            img.InnerHtml = codigo_estrella.ToString();

            return img;
        }


    }
}