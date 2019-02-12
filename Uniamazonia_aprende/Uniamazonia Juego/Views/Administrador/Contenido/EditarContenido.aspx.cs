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
    public partial class EditarContenido : System.Web.UI.Page
    {
        ContenidoController controlador_contenido;
        public DataTable consulta_contenido = new DataTable();


        protected void Page_Load(object sender, EventArgs e)
        {
            cargar_contenid_BD();
        }






        protected void guadar_edicion_Click(object sender, EventArgs e)
        {
            // guardar en la carpeta del proyecto.
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
                    this.cargar_img.SaveAs(Server.MapPath("~/FotosBD/contenidoFotos/edicionFotosC/") + ViewState["foto_cargada"]);
                    // termina proceso, en la carpeta local.


                    


                    // guardar en la base de datos.
                    String ruta_imagen_actual = Server.UrlPathEncode("~/FotosBD/contenidoFotos/edicionFotosC/" + ViewState["foto_cargada"]);
                    ruta_imagen_actual = ruta_imagen_actual.Replace("~", "../../..");


                    int aux_id_cotenido = Convert.ToInt32(ViewState["id_aux_contenido"].ToString());
                    controlador_contenido = new ContenidoController(aux_id_cotenido, this.nuevo_nombre_txt.Text, this.descr_contenido.InnerText, "A", ruta_imagen_actual);

                    if (controlador_contenido.editar_contenido())
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({position: 'center',type: 'success',title: 'Cambios Guardados',showConfirmButton: false,timer: 2500}) </script>");

                        this.nuevo_nombre_txt.Text = "";
                        this.descr_contenido.InnerText = "";
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "mensaje", "<script> swal({type: 'error',title: 'Cambios NO guardados',text: 'Algo salió mal!',timer: 3200}) </script>");
                    }



                    // actualziando los campos de  contenido lista

                    //if (!Page.IsPostBack) return;
                    //this.lista_contenido.Items.Clear();
                    //this.lista_contenido.Items.Insert(0, new ListItem("-- Seleccione un Contenido -- "));
                    //cargar_contenid_BD();

                }
            }
        }



        public void cargar_contenid_BD()
        {
            if (Page.IsPostBack) return;
            controlador_contenido = new ContenidoController(0, "", "", "", "");
            consulta_contenido = controlador_contenido.consulta_combox_nombre();
            this.lista_contenido.DataTextField = "nombre_contenido";
            this.lista_contenido.DataSource = consulta_contenido;
            lista_contenido.DataBind();


        }

        protected void lista_contenido_SelectedIndexChanged(object sender, EventArgs e)
        {
            // sacar el id del contenidos seleccionado
            if (!this.lista_contenido.SelectedValue.Equals(""))
            {
                actualizar_campos();
            }
            
        }

        public void actualizar_campos()
        {

            controlador_contenido = new ContenidoController(0, "", "", "", "");
            consulta_contenido = controlador_contenido.consultar_contenido();

            foreach (DataRow contenido_fila in consulta_contenido.Rows)
            {
                if (contenido_fila["nombre_contenido"].ToString().Equals(this.lista_contenido.SelectedValue))
                {
                    ViewState["id_aux_contenido"] = contenido_fila["id_contenido"].ToString();
                    this.nuevo_nombre_txt.Text = contenido_fila["nombre_contenido"].ToString();
                    this.descr_contenido.InnerText = contenido_fila["descripcion_contenido"].ToString();


                }

            }


        }
    }
}