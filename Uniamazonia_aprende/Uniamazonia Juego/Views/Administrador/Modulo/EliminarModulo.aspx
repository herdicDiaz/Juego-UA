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

        function funcionJS() {
            //alert("holaa");
            swal({
                title: "Esta Seguro?",
                text: "No podra recuperar el archivo una vez eliminado!",
                type: "warning",
                showCancelButton: true,
                confirmButtonClass: "btn-danger",
                confirmButtonText: "Si, Eliminar!",
                cancelButtonText: "No, Cacelar!",
                closeOnConfirm: false,
                closeOnCancel: false
            }, function (isConfirm) {
                if (isConfirm) {
                    swal("Deleted!", "Su archivo ha sido eliminado", "success");
                } else {
                    swal("Cancelled", "No eliminado", "error");
                }
            });
        }



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

                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-danger" OnClientClick="funcionJS();" Text="Eliminar" OnClick="Button1_Click" />

                    </div>
                </div>
                <hr />

            </div>
        </div>

    </div>


</asp:Content>
