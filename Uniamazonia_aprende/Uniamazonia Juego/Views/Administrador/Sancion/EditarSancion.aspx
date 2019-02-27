<%@ Page Title="Editar Sancion" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="EditarSancion.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.Sancion.EditarSancion" %>

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
