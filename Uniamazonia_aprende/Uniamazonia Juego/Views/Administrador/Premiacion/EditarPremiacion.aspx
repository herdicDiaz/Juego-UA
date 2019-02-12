<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="EditarPremiacion.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.Premiacion.EditarPremiacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContenidoPagina" runat="server">
    <br />
    <div class="col-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <center>
          <h3 class="panel-title">
              Crear premiación
          </h3>
      </center>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-6">
                        <label>Puntuación para desbloquear una estrella</label>
                        <input type="text" id="txtPuntosExtrella" class="form-control"  runat="server" required><br />
                    </div>
                    <div class="col-md-6">
                        <label>Cantidad de estrellas para desbloquear un diamante</label>
                        <input type="text" id="txtEstrellasDiamante" class="form-control"  runat="server" required /><br />
                    </div>
                </div>
                <center>
      <button class="btn btn-success">Guardar cambios</button>
      </center>
            </div>
        </div>
    </div>
</asp:Content>

