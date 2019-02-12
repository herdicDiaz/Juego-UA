<%@ Page Title="Eliminar Menu" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="EliminarMenu.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.Menu_Dic.EliminarMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MapaPagina" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#form1").validate({
                rules: {

                   <%=lista_menu_padre.UniqueID%>:{
                    required: true
                }
                },
            messages: {

                 <%=lista_menu_padre.UniqueID%> : "* Seleccione un MENU"
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
                    <h5 class="card-title">Bienvenido! Seleccione El Menu a Eliminar.</h5>
                </div>
            </div>
            <div class="container" id="busquedas1" style="width: 90%; margin: 0 auto;">
                <hr />
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="lista_pruebas">Pruebas Disponibles</label>
                        <asp:DropDownList ID="lista_menu_padre" runat="server" class="form-control" AppendDataBoundItems="true">
                            <asp:ListItem Value=""> -- Seleccione un Menu -- </asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group col-md-6" style="margin-top: 29px !important;">
                        <asp:Button ID="eliminar_menu_PADRE" runat="server" CssClass="btn btn-danger" Text="Eliminar" OnClick="eliminar_menu_PADRE_Click" />
                    </div>
                </div>
                <hr />
            </div>
        </div>
    </div>
    <hr />

</asp:Content>
