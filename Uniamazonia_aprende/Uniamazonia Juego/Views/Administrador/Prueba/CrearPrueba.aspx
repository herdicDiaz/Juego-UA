<%@ Page Title="Crear Prueba" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="CrearPrueba.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.CrearPrueba" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MapaPagina" runat="server">

<%--    <script src="/Content/assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="/Content/Bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="/Content/Bootstrap/JQuery/dist/jquery.validate.js"></script>--%>


    <script type="text/javascript">

        $(document).ready(function () {
            $("#form1").validate({
                rules: {

                   <%=name_prueba.UniqueID%>: "required",
                   <%=lista_contenidoss.UniqueID%> :{
                    required: true
                }



        },
            messages: {

                 <%=lista_contenidoss.UniqueID%> : "Seleccione un contenido",
                 <%=name_prueba.UniqueID%>: "Este campo es requerido"
               
            }

            });
        });

    </script>


</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPagina" runat="server">

    <div style="color: black !important;">
        <div id="fondo_busqueda" style="border: 1px #84B59F dotted; background-color: white;">
            <div class="card bg-success text-white">
                <div class="card-body">
                    <h5 class="card-title">Bienvenido! Cree una prueba nueva para el jugador.</h5>
                </div>
            </div>

            <div class="container" id="busquedas" style="width: 90%; margin: 0 auto;">
                <hr />
                <div class="form-row">

                    <div class="form-group col-md-6">
                        <label for="name_prueba">Nombre Prueba</label>
                        <asp:TextBox ID="name_prueba" runat="server" type="text" class="form-control" placeholder="ingrese el nombre aqui..."></asp:TextBox>

                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputState">Contenidos Disponibles</label>

                        <asp:DropDownList ID="lista_contenidoss" runat="server" class="form-control" AppendDataBoundItems="true">
                            <asp:ListItem Value=""> -- Seleccionar Contenido -- </asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-row">

<%--                    <div class="form-group col-md-4">
                        <label for="inputZip">Numero de Preguntas</label>
                        <asp:DropDownList ID="numero_preguntas" runat="server" class="form-control" AppendDataBoundItems="true">
                            <asp:ListItem Value=""> -- Escoger -- </asp:ListItem>
                        </asp:DropDownList>
                    </div>--%>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-5">
                    </div>
                    <div class="form-group col-md-4">
                        <asp:Button ID="crear_prueba" runat="server" CssClass="btn btn-primary" Text="Crear Prueba" OnClick="crear_prueba_Click" />
                    </div>


                </div>


                <hr />

            </div>
        </div>

    </div>

</asp:Content>
