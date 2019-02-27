<%@ Page Title="Eliminar Prueba" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="EliminarPrueba.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.EliminarPrueba" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MapaPagina" runat="server">
    <script type="text/javascript">

        $(document).ready(function () {
            $("#form1").validate({
                rules: {

                   <%=lista_pruebas.UniqueID%>:{
                    required: true

                }
                },
            messages: {

                 <%=lista_pruebas.UniqueID%> : "* Seleccione una prueba"
               
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
                <li class="breadcrumb-item"><a href="#">Gestionar Prueba</a></li>
                <li class="breadcrumb-item active" aria-current="page">Eliminar Prueba<li>
            </ol>
        </nav>
    </div>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPagina" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div style="color: black !important;">
        <div id="fondo_busqueda" style="border: 1px #84B59F dotted; background-color: white;">
            <div class="card bg-success text-white">
                <div class="card-body">
                    <h5 class="card-title">Bienvenido! Seleccione la prueba a Eliminar.</h5>
                </div>
            </div>

            <div class="container" id="busquedas" style="width: 90%; margin: 0 auto;">
                <hr />
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="lista_pruebas">Modulos Disponibles</label>
                                <asp:DropDownList ID="lista_modulos" runat="server" AutoPostBack="true" OnSelectedIndexChanged="listo_modulos_SelectedIndexChanged" class="form-control" AppendDataBoundItems="true">
                                    <asp:ListItem Value=""> -- Seleccione un Modulo-- </asp:ListItem>
                                </asp:DropDownList>

                            </div>

                            <div class="form-group col-md-6">
                                <label for="lista_pruebas">Contenido Disponibles</label>
                                <asp:DropDownList ID="lista_contenido" runat="server" AutoPostBack="true" OnSelectedIndexChanged="lista_contenido_SelectedIndexChanged" class="form-control" AppendDataBoundItems="true">
                                    <asp:ListItem Value=""> -- Seleccione un Contenido -- </asp:ListItem>
                                </asp:DropDownList>

                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="lista_pruebas">Pruebas Disponibles</label>
                                <asp:DropDownList ID="lista_pruebas" runat="server" class="form-control" AppendDataBoundItems="true">
                                    <asp:ListItem Value=""> -- Seleccione una prueba -- </asp:ListItem>
                                </asp:DropDownList>
                            </div>




                        </div>


                    </ContentTemplate>
                </asp:UpdatePanel>

                <div class="form-row">
                    <div class="form-group col-md-6">
                    </div>
                    <div class="form-group col-md-6">


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
