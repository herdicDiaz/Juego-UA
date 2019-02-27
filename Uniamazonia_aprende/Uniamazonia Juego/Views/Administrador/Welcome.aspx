<%@ Page Title="Welcome" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.Welcome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MapaPagina" runat="server">
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="migajaDePan" runat="server">
    <div style="margin-left: 4px; height: 28px;">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item active" aria-current="page"><span class="mdi mdi-home"></span>&nbsp;Inicio</li>
            </ol>
        </nav>
    </div>
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
                <div class="container-fluid">
                    <div class="row el-element-overlay">
                        <div class="col-lg-4 col-md-6">
                            <div class="card">
                                <div class="el-card-item">
                                    <div class="el-card-avatar el-overlay-1">
                                        <img src="../../Images/docente.jpg" alt="user" />
                                        <div class="el-overlay">
                                            <ul class="list-style-none el-info">
                                                <li class="el-item"><a class="btn default btn-outline image-popup-vertical-fit el-link" href="../../Images/docente.jpg"><i class="mdi mdi-magnify-plus"></i></a></li>
                                                <li class="el-item"><a class="btn default btn-outline el-link" href="javascript:void(0);"><i class="mdi mdi-link"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="card-body">
                                            <h5 class="card-title">DOCENTE</h5>
                                            <p class="card-text">Docente de la universidad de la amazonia</p>
                                        </div>
                                        <div class="card-footer">
                                            <small class="text-muted">Última actualización hace 3 minutos</small>
                                        </div>

                                    </div>
                                    <div class="el-card-content">
                                        <h4 class="m-b-0">Heriberto Fernando Vargas Losada</h4>
                                        <span class="text-muted">DOCENTE</span>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6">
                            <div class="card">
                                <div class="el-card-item">
                                    <div class="el-card-avatar el-overlay-1">

                                        <img src="../../Images/estudiante.jpg" alt="user" />
                                        <div class="el-overlay">
                                            <ul class="list-style-none el-info">
                                                <li class="el-item"><a class="btn default btn-outline image-popup-vertical-fit el-link" href="../../Images/estudiante.jpg"><i class="mdi mdi-magnify-plus"></i></a></li>
                                                <li class="el-item"><a class="btn default btn-outline el-link" href="javascript:void(0);"><i class="mdi mdi-link"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="card-body">
                                            <h5 class="card-title">ESTUDIANTE</h5>
                                            <p class="card-text">Estudiante de ingenieria de sistemas</p>
                                        </div>
                                        <div class="card-footer">
                                            <small class="text-muted">Última actualización hace 3 minutos</small>
                                        </div>

                                    </div>
                                    <div class="el-card-content">
                                        <h4 class="m-b-0">Cristian Tisoy Hurtado</h4>
                                        <span class="text-muted">ESTUDIANTE</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="card">
                                <div class="el-card-item">
                                    <div class="el-card-avatar el-overlay-1">
                                        <img src="../../Images/estudiante1.jpg" alt="user" />
                                        <div class="el-overlay">
                                            <ul class="list-style-none el-info">
                                                <li class="el-item"><a class="btn default btn-outline image-popup-vertical-fit el-link" href="../../Images/estudiante1.jpg"><i class="mdi mdi-magnify-plus"></i></a></li>
                                                <li class="el-item"><a class="btn default btn-outline el-link" href="javascript:void(0);"><i class="mdi mdi-link"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="card-body">
                                            <h5 class="card-title">ESTUDIANTE</h5>
                                            <p class="card-text">Estudiante de ingenieria de sistemas</p>
                                        </div>
                                        <div class="card-footer">
                                            <small class="text-muted">Última actualización hace 3 minutos</small>
                                        </div>

                                    </div>
                                    <div class="el-card-content">
                                        <h4 class="m-b-0">Herdic Munevar Diaz</h4>
                                        <span class="text-muted">ESTUDIANTE</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>








            </div>
            <hr />
            <hr />
        </div>
    </div>











</asp:Content>


