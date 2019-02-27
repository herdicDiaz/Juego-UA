<%@ Page Title="Crear Menu" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="CrearMenuPadre.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.Menu_Dic.CrearMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MapaPagina" runat="server">
    
        <script type="text/javascript">
        $(document).ready(function () {
            $("#form1").validate({
                rules: {

                   <%=nombre_menu_padre.UniqueID%>: "required",
                   <%=lista_icono.UniqueID%> :{
                    required: true
                }
                },
            messages: {

                 <%=lista_icono.UniqueID%> : "* Seleccione un modulo",
                 <%=nombre_menu_padre.UniqueID%>: "* Este campo es requerido"
               
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
                <li class="breadcrumb-item"><a href="#">Gestionar Menu</a></li>
                <li class="breadcrumb-item active" aria-current="page">Crear Menu Padre</li>
            </ol>
        </nav>
    </div>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPagina" runat="server">

    <div style="color: black !important;">
        <div id="fondo_busqueda" style="border: 1px #84B59F dotted; background-color: white;">
            <div class="card bg-success text-white">
                <div class="card-body">
                    <h5 class="card-title">Bienvenido! Cree un nuevo Menu Padre.</h5>
                </div>
            </div>
            <div class="container" id="busquedas" style="width: 90%; margin: 0 auto;">
                <hr />
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="name_modulo">Nombre Menu Padre</label>
                        <asp:TextBox ID="nombre_menu_padre" runat="server" type="text" class="form-control" placeholder="ingrese el nombre aqui..."></asp:TextBox>

                    </div>
                    <div class="form-group col-md-6">

                        <label for="lista_icono">Iconos Disponibles</label>
                        <asp:DropDownList ID="lista_icono" runat="server" class="form-control" AppendDataBoundItems="true">
                            <asp:ListItem Value=""> -- Seleccione un Icono -- </asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="lista_icono">Roles Disponibles</label>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" runat="server" name="rd1" id="rd_admin" value="option1" required>
                            <label class="form-check-label" for="rd_admin">
                                Administrador
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" runat="server" name="rd1" id="rd_jugador" value="option1" required>
                            <label class="form-check-label" for="rd_jugador" >
                               Jugador
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-5">
                    </div>
                    <div class="form-group col-md-4">
                        <asp:Button ID="crear_menu" runat="server" CssClass="btn btn-primary" Text="Crear Menu Padre" OnClick="crear_menu_Click" />
                    </div>
                </div>
                <hr />
            </div>
        </div>
    </div>




</asp:Content>
