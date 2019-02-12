<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="CrearSancion.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.Sancion.CrearSancion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContenidoPagina" runat="server">
    <br />
    <div class="col-12">
        <div class="card">
            <div class="card-header bg-success text-center">
                <h3>Crear sancion</h3>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-6">
                        <label>Descripción de la sanción</label>
                        <input id="txtDescripcion" type="text" runat="server" placeholder="Descripción" class="form-control" />
                    </div>
                    <div class="col-md-6">
                        <label>Url</label>
                        <input id="TxtUrlVideo" class="form-control" type="text" runat="server" placeholder="Url del video" />
                    </div>
                </div>
                <br />
                <%--<asp:Button Text="Subir archivo" class="btn btn-info" type="submit" OnClick="CargarArchivos" runat="server" />--%>
                <center>
                    <asp:Button Text="Crear sanción" class="btn btn-success" type="submit" OnClick="btnCrearSancion" runat="server"/>
                </center>
            </div>
        </div>
    </div>
    <script type="text/javascript">

        $(document).ready(function () {
            $("#form1").validate({
                rules: {

                   <%=txtDescripcion.UniqueID%>: "required",
                   <%=TxtUrlVideo.UniqueID%> :{
                    required: true
                },
                },
            messages: {

                 <%=txtDescripcion.UniqueID%> : "Este campo es requerido",
                 <%=TxtUrlVideo.UniqueID%> : "Este campo es requerido",
            }
            });
        });

    </script>
</asp:Content>

<%--<asp:Content ID="Content2" ContentPlaceHolderID="MapaPagina" runat="server">

</asp:Content>--%>