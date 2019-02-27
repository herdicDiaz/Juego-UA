<%@ Page Title="Ver Perfil" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="VerPerfil.aspx.cs" Inherits="Uniamazonia_Juego.Views.VistasJugador.PerfilJugador.VerPerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MapaPagina" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="migajaDePan" runat="server">
    <div style="margin-left: 4px; height: 28px;">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/Views/Administrador/Welcome.aspx"><span class="mdi mdi-home"></span>&nbsp;Inicio</a></li>
                <li class="breadcrumb-item"><a href="#">Perfil</a></li>
                <li class="breadcrumb-item active" aria-current="page">Ver Perfil</li>
            </ol>
        </nav>
    </div>
</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPagina" runat="server">

    <div style="color: black !important;">
        <div id="fondo_busqueda" style="border: 1px #84B59F dotted; background-color: white;">

            <div class="card bg-success text-white">
                <div class="card-body">
                    <h5 class="card-title">Datos Personales</h5>
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
                        <label for="txt_carrera">Carrera</label>
                        <asp:TextBox ID="txt_carrera" runat="server" type="text" class="form-control"></asp:TextBox>


                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label for="txt_numero_semestre">Numero Semestre</label>
                        <asp:TextBox ID="txt_numero_semestre" type="number" class="form-control" runat="server"></asp:TextBox>

                    </div>
                    <div class="form-group col-md-6">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-5">
                    </div>



                    <div class="form-group col-md-6">
                        <asp:Button ID="actualizar" class="btn btn-success" runat="server" OnClick="actualizar_Click" Text="Actualizar" />
                    </div>
                </div>
                <hr />
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="txt_usuario">Usuario</label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="inputGroupPrepend" style="border-color: #968787;">@</span>
                            </div>
                            <asp:TextBox type="email" runat="server" ValidationGroup="modal1" class="form-control" ID="txt_usuario" aria-describedby="inputGroupPrepend" Style="border-color: #968787;"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group col-md-6">
                        <label for="txt_password">Contraseña</label>
                        <asp:TextBox ID="txt_password" runat="server" type="password" class="form-control"></asp:TextBox>

                    </div>
                </div>


                <div class="form-row">
                    <div class="form-group col-md-6">
                    </div>

                    <div class="form-group col-md-6">

                        <button type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModal">
                            Cambiar Contraseña
                        </button>

                    </div>
                </div>

                <hr />
            </div>
            <hr />
        </div>
    </div>

    <!-- cambiar contraseña - ventana modal -->

    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Cambiar Contraseña</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="txt_password_actual">Contraseña Actual</label>
                            <asp:TextBox ID="txt_password_actual" type="password" class="form-control" runat="server"></asp:TextBox>

                        </div>

                        <div class="form-group col-md-6">
                            <label for="txt_nueva_password">Nueva Contraseña</label>
                            <asp:TextBox ID="txt_nueva_password" type="password" class="form-control" runat="server"></asp:TextBox>

                        </div>

                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="txt_confirmar_password">Confirmar Contraseña</label>
                            <asp:TextBox ID="txt_confirmar_password" runat="server" type="password" class="form-control"></asp:TextBox>

                        </div>

                    </div>

                    <div class="modal-footer">
                        <asp:Button ID="guardar_password" class="btn btn-primary" runat="server" Text="Guardar"  OnClick="guardar_password_Click" />

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- fin ventana modal --->

</asp:Content>
