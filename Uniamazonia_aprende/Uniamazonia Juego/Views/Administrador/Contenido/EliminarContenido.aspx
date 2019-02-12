<%@ Page Title="Eliminar Cotenido" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="EliminarContenido.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.EliminarContenido" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MapaPagina" runat="server">
    <script type="text/javascript">

        $(document).ready(function () {
            $("#form1").validate({
                rules: {

                   <%=lista_contenidoss.UniqueID%>:{
                    required: true
                }
                },
            messages: {

                 <%=lista_contenidoss.UniqueID%> : "* Seleccione un contenido"
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
                    <h5 class="card-title">Bienvenido! Seleccione el Contenido a Eliminar.</h5>
                </div>
            </div>

            <div class="container" id="busquedas" style="width: 90%; margin: 0 auto;">
                <hr />
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="lista_pruebas">Modulo Disponibles</label>
                        <asp:DropDownList ID="lista_modulos" runat="server" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="lista_modulos_SelectedIndexChanged" AppendDataBoundItems="true">
                            <asp:ListItem Value=""> -- Seleccione un Modulo -- </asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="form-group col-md-6">
                        <label for="lista_pruebas">Contenido Disponibles</label>
                        <asp:DropDownList ID="lista_contenidoss" runat="server" class="form-control" AppendDataBoundItems="true">
                            <asp:ListItem Value=""> -- Seleccione un Contenido -- </asp:ListItem>
                        </asp:DropDownList>

                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                    </div>
                    <div class="form-group col-md-4">
                        <asp:Button ID="eliminar_contenido" runat="server" CssClass="btn btn-danger" Text="Eliminar" OnClick="eliminar_contenido_Click" />

                    </div>
                </div>



                <hr />

            </div>
        </div>

    </div>

</asp:Content>
