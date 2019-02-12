<%@ Page Title="Lista sanciones" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="ListarSancion.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.Sancion.ListarSancion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContenidoPagina" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptManager1" />
    <div id="xx" runat="server">
        <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editModalLabel">Sanción </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <iframe width="460" id="cargaVideo" runat="server" height="480" src="https://www.youtube.com/embed/wnJ6LuUFpMo?list=RDxpVfcZ0ZcFM" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br />
    <div class="col-md-12">
        <div class="card">
            <div class="card-header bg-success text-center">
                <h3>Lista de sanciones</h3>
            </div>
            <asp:UpdatePanel ID="upCrudGrid" runat="server">
                <ContentTemplate>
                    <div class="card-body">
                        <label>Buscar sanción</label>
                        <div class="row">
                            <div class="col-md-10">
                                <input type="text" class="form-control" placeholder="Nombre de una sancion." id="Txt_buscar_sancion" runat="server" required title="cdcdc" />
                            </div>
                            <div class="col-md-1">
                                <button id="BtnBuscar" class="btn btn-success" onserverclick="buscarSancion" runat="server" type="submit">Buscar</button>
                            </div>
                            <div class="col-md-1">
                                <button id="BtnLimpiar" type="submit" onserverclick="limpiarGrid" class="btn btn-success" runat="server">Limpiar</button>
                            </div>
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="Txt_buscar_sancion"
                            ErrorMessage="Este campo es requerido."
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>
                        <br />
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server"></asp:UpdatePanel>
                        <asp:GridView ID="ListarSanciones" AutoGenerateColumns="False" BackColor="White" runat="server" DataKeyNames="idsancion"
                            CssClass="table table-striped table-bordered table-condensed" OnRowCommand="eventosGrid"
                            OnPageIndexChanging="Metodo_Paginacion">
                            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                            <HeaderStyle CssClass="bg-light" ForeColor="Black" />

                            <Columns>
                                <asp:BoundField DataField="idsancion" HeaderText="#" ReadOnly="True" SortExpression="idsancion" />
                                <asp:TemplateField HeaderText="Descripción"  ItemStyle-HorizontalAlign="Center" ControlStyle-Width="200px">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("descripcion") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Url"  ItemStyle-HorizontalAlign="Center" ControlStyle-Width="300px">
                                    <ItemTemplate>
                                        <asp:Label ID="labelUrl" runat="server" Text='<%# Bind("url_video") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Estado" ItemStyle-HorizontalAlign="Center" ControlStyle-Width="120px">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("estado_sancion") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:ButtonField CommandName="editar" ButtonType="Button" Text="Editar">
                                    <ControlStyle CssClass="btn btn-info"></ControlStyle>
                                </asp:ButtonField>
                                <asp:ButtonField CommandName="eliminar" ButtonType="Button" Text="Eliminar">
                                    <ControlStyle CssClass="btn btn-danger"></ControlStyle>
                                </asp:ButtonField>
                                <asp:ButtonField CommandName="verSancion" ButtonType="Button" Text="Ver sanción">
                                    <ControlStyle CssClass="btn btn-success"></ControlStyle>
                                </asp:ButtonField>
                            </Columns>

                        </asp:GridView>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
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
                closeOnConfirm: false
            },
                function (isConfirm) {
                    if (isConfirm) {
                        swal({
                            title: "Eliminado",
                            text: "Eliminaste el registro del proyecto.",
                            type: "success"
                        });
                        //swal("Deleted!", "Your imaginary file has been deleted.", "success");
                    } else {
                        swal("Cancelled", "Your imaginary file is safe :)", "error");
                    }
                });

        }

        var TxtBuscarSancio = document.getElementById("Txt_buscar_sancion");

    </script>
</asp:Content>

