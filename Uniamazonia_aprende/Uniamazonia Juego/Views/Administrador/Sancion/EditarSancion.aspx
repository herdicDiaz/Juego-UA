<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="EditarSancion.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.Sancion.EditarSancion" %>

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
                <div class="row">
                    <div class="col-md-6">
                    <label>Estado de la pregunta</label>
                        <asp:DropDownList ID="DropDownList" AppendDataBoundItems="true" CssClass="form-control" runat="server">
                            <%--<asp:ListItem Value="0">A</asp:ListItem>--%>
                            <asp:ListItem Value="0">--Seleccione estado--</asp:ListItem>
                        </asp:DropDownList><br />
                        <p>"A" Habilitar, "D" Desabilitar</p>
              
                    </div>
                </div>
                <center>
                    <button id="BtnGuardar" onserverclick="guardarSancion" type="submit" class="btn btn-success text-center" runat="server">Guardar cambios</button>
                </center>
            </div>
        </div>
    </div>

</asp:Content>
