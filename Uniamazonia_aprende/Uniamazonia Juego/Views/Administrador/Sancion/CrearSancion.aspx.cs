﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniamazonia_Juego.Controllers;

namespace Uniamazonia_Juego.Views.Administrador.Sancion
{
    public partial class CrearSancion : System.Web.UI.Page
    {
        SancionController SancionC = new SancionController();
    

        protected void btnCrearSancion(object sender, EventArgs e)
            {
            String descripcion = txtDescripcion.Value;
            String Url = TxtUrlVideo.Value;
            Boolean consulta = SancionC.insertarSancion(descripcion,Url ,"0");
            //using (BinaryReader reader = new BinaryReader(txtCargarVideo.PostedFile.InputStream))
            //{
            //    String descripcion = txtDescripcion.Value;
            //    String nombre = this.txtCargarVideo.PostedFile.FileName;
            //    byte[] image = reader.ReadBytes(txtCargarVideo.PostedFile.ContentLength);
            //    if (descripcion=="")
            //    {
            //        Response.Write("<script>alert('Aun no has escrito una descripcion de la sanción')</script>");
            //    }
            //    if (image.Length==0)
            //    {
            //        Response.Write("<script>alert('Aun no has cargado un archivo')</script>");
            //    }
            //    if (descripcion!="" && image.Length!=0)
            //    {
            //    }

            //}
        }
    }
}