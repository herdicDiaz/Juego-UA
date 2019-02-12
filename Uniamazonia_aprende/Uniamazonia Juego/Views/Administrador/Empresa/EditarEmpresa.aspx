﻿<%@ Page Title="Editar Empresa" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="EditarEmpresa.aspx.cs" Inherits="Uniamazonia_Juego.Views.Administrador.Empresa.CrearEmpresa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MapaPagina" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContenidoPagina" runat="server">
  
        <div style="color: black !important;">
        <div id="fondo_busqueda" style="border: 1px #84B59F dotted; background-color: white;">
            <div class="card bg-success text-white">
                <div class="card-body">
                    <h5 class="card-title">Bienvenido! Datos de La Empresa.</h5>
                </div>
            </div>
            <div class="container" id="busquedas" style="width: 90%; margin: 0 auto;">
                <hr />
                <div class="form-row">

                    <div class="form-group col-md-6">
                        <label for="nombre_empresa">Nuevo Nombre Empresa:</label>
                        <asp:TextBox ID="nuevo_nombre" runat="server" type="text" class="form-control" placeholder="ingrese el nombre aqui..."></asp:TextBox>

                    </div>
                    <div class="form-group col-md-6">
                      <label for="antiguo_nombre">Actual Nombre:</label>
                        <asp:TextBox ID="nombre_actual" runat="server" type="text" class="form-control" placeholder="ingrese el nombre aqui..."></asp:TextBox>

                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                            <label for="nuevaa_descripcion">Nueva Descripcion:</label>
                            <textarea class="form-control" runat="server" id="nueva_descripcion" rows="3"></textarea>
                    </div>

                     <div class="form-group col-md-6">
                             <label for="antigua_descripcion">Descripcion Actual:</label>
                             <textarea class="form-control"  runat="server" id="descripcion_actual" rows="3" readonly></textarea>
                    </div>
                </div>

                <div class="form-row">
                        <div class="form-group col-md-6">
                        <label for="nuevo_nit">Nuevo NIT:</label>
                        <asp:TextBox ID="nuevo_nit_empresa" runat="server" type="number" class="form-control" placeholder="ingrese el nombre aqui..."></asp:TextBox>

                    </div>
                    <div class="form-group col-md-6">
                      <label for="nit_aactual">NIT Actual:</label>
                      <asp:TextBox ID="nit_actual" runat="server" type="number" class="form-control" placeholder="ingrese el nombre aqui..."></asp:TextBox>

                    </div>

                </div>


                <div class="form-row">
                    <div class="form-group col-md-5">
                    </div>
                    <div class="form-group col-md-4">
                        <asp:Button ID="Guadar_empresa" runat="server" CssClass="btn btn-primary" Text="Guardar Cambios" />
                    </div>
                </div>
                <hr />
            </div>
        </div>
    </div>




</asp:Content>
