    using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniamazonia_Juego.Controllers;

namespace Uniamazonia_Juego.Views.Administrador
{
    public partial class CrearContenido : System.Web.UI.Page
    {
        ContenidoController controlador_contenido;
        ModuloController controlador_modulo;

        DataTable consulta_lista_modulos = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            cargar_modulos_BD();

        }

        protected void crear_contenido_Click(object sender, EventArgs e)
        {
            // crear conetenido
            if (String.IsNullOrWhiteSpace(this.nombre_content.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({type: 'error',title: 'Complete todos los campos',text: 'Algo salió mal!',timer: 3200}) </script>");
            }
            else
            {
                // guardar en la carpeta del proyecto.
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
                        this.cargar_img.SaveAs(Server.MapPath("~/FotosBD/contenidoFotos/") + ViewState["foto_cargada"]);
                        // termina proceso, en la carpeta local.

                        
                        // guardar en la base de datos.

                        String ruta_imagen_actual = Server.UrlPathEncode("~/FotosBD/contenidoFotos/" + ViewState["foto_cargada"]);
                        ruta_imagen_actual = ruta_imagen_actual.Replace("~", "../../..");

                        controlador_contenido = new ContenidoController(0, this.nombre_content.Text, this.descr_contenido.InnerText, "A",ruta_imagen_actual);

                        if (controlador_contenido.crear_contenido(this.lista_modulos.SelectedValue))
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({position: 'center',type: 'success',title: 'Registro Exitoso',timer: 2500}) </script>");

                            this.nombre_content.Text = "";
                            this.descr_contenido.InnerText = "";

                            //this.lista_modulos.Items.Clear();
                            //this.lista_modulos.Items.Insert(0, new ListItem("-- Seleccione un Modulo -- "));
                            //cargar_modulos_BD();

                        }
                        else
                        {

                            ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({type: 'error',title: 'Contenido No! Creado',text: 'Algo salió mal!',timer: 3200}) </script>");

                        }
                    }
                }
            }
        }


        public void cargar_modulos_BD() {
            if (Page.IsPostBack) return;
            controlador_modulo = new ModuloController(0, "", "", "");
            consulta_lista_modulos = controlador_modulo.consulta_combox_nombre();
            this.lista_modulos.DataTextField = "nombre_modulo";
            this.lista_modulos.DataSource = consulta_lista_modulos;
            lista_modulos.DataBind();

        }
    }
}