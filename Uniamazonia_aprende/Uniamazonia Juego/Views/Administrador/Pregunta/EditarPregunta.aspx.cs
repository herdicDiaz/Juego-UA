using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniamazonia_Juego.Controllers;

namespace Uniamazonia_Juego.Views.Administrador.Pregunta
{
    public partial class EditarPregunta : System.Web.UI.Page
    {
        DataTable consulta_pruebas = new DataTable();
        PruebaController PruebaC=new PruebaController();
        PreguntaController preguntaC = new PreguntaController();
        RespuestaController respuestaC = new RespuestaController();
        int id_pregunta;
    
        protected void Page_Load(object sender, EventArgs e)
        {
            id_pregunta = Convert.ToInt32(Request.QueryString["id_pregunta"]);
            if (Page.IsPostBack==false)
            {
                DataTable consulta = preguntaC.preguntaEditar(id_pregunta);
                txtNombre.Text = consulta.Rows[0]["nombre_pregunta"].ToString();
                String estado = consulta.Rows[0]["estado_pregunta"].ToString();
                txtRespuestaA.Value = consulta.Rows[0]["respuesta_a"].ToString();
                txtRespuestaB.Value = consulta.Rows[0]["respuesta_b"].ToString();
                txtRespuestaC.Value = consulta.Rows[0]["respuesta_c"].ToString();
                txtRespuestaD.Value = consulta.Rows[0]["respuesta_d"].ToString();
                DropRespuestaCorrec.Items.Add("A");
                DropRespuestaCorrec.Items.Add("B");
                DropRespuestaCorrec.Items.Add("C");
                DropRespuestaCorrec.Items.Add("D");
                if (consulta.Rows[0]["respuesta_correcta"].ToString()== consulta.Rows[0]["respuesta_a"].ToString())
                {
                    DropRespuestaCorrec.SelectedValue ="1";

                }
                else
                {
                    if (consulta.Rows[0]["respuesta_correcta"].ToString() == consulta.Rows[0]["respuesta_b"].ToString())
                    {
                        DropRespuestaCorrec.SelectedValue = "2";
                    }
                    else
                    {
                        if (consulta.Rows[0]["respuesta_correcta"].ToString() == consulta.Rows[0]["respuesta_c"].ToString())
                        {
                            DropRespuestaCorrec.SelectedValue = "3";

                        }
                        else
                        {
                            DropRespuestaCorrec.SelectedValue = "4";

                        }
                    }
                }
                
            }
         
        }

        protected void guardarCambios(object sender, EventArgs e)
        {

            String nombre1 = txtNombre.Text.ToString();
            String ra1 = txtRespuestaA.Value;
            String rb1 = txtRespuestaB.Value;
            String rc1 = txtRespuestaC.Value;
            String rd1 = txtRespuestaD.Value;
            String respuestaCorrecta;

            if (DropRespuestaCorrec.Text == "A")
            {
                respuestaCorrecta = ra1;
            }
            else
            {
                if (DropRespuestaCorrec.Text == "B")
                {
                    respuestaCorrecta = rb1;
                }
                else
                {
                    if (DropRespuestaCorrec.Text == "C")
                    {
                        respuestaCorrecta = rc1;
                    }
                    else
                    {
                        respuestaCorrecta = rd1;
                    }
                }
            }
            Boolean consulta = preguntaC.update_pregunta(nombre1, id_pregunta);
            Boolean consulta1 = respuestaC.updateRespuesta(ra1, rb1, rc1, rd1, respuestaCorrecta, id_pregunta);
            if (consulta & consulta1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({position: 'center',type: 'success',title: 'Exitoso!',text:'Pregunta actulizada satisfatoriamente.',timer:3000}) </script>");
            }
            //Response.Redirect("~/Views/Administrador/Pregunta/ListarPreguntas.aspx");

        }

    }
}