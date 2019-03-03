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
    public partial class EditarModulo : System.Web.UI.Page
    {
        ModuloController controlador_modulos;
        DataTable consulta_modulo = new DataTable();


        protected void Page_Load(object sender, EventArgs e)
        {
            cargar_modulos_BD();

        }



        protected void guadar_edicion_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrWhiteSpace(this.nuevo_nombre_txt.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({type: 'error',title: 'Complete todos los campos',text: 'Algo salió mal!',timer: 3200}) </script>");
            }
            else
            {
                // guardar en la ruta , de la carpeta del proyecto.
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
                        this.cargar_img.SaveAs(Server.MapPath("~/FotosBD/moduloFotos/edicionFotos/") + ViewState["foto_cargada"]);


                        // guardar en la base de datos.
                        String ruta_imagen_actual = Server.UrlPathEncode("~/FotosBD/moduloFotos/edicionFotos/" + ViewState["foto_cargada"]);
                        ruta_imagen_actual = ruta_imagen_actual.Replace("~", "../../..");

                        int id_modulo = Convert.ToInt32(ViewState["id_modulo_aux"].ToString());

                        controlador_modulos = new ModuloController(id_modulo, this.lista_modulos.SelectedValue, "A", ruta_imagen_actual);


                        if (controlador_modulos.actualizar_nombre_modulo())
                        {

                            ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({position: 'center',type: 'success',title: 'Registro Exitoso',showConfirmButton: false,timer: 2500}) </script>");

                            this.nuevo_nombre_txt.Text = "";

                        }
                        else
                        {

                            ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({type: 'error',title: 'Modulo No Guardado!',text: 'Algo salió mal!',timer: 3200}) </script>");
                        }
                        

                    }

                }



            }


        }

        public void cargar_modulos_BD() {
            if (Page.IsPostBack) return;
            controlador_modulos = new ModuloController(0, "", "", "");
            consulta_modulo = controlador_modulos.consulta_combox_nombre();
            this.lista_modulos.DataTextField = "nombre_modulo";
            this.lista_modulos.DataSource = consulta_modulo;
            lista_modulos.DataBind();
        }

        protected void subir_Click(object sender, EventArgs e)
        {

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
            //        this.cargar_img.SaveAs(Server.MapPath("~/FotosBD/moduloFotos/edicionFotos/") + ViewState["foto_cargada"]);

            //    }

            //}
        }

        protected void lista_modulos_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id_modulo_seleccionado=0;
            controlador_modulos = new ModuloController(0, "", "", "");
            consulta_modulo = controlador_modulos.consulta_combox_nombre();


            foreach (DataRow fila in consulta_modulo.Rows)
            {
                if (fila["nombre_modulo"].ToString().Equals(this.lista_modulos.SelectedValue))
                {
                   id_modulo_seleccionado = Convert.ToInt32(fila["id_modulo"].ToString());
                }
            }

            ViewState["id_modulo_aux"] = id_modulo_seleccionado;
            controlador_modulos = new ModuloController(id_modulo_seleccionado,"","","");
            this.nuevo_nombre_txt.Text = controlador_modulos.consulta_nombre_BD();
        }
    }
}