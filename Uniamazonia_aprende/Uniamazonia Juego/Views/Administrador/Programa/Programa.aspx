<%@ Page Title="Programa" Language="C#" MasterPageFile="~/Principal.Master"   AutoEventWireup="true" CodeBehind="Programa.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.Programa.Programa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MapaPagina" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="migajaDePan" runat="server">
    <div style="margin-left: 4px; height: 28px;">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/Views/Administrador/Welcome.aspx">Inicio</a></li>
                <li class="breadcrumb-item"><a href="#">Gestionar Tablas Basicas</a></li>
                <li class="breadcrumb-item active" aria-current="page">Gestionar Programas<li>
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
                    <h5 class="card-title">Bienvenido! Cree un nuevo Programa.</h5>
                </div>
            </div>
            <div class="container" id="busquedas" style="width: 90%; margin: 0 auto;">
                <hr />

                <div class="form-row">
                    <div class="form-group col-md-10">
                        <label for="nombre_content">Nombre Programa</label>
                        <asp:TextBox ID="nombre_programa" runat="server" type="text" class="form-control" placeholder="ingrese el nombre aqui..."></asp:TextBox>

                    </div>
                    <div class="form-group col-md-2">
                        <asp:Button ID="crear_programa" data-target="#recuperar" Style="margin-top: 29px;" runat="server" CssClass="btn btn-success" Text="Crear Programa" OnClick="crear_programa_Click" />
                    </div>
                </div>


                <hr />
                <div class="col-md-12">



                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>


                    <asp:GridView ID="Tabla_programas" AutoGenerateColumns="False" runat="server"
                        OnPageIndexChanging="Metodo_Paginacion" DataKeyNames="id_programa"
                        PageSize="10" AllowPaging="true"
                        CssClass="table table-striped table-bordered table-condensed" 

                        OnRowCancelingEdit="RowCancelEditEvent"


                        OnRowDeleting="RowDeleting" OnRowEditing="RowEditing" OnRowUpdating="RowUpdating">


                        <RowStyle BackColor="White" ForeColor="#003399" />
                        <Columns>
                            <asp:BoundField DataField="id_programa" HeaderText="#" ReadOnly="True" SortExpression="id_programa" />

                            <asp:TemplateField HeaderText="Nombre" SortExpression="nombre_programa" ItemStyle-HorizontalAlign="Center">
                                <EditItemTemplate>
                                    <asp:TextBox ID="nombre_programa" runat="server" Text='<%# Bind("nombre_programa") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("nombre_programa") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:CommandField  ButtonType="Button"   ShowEditButton="true"  ShowDeleteButton="true" ControlStyle-CssClass="edit-sprite">
                             
                            </asp:CommandField>
                        </Columns>
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <HeaderStyle CssClass="bg-light" />
                    </asp:GridView>

                        </ContentTemplate>
                    </asp:UpdatePanel>


                </div>



            </div>
            <hr />
            <hr />
            <hr />
        </div>
    </div>
</asp:Content>
