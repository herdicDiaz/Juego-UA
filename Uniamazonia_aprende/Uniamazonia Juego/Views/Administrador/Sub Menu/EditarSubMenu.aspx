<%@ Page Title="Editar Sub Menu" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="EditarSubMenu.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.Menu_Dic.EditarSubMenu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MapaPagina" runat="server">
        <script type="text/javascript">

        $(document).ready(function () {
            $("#form1").validate({
                rules: {

                   <%=lista_menu_padre_aux.UniqueID%>: "required",
                   <%=lista_menu_hijo.UniqueID%> :{
                    required: true
                }
                },
            messages: {

                 <%=lista_menu_padre_aux.UniqueID%> : "Seleccione un MENU",
                 <%=lista_menu_hijo.UniqueID%>: "Seleccione un SUB MENU"
               
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
                <li class="breadcrumb-item active" aria-current="page">Editar Sub Menu</li>
            </ol>
        </nav>
    </div>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPagina" runat="server">
          <div style="color: black !important;">
        <div id="fondo_busqueda1" style="border: 1px #84B59F dotted; background-color: white;">
            <div class="card bg-success text-white">
                <div class="card-body">
                    <h5 class="card-title">Bienvenido! Seleccione el sub Menu a editar.</h5>
                </div>
            </div>

            <div class="container" id="busquedas1" style="width: 90%; margin: 0 auto;">
                <hr />


                <div class="form-row">
                    <div class="form-group col-md-6">

                         <label for="lista_pruebas">Lista Menu: </label>
                        <asp:DropDownList ID="lista_menu_padre_aux" runat="server" class="form-control" AppendDataBoundItems="true" OnSelectedIndexChanged="actualizar_capos_padre" AutoPostBack="true">
                            <asp:ListItem Value=""> -- Seleccione Menu Padre -- </asp:ListItem>
                        </asp:DropDownList>

                        
                    </div>

                    <div class="form-group col-md-6">
                        <label for="nuevo_nombre_txt">Nuevo Nombre</label>
                        <asp:TextBox ID="nombre_menu_hijo" runat="server" type="text" class="form-control" placeholder="ingrese el nombre aqui..."></asp:TextBox>

                    </div>
                </div>
                 <div class="form-row">
                     <div class="form-group col-md-6">
                         <label for="lista_pruebas">Lista Sub Menu</label>
                        <asp:DropDownList ID="lista_menu_hijo" runat="server" class="form-control" AppendDataBoundItems="true" OnSelectedIndexChanged="actualizar_capos_hijo" AutoPostBack="true">
                            <asp:ListItem Value=""> -- Seleccione un Sub Menu -- </asp:ListItem>
                        </asp:DropDownList>

                    </div>
                     <div class="form-group col-md-6">
                        <label for="nuevo_nombre_txt">Nueva Url:</label>
                        <asp:TextBox ID="nueva_url_menu_hijo" runat="server" type="text" class="form-control" placeholder="Icono..."></asp:TextBox>

                    </div>
                </div>

         
                <div class="form-row">
                    <div class="form-group col-md-5">
                    </div>
                    <div class="form-group col-md-4">
                        <asp:Button ID="guardar_menu_HIJO" runat="server" CssClass="btn btn-info" Text="Guardar" OnClick="guardar_menu_HIJO_Click" />
                    </div>
                </div>
                <hr />
            </div>
        </div>
        </div>

</asp:Content>
