<%@ Page Title="Ranking" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Ranking.aspx.cs" Inherits="Uniamazonia_Juego.Views.VistasJugador.Ranking.Ranking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MapaPagina" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="migajaDePan" runat="server">
    <div style="margin-left: 4px; height: 28px;">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/Views/Administrador/Welcome.aspx"><span class="mdi mdi-home"></span>&nbsp;Inicio</a></li>
                <li class="breadcrumb-item"><a href="#">Ranking</a></li>
                <li class="breadcrumb-item active" aria-current="page">Ver Ranking</li>
            </ol>
        </nav>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPagina" runat="server">
    <div class="card">
        <div class="card-header text-center bg-success">
            <h3>Ranking</h3>
        </div>

        <div class="card-body">
            <div class="col-md-12">
                <asp:GridView ID="GridViewRanking" runat="server" AutoGenerateColumns="false"
                    CssClass="table table-striped table-bordered table-condensed"
                    >
                    <Columns>
                        <asp:TemplateField HeaderText="Primer nombre" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label id="Label_Primer_Nombre" runat="server" Text='<%#Bind("nombre_1")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Primer apellido" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="Label_Primer_Apellido" runat="server" Text='<%#Bind("apellido_1")%>' ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Segungo apellido" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="Label_Segundo_Apellido" runat="server" Text='<%#Bind("apellido_2")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Puntaje" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="Label_Puntaje" runat="server" Text='<%#Bind("puntaje_acomulado") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
