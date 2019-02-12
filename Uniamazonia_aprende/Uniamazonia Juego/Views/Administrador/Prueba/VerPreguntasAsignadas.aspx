<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="VerPreguntasAsignadas.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.Prueba.VerPreguntasAsignadas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MapaPagina" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPagina" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="card">
        <div class="card-header text-center bg-success">
            <h3>Pruebas y preguntas</h3>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-5">
                    <asp:DropDownList ID="DropNombrePruebas" runat="server" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="BindGridView_SeleccionPrueba" CssClass="form-control">
                        <asp:ListItem Value="" Selected="True">--Selecciona una prueba--</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-5">
                    <input id="TxtBuscar" runat="server" placeholder="Escribe la pregunta que buscas" class="form-control" />
                </div>
                <div class="col-md-1">
                    <asp:Button ID="BtnBuscar" runat="server" Text="Buscar" OnClick="buscarPregunta" CssClass="btn btn-success" />
                </div>

                <div class="col-md-1">
                    <asp:Button ID="BtnLimpiar" Text="Limpiar" runat="server" OnClick="BtnLimpiarConsultas" CssClass="btn btn-success" />
                </div>
            </div>
            <br />
            <div>
                <div id="DivNohaypreguntas" runat="server" class="alert alert-info" style="display: block"></div>
            </div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="col-md-12">
                        <asp:GridView ID="Tabla_Preguntas" AutoGenerateColumns="False" runat="server"
                            OnPageIndexChanging="Metodo_Paginacion"
                            OnRowCommand="EventosGrid"
                            DataKeyNames="id_pregunta"
                            CssClass="table table-striped table-bordered table-condensed">

                            <%--Estilos--%>
                            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                            <HeaderStyle CssClass="bg-light" ForeColor="Black" />

                            <Columns>
                                <asp:BoundField DataField="id_pregunta" ItemStyle-HorizontalAlign="Center" HeaderText="#" ReadOnly="True" />
                                <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-BorderColor="White" HeaderText="Nombre" ControlStyle-Width="800px">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("nombre_pregunta") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:ButtonField ButtonType="Button" Text="Quitar" CommandName="Quitar">
                                    <ControlStyle CssClass="btn btn-danger"></ControlStyle>
                                </asp:ButtonField>

                            </Columns>
                        </asp:GridView>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>

        </div>
    </div>

    <script type="text/javascript">
</script>
</asp:Content>
