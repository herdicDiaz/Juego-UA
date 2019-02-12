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




<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPagina" runat="server">

    <div style="color: black !important;">
        <div id="fondo_busqueda" style="border: 1px #84B59F dotted; background-color: white;">

            <div class="card bg-success text-white">
                <div class="card-body">
                    <h5 class="card-title">Lista De Todas Los Modulos en Apreder.+</h5>
                </div>
            </div>

            <div id="busquedas" style="width: 90%; margin: 0 auto;">
                <hr />


                <div class="input-group" style="width: 55% !important;">
                    <asp:TextBox ID="filtro_prueba" runat="server" class="form-control is-invalid" type="text" placeholder="&#128270; Buscar.." required ></asp:TextBox>
                    <asp:Button ID="buscar_modulo" runat="server" class="btn btn-success" OnClick="buscar_modulo_Click" Text="Filtrar" />
                    <br>
                </div>
                <hr />
                <div id="tabla_unica" class="table-responsive">
                    <asp:GridView ID="lista_filtro_modulo" runat="server"
                        AllowPaging="true" AutoGenerateColumns="false"
                        OnPageIndexChanging="OnPageIndexChanging" CssClass="table table-striped" border="0" PageSize="7">
                        <PagerStyle CssClass="current-page" />

                        <Columns>
                            <asp:BoundField ItemStyle-Width="7%" ItemStyle-CssClass="unico_position" DataField="id_modulo" HeaderText="Codigo" ReadOnly="true" SortExpression="id_modulo" />
                            <asp:BoundField ItemStyle-Width="150px" ItemStyle-CssClass="unico_design" DataField="nombre_modulo" HeaderText="Nombre Modulo" ReadOnly="true" SortExpression="nombre_modulo" />
                            <asp:BoundField ItemStyle-Width="8%" ItemStyle-CssClass="unico_position" DataField="estado_modulo" HeaderText="Estado" ReadOnly="true" SortExpression="estado_modulo" />
                        </Columns>
                        <PagerSettings Mode="NumericFirstLast" PageButtonCount="4" FirstPageText="Primero" LastPageText="Ultimo" />
                        <PagerStyle CssClass="pagination-lg" HorizontalAlign="Center" />
                    </asp:GridView>
                </div>
                <hr />

            </div>
            <hr />
        </div>
    </div>





</asp:Content>
