<%@ Page Title="Listar Pregunta" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="ListarPreguntas.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.Pregunta.ListarPreguntas" %>

<asp:Content ID="Content3" ContentPlaceHolderID="migajaDePan" runat="server">
    <div style="margin-left: 4px; height: 28px;">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/Views/Administrador/Welcome.aspx">Inicio</a></li>
                <li class="breadcrumb-item"><a href="#">Preguntas y Respuestas</a></li>
                <li class="breadcrumb-item active" aria-current="page">Listar Pregunta<li>
            </ol>
        </nav>
    </div>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContenidoPagina" runat="server">
    <br />
    <div class="container-fluid">

        <div class="card">
            <div class="card-header bg-success text-center">
                <h3>Consultar preguntas y respuestas</h3>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-10">
                        <asp:TextBox class="form-control" ID="Txt_busqueda" type="text" placeholder="Buscar una pregunta" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-1">
                        <button type="submit" runat="server" class="btn btn-success" onserverclick="BuscarEnGrid">Buscar</button>
                    </div>
                    <div class="col-md-1">
                        <button type="submit" runat="server" class="btn btn-success" onserverclick="limpiarGrid">Limpiar</button>
                    </div>
                </div>

                <%--tabla--%>
                <br />
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <div class="col-md-12">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="Tabla_Preguntas" AutoGenerateColumns="False" runat="server"
                                OnPageIndexChanging="Metodo_Paginacion" DataKeyNames="id_pregunta"
                                OnRowCommand="eventos_grid"
                                CssClass="table table-striped table-bordered table-condensed">
                                <%--<RowStyle BackColor="White" ForeColor="#003399" />--%>
                                <Columns>
                                    <asp:BoundField DataField="id_pregunta" HeaderText="#" ReadOnly="True" SortExpression="id_pregunta" />
                                    <asp:TemplateField HeaderText="Nombre" SortExpression="nombre_pregunta">

                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("nombre_pregunta") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Estado" SortExpression="estado_pregunta">

                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("estado_pregunta") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Calificación" SortExpression="calificacion">

                                        <ItemTemplate>
                                            <asp:Label ID="Labelcalificacion" runat="server" Text='<%# Bind("calificacion") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Respuesta A" SortExpression="respuesta_a">

                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("respuesta_a") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Respuesta B" SortExpression="respuesta_b">

                                        <ItemTemplate>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("respuesta_b") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Respuesta C" SortExpression="respuesta_c">

                                        <ItemTemplate>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("respuesta_c") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Respuesta D" SortExpression="respuesta_d">

                                        <ItemTemplate>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("respuesta_d") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Respuesta correcta" SortExpression="respuesta_correcta">

                                        <ItemTemplate>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("respuesta_correcta") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                    <asp:ButtonField CommandName="editar" ControlStyle-CssClass="btn btn-info"
                                        ButtonType="Button" Text="Editar"></asp:ButtonField>

                                    <asp:ButtonField CommandName="eliminar"
                                        ButtonType="Button" Text="Eliminar">
                                        <ControlStyle CssClass="btn btn-danger"></ControlStyle>
                                    </asp:ButtonField>

                                </Columns>
                                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                <HeaderStyle CssClass="bg-light" ForeColor="Black" />
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <div class="row justify-content-end">
                        <asp:ImageButton runat="server" ID="imageButton" ImageUrl="~/Images/icon-pdf.png" Width="50px" Height="50px" OnClick="imageButton_Click" />
                    </div>
                </div>

            </div>
        </div>
    </div>
    <br />
    <script type="text/javascript">
        function successalert() {
            swal({
                title: 'Registro exitoso!',
                text: '¡Que bien!',
                type: 'success'
            });
        }

        function denegadoAlert(msg) {
            swal({
                title: 'Elimiación de pregunta!',
                text: msg,
                type: 'error',
                showCancelButton: true,
            },
                function (isConfirm) {
                    if (isConfirm) {
                        swal("Deleted!", "Your imaginary file has been deleted.", "success");
                    } else {
                        swal("Cancelled", "Your imaginary file is safe :)", "error");
                    }
                });

        }
    </script>
</asp:Content>

