<%@ Page Title="" Language="C#" MasterPageFile="~/views/admin/admin.Master" AutoEventWireup="true" CodeBehind="responsable.aspx.cs" Inherits="Ecu911Pasantes.views.admin.responsable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTitle" runat="server">
    Responsable | Admin - Sistema Pasantes
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphCabecera" runat="server">
    <link rel="stylesheet" type="text/css" href="../../resources/vendors/styles/wizard.css" />
    <link rel="stylesheet" type="text/css" href="../../resources/src/plugins/sweetalert2/sweetalert2.css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMensajes" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:Timer ID="Timer1" runat="server" Interval="2000" OnTick="Timer1_Tick"></asp:Timer>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphContenido" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="min-height-200px">
                <div class="page-header">
                    <div class="row">
                        <div class="col-md-6 col-sm-12">
                            <div class="title">
                                <h4>Registrar un responsable</h4>
                            </div>
                            <nav aria-label="breadcrumb" role="navigation">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="inicio.aspx">Inicio</a></li>
                                    <li class="breadcrumb-item"><a href="responsables.aspx">Listado de responsables</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Registrar un responsable</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
                <div class="pd-20 card-box mb-30">
                    <div class="row">
                        <div class="col-4">
                            <div class="form-group row">
                                <label class="col-sm-12 col-md-2 col-form-label">Cedula</label>
                                <div class="col-sm-12 col-md-10">
                                    <asp:TextBox ID="txtCedula" TextMode="Number" MaxLength="10" CssClass="form-control" OnTextChanged="TxtCedula_TextChanged" AutoPostBack="true" placeholder="Ingrese su cedula" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="Red" runat="server" ErrorMessage="La cedula es requerida" ControlToValidate="txtCedula" ValidationGroup="Info" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="form-group row">
                                <label class="col-sm-12 col-md-2 col-form-label">Nombres</label>
                                <div class="col-sm-12 col-md-10">
                                    <asp:TextBox ID="txtNombre" type="text" CssClass="form-control" placeholder="Ingrese sus nombres" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ForeColor="Red" runat="server" ErrorMessage="Los nombres son requeridos" ControlToValidate="txtNombre" ValidationGroup="Info" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="form-group row">
                                <label class="col-sm-12 col-md-2 col-form-label">Apellidos</label>
                                <div class="col-sm-12 col-md-10">
                                    <asp:TextBox ID="txtApellido" type="text" CssClass="form-control" placeholder="Ingrese sus apellidos" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ForeColor="Red" runat="server" ErrorMessage="Los apellidos son requeridos" ControlToValidate="txtApellido" ValidationGroup="Info" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group row">
                                <label class="col-sm-12 col-md-2 col-form-label">Dirección</label>
                                <div class="col-sm-12 col-md-10">
                                    <asp:TextBox ID="txtDireccion" type="text" CssClass="form-control" placeholder="Ingrese la dirección" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ForeColor="Red" runat="server" ErrorMessage="La dirección es requerida" ControlToValidate="txtDireccion" ValidationGroup="Info" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group row">
                                <label class="col-sm-12 col-md-2 col-form-label">Celular</label>
                                <div class="col-sm-12 col-md-10">
                                    <asp:TextBox ID="txtCelular" TextMode="Phone" MaxLength="10" CssClass="form-control" placeholder="Ingrese el numero de celular" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ForeColor="Red" runat="server" ErrorMessage="El celular es requerido" ControlToValidate="txtCelular" ValidationGroup="Info" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ForeColor="Red" ErrorMessage="Ingrese correctamente su numero de telefono" ControlToValidate="txtCelular" ValidationGroup="Info" ValidationExpression="[0-9]{10}" Display="Dynamic"></asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group row">
                                <label class="col-sm-12 col-md-2 col-form-label">Area</label>
                                <div class="col-sm-12 col-md-10">
                                    <asp:TextBox ID="txtArea" type="text" CssClass="form-control" placeholder="Ingrese el area de trabajo" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ForeColor="Red" runat="server" ErrorMessage="La area de trabajo es requerida" ControlToValidate="txtArea" ValidationGroup="Info" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group row">
                                <label class="col-sm-12 col-md-2 col-form-label">Cargo</label>
                                <div class="col-sm-12 col-md-10">
                                    <asp:TextBox ID="txtCargo" type="text" CssClass="form-control" placeholder="Ingrese el area de trabajo" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ForeColor="Red" runat="server" ErrorMessage="El cargo es requerido" ControlToValidate="txtCargo" ValidationGroup="Info"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group row">
                                <label class="col-sm-12 col-md-4 col-form-label">Nombre de usuario</label>
                                <div class="col-sm-12 col-md-8">
                                    <asp:TextBox ID="txtUser" type="text" CssClass="form-control" placeholder="Ingrese el nombre de usuario" OnTextChanged="txtUser_TextChanged" AutoPostBack="true" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" runat="server" ControlToValidate="txtUser" ValidationGroup="info" ErrorMessage="El nombre de usuario es requerido" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group row">
                                <label class="col-sm-12 col-md-4 col-form-label">Correo electronico</label>
                                <div class="col-sm-12 col-md-8">
                                    <asp:TextBox ID="txtEmail" type="text" CssClass="form-control" placeholder="Ingrese el correo electronico" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" runat="server" ControlToValidate="txtEmail" ValidationGroup="info" ErrorMessage="El correo electronico es requerido" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group row">
                                <label class="col-sm-12 col-md-4 col-form-label">Contraseña</label>
                                <div class="col-sm-12 col-md-8">
                                    <asp:TextBox ID="txtPass" TextMode="Password" CssClass="form-control" placeholder="Ingrese la contraseña" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" ErrorMessage="La contraseña es requerida" ControlToValidate="txtPass" ValidationGroup="Info" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group row">
                                <label class="col-sm-12 col-md-4 col-form-label">Confirmar contraseña</label>
                                <div class="col-sm-12 col-md-8">
                                    <asp:TextBox ID="txtConfirmar" TextMode="Password" CssClass="form-control" placeholder="Confirme la contraseña" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" runat="server" ErrorMessage="La confirmación de la contraseña es requerida" ControlToValidate="txtConfirmar" ValidationGroup="Info" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" ForeColor="Red" ControlToValidate="txtConfirmar" ControlToCompare="txtPass" runat="server" ErrorMessage="Las contraseñas ingresadas no coiciden" ValidationGroup="Info" Display="Dynamic"></asp:CompareValidator>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="align-items-end">
                        <asp:Button ID="btnRegresar" OnClick="lnbCancelar_Click" CssClass="btn btn-outline-primary btn-lg" runat="server" Text="Regresar" />
                        <asp:Button ID="btnGuardar" OnClick="lnbGuardar_Click" CssClass="btn btn-primary btn-lg" ValidationGroup="info" runat="server" Text="Enviar" />
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphFooter" runat="server">
    <script type="text/javascript" src="../../resources/vendors/scripts/function.js"></script>
    <script type="text/javascript" src="../../resources/src/plugins/sweetalert2/sweetalert2.all.js"></script>
    <script type="text/javascript" src="../../resources/src/plugins/sweetalert2/sweet-alert.init.js"></script>
</asp:Content>
