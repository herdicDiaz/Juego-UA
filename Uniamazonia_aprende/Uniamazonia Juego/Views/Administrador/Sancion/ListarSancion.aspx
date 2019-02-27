<%@ Page Title="Lista Sanciones" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="ListarSancion.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.Sancion.ListarSancion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContenidoPagina" runat="server">

    <%--Modal para eliminar sancion--%>
    <div id="deleteModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Eliminar sanción</h5>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    ¿Está seguro que desea eliminar la sanción?
                              <asp:HiddenField ID="hfCode" runat="server" />
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <asp:LinkButton ID="btnEliminar" runat="server" class="btn btn-danger" Text='Eliminar' OnClick="btnEliminar_Click" runat="server">Eliminar</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>


    <%--Modal para cargara el video--%>
    <asp:ScriptManager runat="server" ID="ScriptManager1" />
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div id="xx" runat="server">
                <div class="modal fade" id="Modalvideo" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="editModalLabel">Sanción </h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <iframe width="760" id="cargaVideo" runat="server" height="480" src="" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Cerar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <br />




        <div class="card">
            <div class="card-header bg-success text-center">
                <h3>Lista de sanciones</h3>
            </div>
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
                        <br />

                 <div class="table-responsive">
      <asp:UpdatePanel ID="upCrudGrid" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="ListarSanciones" AutoGenerateColumns="False" BackColor="White" runat="server" DataKeyNames="idsancion"
                                CssClass="table table-striped table-bordered table-condensed" OnRowCommand="eventosGrid"
                                OnPageIndexChanging="Metodo_Paginacion">
                                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                <HeaderStyle CssClass="bg-light" ForeColor="Black" />

                                <Columns>
                                    <asp:BoundField DataField="idsancion" HeaderText="#" ReadOnly="True" SortExpression="idsancion" />
                                    <asp:TemplateField HeaderText="Descripción" ItemStyle-HorizontalAlign="Center" ControlStyle-Width="200px">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("descripcion") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Url" ItemStyle-HorizontalAlign="Center" ControlStyle-Width="300px">
                                        <ItemTemplate>
                                            <asp:Label ID="labelUrl" runat="server" Text='<%# Bind("url_video") %>'></asp:Label>
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
                       
                </ContentTemplate>
            </asp:UpdatePanel>
                 </div>
           
        </div>
    </div>
    <div class="row justify-content-end">
        <asp:ImageButton runat="server" ID="imageButton" ImageUrl="~/Images/icon-pdf.png" Width="50px" Height="50px" OnClick="imageButton_Click" />
    </div>
    <script type="text/javascript">
        function successalert() {
            swal({
                title: 'Registro exitoso!',
                text: '¡Que bien!',
                type: 'success'
            });
        }

        var TxtBuscarSancio = document.getElementById("Txt_buscar_sancion");

    </script>
</asp:Content>

