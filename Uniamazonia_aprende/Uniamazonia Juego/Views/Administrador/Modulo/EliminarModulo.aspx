<%@ Page Title="Eliminar Modulo" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="EliminarModulo.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.EliminarModulo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MapaPagina" runat="server">
    <script type="text/javascript">

        $(document).ready(function () {
            $("#form1").validate({
                rules: {

                   <%=lista_modulos.UniqueID%>:{
                    required: true
                }
                },
            messages: {

                 <%=lista_modulos.UniqueID%> : "* Seleccione un modulo"
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
                    <h5 class="card-title">Bienvenido! Seleccione el Modulo a Eliminar.</h5>
                </div>
            </div>

            <div class="container" id="busquedas" style="width: 90%; margin: 0 auto;">
                <hr />
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="lista_pruebas">Modulos Disponibles</label>
                        <asp:DropDownList ID="lista_modulos" runat="server" class="form-control" AppendDataBoundItems="true">
                            <asp:ListItem Value=""> -- Seleccione un Modulo -- </asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group col-md-6" style="margin-top: 29px !important;">
                        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteModal">Eliminar</button>
                    
                    
                    </div>
                </div>
                <hr />

            </div>
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
                    ¿Está seguro que desea eliminar el Modulo?
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
