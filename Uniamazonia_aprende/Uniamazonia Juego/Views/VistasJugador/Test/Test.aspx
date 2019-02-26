<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="Uniamazonia_Juego.Views.VistasJugador.Test.Test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MapaPagina" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPagina" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <%--VENTANAS MODALES--%>
    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>
            <div id="xx" runat="server">
                <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="editModalLabel">Sanción </h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <iframe width="760" id="cargaVideo" runat="server" height="480" src="" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Cerar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>



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
