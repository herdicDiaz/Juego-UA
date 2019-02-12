﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniamazonia_Juego.Conexion;
using Uniamazonia_Juego.Controllers;
using Uniamazonia_Juego.Models;

namespace Uniamazonia_Juego.Views.Administrador.Pregunta
{
    public partial class CrearPregunta : System.Web.UI.Page
    {
        string pregunta;
        string respuestaA;
        string respuestaB;
        string respuestaC;
        string respuestaD;
        int calificacion;
        string respuesta_correcta;

        PruebaController PruebaC=new PruebaController();
        SancionController SancionC = new SancionController();
        PreguntaController preguntaC = new PreguntaController();
        RespuestaController RespuestaController = new RespuestaController();
        Connection connection=new Connection();
        DataTable consulta_lista_pruebas = new DataTable();
        DataTable consulta_lista_sanciones = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack==false)
            {
                DropRespuestCorrecta.Items.Add("A");
                DropRespuestCorrecta.Items.Add("B");
                DropRespuestCorrecta.Items.Add("C");
                DropRespuestCorrecta.Items.Add("D");
            }
        }

        protected void btnCrearPregunta(object sender, EventArgs e)
        {
            this.pregunta = txtNombrePregunta.Text;
            this.respuestaA = txtRespuesta1.Text;
            this.respuestaB = txtRespuesta2.Text;
            this.respuestaC = txtRespuesta3.Text;
            this.respuestaD = txtRespuesta4.Text;

            if (DropRespuestCorrecta.SelectedValue=="A")
            {
                respuesta_correcta = txtRespuesta1.Text;
            }
            else{
                if (DropRespuestCorrecta.SelectedValue == "B")
                {
                    respuesta_correcta = txtRespuesta2.Text;
                }
                else
                {
                    if (DropRespuestCorrecta.SelectedValue == "C")
                    {
                        respuesta_correcta = txtRespuesta3.Text;
                    }
                    else
                    {
                        if (DropRespuestCorrecta.SelectedValue == "D")
                        {
                            respuesta_correcta = txtRespuesta4.Text;
                        }
                    }
                }
            }

            //inserta una nueva pregunta en el sistema.
            Boolean insert= preguntaC.Insertar_registro_pregunta(pregunta,calificacion);

            DataTable consulta2 = preguntaC.Consultas_generales("select max(id_pregunta) from pregunta");
            int fk_pregunta = Int32.Parse(consulta2.Rows[0]["max(id_pregunta)"].ToString());

            //inserta las respuesta de la pregunta creada anteriormente.
            Boolean insert_respuestas = RespuestaController.insert_respuestas(respuestaA, respuestaB, respuestaC, respuestaD, respuesta_correcta, "A", fk_pregunta);
            if (insert && insert_respuestas)
            {
            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "successalert();", true);
            Response.Redirect("~/Views/Administrador/Pregunta/ListarPreguntas.aspx");
            }
        }


    }
}