<%@ Page Title="Crear Cotenido" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="CrearContenido.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.CrearContenido" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MapaPagina" runat="server">
        <script type="text/javascript">

        $(document).ready(function () {
            $("#form1").validate({
                rules: {

                   <%=nombre_content.UniqueID%>: "required",
                   <%=descr_contenido.UniqueID%> :{
                    required: true
                },
                <%=lista_modulos.UniqueID%>: {
                    required: true
                }
                },
            messages: {

                 <%=nombre_content.UniqueID%> : "* Este Campo es requerido",
                 <%=descr_contenido.UniqueID%>: "* Este Campo es requerido",
                 <%=lista_modulos.UniqueID%>: "Seleccione un Modulo"
               
            }

            });
        });

    </script>





</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="migajaDePan" runat="server">
    <div style="margin-left: 4px; height: 28px;">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/Views/Administrador/Welcome.aspx"><span class="mdi mdi-home"></span>&nbsp;Inicio</a></li>
                <li class="breadcrumb-item"><a href="#">Gestionar Contenido</a></li>
                <li class="breadcrumb-item active" aria-current="page">Crear Contenido</li>
            </ol>
        </nav>
    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPagina" runat="server">


        <div style="color: black !important;">
            <div id="fondo_busqueda" style="border: 1px #84B59F dotted; background-color: white;">
                <div class="card bg-success text-white">
                    <div class="card-body">
                        <h5 class="card-title">Bienvenido! Cree un nuevo Contenido.</h5>
                    </div>
                </div>

                <div class="container" id="busquedas" style="width: 90%; margin: 0 auto;">
                    <hr />
                    <div class="form-row">

                        <div class="form-group col-md-6">
                            <label for="nombre_content">Nombre Contenido</label>
                            <asp:TextBox ID="nombre_content" runat="server" type="text" class="form-control" placeholder="ingrese el nombre aqui..."></asp:TextBox>

                        </div>
                        <div class="form-group col-md-6">

                            <label for="inputState">Seleccione Una Imagen</label>
                            <div class="custom-file">

                                <!-- subir foto -->
                            <asp:FileUpload ID="cargar_img" class="form-control" runat="server" />
                            </div>

                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="exampleFormControlTextarea1">Descripcion Contenido</label>
                            <textarea class="form-control" id="descr_contenido" rows="3" runat="server" ></textarea>
                        </div>
                        <div class="form-group col-md-6">

                        <label for="lista_modulos">Modulos Disponibles</label>
                        <asp:DropDownList ID="lista_modulos" runat="server" class="form-control" AppendDataBoundItems="true">
                            <asp:ListItem Value=""> -- Seleccione un Modulo -- </asp:ListItem>
                        </asp:DropDownList>


                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-5">
                        </div>
                        <div class="form-group col-md-4">
                            <asp:Button ID="crear_contenido" runat="server" CssClass="btn btn-success" Text="Crear Contenido" OnClick="crear_contenido_Click"  />
                        </div>
                    </div>
                    <hr />
                </div>
            </div>
        </div>

    </asp:Content>
