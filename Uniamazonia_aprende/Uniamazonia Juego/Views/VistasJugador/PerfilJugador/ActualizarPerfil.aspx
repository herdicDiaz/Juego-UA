<%@ Page Title="Actualizar Perfil" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="ActualizarPerfil.aspx.cs" Inherits="Uniamazonia_Juego.Views.VistasJugador.PerfilJugador.ActualizarPerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MapaPagina" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPagina" runat="server">
    <div style="color: black !important;">
        <div id="fondo_busqueda" style="border: 1px #84B59F dotted; background-color: white;">

            <div class="card bg-info text-white">
                <div class="card-body">
                    <h5 class="card-title">Actualizar Datos Personales</h5>
                </div>
            </div>

            <div id="busquedas" style="width: 90%; margin: 0 auto;">
                <hr />
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="txt_nombre1">Primer Nombre</label>
                        <asp:TextBox type="text" class="form-control" ID="txt_nombre1" runat="server"></asp:TextBox>

                    </div>
                    <div class="form-group col-md-6">
                        <label for="txt_nombre2">Segundo Nombre</label>
                        <asp:TextBox ID="txt_nombre2" runat="server" type="text" class="form-control"></asp:TextBox>

                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="txt_apellido1">Primer Apellido</label>
                        <asp:TextBox ID="txt_apellido1" runat="server" type="text" class="form-control"></asp:TextBox>

                    </div>
                    <div class="form-group col-md-6">
                        <label for="txt_apellido2">Segundo Apellido</label>
                        <asp:TextBox ID="txt_apellido2" type="text" class="form-control" runat="server"></asp:TextBox>

                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="txt_identificacion">Identificacion</label>
                        <asp:TextBox ID="txt_identificacion" runat="server" type="number" class="form-control"></asp:TextBox>

                    </div>
                    <div class="form-group col-md-6">
                        <label for="lista_carreras">Carrera Actual:  <asp:Label ID="txt_carrera_actual" runat="server" Text="Sin Carrera"></asp:Label> </label>
                        <asp:DropDownList ID="lista_programas" runat="server" class="form-control" AppendDataBoundItems="true" Style="border-color: #968787;">
                            <asp:ListItem Value=""> -- Seleccione una Carrera -- </asp:ListItem>
                        </asp:DropDownList>

                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">

                        <label for="txt_correo">Correo Electronico</label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="inputGroupPrepend" style="border-color: #968787;">@</span>
                            </div>
                            <asp:TextBox type="email" runat="server" ValidationGroup="modal1" class="form-control" ID="txt_correo" aria-describedby="inputGroupPrepend" Style="border-color: #968787;"></asp:TextBox>
                        </div>


                    </div>
                    <div class="form-group col-md-4">
                        <label for="lista_semestres">Semestre Actual:  <asp:Label ID="txt_semestre_actual" runat="server" Text="Sin Semestre"></asp:Label> </label>
                        <asp:DropDownList ID="lista_semestres" runat="server" class="form-control" AppendDataBoundItems="true" Style="border-color: #968787;">
                            <asp:ListItem Value=""> -- Seleccione un Semestre -- </asp:ListItem>
                            <asp:ListItem Value="1"></asp:ListItem>
                            <asp:ListItem Value="2"></asp:ListItem>
                            <asp:ListItem Value="3"> </asp:ListItem>
                            <asp:ListItem Value="4"> </asp:ListItem>
                            <asp:ListItem Value="5"> </asp:ListItem>
                            <asp:ListItem Value="7"> </asp:ListItem>
                            <asp:ListItem Value="8"> </asp:ListItem>
                            <asp:ListItem Value="9"> </asp:ListItem>
                            <asp:ListItem Value="10"> </asp:ListItem>
                        </asp:DropDownList>

                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-5">
                    </div>

                    <div class="form-group col-md-6">

                        <asp:Button ID="actualizar" class="btn btn-primary" runat="server" OnClick="actualizar_Click" Text="Guardar Cambios" />
                    </div>
                </div>
                <hr />
            </div>
            <hr />
        </div>
    </div>
</asp:Content>
