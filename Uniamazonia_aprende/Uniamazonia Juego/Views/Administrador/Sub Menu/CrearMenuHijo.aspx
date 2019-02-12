<%@ Page Title="Crear Menu Hijo" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="CrearMenuHijo.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.Menu_Dic.CrearMenuHijo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MapaPagina" runat="server">
      <script type="text/javascript">
        $(document).ready(function () {
            $("#form1").validate({
                rules: {

                   <%=nombre_menu_hijo.UniqueID%>: "required",
                   <%=url_munu_hijo.UniqueID%>: "required",
                  


                   <%=lista_menu_padre.UniqueID%> :{
                    required: true
                }
                },
            messages: {

                 <%=lista_menu_padre.UniqueID%> : "* Seleccione un modulo",
                 <%=nombre_menu_hijo.UniqueID%>: "* Este campo es requerido",
                 <%=url_munu_hijo.UniqueID%>: "* Este campo es requerido"
               
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
                    <h5 class="card-title">Bienvenido! Cree un nuevo Menu Hijo.</h5>
                </div>
            </div>
            <div class="container" id="busquedas" style="width: 90%; margin: 0 auto;">
                <hr />


                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="name_modulo">Nombre Menu Hijo</label>
                        <asp:TextBox ID="nombre_menu_hijo" runat="server" type="text" class="form-control" placeholder="ingrese el nombre aqui..."></asp:TextBox>

                    </div>
                    <div class="form-group col-md-6">
                      <label for="name_modulo">Direccion URL</label>
                        <asp:TextBox ID="url_munu_hijo" runat="server" type="text" class="form-control" placeholder="/Views/..."></asp:TextBox>
                        </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="lista_icono">Seleccione el rol</label>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" runat="server" name="rd1" id="rd_admin" value="option1" required>
                            <label class="-form-check-label" for="rd_admin">
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
                     <div class="form-group col-md-6">
                       <label for="lista_menu_padre">Lista Menu Padre</label>
                        <asp:DropDownList ID="lista_menu_padre" runat="server" class="form-control" AppendDataBoundItems="true">
                            <asp:ListItem Value=""> -- Seleccione Menu Padre -- </asp:ListItem>
                        </asp:DropDownList>
                    </div>

                     </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-5">
                    </div>
                    <div class="form-group col-md-4">
                        <asp:Button ID="crear_menu_hijo" runat="server" CssClass="btn btn-primary" Text="Crear Menu Hijo" OnClick="crear_menu_hijo_Click" />
                    </div>
                </div>
                <hr />
            </div>
        </div>

</asp:Content>
