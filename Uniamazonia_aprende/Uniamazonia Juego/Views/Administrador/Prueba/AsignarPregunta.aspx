<%@ Page Title="Asignar pregunta" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="AsignarPregunta.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.Prueba.AsignarPregunta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MapaPagina" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="migajaDePan" runat="server">
    <div style="margin-left: 4px; height: 28px;">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/Views/Administrador/Welcome.aspx"><span class="mdi mdi-home"></span>&nbsp;Inicio</a></li>
                <li class="breadcrumb-item"><a href="#">Gestionar Prueba</a></li>
                <li class="breadcrumb-item active" aria-current="page">Asignar Pregunta<li>
            </ol>
        </nav>
    </div>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPagina" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <%--<asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>--%>
    <div class="card">
        <div class="card-header text-center bg-success">
            <h3>Pruebas y preguntas</h3>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-12">
                    <label>Pruebas</label>
                    <asp:DropDownList ID="DropListPrueba" CssClass="form-control" AppendDataBoundItems="true" runat="server">
                        <asp:ListItem Value="0">--Seleccione una prueba--</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                </div>
            </div>
            <div>
                <div id="Nohaypreguntas" runat="server" style="display: none" class="alert alert-info"></div>
            </div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="TblPreguntas" runat="server" AutoGenerateColumns="false"
                        CssClass="table table-striped table-bordered table-condensed" OnPageIndexChanging="Metodo_Paginacion"
                        OnRowCommand="agregarPregunta" DataKeyNames="id_pregunta">
                        <HeaderStyle ForeColor="Black" />
                        <FooterStyle />
                        <Columns>
                            <asp:BoundField DataField="id_pregunta" HeaderText="#" ReadOnly="True" SortExpression="id_pregunta" />
                            <asp:TemplateField HeaderText="Nombre" SortExpression="nombre_pregunta" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("nombre_pregunta") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Estado" SortExpression="estado_pregunta" ItemStyle-HorizontalAlign="Center" ControlStyle-Width="400px">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("estado_pregunta") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:ButtonField CommandName="Agregar" ControlStyle-CssClass="btn btn-info" ButtonType="Button" Text="Agregar">
                                <ControlStyle CssClass="btn btn-info"></ControlStyle>
                            </asp:ButtonField>
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
            <br />

            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <div id="BorderPreguntasAsignadas" runat="server" style="display:none" class="border border-success ">
                        <div>
                            <center>
                            <div class="alert alert-success form-control" id="DivPreguntasAsignadas" runat="server" style="display: none" role="alert">
                            </div>
                            </center>
                  
                        </div>
                        <asp:GridView ID="GridViewPreguntasAsignadas" runat="server" AutoGenerateColumns="false"
                            CssClass="table table-striped table-bordered table-condensed">
                            <Columns>
                                <asp:TemplateField HeaderText="Pregunta" SortExpression="nombre_pregunta" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("nombre_pregunta") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>

                        </asp:GridView>
                        </div>


                    </div>

                </ContentTemplate>

            </asp:UpdatePanel>

        </div>
    </div>
    <script type="text/javascript">

        function denegadoAlert(msg) {
            swal({
                title: 'Error!',
                text: msg,
                type: 'error',
                showCancelButton: true,
            },
                function (isConfirm) {
                    if (isConfirm) {
                        swal("Deleted!", "Your imaginary file has been deleted.", "success");
                    } else {
                        swal("Cancelled", "Your imaginary file is safe :)", "error");
                    }
                });
        }

        function successAlert(title_p, msg) {
            swal({
                title: title_p,
                text: msg,
                type: 'success',
            });
        }
    </script>
</asp:Content>
