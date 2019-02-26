using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniamazonia_Juego.Controllers;
using Uniamazonia_Juego.Controllers.Cotrollers;
using Uniamazonia_Juego.Controllers.CotrollersJugador;

namespace Uniamazonia_Juego.Views.VistasJugador.Test
{
    public partial class Test : System.Web.UI.Page
    {
        PreguntaController PreguntaC = new PreguntaController();
        RespuestaController RespuestaC = new RespuestaController();
        Usuario_PruebaController Usuario_PruebaC = new Usuario_PruebaController();
        prueba_sancionController Prueba_SancionC = new prueba_sancionController();
        SancionController SancioC = new SancionController();
        RankingController RankingC = new RankingController();
        JugadorController JugadorC = new JugadorController();

        public static PruebaController PruebaC { get; set; }
        public static List<int> listaNumeroOutp { get; set; }
        public static DataTable resultadoRespuestas { get; set; }
        String id_prueba;
        Random aletorio = new Random();
        DataTable consulta,pregunta;
        public static int numeroPreguntas_Prueba=0, Puntos_prueba=0, numeroAleatorio=0, PreguntasCorrectas, PreguntasIncorrectas, preguntasNocontestadas,PreguntasContestadas;


        Boolean Guardian=true;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack==false)
            {
                listaNumeroOutp = new List<int>();
                listaNumeroOutp.Clear();
                PruebaC = new PruebaController();
                EcrituraPreguntaRespuesta();
                PreguntasCorrectas = 0;
                PreguntasIncorrectas = 0;
                preguntasNocontestadas = 0;
            }
        }

        public void BtnSiguiente(object sender, EventArgs e)
        {
            String repuestaCorrecta = resultadoRespuestas.Rows[0]["respuesta_correcta"].ToString();
            verificarRespuesta(repuestaCorrecta);
            EcrituraPreguntaRespuesta();
        }

        public void TerminarIntento(object sender, EventArgs e)
        {
            PreguntasContestadas = PreguntasCorrectas + PreguntasIncorrectas;
            int id_usuario = Convert.ToInt32(Session["id_usuario"].ToString());
            int Session_id_prueba = Convert.ToInt32(Session["id_prueba"].ToString());
            preguntasNocontestadas = numeroPreguntas_Prueba - PreguntasContestadas;

            DataTable consultaJugador = JugadorC.ConsultaFkUsuario(id_usuario);
            int id_jugador =Convert.ToInt32(consultaJugador.Rows[0]["id_jugador"].ToString());

            Boolean insert = Usuario_PruebaC.InsertarRegistro(Session_id_prueba, id_jugador, "2018/02/07", Puntos_prueba, preguntasNocontestadas, PreguntasContestadas, PreguntasIncorrectas, PreguntasCorrectas);

            //Se hace una consulta para saber si el usuario ya tiene un registro en la tabla ranking.
            DataTable consultaRanking = RankingC.ConsultaParametroFk_Jugador(id_jugador);
            if (consultaRanking.Rows.Count != 0)
            {
                //Update
                DataTable ConsultaRanking = RankingC.ConsultaParametroFk_Jugador(id_jugador);
                int PuntosGuardados =Convert.ToInt32( ConsultaRanking.Rows[0]["puntaje_acomulado"].ToString());
                int suma = PuntosGuardados + Puntos_prueba;
                Boolean up = RankingC.Update(suma,id_jugador);
            }
            else
            {
                //Insert
                Boolean inser = new Boolean();
                inser = RankingC.Insert(Puntos_prueba, id_jugador);

            }

            if (PreguntasIncorrectas>0)
            {
                DataTable Consulta_Prueba_Sancion = Prueba_SancionC.ConsultaParametroFK_prueba(Convert.ToString(Session_id_prueba));
                if (Consulta_Prueba_Sancion.Rows.Count!=0)
                {
                    int numero_sanciones = Consulta_Prueba_Sancion.Rows.Count;
                    Random rnd = new Random();
                    int numero_aleatorio = rnd.Next(0, numero_sanciones);

                    String id_sancion = Consulta_Prueba_Sancion.Rows[numero_aleatorio]["fk_sancion"].ToString();
                    DataTable Consulta_sancion = SancioC.ConsultaParametroIdsancion(id_sancion);
                    String url_video = Consulta_sancion.Rows[0]["url_video"].ToString();
                    cargaVideo.Attributes["Src"] = url_video;

                    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    sb.Append(@"<script type='text/javascript'>");
                    sb.Append("$('#editModal').modal('show');");
                    sb.Append(@"</script>");
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "editModal", sb.ToString(), false);
                }
            }
            Puntos_prueba = 0;
        }

        public void EcrituraPreguntaRespuesta()
        {
            if (Guardian)
            {
                pregunta = retornaPregunta();
                Guardian = false;
            }
            numeroPreguntas_Prueba = pregunta.Rows.Count;

            //Genera el numero aletorio de la pregunta que se mostrara al usuario.
            numeroAleatorio = aletorio.Next(0, numeroPreguntas_Prueba);


            int retorno =guardarPreguntasGeneradas(numeroPreguntas_Prueba, numeroAleatorio);
            //codigo para cargar la pregunta en el html
            if (numeroPreguntas_Prueba == 0)
            {
                //Response.Redirect("~/Views/VistasJugador/Contenido/ListaContenido.aspx");
                Response.Write("<script>alert('No hay preguntas para mostrar');</script>");

            }
            else
            {
                String preguntaHtml = pregunta.Rows[retorno]["nombre_pregunta"].ToString();
                String id_pregunta = pregunta.Rows[retorno]["id_pregunta"].ToString();
                PreguntaHtml.InnerHtml = preguntaHtml;

                //codigo para cargar la respuestas en el html.
                resultadoRespuestas = retornaRespuesta(id_pregunta);
                Radio1.Text = resultadoRespuestas.Rows[0]["respuesta_a"].ToString();
                Radio2.Text = resultadoRespuestas.Rows[0]["respuesta_b"].ToString();
                Radio3.Text = resultadoRespuestas.Rows[0]["respuesta_c"].ToString();
                Radio4.Text = resultadoRespuestas.Rows[0]["respuesta_d"].ToString();
            }
        }


        public DataTable retornaPregunta()
        {
                //Obtenemos el id de la prueba
                id_prueba = Convert.ToString(Request.QueryString["id_prueba"]);
                Session["id_prueba"] = id_prueba;
                DataTable ConsultaPrueba = PruebaC.consultaParametroId_prueba(id_prueba);
                String NombrePrueba = ConsultaPrueba.Rows[0]["nombre_prueba"].ToString();
                TituloPrueba.InnerHtml = "Prueba de conocimiento: <strong>" + NombrePrueba + "</strong>";
                consulta = PreguntaC.consultaParametroFk_Prueba(id_prueba);
            return consulta;
        }


        public void verificarRespuesta(String respuestaCorrecta)
        {
                if (Radio1.Checked)
                {
                    if (Radio1.Text==respuestaCorrecta)
                    {
                    PreguntasCorrectas++;
                    Puntos_prueba++;
                }
                else
                {
                    PreguntasIncorrectas++;
                }
                Radio1.Checked = false;
                }
                else
                {
                    if (Radio2.Checked)
                    {
                    if (Radio2.Text == respuestaCorrecta)
                    {
                        PreguntasCorrectas++;
                        Puntos_prueba++;
                    }
                    else
                    {
                        PreguntasIncorrectas++;
                    }
                    Radio2.Checked = false;
                }
                else
                {
                    if (Radio3.Checked)
                    {
                        if (Radio3.Text == respuestaCorrecta)
                        {
                            PreguntasCorrectas++;
                            Puntos_prueba++;
                        }
                        else
                        {
                            PreguntasIncorrectas++;
                        }
                        Radio3.Checked = false;
                    }
                    else
                    {
                        if (Radio4.Checked)
                        {
                            if (Radio4.Text == respuestaCorrecta)
                            {
                                PreguntasCorrectas++;
                                Puntos_prueba++;
                            }
                            else
                            {
                                PreguntasIncorrectas++;
                            }
                        Radio4.Checked = false;
                        }
                        else
                        {
                        }
                    }
                }
                }
            PreguntasContestadas = PreguntasCorrectas + PreguntasIncorrectas;
        }

        public int recursivoAletorio(int numeroAleatorio, int numeroPreguntas)
        {
            if (listaNumeroOutp.Count != numeroPreguntas)
            {
                foreach (int c in listaNumeroOutp)
                {
                    if (c == numeroAleatorio)
                    {
                        while (c == numeroAleatorio)
                        {
                            numeroAleatorio = aletorio.Next(0, numeroPreguntas);
                        }
                       return numeroAleatorio = recursivoAletorio(numeroAleatorio, numeroPreguntas);
                    }
                }
            }
            else
            {
                DivFinalizacion.InnerHtml = "Haz finalizado";
                DivFinalizacion.Attributes.Add("style", "display:block");
                ResultadosPrueba.InnerHtml = "<strong>Respuestas correctas: </strong>" + PreguntasCorrectas + "<strong> Respuestas incorrectas: </strong>" + PreguntasIncorrectas + "<strong> Preguntas no contestadas </strong>" + preguntasNocontestadas;
                ResultadosPrueba.Attributes.Add("style", "display:block");
                BtnNext.Enabled = false;
                listaNumeroOutp.Clear();
                numeroPreguntas = 0;
                listaNumeroOutp = new List<int>();
            }
            listaNumeroOutp.Add(numeroAleatorio);
            return numeroAleatorio;
        }

        public int guardarPreguntasGeneradas(int numeroPreguntas, int numeroAleatorio)
        {
                if (listaNumeroOutp.Count == 0)
                {
                    listaNumeroOutp.Add(numeroAleatorio);
                }
                else
                {
                    numeroAleatorio = recursivoAletorio(numeroAleatorio, numeroPreguntas);
                }
            return numeroAleatorio;
        }

        public DataTable retornaRespuesta(String fk_pregunta)
        {
            DataTable consultaRespuestas = RespuestaC.ConsultaParametroFk_pregunta(fk_pregunta);
            return consultaRespuestas;
        }
    }
}