<%@ Page Title="Consultar Pruebas" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="ConsultarPrueba.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.ConsultarPrueba" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MapaPagina" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPagina" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


    <div style="color: black !important;">
        <div id="fondo_busqueda" style="border: 1px #84B59F dotted; background-color: white;">

            <div class="card bg-success text-white">
                <div class="card-body">
                    <h5 class="card-title">Lista De Todas Las Pruebas de Apreder.+</h5>
                </div>
            </div>

            <div id="busquedas" style="width: 90%; margin: 0 auto;">
                <hr />
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="lista_menu_padre">Lista Modulos</label>
                        <asp:DropDownList ID="lista_modulo" runat="server" class="form-control" OnSelectedIndexChanged="lista_modulo_SelectedIndexChanged" AutoPostBack="true" AppendDataBoundItems="true">
                            <asp:ListItem Value=""> -- Seleccione Modulo -- </asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="lista_menu_padre">Lista Contenidos
                            <asp:Label ID="contenido_actual" runat="server" Text=""></asp:Label></label>
                        <asp:DropDownList ID="lista_contenido" runat="server" class="form-control" OnSelectedIndexChanged="lista_contenido_SelectedIndexChanged" AutoPostBack="true" AppendDataBoundItems="true">
                            <asp:ListItem Value=""> -- Seleccione Contenido -- </asp:ListItem>
                        </asp:DropDownList>

                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <div class="input-group">
                            <asp:TextBox ID="filtro_prueba" runat="server" class="form-control is-invalid" type="text" placeholder="&#128270; Buscar.." required></asp:TextBox>
                            <asp:Button ID="buscar_pruebas" runat="server" class="btn btn-success" OnClick="buscar_pruebas_Click" Text="Filtrar" />
                            <br>
                        </div>
                    </div>
                </div>

                <hr />
                <div id="tabla_unica" class="table-responsive">



                            <asp:GridView ID="lista_filtro_pruebas" runat="server"
                                AllowPaging="true" AutoGenerateColumns="false"
                                OnPageIndexChanging="OnPageIndexChanging" CssClass="table table-striped" border="0" PageSize="7">
                                <PagerStyle CssClass="current-page" />

                                <Columns>
                                    <asp:BoundField ItemStyle-Width="7%" ItemStyle-CssClass="unico_position" DataField="id_prueba" HeaderText="Codigo" ReadOnly="true" SortExpression="id_prueba" />
                                    <asp:BoundField ItemStyle-Width="150px" ItemStyle-HorizontalAlign="Center" DataField="nombre_prueba" HeaderText="Nombre Prueba" ReadOnly="true" SortExpression="nombre_prueba" />
                                    <%--<asp:BoundField ItemStyle-Width="15%" ItemStyle-CssClass="unico_position" DataField="numero_preguntas" HeaderText="Numero Preguntas" ReadOnly="true" SortExpression="numero_preguntas" />--%>
                                    <asp:BoundField ItemStyle-Width="8%" ItemStyle-CssClass="unico_position" DataField="estado_prueba" HeaderText="Estado" ReadOnly="true" SortExpression="estado_prueba" />
                                    <asp:BoundField ItemStyle-Width="12%" ItemStyle-CssClass="unico_position" DataField="fk_contenido" HeaderText="Fk Contenido" ReadOnly="true" SortExpression="fk_contenido" />
                                </Columns>
                                <PagerSettings Mode="NumericFirstLast" PageButtonCount="4" FirstPageText="Primero" LastPageText="Ultimo" />
                                <PagerStyle CssClass="pagination-lg" HorizontalAlign="Center" />
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>


                </div>
                <hr />

            </div>
            <asp:ImageButton runat="server" ID="imgenButton" ImageUrl="~/Images/icon-pdf.png" OnClick="imgenButton_Click" Width="50px" Height="50px" />
            <hr />
        </div>
    </div>


</asp:Content>
