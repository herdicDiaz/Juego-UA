<%@ Page Title="Consultar Contenido" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="ConsultarContenido.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.ConsultarContenido" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MapaPagina" runat="server">

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
                <div class="form-row">
                    <div class="form-group col-md-6">

                        <label for="lista_menu_padre">Lista Modulos</label>
                        <asp:DropDownList ID="lista_modulo" runat="server" class="form-control" OnSelectedIndexChanged="lista_modulo_SelectedIndexChanged" AutoPostBack="true" AppendDataBoundItems="true">
                            <asp:ListItem Value=""> -- Seleccione un Modulo -- </asp:ListItem>
                        </asp:DropDownList>

                    </div>
                    <div class="form-group col-md-6">

                        <label for="lista_menu_padre">Filtro</label>
                        <div class="input-group">
                            <asp:TextBox ID="filtro_contenido" class="form-control is-invalid" runat="server" type="text" placeholder="&#128270; Buscar.." required></asp:TextBox>
                            <asp:Button ID="buscar_contenido" runat="server" Text="Filtrar" class="btn btn-success" OnClick="buscar_contenido_Click1" />
                        </div>


                    </div>
                </div>
                <hr />
                <div id="tabla_unica" class="table-responsive">

                    <asp:GridView ID="lista_filtro_contenido" runat="server"
                        AllowPaging="true" AutoGenerateColumns="false"
                        OnPageIndexChanging="OnPageIndexChanging" CssClass="table table-striped" border="0" PageSize="7">
                        <PagerStyle CssClass="current-page" />

                        <Columns>
                            <asp:BoundField ItemStyle-Width="7%" ItemStyle-CssClass="unico_position" DataField="id_contenido" HeaderText="Codigo" ReadOnly="true" SortExpression="id_contenido" />
                            <asp:BoundField ItemStyle-Width="150px" ItemStyle-CssClass="unico_design" DataField="nombre_contenido" HeaderText="Nombre Contenido" ReadOnly="true" SortExpression="nombre_contenido" />
                            <asp:BoundField ItemStyle-Width="150px" ItemStyle-CssClass="unico_design" DataField="descripcion_contenido" HeaderText="Descipcion" ReadOnly="true" SortExpression="descripcion_contenido" />
                            <asp:BoundField ItemStyle-Width="8%" ItemStyle-CssClass="unico_position" DataField="estado_contenido" HeaderText="Estado" ReadOnly="true" SortExpression="estado_contenido" />
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























    <%--    <div style="color: black !important;">
        <div id="fondo_busqueda" style="width: 60%; border: 1px #84B59F dotted;">

            <hr />

            <div id="busquedas" style="width: 90%; margin: 0 auto;">
                <hr />
                <div class="input-group">

                    <input class="form-control" id="myInput" type="text" placeholder="Buscar..">
                    <br>
                </div>

                <hr />
                <br />
                <asp:Repeater ID="tabla_modulos" runat="server">
                    <HeaderTemplate>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th style="text-align: center;"><strong>Codigo</strong></th>
                                    <th style="text-align: center;"><strong>Nombre Contenido</strong></th>
                                    <th style="text-align: center;"><strong>Url Imagen</strong></th>
                                    <th style="text-align: center;"><strong>Estado</strong></th>
                                    
                                </tr>
                            </thead>
                            <tbody id="myTable">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%#Eval("id_contenido")%></td>
                            <td><%#Eval("nombre_contenido")%></td>
                            <td><%#Eval("url_img_contenido")%></td>
                            <td><%#Eval("estado_contenido")%></td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </tbody>
        </table>
                    </FooterTemplate>
                </asp:Repeater>

                <hr />

            </div>
            <hr />
        </div>
    </div>

    --%>


    <script>  
        $(document).ready(function () {
            $("#myInput").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#myTable tr").filter(function () {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    </script>




</asp:Content>
