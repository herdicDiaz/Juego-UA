<%@ Page Title="Editar Contenido" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="EditarContenido.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.EditarContenido" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MapaPagina" runat="server">
    <script type="text/javascript">

        $(document).ready(function () {
            $("#form1").validate({
                rules: {

                   <%=nuevo_nombre_txt.UniqueID%>: "required",
                   <%=descr_contenido.UniqueID%> :{
                    required: true
                },
                <%=lista_contenido.UniqueID%>: {
                    required: true
                }
                },
            messages: {

                 <%=nuevo_nombre_txt.UniqueID%> : "* Este Campo es requerido",
                 <%=descr_contenido.UniqueID%>: "* Este Campo es requerido",
                 <%=lista_contenido.UniqueID%>: "Seleccione un Modulo"
               
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
                <li class="breadcrumb-item"><a href="#">Gestionar Contenido</a></li>
                <li class="breadcrumb-item active" aria-current="page">Editar Contenido</li>
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
                    <h5 class="card-title">Bienvenido! Actulizacion de contenidos.</h5>
                </div>
            </div>

            <div class="container" id="busquedas" style="width: 90%; margin: 0 auto;">
                <hr />




                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="lista_contenido">Contenido Disponibles</label>
                                <asp:DropDownList ID="lista_contenido" runat="server" AutoPostBack="true" OnSelectedIndexChanged="lista_contenido_SelectedIndexChanged" class="form-control" AppendDataBoundItems="true">
                                    <asp:ListItem Value=""> -- Seleccione un Contenido -- </asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="form-group col-md-6">
                                <label for="nombre_content">Nombre Contenido</label>
                                <asp:TextBox ID="nuevo_nombre_txt" runat="server" type="text" class="form-control" placeholder="ingrese el nombre aqui..."></asp:TextBox>

                            </div>
                        </div>


                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="exampleFormControlTextarea1">Descripcion Contenido</label>
                                <textarea class="form-control" id="descr_contenido" rows="3" runat="server"></textarea>
                            </div>


                            <div class="form-group col-md-6">
                                <label for="inputState">Seleccione Una Imagen</label>
                                <div class="custom-file">
                                    <!-- sibir foto -->
                                    <asp:FileUpload ID="cargar_img" class="form-control" runat="server" />
                                </div>
                            </div>




                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="form-row">
                    <div class="form-group col-md-6">
                    </div>
                    <div class="form-group col-md-4">
                        <asp:Button ID="guadar_edicion" runat="server" CssClass="btn btn-primary" Text="Guardar" OnClick="guadar_edicion_Click" />
                    </div>
                </div>


                <hr />






            </div>
        </div>
    </div>


</asp:Content>
