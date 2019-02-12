using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniamazonia_Juego.Controllers;

namespace Uniamazonia_Juego.Views.Administrador
{
    public partial class GestionarModulos : System.Web.UI.Page
    {

        ModuloController controlador_menu;


        protected void Page_Load(object sender, EventArgs e)
        {
         
        }


        public String nombre_aleatorio() {
            String path = Path.GetRandomFileName();
            path = path.Replace(".","");
            return path;
        }


        protected void crear_modulo_Click1(object sender, EventArgs e)
        {
            // crear Modulo
            if (String.IsNullOrWhiteSpace(this.name_modulo.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({type: 'error',title: 'Complete todos los campos',text: 'Algo salió mal!',timer: 3200}) </script>");
            }
            else
            {
                // subir la foto a las carpetas del proyecto.
                Boolean correcto = false;
                if (cargar_img.HasFile)
                {
                    ViewState["extencion"] = System.IO.Path.GetExtension(this.cargar_img.FileName).ToLower();
                    String[] extencionesPermitidas = { ".png", ".jpg", ".jpeg" };
                    for (int i = 0; i < extencionesPermitidas.Length; i++)
                    {
                        if (ViewState["extencion"].ToString() == extencionesPermitidas[i])
                        {
                            correcto = true;
                        }
                    }
                    if (correcto)
                    {
                        ViewState["foto_cargada"] = System.IO.Path.GetFileName(cargar_img.FileName);
                        this.cargar_img.SaveAs(Server.MapPath("~/FotosBD/moduloFotos/") + ViewState["foto_cargada"]);
                        // termina proceso, en la carpeta local.



                        // realizar el registro en la base de datos.
                        String ruta_imagen_actual = Server.UrlPathEncode("~/FotosBD/moduloFotos/" + ViewState["foto_cargada"]);
                        ruta_imagen_actual = ruta_imagen_actual.Replace("~", "../../..");


                        controlador_menu = new ModuloController(0, this.name_modulo.Text, "A", ruta_imagen_actual);
                        if (controlador_menu.crear_modulo())
                        {
                            //ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal ('Good job!', 'You clicked the button!', 'success') </script>");
                            ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({position: 'center',type: 'success',title: 'Registro Exitoso',timer: 2500}) </script>");
                            this.name_modulo.Text = "";
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({type: 'error',title: 'Modulo No! Creado',text: 'Algo salió mal!',timer: 3200}) </script>");

                            //ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal ('Error', 'varifique la entrada', 'error') </script>");

                        }
                    }
                }
            }
        }

        protected void subir_Click(object sender, EventArgs e)
        {
            // subir             
            //Boolean correcto = false;
            //if (cargar_img.HasFile)
            //{
            //    ViewState["extencion"] = System.IO.Path.GetExtension(this.cargar_img.FileName).ToLower();
            //    String[] extencionesPermitidas = { ".png", ".jpg", ".jpeg" };
            //    for (int i = 0; i < extencionesPermitidas.Length; i++)
            //    {
            //        if (ViewState["extencion"].ToString() == extencionesPermitidas[i])
            //        {
            //            correcto = true;
            //        }
            //    }
            //    if (correcto)
            //    {
            //        ViewState["foto_cargada"] = System.IO.Path.GetFileName(cargar_img.FileName);
            //        this.cargar_img.SaveAs(Server.MapPath("~/FotosBD/moduloFotos/") + ViewState["foto_cargada"]);
            //    }

            //}
        }
    }
}