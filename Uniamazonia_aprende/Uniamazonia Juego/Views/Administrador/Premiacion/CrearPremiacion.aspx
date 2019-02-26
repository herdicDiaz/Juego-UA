<%@ Page Title="Crear Premiacion" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="CrearPremiacion.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.Premiacion.CrearPremiacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContenidoPagina" runat="server">
    <br />
    <div class="col-12">
        <div class="card">
            <div class="card-header bg-success text-center">
                <h3>Crear premiación
                </h3>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-6">
                        <label>Cantidad de puntos para desbloquear una estrella</label>
                        <input type="text" id="txtPuntosExtrella" class="form-control" placeholder="Ejemplo 120" runat="server" required><br />
                    </div>
                    <div class="col-md-6">
                        <label>Cantidad de estrellas para desbloquear un diamante</label>
                        <input type="text" id="txtEstrellasDiamante" class="form-control" placeholder="ejemplo 5" runat="server" required /><br />
                    </div>
                </div>
                <center>
                    <asp:Button ID="BtnCrearPremiacion" CssClass="btn btn-success" OnClick="crearPremiacion" Text="Crear premiacion" runat="server"/>
      </center>
            </div>
        </div>
    </div>
    <script type="text/javascript">

        $(document).ready(function () {
            $("#form1").validate({
                rules: {

                   <%=txtPuntosExtrella.UniqueID%>: "required",
                   <%=txtEstrellasDiamante.UniqueID%> :{
                    required: true
                },
                },
            messages: {

                 <%=txtPuntosExtrella.UniqueID%> : "Este campo es requerido",
                 <%=txtEstrellasDiamante.UniqueID%> : "Este campo es requerido",
            }
            });
        });

    </script>
</asp:Content>

