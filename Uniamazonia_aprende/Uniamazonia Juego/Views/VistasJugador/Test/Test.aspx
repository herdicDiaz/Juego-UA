<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="Uniamazonia_Juego.Views.VistasJugador.Test.Test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MapaPagina" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPagina" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="card">
        <div class="card-header bg-success">
            <h3 runat="server" class="text-center">Test</h3>
        </div>
        <div class="card-body">
            <div class="card-title" runat="server" id="TituloPrueba">
                <h3></h3>
            </div>
            <br />
            <div class="border border-success">
                <br />
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="container">
                            <h4 id="PreguntaHtml" runat="server"></h4>
                            <%--repuestas--%>
                            <div class="row" runat="server">
                                <asp:RadioButton CssClass="col-md-0" runat="server" ID="Radio1" GroupName="Respuestas" />
                            </div>
                            <div class="row">
                                <asp:RadioButton ID="Radio2" runat="server" GroupName="Respuestas" />
                            </div>
                            <div class="row">
                                <asp:RadioButton CssClass="col-md-0" runat="server" ID="Radio3" GroupName="Respuestas" />
                            </div>
                            <div class="row">
                                <asp:RadioButton CssClass="col-md-0" runat="server" ID="Radio4" GroupName="Respuestas" />
                            </div>
                        </div>
                        <br />
                        <%--<asp:Label ID="pruena" runat="server"></asp:Label>--%>
                        <div class="row justify-content-sm-around">
                            <div class="">
                                <asp:Button ID="BtnNext" CssClass="btn btn-success" OnClick="BtnSiguiente" Text="Siguiente" runat="server" />
                            </div>
                            &nbsp
                            &nbsp
                            <div class="">
                                <asp:Button ID="BtnTerminar_intento" runat="server" Text="Terminar intento" CssClass="btn btn-danger" OnClick="TerminarIntento" />
                            </div>
                        </div>

                        <br />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <br />
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <div id="DivFinalizacion" style="display: none" class="alert alert-success" role="alert" runat="server">
                        <h1></h1>
                    </div>

                    <div id="ResultadosPrueba" style="display: none" class="alert alert-warning" role="alert" runat="server">
                        <h1></h1>
                    </div>

                </ContentTemplate>
            </asp:UpdatePanel>
            <%--Boton de siguiente.--%>
        </div>
    </div>
</asp:Content>
