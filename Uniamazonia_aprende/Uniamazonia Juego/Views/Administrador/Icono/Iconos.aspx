<%@ Page Title="Iconos" Language="C#" MasterPageFile="~/Principal.Master" EnableEventValidation="true" AutoEventWireup="true" CodeBehind="Iconos.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.Icono.Iconos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MapaPagina" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPagina" runat="server">

    <div style="color: black !important;">
        <div id="fondo_busqueda" style="border: 1px #84B59F dotted; background-color: white;">
            <div class="card bg-success text-white">
                <div class="card-body">
                    <h5 class="card-title">Bienvenido! Cree un nuevo Icono.</h5>
                </div>
            </div>
            <div class="container" id="busquedas" style="width: 90%; margin: 0 auto;">
                <hr />

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="nombre_content">Nombre Icono</label>
                        <asp:TextBox ID="nombre_icono" runat="server" type="text" class="form-control" placeholder="ingrese el nombre aqui..."></asp:TextBox>

                    </div>
                    <div class="form-group col-md-4">
                        <asp:Button ID="crear_icono" data-target="#recuperar" Style="margin-top: 29px;" runat="server" CssClass="btn btn-primary" Text="Crear Icono" OnClick="crear_icono_Click" />
                    </div>
                </div>


                <hr />
                <div class="col-md-12">
                    <asp:GridView ID="Tabla_Iconos" AutoGenerateColumns="False" runat="server"
                        OnPageIndexChanging="Metodo_Paginacion" DataKeyNames="id_icono"
                        PageSize="10" AllowPaging="true"
                        CssClass="table table-striped table-bordered table-condensed" 

                        OnRowCancelingEdit="RowCancelEditEvent"


                        OnRowDeleting="RowDeleting" OnRowEditing="RowEditing" OnRowUpdating="RowUpdating">


                        <RowStyle BackColor="White" ForeColor="#003399" />
                        <Columns>
                            <asp:BoundField DataField="id_icono" HeaderText="#" ReadOnly="True" SortExpression="id_icono" />

                            <asp:TemplateField HeaderText="Nombre" SortExpression="nombre_icono">
                                <EditItemTemplate>
                                    <asp:TextBox ID="nombre_icono" runat="server" Text='<%# Bind("nombre_icono") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("nombre_icono") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:CommandField  ButtonType="Button"   ShowEditButton="true"  ShowDeleteButton="true" ControlStyle-CssClass="edit-sprite">
                             
                            </asp:CommandField>

      
                            
                      

                        </Columns>
                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <HeaderStyle CssClass="bg-light" />
                    </asp:GridView>
                </div>



            </div>
            <hr />
            <hr />
            <hr />
        </div>
    </div>



                    <!--        <asp:ButtonField CommandName="editar" ControlStyle-CssClass="btn btn-info"
                                ButtonType="Button" Text="Editar" >
                                <ControlStyle CssClass="btn btn-success"></ControlStyle>
                            </asp:ButtonField>

                            <asp:ButtonField CommandName="eliminar" ControlStyle-CssClass="btn btn-info"
                                ButtonType="Button" Text="Eliminar">
                                <ControlStyle CssClass="btn btn-danger"></ControlStyle>
                            </asp:ButtonField> -->

















</asp:Content>
