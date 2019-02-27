<%@ Page Title="Editar Modulo" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="EditarModulo.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.EditarModulo" %>

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

                   <%=lista_modulos.UniqueID%>: "required",
                   <%=cargar_img.UniqueID%>: "required",
                   <%=nuevo_nombre_txt.UniqueID%> :{
                    required: true
                }
                },
            messages: {

                 <%=lista_modulos.UniqueID%> : "* Seleccione un modulo",
                 <%=nuevo_nombre_txt.UniqueID%>: "* Este campo es requerido",
                 <%=cargar_img.UniqueID%>: "* Seleccione un Imagen"
               
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
                <li class="breadcrumb-item active" aria-current="page">Editar Modulos<li>
            </ol>
        </nav>
    </div>
</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPagina" runat="server">



    <div style="color: black !important;">
        <div id="fondo_busqueda" style="border: 1px #84B59F dotted; background-color: white;">
            <div class="card bg-success text-white">
                <div class="card-body">
                    <h5 class="card-title">Bienvenido! Seleccione el modulo a editar.</h5>
                </div>
            </div>




            <div class="container" id="busquedas" style="width: 90%; margin: 0 auto;">
                <hr />
                <div class="form-row">

                    <div class="form-group col-md-6">

                        <label for="lista_modulos">Modulos Disponibles</label>
                        <asp:DropDownList ID="lista_modulos" runat="server" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="lista_modulos_SelectedIndexChanged" AppendDataBoundItems="true">
                            <asp:ListItem Value=""> -- Seleccione un Modulo -- </asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="form-group col-md-6">
                        <label for="nuevo_nombre_txt">Nuevo Nombre Modulo</label>
                        <asp:TextBox ID="nuevo_nombre_txt" runat="server" type="text" class="form-control" placeholder="ingrese el nombre aqui..."></asp:TextBox>

                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                    </div>

                    <div class="form-group col-md-5">
                        <label for="inputState">Selecciones Una Imagen</label>
                        <div class="custom-file">
                            <!-- Actualizar imagen -->
                            <asp:FileUpload ID="cargar_img" class="form-control" runat="server" />
                            <asp:Button ID="subir" runat="server" Text="subir" hidden="" OnClick="subir_Click" />



                        </div>
                    </div>
                </div>


                <div class="form-row">
                    <div class="form-group col-md-5">
                    </div>
                    <div class="form-group col-md-4">
                        <asp:Button ID="guadar_edicion" runat="server" CssClass="btn btn-info" Text="Guardar" OnClick="guadar_edicion_Click" />
                    </div>


                </div>


                <hr />

            </div>
        </div>

    </div>

</asp:Content>
