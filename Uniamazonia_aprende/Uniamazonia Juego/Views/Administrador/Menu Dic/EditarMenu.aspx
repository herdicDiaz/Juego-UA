<%@ Page Title="Editar Menu" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="EditarMenu.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.Menu_Dic.EditarMenu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MapaPagina" runat="server">
            <script type="text/javascript">

        $(document).ready(function () {
            $("#form1").validate({
                rules: {

                   <%=lista_menu_padre.UniqueID%>: "required"

                },
            messages: {

                 <%=lista_menu_padre.UniqueID%> : "* Seleccione un MENU"
               
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
                <li class="breadcrumb-item"><a href="#">Gestionar Menu</a></li>
                <li class="breadcrumb-item active" aria-current="page">Editar Menu</li>
            </ol>
        </nav>
    </div>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPagina" runat="server">
     <!--EDITAR MENU PADRE  -->
        <div style="color: black !important;">
        <div id="fondo_busqueda" style="border: 1px #84B59F dotted; background-color: white;">
            <div class="card bg-success text-white">
                <div class="card-body">
                    <h5 class="card-title">Bienvenido! Seleccione el MENU a editar.</h5>
                </div>
            </div>

            <div class="container" id="busquedas" style="width: 90%; margin: 0 auto;">
                <hr />


                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="lista_pruebas">Lista Menu:</label>
                        <asp:DropDownList ID="lista_menu_padre" runat="server" class="form-control" AppendDataBoundItems="true" OnSelectedIndexChanged="actualizar_capos_padre" AutoPostBack="true">
                            <asp:ListItem Value=""> -- Seleccione Menu Padre -- </asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="form-group col-md-6">
                        <label for="nuevo_nombre_txt">Nuevo Nombre</label>
                        <asp:TextBox ID="nuevo_nombre_menu_padre" runat="server" type="text" class="form-control" placeholder="ingrese el nombre aqui..."></asp:TextBox>

                    </div>
                </div>
                 <div class="form-row">
                     <div class="form-group col-md-6">
                    </div>
                     <div class="form-group col-md-6">
                        <label for="nuevo_nombre_txt">Icono Actual</label>
                        <asp:TextBox ID="icono_actual" runat="server" type="text" class="form-control" placeholder="Icono..."></asp:TextBox>

                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                    </div>
                    <div class="form-group col-md-4">
                        <label for="numero_preguntas">Lista Iconos</label>
                        <asp:DropDownList ID="lista_iconos_menu_padre" runat="server" class="form-control" AppendDataBoundItems="true">
                            <asp:ListItem Value=""> -- Seleccione un Icono -- </asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-5">
                    </div>
                    <div class="form-group col-md-4">
                        <asp:Button ID="guadar_menu_PADRE" runat="server" CssClass="btn btn-info" Text="Guardar" OnClick="guadar_menu_PADRE_Click" />
                    </div>
                </div>
                <hr />
            </div>
        </div>
        </div>
    <hr />
</asp:Content>
