<%@ Page Title="Welcome" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.Welcome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MapaPagina" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPagina" runat="server">

    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">

        <ol class="carousel-indicators" runat="server" id="numero_carusel">
            <!-- desde la base de datos-->
        </ol>
        <div class="carousel-inner" runat="server" id="carusel_unico">
            <!-- desde la base de datos-->
        </div>

        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

</asp:Content>


