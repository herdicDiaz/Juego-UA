using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniamazonia_Juego.Controllers;

namespace Uniamazonia_Juego.Views.VistasJugador.Test
{
    public partial class Test : System.Web.UI.Page
    {
        PreguntaController PreguntaC = new PreguntaController();
        RespuestaController RespuestaC = new RespuestaController();
        Usuario_PruebaController Usuario_PruebaC = new Usuario_PruebaController();
        public static PruebaController PruebaC { get; set; }
        public static List<int> listaNumeroOutp { get; set; }
        public static DataTable resultadoRespuestas { get; set; }
        String id_prueba;
        Random aletorio = new Random();
        DataTable consulta,pregunta;
        public static int numeroPreguntas_Prueba=0, numeroAleatorio=0, PreguntasCorrectas, PreguntasIncorrectas, preguntasNocontestadas,PreguntasContestadas;


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
            int id_usuario =Convert.ToInt32( Session["id_usuario"].ToString());
            int Session_id_prueba =Convert.ToInt32( Session["id_prueba"].ToString());
            preguntasNocontestadas = numeroPreguntas_Prueba - PreguntasContestadas;
            Boolean insert = Usuario_PruebaC.InsertarRegistro(Session_id_prueba, id_usuario,"2018/02/07",12,preguntasNocontestadas,PreguntasContestadas,PreguntasIncorrectas,PreguntasCorrectas);
           

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

                        }
                        else
                        {
                            PreguntasIncorrectas++;
                        }
                    }
                    else
                    {
                        if (Radio4.Checked)
                        {
                            if (Radio1.Text == respuestaCorrecta)
                            {
                                PreguntasCorrectas++;
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