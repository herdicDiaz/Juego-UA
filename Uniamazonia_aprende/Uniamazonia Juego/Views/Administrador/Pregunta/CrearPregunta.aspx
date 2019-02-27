<%@ Page Title="Crear Pregunta" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="CrearPregunta.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.Pregunta.CrearPregunta" %>



<asp:Content ID="Content3" ContentPlaceHolderID="migajaDePan" runat="server">
    <div style="margin-left: 4px; height: 28px;">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/Views/Administrador/Welcome.aspx"><span class="mdi mdi-home"></span>&nbsp;Inicio</a></li>
                <li class="breadcrumb-item"><a href="#">Preguntas y Respuestas</a></li>
                <li class="breadcrumb-item active" aria-current="page">Crear Pregunta<li>
            </ol>
        </nav>
    </div>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPagina" runat="server">
    <br />
    <div class="col-md-12">
        <div class="card">
            <div class="card-header bg-success text-center">
                <h3>Crear pregunta</h3>
            </div>

            <div class="card-body">
                <div class="row">
                    <br />
                    <br />
                   
                    <div class="col-md-6 col-xs-12">
                        <label>
                            Pregunta
                        <label style="color: red">(*)</label></label>
                        <asp:TextBox ID="txtNombrePregunta" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6 col-xs-12">
                        <label>
                            Repuesta A
                           
                        <label style="color: red">(*)</label></label>
                        <asp:TextBox ID="txtRespuesta1" type="text" class="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <%--respuesta de la pregunta--%>
                <div class="row">
                    <div class="col-md-6">
                        <label>
                            Repuesta B
                        <label style="color: red">(*)</label></label>
                        <asp:TextBox ID="txtRespuesta2" type="text" class="form-control" runat="server"></asp:TextBox>
                        <br />
                    </div>
                    <div class="col-md-6">
                        <label>
                            Repuesta C
                           
                        <label style="color: red">(*)</label></label>
                        <asp:TextBox ID="txtRespuesta3" type="text" class="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <%--sanciones y calificacion de la pregunta.--%>
                <div class="row">
                    <div class="col-md-6">
                        <label>
                            Repuesta D
                        <label style="color: red">(*)</label></label>
                        <asp:TextBox ID="txtRespuesta4" type="text" class="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label>
                            Respuesta correcta
                        <label style="color: red">(*)</label></label>
                        <asp:DropDownList ID="DropRespuestCorrecta" runat="server" CssClass="form-control" AppendDataBoundItems="true">
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <center>
                <asp:Button class="btn btn-success" type="submit" Text="Crear pregunta"  OnClick="btnCrearPregunta" runat="server"/>
            <%--<button class="btn btn-success" type="submit"  onserverclick="btnCrearPregunta" runat="server">Crear pregunta</button>--%>
                </center>
            <br />
            <p>
                los campo mercados con
                   
            <label style="color: red">(*)</label>
                son obligatorios
            </p>
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#form1").validate({
                rules: {

                   <%=txtNombrePregunta.UniqueID%>: "required",
                   <%=txtRespuesta1.UniqueID%>: "required",
                   <%=txtRespuesta2.UniqueID%>: "required",
                   <%=txtRespuesta3.UniqueID%>: "required",
                   <%=txtRespuesta4.UniqueID%> :{
                    required: true
                },
                },
            messages: {

                 <%=txtNombrePregunta.UniqueID%> : "Este campo es requerido",
                 <%=txtRespuesta1.UniqueID%> : "Este campo es requerido",
                 <%=txtRespuesta2.UniqueID%> : "Este campo es requerido",
                 <%=txtRespuesta3.UniqueID%> : "Este campo es requerido",
                 <%=txtRespuesta4.UniqueID%> : "Este campo es requerido",
            }
            });
        });


    </script>

</asp:Content>
