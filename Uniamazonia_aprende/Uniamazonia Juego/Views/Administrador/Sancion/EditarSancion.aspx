<%@ Page Title="Editar Sancion" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="EditarSancion.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.Sancion.EditarSancion" %>
<asp:Content ID="Content3" ContentPlaceHolderID="migajaDePan" runat="server">
    <div style="margin-left: 4px; height: 28px;">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/Views/Administrador/Welcome.aspx">Inicio</a></li>
                <li class="breadcrumb-item"><a href="#">Gestionar Sancion</a></li>
                <li class="breadcrumb-item active" aria-current="page">Editar Sancion<li>
            </ol>
        </nav>
    </div>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContenidoPagina" runat="server">
    <div class="col-md-12">
        <div class="card">
            <div class="card-header bg-success text-center">
                <h3>Editar pregunta</h3>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-6">
                        <label>Descripción</label>
                        <input id="TxtDescripcion" type="text" class="form-control" runat="server" />
                    </div>
                    <div class="col-md-6">
                        <label>Url del video</label>
                        <input id="TxtUrl" type="text" class="form-control" runat="server" />
                    </div>
                </div>

                <br />
                <center>
                    <button id="BtnGuardar" onserverclick="guardarSancion" type="submit" class="btn btn-success text-center" runat="server">Guardar cambios</button>
                </center>
            </div>
        </div>
    </div>

</asp:Content>
