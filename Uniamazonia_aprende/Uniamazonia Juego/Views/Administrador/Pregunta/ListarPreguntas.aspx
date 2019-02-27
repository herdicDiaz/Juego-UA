<%@ Page Title="Listar Pregunta" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="ListarPreguntas.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.Pregunta.ListarPreguntas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContenidoPagina" runat="server">
    <br />
    <div id="deleteModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Eliminar Pregunta</h5>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    ¿Está seguro que desea eliminar la pregunta?
                              <asp:HiddenField ID="hfCode" runat="server" />
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <asp:LinkButton ID="btnEliminar" runat="server" class="btn btn-danger" Text='Eliminar' OnClick="btnEliminar_Click" runat="server">Eliminar</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>


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
                <div class="row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:GridView ID="Tabla_Preguntas" AutoGenerateColumns="False" runat="server"
                                        OnPageIndexChanging="Metodo_Paginacion" DataKeyNames="id_pregunta"
                                        OnRowCommand="eventos_grid"
                                        CssClass="table table-striped table-bordered table-condensed">
                                        <%--<RowStyle BackColor="White" ForeColor="#003399" />--%>
                                        <Columns>
                                            <asp:BoundField DataField="id_pregunta" HeaderText="#" ReadOnly="True" SortExpression="id_pregunta" />
                                            <asp:TemplateField HeaderText="Pregunta" SortExpression="nombre_pregunta" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("nombre_pregunta") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Calificación" SortExpression="calificacion" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="Labelcalificacion" runat="server" Text='<%# Bind("calificacion") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Respuesta A" SortExpression="respuesta_a" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("respuesta_a") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Respuesta B" SortExpression="respuesta_b" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("respuesta_b") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Respuesta C" SortExpression="respuesta_c" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("respuesta_c") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Respuesta D" SortExpression="respuesta_d" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("respuesta_d") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Respuesta correcta" SortExpression="respuesta_correcta" ItemStyle-HorizontalAlign="Center">
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
                        </div>

                        <div class="row justify-content-end">
                            <asp:ImageButton runat="server" ID="imageButton" ImageUrl="~/Images/icon-pdf.png" Width="50px" Height="50px" OnClick="imageButton_Click" />
                        </div>
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

