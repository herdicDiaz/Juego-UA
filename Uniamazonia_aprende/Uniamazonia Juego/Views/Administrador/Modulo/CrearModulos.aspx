<%@ Page Title="Crear Modulo" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="CrearModulos.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.GestionarModulos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MapaPagina" runat="server">
    <script type="text/javascript">

        //$(document).ready(function () {
        //    $("[id*='cargar_img']").change(
        //        function () {
        //            $("[id*='subir']").click();

        //        }
        //    );
        //});


        $(document).ready(function () {
            $("#form1").validate({
                rules: {
                   <%=name_modulo.UniqueID%>: "required"
                },
                messages: {

                 <%=name_modulo.UniqueID%> : "* Este campo es obligatorio"
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
                <li class="breadcrumb-item"><a href="#">Gestionar Modulos</a></li>
                <li class="breadcrumb-item active" aria-current="page">
                Crear Modulos<li>
            </ol>
        </nav>
    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPagina" runat="server">

    <div style="color: black !important;">
        <div id="fondo_busqueda" style="border: 1px #84B59F dotted; background-color: white;">
            <div class="card bg-success text-white">
                <div class="card-body">
                    <h5 class="card-title">Bienvenido! Cree un nuevo modulo.</h5>
                </div>
            </div>

            <div class="container" id="busquedas" style="width: 90%; margin: 0 auto;">
                <hr />



                        <div class="form-row">

                            <div class="form-group col-md-6">
                                <label for="name_modulo">Nombre Modulo</label>
                                <asp:TextBox ID="name_modulo" runat="server" type="text" class="form-control" placeholder="ingrese el nombre aqui..."></asp:TextBox>

                            </div>
                            <div class="form-group col-md-6">
                                <label for="inputState">Selecciones Una Imagen</label>
                                <div class="custom-file">
                                    <!-- subir imagen -->

                                    <asp:FileUpload ID="cargar_img" class="form-control" runat="server" />
                                    <asp:Button ID="subir" runat="server" Text="subir" hidden="" OnClick="subir_Click" />


                                </div>
                            </div>
                            <div class="form-group col-md-0">
                            </div>

                        </div>

                   

                <div class="form-row">
                    <div class="form-group col-md-5">
                    </div>
                    <div class="form-group col-md-4">
                        <asp:Button ID="crear_modulo" runat="server" CssClass="btn btn-success" Text="Crear Modulo" OnClick="crear_modulo_Click1" />
                    </div>
                </div>


                <hr />
            </div>
        </div>
    </div>



</asp:Content>
