<%@ Page Title="Contenido" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="ListaContenido.aspx.cs" Inherits="Uniamazonia_Juego.Views.VistasJugador.ConsulraContenido.ListaContenido" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MapaPagina" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="migajaDePan" runat="server">
    <div style="margin-left: 4px; height: 28px;">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/Views/Administrador/Welcome.aspx"><span class="mdi mdi-home"></span>&nbsp;Inicio</a></li>
                <li class="breadcrumb-item"><a href="#">Modulos</a></li>
                <li class="breadcrumb-item"><a href="/Views/VistasJugador/ConsultaModulo/ListaModulo.aspx">Ver Modulos</a></li>
                <li class="breadcrumb-item active" aria-current="page">Lista Contenido</li>
            </ol>
        </nav>
    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPagina" runat="server">
    <div class="card">
        <div class="card-header bg-success text-center">
            <h3>Lista de contenidos</h3>
        </div>
        <div class="card-body">
            <div class="row">
                <asp:ListView ID="ListView1" runat="server">
                    <ItemTemplate>
                        <div class="col-md-12">
                            <div class="card">
                                <div class="card-header bg-info" style="color:white">
                                    <h4>
                                    <%# Eval("nombre_contenido") %>
                                    </h4>
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title">Descripción</h5>
                                    <p class="card-text"><%#Eval("descripcion_contenido")%></p>
                                     <asp:Button runat="server" Text="Ver pruebas" ID="btnPrueba" CssClass="btn btn-success" CommandArgument='<%#Eval("id_contenido")%>' OnClick="btnPrueba" />
                                </div>
                            </div>


                            <%--lklkl--%>
               <%--             <div class="card">
                                <div class="card-header bg-info text-center">
                                    <h5 style="color: white"><%#Eval("nombre_contenido")%></h5>
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">Descripción</h4>
                                    <p class="card-text"><%#Eval("descripcion_contenido")%></p>
                                    <center>
                            <asp:Button runat="server" Text="Ver pruebas" ID="btnPrueba" CssClass="btn btn-info" CommandArgument='<%#Eval("id_contenido")%>' OnClick="btnPrueba" />
                            </center>
                                </div>
                            </div>--%>
                        </div>

                    </ItemTemplate>
                </asp:ListView>
            </div>

        </div>
    </div>

</asp:Content>
