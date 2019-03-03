<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="EditarPuntuacion.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.Puntuacion.EditarSancion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MapaPagina" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="migajaDePan" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoPagina" runat="server">
    <div class="card">
        <div class="card-header text-center bg-success">
            <h3>Editar puntuación</h3>
        </div>
        <div class="card-body">
                <asp:Label ID="Label" Text="Puntos" runat="server"></asp:Label>
                <div class="row ">
                    <div class="col-md-11">
                        <asp:TextBox ID="TexboxPuntos" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-1">
                        <asp:Button ID="ButtonGuardar" CssClass="btn btn-success" Text="Guardar" runat="server" OnClick="ButtonGuardar_Click"/>
                    </div>
                </div>
        </div>
    </div>
</asp:Content>
