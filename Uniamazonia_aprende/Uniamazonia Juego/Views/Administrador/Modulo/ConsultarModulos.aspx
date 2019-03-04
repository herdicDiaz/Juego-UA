<%@ Page Title="Consultar Modulos" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="ConsultarModulos.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.ConsultarModulos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MapaPagina" runat="server">


    <!--   <script type="text/javascript">
        $(document).ready(function () {
            $("#form1").validate({
                rules: {

                   <%=filtro_prueba.UniqueID%>: "required"
                },
            messages: {

                 <%=filtro_prueba.UniqueID%> : "* Ingrese el nombre del modulo"
                }
                });
        });
    </script> -->


</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="migajaDePan" runat="server">
    <div style="margin-left: 4px; height: 28px;">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/Views/Administrador/Welcome.aspx"><span class="mdi mdi-home"></span>&nbsp;Inicio</a></li>
                <li class="breadcrumb-item"><a href="#">Gestionar Modulos</a></li>
                <li class="breadcrumb-item active" aria-current="page">Consultar Modulo<li>
            </ol>
        </nav>
    </div>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPagina" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


    <div style="color: black !important;">
        <div id="fondo_busqueda" style="border: 1px #84B59F dotted; background-color: white;">

            <div class="card bg-success text-white">
                <div class="card-body">
                    <h5 class="card-title">Lista De Todas Los Modulos en Apreder.+</h5>
                </div>
            </div>

            <div id="busquedas" style="width: 90%; margin: 0 auto;">
                <hr />

               


                        <div class="row">
                            <div class="col-md-11">
                                <asp:TextBox ID="filtro_prueba" runat="server" class="form-control is-invalid" type="text" placeholder="&#128270; Buscar.." required></asp:TextBox>
                            </div>
                            <div class="col-md-1">
                                <asp:Button ID="buscar_modulo" runat="server" class="btn btn-success" OnClick="buscar_modulo_Click" Text="Filtrar" />
                            </div>

                            <br>
                            <%--</div>--%>
                        </div>
                        <hr />
                        <div id="tabla_unica" class="table-responsive">
                             <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>

                            <asp:GridView ID="lista_filtro_modulo" runat="server"
                                AllowPaging="true" AutoGenerateColumns="false"
                                OnPageIndexChanging="OnPageIndexChanging" CssClass="table table-striped" border="0" PageSize="7">
                                <PagerStyle CssClass="current-page" />
                                <Columns>
                                    <asp:BoundField ItemStyle-Width="7%" ItemStyle-CssClass="unico_position" DataField="id_modulo" HeaderText="Codigo" ReadOnly="true" SortExpression="id_modulo" />
                                    <asp:BoundField ItemStyle-Width="150px" ItemStyle-HorizontalAlign="center" DataField="nombre_modulo" HeaderText="Nombre Modulo" ReadOnly="true" SortExpression="nombre_modulo" />
                                    <asp:BoundField ItemStyle-Width="8%" DataField="estado_modulo" HeaderText="Estado" ReadOnly="true" SortExpression="estado_modulo" />
                                </Columns>
                                <PagerSettings Mode="NumericFirstLast" PageButtonCount="4" FirstPageText="Primero" LastPageText="Ultimo" />
                                <PagerStyle CssClass="pagination-lg" HorizontalAlign="Center" />
                            </asp:GridView>



                    </ContentTemplate>
                </asp:UpdatePanel>

            </div>
                   <div class="row justify-content-end">
                            <asp:ImageButton runat="server" ID="imageButton" ImageUrl="~/Images/icon-pdf.png" Width="50px" Height="50px" OnClick="imageButton_Click" />
                        </div>
            <hr />

        </div>
        <hr />
    </div>





</asp:Content>
