    <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Uniamazonia_Juego.Views.Login.Login" %>
    <!DOCTYPE html>

<html dir="ltr" lang="en">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="icon" type="image/png" sizes="20x20" href="/Images/test1.jpg">

    <title>Apreder.+ | Inicio Sesion</title>

    <link href="/Content/Bootstrap/dist/css/bootstrap.css" rel="stylesheet" />
    <link href="/Content/Bootstrap/dist/css/bootstrap.min.css" rel="stylesheet" />

    <link href="/Content/assets/libs/flot/css/float-chart.css" rel="stylesheet">
    <link href="/Content/dist/css/style.min.css" rel="stylesheet" />



    <link href="/Content/Style.css" rel="stylesheet" />
    <script src="/Content/assets/libs/jquery/dist/jquery.min.js"></script>

    <link href="/Content/Css/sweetalert2.min.css" rel="stylesheet" />
    <script src="/Content/Js/sweetalert2.all.min.js" type="text/javascript"></script>
</head>



<body>
    <form id="form1" runat="server">
        <div class="log">
            <h2>Iniciar Sesión</h2>
            <asp:TextBox runat="server" placeholder="&#128274; Usuario" type="text" ID="usuario_actual"></asp:TextBox>
            <asp:TextBox runat="server" placeholder="&#128273; Contraseña" type="password" ID="password_actual"></asp:TextBox>
            <asp:Button id="iniciar"  type="submit" name="submit" BackColor="#3366ff" value="Ingresar" class="btn-login"  OnClick="iniciar_Click" runat="server" Text="ingresar" />




            <a href="#registro" data-toggle="modal">Registrarse</a>
            <a href="#recuperar" data-toggle="modal">¿Olvidó su contraseña?</a>
        </div>

        <!-- ventanas modales -->
        <div class="modal fade" id="registro" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <!--- header de la ventana modal -->
                    <div class="modal-header">
                        <asp:Label ID="Label1" runat="server" Text=""><strong style="padding-left: 300%;">REGISTRO</strong></asp:Label>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>

                    </div>

                    <!--- contenido de la ventana modal -->

                    <div class="modal-body">
                        <div class="container">


                            <div class="form-row">

                                <div class="col-md-6 mb-3">
                                    <label for="txt_nombre_1">Primer Nombre</label>

                                    <asp:TextBox type="text" runat="server" ValidationGroup="modal1" class="form-control" id="txt_nombre_1" placeholder="digite su nombre" style="border-color: #968787;" > </asp:TextBox>

                                </div>

                                <div class="col-md-6 mb-3">
                                    <label for="txt_apellido_1">Primer Apellido</label>

                                    <asp:TextBox type="text" runat="server" ValidationGroup="modal1" class="form-control" id="txt_apellido_1" placeholder="digite su apellido" style="border-color: #968787;" ></asp:TextBox>

                                    </div>

                                <div class="col-md-6 mb-3">
                                    <label for="txt_nombre_2">Segundo Nombre</label>

                                    <asp:TextBox type="text" runat="server" ValidationGroup="modal1" class="form-control" id="txt_nombre_2" placeholder="digite su nombre" style="border-color: #968787;"></asp:TextBox>
                                </div>

                                <div class="col-md-6 mb-3">
                                    <label for="txt_apellido_2">Segundo Apellido</label>

                                    <asp:TextBox type="text" runat="server" ValidationGroup="modal1" class="form-control" id="txt_apellido_2" placeholder="digite su apellido" style="border-color: #968787;"></asp:TextBox>
                                </div>
                                <div class="col-md-6 mb-3">

                                    <label for="lista_carreras">Carreras Disponibles</label>
                                    <asp:DropDownList ID="lista_programas" runat="server" class="form-control" AppendDataBoundItems="true" Style="border-color: #968787;">
                                        <asp:ListItem Value=""> -- Seleccione una Carrera -- </asp:ListItem>
                                    </asp:DropDownList>


                                </div>

                                <div class="col-md-6 mb-3">

                                    <label for="lista_semestres">Lista Semestres</label>
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

                                <div class="col-md-4 mb-3">
                                    <label for="txt_identificacion">Indentificacion</label>

                                    <asp:TextBox type="number" runat="server" ValidationGroup="modal1" class="form-control" id="txt_identificacion" style="border-color: #968787;" ></asp:TextBox>
                                </div>


                                <div class="col-md-8 mb-3">
                                    <label for="txt_correo">Correo Electronico</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend" >
                                            <span class="input-group-text" id="inputGroupPrepend" style="border-color: #968787;">@</span>
                                        </div>
                                        <asp:TextBox type="email" runat="server" ValidationGroup="modal1" class="form-control" id="txt_correo" placeholder="email" aria-describedby="inputGroupPrepend" style="border-color: #968787;"></asp:TextBox>
                                    </div>
                                </div>

                            </div>




                            <div class="form-group">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" value="" id="invalidCheck">
                                    <label class="form-check-label" for="invalidCheck">
                                        Acepto Los Terminos y Condiciones
                                    </label>

                                </div>
                            </div>

                        </div>
                    </div>


                    <!--- footer de la ventana modal -->
                    <div class="modal-footer">

                        <asp:Button ID="registro1" runat="server" class="btn btn-primary" ValidationGroup="modal1" type="submit" Text="Registrarse" OnClick="registro1_Click"/>


                    </div>
                </div>
            </div>
        </div>

        <!-- SEGUNDA VENTANA MODAL -->
        <div class="modal fade" id="recuperar">
            <div class="modal-dialog">
                <div class="modal-content">
                    <!--- header de la ventana modal -->
                    <div class="modal-header">
                        <asp:Label ID="Label7" runat="server" Text=""><strong>Recuperacion de Contraseña</strong></asp:Label>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>


                    <!-- contenido de al ventana -->
                    <div class="modal-body">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="Label8" runat="server"><strong>Correo Electronico</strong></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox class="entrada" ID="TextBox4" runat="server" type="email" placeholder="ingrese su correo" Style="margin-left: 11px; height: 34px; width: 220px;"></asp:TextBox>
                                </td>
                            </tr>
                        </table>


                    </div>
                    <!--- footer de la ventana modal -->


                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">cerrar </button>
                        <button type="button" class="btn btn-primary">guadar cambios</button>
                    </div>


                </div>
            </div>
        </div>




    </form>



    <script src="/Content/Bootstrap/JQuery/lib/jquery.js"></script>
    <script src="/Content/Bootstrap/JQuery/dist/jquery.validate.js"></script>

    <script src="/Content/Bootstrap/dist/js/bootstrap.js"></script>
    <script src="/Content/Bootstrap/dist/js/bootstrap.min.js"></script>

    <script src="/Content/assets/libs/popper.js/dist/umd/popper.min.js"></script>
    <script src="/Content/assets/libs/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="/Content/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js"></script>
    <script src="/Content/assets/extra-libs/sparkline/sparkline.js"></script>
    <script src="/Content/dist/js/waves.js"></script>
    <script src="/Content/dist/js/sidebarmenu.js"></script>
    <script src="/Content/dist/js/custom.min.js"></script>
    <script src="/Content/assets/libs/flot/excanvas.js"></script>
    <script src="/Content/assets/libs/flot/jquery.flot.js"></script>
    <script src="/Content/assets/libs/flot/jquery.flot.pie.js"></script>
    <script src="/Content/assets/libs/flot/jquery.flot.time.js"></script>
    <script src="/Content/assets/libs/flot/jquery.flot.stack.js"></script>
    <script src="/Content/assets/libs/flot/jquery.flot.crosshair.js"></script>
    <script src="/Content/assets/libs/flot.tooltip/js/jquery.flot.tooltip.min.js"></script>
    <script src="/Content/dist/js/pages/chart/chart-page-init.js"></script>

</body>
</html>
