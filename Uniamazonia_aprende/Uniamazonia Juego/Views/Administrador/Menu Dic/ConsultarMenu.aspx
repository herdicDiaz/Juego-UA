<%@ Page Title="Consultar Menu" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="ConsultarMenu.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.Menu_Dic.ConsultarMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MapaPagina" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#form1").validate({
                rules: {

                   <%=filtro_menu_hijo.UniqueID%>: "required"
                },
                messages: {

                 <%=filtro_menu_hijo.UniqueID%> : "* Este campo es requerido"
               
            }

            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="migajaDePan" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div style="margin-left: 4px; height: 28px;">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/Views/Administrador/Welcome.aspx"><span class="mdi mdi-home"></span>&nbsp;Inicio</a></li>
                <li class="breadcrumb-item"><a href="#">Gestionar Menu</a></li>
                <li class="breadcrumb-item active" aria-current="page">Consultar Menu</li>
            </ol>
        </nav>
    </div>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPagina" runat="server">


    <div style="color: black !important;">
        <div id="fondo_busqueda" style="border: 1px #84B59F dotted; background-color: white;">

            <div class="card bg-success text-white">
                <div class="card-body">
                    <h5 class="card-title">Lista De Todas Las Menu de Apreder.+</h5>
                </div>
            </div>
            <div id="busquedas" class="container" style="width: 90%; margin: 0 auto;">
                <hr />

                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="lista_icono">Seleccione el rol</label>
                                <div class="form-check">
                                    <asp:RadioButton ID="rd_admin" class="form-check-input" OnCheckedChanged="rd_admin_CheckedChanged" AutoPostBack="true" GroupName="rd1" runat="server" />

                                    <label class="-form-check-label" for="rd_admin">
                                        Administrador
                                    </label>
                                </div>
                                <div class="form-check">

                                    <asp:RadioButton ID="rd_jugador" OnCheckedChanged="rd_jugador_CheckedChanged" AutoPostBack="true" class="form-check-input" GroupName="rd1" runat="server" />

                                    <label class="form-check-label" for="rd_jugador">
                                        Jugador
                                    </label>

                                </div>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="lista_menu_padre">Lista Menu Padre</label>
                                <asp:DropDownList ID="lista_menu_padre" runat="server" class="form-control" OnSelectedIndexChanged="mostrar_menu_hijo" AutoPostBack="true" AppendDataBoundItems="true">
                                    <asp:ListItem Value=""> -- Seleccione Menu Padre -- </asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <hr />
                                    <div class="input-group">
                                        <asp:TextBox ID="filtro_menu_hijo" runat="server" class="form-control" type="text" placeholder="&#128270; Buscar.."></asp:TextBox>

                                        <asp:LinkButton ID="traer_menu_hijo" runat="server" class="btn btn-success" OnClick="traer_menu_hijo_Click"><i class="fa fa-search"></i>   Filtro</asp:LinkButton>
                                        <br>
                                    </div>
                                </div>
                            </div>
                            <hr />
                            <div id="tabla_unica" class="table-responsive">
                                <hr />

                                <asp:GridView ID="lista_menu_hijo" runat="server"
                                    AllowPaging="true" AutoGenerateColumns="false"
                                    OnPageIndexChanging="OnPageIndexChanging" CssClass="table table-striped" border="0" PageSize="7">
                                    <PagerStyle CssClass="current-page" />
                                    <Columns>
                                        <asp:BoundField ItemStyle-Width="7%" ItemStyle-CssClass="unico_position" DataField="id_vista" HeaderText="Codigo" ReadOnly="true" SortExpression="id_vista" />
                                        <asp:BoundField ItemStyle-Width="20%" ItemStyle-CssClass="unico_design" DataField="descripcion" HeaderText="Nombre Menu Hijo" ReadOnly="true" SortExpression="descripcion" />
                                        <asp:BoundField ItemStyle-Width="56%" ItemStyle-CssClass="unico_position" DataField="url" HeaderText="Direccion Url" ReadOnly="true" SortExpression="url" />
                                        <asp:BoundField ItemStyle-Width="15%" ItemStyle-CssClass="unico_position" DataField="icono" HeaderText="Icono" ReadOnly="true" SortExpression="icono" />
                                        <asp:BoundField ItemStyle-Width="12%" ItemStyle-CssClass="unico_position" DataField="estado" HeaderText="Estado" ReadOnly="true" SortExpression="estado" />
                                    </Columns>
                                    <PagerSettings Mode="NumericFirstLast" PageButtonCount="4" FirstPageText="Primero" LastPageText="Ultimo" />
                                    <PagerStyle CssClass="pagination-lg" HorizontalAlign="Center" />
                                </asp:GridView>


                            </div>



                            <hr />
                    </ContentTemplate>
                </asp:UpdatePanel>


            </div>
        </div>
        <hr />
    </div>








</asp:Content>
