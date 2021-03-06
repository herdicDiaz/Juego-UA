﻿<%@ Page Title="Preguntas Asignadas" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="VerPreguntasAsignadas.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.Prueba.VerPreguntasAsignadas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MapaPagina" runat="server">

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="migajaDePan" runat="server">
        <div id="deleteModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Eliminar Pregunta</h5>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    ¿Está seguro que desea eliminar la pregunta?
                              <asp:HiddenField ID="hfCode" runat="server" />
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <asp:LinkButton ID="btnEliminar" runat="server" class="btn btn-danger" Text='Eliminar' OnClick="btnEliminar_Click" runat="server">Eliminar</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>


    <div style="margin-left: 4px; height: 28px;">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/Views/Administrador/Welcome.aspx"><span class="mdi mdi-home"></span>&nbsp;Inicio</a></li>
                <li class="breadcrumb-item"><a href="#">Gestionar Prueba</a></li>
                <li class="breadcrumb-item active" aria-current="page">
                Ver Preguntas Asignadas<li>
            </ol>
        </nav>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPagina" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="card">
        <div class="card-header text-center bg-success">
            <h3>Pruebas asignadas</h3>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-5">
                    <asp:DropDownList ID="DropNombrePruebas" runat="server" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="BindGridView_SeleccionPrueba" CssClass="form-control">
                        <asp:ListItem Value="" Selected="True">--Selecciona una prueba--</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-md-5">
                    <input id="TxtBuscar" runat="server" placeholder="Escribe la pregunta que buscas" class="form-control" />
                </div>
                <div class="col-md-1">
                    <asp:Button ID="BtnBuscar" runat="server" Text="Buscar" OnClick="buscarPregunta" CssClass="btn btn-success" />
                </div>

                <div class="col-md-1">
                    <asp:Button ID="BtnLimpiar" Text="Limpiar" runat="server" OnClick="BtnLimpiarConsultas" CssClass="btn btn-success" />
                </div>
            </div>
            <br />
            <div>
                <div id="DivNohaypreguntas" runat="server" class="alert alert-info" style="display: block"></div>
            </div>

            <div class="table-responsive">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="col-md-12">
                            <asp:GridView ID="Tabla_Preguntas" AutoGenerateColumns="False" runat="server"
                                OnPageIndexChanging="Metodo_Paginacion"
                                OnRowCommand="EventosGrid"
                                DataKeyNames="id_pregunta"
                                CssClass="table table-striped table-bordered table-condensed">

                                <%--Estilos--%>
                                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                <HeaderStyle CssClass="bg-light" ForeColor="Black" />

                                <Columns>
                                    <asp:BoundField DataField="id_pregunta" ItemStyle-HorizontalAlign="Center" HeaderText="#" ReadOnly="True" />
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" HeaderStyle-BorderColor="White" HeaderText="Nombre" ControlStyle-Width="800px">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("nombre_pregunta") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:ButtonField ButtonType="Button" Text="Quitar" CommandName="Quitar">
                                        <ControlStyle CssClass="btn btn-danger"></ControlStyle>
                                    </asp:ButtonField>

                                </Columns>
                            </asp:GridView>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>


        </div>
    </div>

    <script type="text/javascript">
</script>
</asp:Content>
