﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="VerSancionesAsignadas.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.Prueba.VerSancionesAsignadas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MapaPagina" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPagina" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="card">
        <div class="card-header text-center bg-success">
            <h3>Pruebas y sanciones</h3>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-5">
                    <asp:DropDownList ID="DropPruebas" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropConsultaGrid" AppendDataBoundItems="true">
                        <asp:ListItem Value="" Selected="True">--Seleccione una prueba--</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-5">
                    <input id="TxtBuscardor" runat="server" class="form-control" placeholder="Escribe la sancion que buscas" />
                </div>
                <div class="col-md-2 text-center">
                    <asp:Button ID="BtnBuscar" runat="server" Text="Buscar" CssClass="btn btn-success" OnClick="Buscar" />
                    <asp:Button ID="BtnLimpiar" runat="server" Text="Limpiar" class="btn btn-success" OnClick="Limpiar" />
                </div>

            </div>
            <br />
            <div>
                <div id="DivNohaysancionAsignadas" style="display: none" class="alert alert-info" runat="server"></div>
            </div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>

                    <asp:GridView ID="TblPrueba_sanciones" runat="server" AutoGenerateColumns="false"
                        CssClass="table table-striped table-bordered table-condensed"
                        OnPageIndexChanging="Metodo_Paginacion"
                        OnRowCommand="ComandosGrid"
                        DataKeyNames="idsancion">

                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                        <HeaderStyle ForeColor="Black" />
                        <Columns>
                            <asp:BoundField DataField="idsancion" SortExpression="idsancion" ReadOnly="True" HeaderText="#" ItemStyle-HorizontalAlign="Center" />
                            <asp:TemplateField HeaderText="Sancion asignada" ItemStyle-HorizontalAlign="Center" ControlStyle-Width="800px">
                                <ItemTemplate>
                                    <asp:Label ID="LabelDescripcion" runat="server" Text='<%# Bind("descripcion") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:ButtonField Text="Quitar" ButtonType="Button" CommandName="Quitar">
                                <ControlStyle CssClass="btn btn-danger"></ControlStyle>
                            </asp:ButtonField>
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>

        </div>
    </div>
    <script type="text/javascript">
<%--        $(document).ready(function () {
            $("#form1").validate({
                rules: {
                    <%=TxtBuscardor.UniqueID%>: {
                        required: true
                    },
                },
                messages: {
                <%=TxtBuscardor.UniqueID%>: "Este campo es requerido"
            }

            });
        });--%>

</script>
</asp:Content>
