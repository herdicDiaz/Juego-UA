<%@ Page Title="Editar Prueba" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="EditarPrueba.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.EditarPrueba" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MapaPagina" runat="server">

    <script type="text/javascript">

        $(document).ready(function () {
            $("#form1").validate({
                rules: {

                   <%=lista_pruebas.UniqueID%>: "required",
                   <%=nuevo_nombre_txt.UniqueID%> :{
                    required: true
                },
                },
            messages: {

                 <%=lista_pruebas.UniqueID%> : "Seleccione una prueba",
                 <%=nuevo_nombre_txt.UniqueID%>: "Este campo es requerido"
               
            }

            });
        });


    </script>




</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="migajaDePan" runat="server">
    <div style="margin-left: 4px; height: 28px;">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/Views/Administrador/Welcome.aspx">Inicio</a></li>
                <li class="breadcrumb-item"><a href="#">Gestionar Prueba</a></li>
                <li class="breadcrumb-item active" aria-current="page">Editar Pregunta<li>
            </ol>
        </nav>
    </div>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPagina" runat="server">

    <div style="color: black !important;">
        <div id="fondo_busqueda" style="border: 1px #84B59F dotted; background-color: white;">
            <div class="card bg-success text-white">
                <div class="card-body">
                    <h5 class="card-title">Bienvenido! Seleccione la prueba a editar.</h5>
                </div>
            </div>

            <div class="container" id="busquedas" style="width: 90%; margin: 0 auto;">
                <hr />
                <div class="form-row">

                    <div class="form-group col-md-6">

                        <label for="lista_pruebas">Pruebas Disponibles</label>
                        <asp:DropDownList ID="lista_pruebas" runat="server" class="form-control" AppendDataBoundItems="true">
                            <asp:ListItem Value=""> -- Seleccione una prueba -- </asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="form-group col-md-6">
                        <label for="nuevo_nombre_txt">Nuevo Nombre Prueba</label>
                        <asp:TextBox ID="nuevo_nombre_txt" runat="server" type="text" class="form-control" placeholder="ingrese el nombre aqui..."></asp:TextBox>

                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                    </div>

                <%--    <div class="form-group col-md-4">
                        <label for="numero_preguntas">Numero de Preguntas</label>
                        <asp:DropDownList ID="numero_preguntas" runat="server" class="form-control" AppendDataBoundItems="true">
                            <asp:ListItem Value=""> -- Escoger -- </asp:ListItem>
                        </asp:DropDownList>
                    </div>--%>
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
