<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="AsignarSancion.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.Prueba.AsignarSancion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MapaPagina" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPagina" runat="server">
    <div class="card">
        <div class="card-header text-center bg-success">
            <h3>Asingación de sancion a prueba</h3>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-12">
                    <asp:DropDownList ID="DropPruebas" AppendDataBoundItems="true" runat="server" CssClass="form-control">
                        <asp:ListItem Value="0">--Seleccione una prueba--</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <br />
            <div class="col-md-12">
                <asp:GridView runat="server" ID="Tbl_sanciones" AutoGenerateColumns="False"
                    OnPageIndexChanging="Metodo_Paginacion" DataKeyNames="idsancion"
                    CssClass="table table-striped table-bordered table-condensed" OnRowCommand="EventosGrid">

                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <HeaderStyle CssClass="bg-light" ForeColor="Black" />

                    <Columns>
                        <asp:BoundField DataField="idsancion" HeaderText="#" ReadOnly="True" SortExpression="idsancion" />
                        <asp:TemplateField HeaderText="Descripcion" SortExpression="descripcion">
                            <EditItemTemplate>
                                <asp:TextBox ID="TxtDescripcion" runat="server" Text='<%# Bind("descripcion") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LabelDescripcion" runat="server" Text='<%# Bind("descripcion") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Url video" SortExpression="url_video">
                            <EditItemTemplate>
                                <asp:TextBox ID="TxtUrl_Video" runat="server" Text='<%# Bind("url_video") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LabelUrl_Video" runat="server" Text='<%# Bind("url_video") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Estado" SortExpression="estado_sancion">
                            <EditItemTemplate>
                                <asp:TextBox ID="TxtEstado" runat="server" Text='<%# Bind("estado_sancion") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="LabelEstado" runat="server" Text='<%# Bind("estado_sancion") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:ButtonField CommandName="Agregar" ControlStyle-CssClass="btn btn-info"
                            ButtonType="Button" Text="Agregar">
                            <ControlStyle CssClass="btn btn-info"></ControlStyle>
                        </asp:ButtonField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>

    </div>
</asp:Content>
