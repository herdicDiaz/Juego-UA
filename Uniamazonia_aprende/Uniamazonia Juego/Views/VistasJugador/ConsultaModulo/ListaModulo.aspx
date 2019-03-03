<%@ Page Title="Lista Modulos" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="ListaModulo.aspx.cs" Inherits="Uniamazonia_Juego.Views.VistasJugador.ListaModulo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MapaPagina" runat="server">
    <script language="C#" runat="server">
    </script>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="migajaDePan" runat="server">
    <div style="margin-left: 4px; height: 28px;">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/Views/Administrador/Welcome.aspx"><span class="mdi mdi-home"></span>&nbsp;Inicio</a></li>
                <li class="breadcrumb-item"><a href="#">Modulos</a></li>
                <li class="breadcrumb-item active" aria-current="page">Ver Modulos</li>
            </ol>
        </nav>
    </div>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPagina" runat="server">
    <div class="card">
        <div class="card-header text-center bg-success">
            <h3>Listado módulos</h3>
        </div>
        <div class="card-body">
            <div class="row">
                <%--<div class="col-md-2">--%>
                <asp:ListView ID="listView1" runat="server">
                    <ItemTemplate>
                        <div class="col-md-4">
                            <div class="card border-info mb-3" style="width: 18rem;">
                                <img id="img1" src=<%#Eval("irl_img_modelo") %> class="card-img-top" width="245" height="260">
                                <div class="card-body">
                                    <h4 class="card-title"><%#Eval("nombre_modulo")%></h4>
                                    <center>
                                    <asp:Button OnClick="btnVerContenidos" ID="btnVerContenidos" runat="server" CommandArgument='<%#Eval("id_modulo")%>' Text="Ver contenidos" CssClass="btn btn-info" />
                                    </center>
                                </div>
                            </div>
                        </div>

                    </ItemTemplate>
                </asp:ListView>
                <%--</div>--%>
            </div>

        </div>
    </div>
    <%--    <div class="galleta-header" style="background-color: #00adbf;">
        <div class="galleta-header-border" style="border-color: #2e6f94;">
            <h2 style="text-align: center; font-size: 20px; color: #ffffff; margin-top: 6px; margin-bottom: 9px;">MODULOS</h2>
        </div>
    </div>--%>

    <script type="text/javascript">
</script>
</asp:Content>
