<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Puntuación.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.Puntuacion.Puntuación" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MapaPagina" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="migajaDePan" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContenidoPagina" runat="server">
    <div class="card">
        <div class="card-header text-center bg-success">
            <h3>Puntuación</h3>
        </div>
        <div class="card-body">
            <br />
            <asp:GridView ID="GridView" runat="server" AutoGenerateColumns="false" OnRowCommand="GridView_RowCommand"
                CssClass="table table-striped table-bordered table-condensed" DataKeyNames="id_puntuacion">
                <Columns>
                    <asp:BoundField DataField="id_puntuacion" HeaderText="#" ReadOnly="True" SortExpression="id_puntuacion" />
                    <asp:TemplateField HeaderText="Puntuación" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="900px">
                        <ItemTemplate>
                            <asp:Label ID="label" runat="server" Text='<%# Bind("valor_punto") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:ButtonField CommandName="editar" ControlStyle-CssClass="btn btn-success"
                        ButtonType="Button" Text="Editar"></asp:ButtonField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
