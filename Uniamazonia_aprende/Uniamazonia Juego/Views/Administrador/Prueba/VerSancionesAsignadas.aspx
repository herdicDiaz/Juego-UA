<%@ Page Title="Sanciones Asignadas" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="VerSancionesAsignadas.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.Prueba.VerSancionesAsignadas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MapaPagina" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="migajaDePan" runat="server">
    <div style="margin-left: 4px; height: 28px;">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/Views/Administrador/Welcome.aspx">Inicio</a></li>
                <li class="breadcrumb-item"><a href="#">Gestionar Prueba</a></li>
                <li class="breadcrumb-item active" aria-current="page">Ver Sanciones Asignadas<li>
            </ol>
        </nav>
    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPagina" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <%--Modal para eliminar sancion--%>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div id="deleteModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Eliminar sanción</h5>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body" id="TextoModal" runat="server">
                            <asp:HiddenField ID="hfCode" runat="server" />
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                            <asp:LinkButton ID="btnEliminar" runat="server" class="btn btn-danger" Text='Eliminar' OnClick="btnEliminar_Click" runat="server">Eliminar</asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>





    <div class="card">
        <div class="card-header text-center bg-success">
            <h3>Pruebas y sanciones</h3>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-5">
                    <asp:DropDownList ID="DropPruebas" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropConsultaGrid" AppendDataBoundItems="true">
                        <asp:ListItem Value="" Selected="True">--Seleccione una prueba--</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-5">
                    <input id="TxtBuscardor" runat="server" class="form-control" placeholder="Escribe la sancion que buscas" />
                </div>
                <div class="col-md-2 text-center">
                    <asp:Button ID="BtnBuscar" runat="server" Text="Buscar" CssClass="btn btn-success" OnClick="Buscar" />
                    <asp:Button ID="BtnLimpiar" runat="server" Text="Limpiar" class="btn btn-success" OnClick="Limpiar" />
                </div>

            </div>
            <br />
            <div>
                <div id="DivNohaysancionAsignadas" style="display: none" class="alert alert-info" runat="server"></div>
            </div>

            <div class="table-responsive">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>

                        <asp:GridView ID="TblPrueba_sanciones" runat="server" AutoGenerateColumns="false"
                            CssClass="table table-striped table-bordered table-condensed"
                            OnPageIndexChanging="Metodo_Paginacion"
                            OnRowCommand="ComandosGrid"
                            DataKeyNames="idsancion">

                            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                            <HeaderStyle ForeColor="Black" />
                            <Columns>
                                <asp:BoundField DataField="idsancion" SortExpression="idsancion" ReadOnly="True" HeaderText="#" ItemStyle-HorizontalAlign="Center" />
                                <asp:TemplateField HeaderText="Sancion asignada" ItemStyle-HorizontalAlign="Center" ControlStyle-Width="800px">
                                    <ItemTemplate>
                                        <asp:Label ID="LabelDescripcion" runat="server" Text='<%# Bind("descripcion") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:ButtonField Text="Quitar" ButtonType="Button" CommandName="Quitar">
                                    <ControlStyle CssClass="btn btn-danger"></ControlStyle>
                                </asp:ButtonField>
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>


        </div>
    </div>
    <script type="text/javascript">
<%--        $(document).ready(function () {
            $("#form1").validate({
                rules: {
                    <%=TxtBuscardor.UniqueID%>: {
                        required: true
                    },
                },
                messages: {
                <%=TxtBuscardor.UniqueID%>: "Este campo es requerido"
            }

            });
        });--%>

</script>
</asp:Content>
