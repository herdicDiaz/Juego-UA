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
    <hr />
    <hr />

    <div style="color: black !important;">
        <div id="fondo_busqueda" style="border: 1px #84B59F dotted; background-color: white;">
            <div class="card bg-success text-white">
                <div class="card-body">
                    <h5 class="card-title">Nosotros.</h5>
                </div>
            </div>
            <div class="container" id="busquedas" style="width: 90%; margin: 0 auto;">
                <hr />


                <div class="card-deck">
                    <div class="card" style="max-width: 990px; border:none !important;">

                    </div>

                    <div class="card">
                        <img src="../../../Images/profesor.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Heriberto Fernando Vargas Losada</h5>
                            <p class="card-text">Docente de la universidad de la Amazonia</p>
                        </div>
                        <div class="card-footer">
                            <small class="text-muted">Última actualización hace 3 minutos</small>
                        </div>
                    </div>

                    <div class="card" style="max-width: 990px; border:none !important;">

                    </div>
                </div>
                <hr />
                <hr />

                <div class="card-deck">
                    <div class="card" style="max-width: 350px";>
                        <img src="../../../Images/estudiantes.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Herdic Munevar Diaz</h5>
                            <p class="card-text">Estudiante de ingenieria de sistemas</p>
                        </div>
                        <div class="card-footer">
                            <small class="text-muted">Última actualización hace 3 minutos</small>
                        </div>
                    </div>

                    <div class="card" style="max-width: 150px; border:none !important";>

                    </div>

                    <div class="card" style="max-width: 350px";>
                        <img src="../../../Images/estudiantes.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Cristian Tisoy Hurtado</h5>
                            <p class="card-text">Estudiante de ingenieria de sistemas</p>
                        </div>
                        <div class="card-footer">
                            <small class="text-muted">Última actualización hace 3 minutos</small>
                        </div>
                    </div>
                </div>











                <hr />
            </div>
        </div>
    </div>

</asp:Content>


