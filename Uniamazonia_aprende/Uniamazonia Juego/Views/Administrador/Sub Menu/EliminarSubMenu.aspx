<%@ Page Title="Eliminar Sub Menu" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="EliminarSubMenu.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.Sub_Menu.EliminarSubMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MapaPagina" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#form1").validate({
                rules: {
                   <%=menu_padre_aux.UniqueID%>:{
                    required: true
                },
                <%=lista_menu_hijo.UniqueID%>: {
                    required: true
                }

                },
            messages: {

                 <%=menu_padre_aux.UniqueID%> : "* Seleccione un MENU",
                 <%=lista_menu_hijo.UniqueID%> : "* Seleccione un SUB MENU"
               
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
                <li class="breadcrumb-item"><a href="#">Gestionar Sub Menu</a></li>
                <li class="breadcrumb-item active" aria-current="page">Eliminar Sub Menu</li>
            </ol>
        </nav>
    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPagina" runat="server">
    <div style="color: black !important;">
        <div id="fondo_busqueda1" style="border: 1px #84B59F dotted; background-color: white;">
            <div class="card bg-success text-white">
                <div class="card-body">
                    <h5 class="card-title">Bienvenido! Seleccione El Sub Menu a Eliminar.</h5>
                </div>
            </div>
            <div class="container" id="busquedas" style="width: 90%; margin: 0 auto;">
                <hr />
                <div class="form-row">

                    <div class="form-group col-md-6">
                        <label for="lista_pruebas">Lista MENU</label>
                        <asp:DropDownList ID="menu_padre_aux" runat="server" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="menu_padre_aux_SelectedIndexChanged" AppendDataBoundItems="true">
                            <asp:ListItem Value=""> -- Seleccione un Menu -- </asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="name_modulo">Nombre Menu</label>
                        <asp:TextBox ID="nombre_menu_padre" runat="server" type="text" class="form-control" placeholder="nombre seleccionado..."></asp:TextBox>

                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="lista_pruebas">Lista SUB MENU</label>
                        <asp:DropDownList ID="lista_menu_hijo" runat="server" class="form-control" AppendDataBoundItems="true">
                            <asp:ListItem Value=""> -- Seleccione un Sub Menu -- </asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-5">
                    </div>
                    <div class="form-group col-md-6">
                         <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteModal">Eliminar</button>
                    </div>
                </div>
            </div>
            <hr />
        </div>
    </div>
       <!-- Delete Record Modal Starts here-->
    <div id="deleteModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Eliminar Pregunta</h5>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    ¿Está seguro que desea eliminar el Contenido?
                              <asp:HiddenField ID="hfCode" runat="server" />
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <asp:LinkButton ID="btnEliminar" runat="server" class="btn btn-danger" Text='Eliminar' OnClick="btnEliminar_Click" runat="server">Eliminar</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
    <!--Delete Record Modal Ends here -->
</asp:Content>
