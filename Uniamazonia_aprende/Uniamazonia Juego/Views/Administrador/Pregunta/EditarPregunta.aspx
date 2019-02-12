<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="EditarPregunta.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.Pregunta.EditarPregunta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContenidoPagina" runat="server">
    <br />
    <div class="col-md-12">
        <div class="card">
            <div class="card-header bg-success text-center">
                <h2>Editar pregunta</h2>
            </div>
            <div class="card-body">
                <br />
                <div class="row">
                    <div class="col-md-6">
                        <label>Pregunta</label>
                        <asp:TextBox ID="txtNombre" type="text" class="form-control" runat="server"></asp:TextBox>
                        <br />
                    </div>
                    <%--                    <div class="col-md-6">
                        <label>Estado</label>
                        <asp:DropDownList ID="Estado_select" CssClass="form-control" runat="server" AppendDataBoundItems="true">
                            <asp:ListItem>--Seleccione un estado--</asp:ListItem>
                        </asp:DropDownList>
                    </div>--%>
                    <div class="col-md-6">
                        <label>
                            Repuesta A
                        </label>
                        <input id="txtRespuestaA" type="text" class="form-control" runat="server" required />
                    </div>
                </div>

                <div class="row">


                    <div class="col-md-6">
                        <label>Repuesta B </label>
                        <input id="txtRespuestaB" type="text" class="form-control" runat="server" required />
                    </div>

                    <div class="col-6">
                        <label>Repuesta C</label>
                        <input id="txtRespuestaC" type="text" class="form-control" runat="server" required />
                    </div>
                </div>
                <br />
                <div class="row">

                    <div class="col-md-6">
                        <label>Repuesta D </label>
                        <input id="txtRespuestaD" type="text" class="form-control" runat="server" required />
                    </div>

                    <div class="col-md-6">
                        <label>Repuesta correcta </label>
                        <asp:DropDownList ID="DropRespuestaCorrec" runat="server" CssClass="form-control">
                        </asp:DropDownList>
                        <%--<input id="TxtCorrecta" type="text" class="form-control" runat="server" required />--%>
                    </div>
                </div>
                <br />

  <%--              <div class="row">

                    <div class="col-md-6">
                        <label>Calificación</label>
                        <input id="Txtcalificacion" type="text" class="form-control" runat="server" required />
                    </div>
                </div>--%>
                <br />
                <center>
                <button class="btn btn-success" type="submit" onserverclick="guardarCambios" runat="server">Guardar pregunta</button>
                </center>
                <br />
            </div>
        </div>
        <script type="text/javascript">
            function successalert() {
                swal({
                    title: 'Registro exitoso!',
                    text: '¡Que bien!',
                    type: 'success'
                });
            }

            function denegadoAlert(msg) {
                swal({
                    title: 'Registro exitoso!',
                    text: msg,
                    type: 'success'
                });
            }
        </script>
    </div>

</asp:Content>

