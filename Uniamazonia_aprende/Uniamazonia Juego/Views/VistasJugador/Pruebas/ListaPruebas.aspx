<%@ Page Title="Lista Pruebas" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="ListaPruebas.aspx.cs" Inherits="Uniamazonia_Juego.Views.VistasJugador.Pruebas.ListaPruebas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MapaPagina" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="migajaDePan" runat="server">
    <div style="margin-left: 4px; height: 28px;">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/Views/Administrador/Welcome.aspx"><span class="mdi mdi-home"></span>&nbsp;Inicio</a></li>
                 <li class="breadcrumb-item"><a href="#">Modulos</a></li>
                <li class="breadcrumb-item"><a href="/Views/VistasJugador/ConsultaModulo/ListaModulo.aspx">Ver Modulos</a></li>
                <li class="breadcrumb-item"><a href="/Views/VistasJugador/Contenido/ListaContenido.aspx">Lista Contenido</a></li>
                <li class="breadcrumb-item active" aria-current="page">Lista Pruebas</li>
            </ol>
        </nav>
    </div>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPagina" runat="server">


    <%--<div class="container-fluid">--%>



    <div class="card">
        <div class="card-header bg-success text-center">
            <h3 id="h5Titulo_prueba" runat="server" class="text-center">Listado de pruebas</h3>
        </div>
        <div class="card-body">
            <div class="row">
                <asp:ListView ID="ListPruebas" runat="server">
                    <ItemTemplate>
                        <div class="col-md-4">
                            <div class="card">
                                <div class="card-header text-center bg-info">
                                    <h6 style="color:white"><strong >Prueba: </strong> <%#Eval("nombre_prueba")%></h6>
                                </div>
                                <div class="card-body">
                                    <center>
                                    <asp:Button ID="Btn_iniciar_prueba" Text="Iniciar prueba" CssClass="btn btn-info" runat="server" OnClick="Metodo_inciar_prueba" CommandArgument='<%#Eval("id_prueba")%>' />
                                    </center>
                                </div>
                            </div>
                        </div>

                    </ItemTemplate>
                </asp:ListView>
            </div>

        </div>
    </div>
    <%--</div>--%>
</asp:Content>
