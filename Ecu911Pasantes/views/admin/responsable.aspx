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
                    <div class="content">
                        <div class="content__inner">
                            <div class="container">
                                <div class="container overflow-hidden">
                                    <div class="multisteps-form">
                                        <div class="row">
                                            <div class="col-12 col-lg-8 ml-auto mr-auto mb-4">
                                                <div class="multisteps-form__progress">
                                                    <button class="multisteps-form__progress-btn js-active" type="button" title="Cuenta">Cuenta</button>
                                                    <button class="multisteps-form__progress-btn" type="button" title="Info persnal">Info personal</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12 col-lg-12 m-auto">
                                                <div class="multisteps-form__form">
                                                    <div class="multisteps-form__panel shadow p-4 rounded bg-white js-active" data-animation="scaleIn">
                                                        <h3 class="multisteps-form__title">Cuenta</h3>
                                                        <div class="multisteps-form__content">
                                                            <div class="form-row mt-4">
                                                                <div class="col-12 col-sm-6">
                                                                    <asp:TextBox ID="txtUser" type="text" CssClass="multisteps-form__input form-control" placeholder="Nombre de usuario" runat="server"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ErrorMessage="El nombre de usuario es requerido" ControlToValidate="txtUser" ValidationGroup="Info"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="col-12 col-sm-6 mt-4 mt-sm-0">
                                                                    <asp:TextBox ID="txtEmail" type="email" CssClass="multisteps-form__input form-control" placeholder="Correo electrónico"  runat="server"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ErrorMessage="El correo electrónico es requerido" ControlToValidate="txtEmail" ValidationGroup="Info"></asp:RequiredFieldValidator>
                                                                    <br />
                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red" ErrorMessage="El correo ingresado no es valido" ControlToValidate="txtEmail" ValidationGroup="Info" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>
                                                            <div class="form-row mt-4">
                                                                <div class="col-12 col-sm-6">
                                                                    <asp:TextBox ID="txtPass" type="password" CssClass="multisteps-form__input form-control"  placeholder="Contraseña" runat="server"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" ErrorMessage="La contraseña es requerida" ControlToValidate="txtPass" ValidationGroup="Info"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="col-12 col-sm-6 mt-4 mt-sm-0">
                                                                    <asp:TextBox ID="txtConfirmar" type="password" CssClass="multisteps-form__input form-control"  placeholder="Repetir contraseña" runat="server"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" runat="server" ErrorMessage="La confirmación de la contraseña es requerida" ControlToValidate="txtConfirmar" ValidationGroup="Info"></asp:RequiredFieldValidator>
                                                                    <br />
                                                                    <asp:CompareValidator ID="CompareValidator1" ForeColor="Red" ControlToValidate="txtConfirmar" ControlToCompare="txtPass" runat="server" ErrorMessage="Las contraseñas ingresadas no coiciden" ValidationGroup="Info"></asp:CompareValidator>
                                                                </div>
                                                            </div>
                                                            <div class="button-row d-flex mt-4">
                                                                <asp:Button ID="btnRegresar" OnClick="lnbCancelar_Click" CssClass="btn btn-outline-primary" runat="server" Text="Regresar" />
                                                                <button class="btn btn-primary ml-auto js-btn-next" type="button" title="Siguiente">Siguiente</button>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="multisteps-form__panel shadow p-4 rounded bg-white" data-animation="scaleIn">
                                                        <h3 class="multisteps-form__title">Información personal</h3>
                                                        <div class="multisteps-form__content">
                                                            <div class="form-row mt-4">
                                                                <div class="col-12 col-sm-4">
                                                                    <asp:TextBox ID="txtCedula" type="number" MaxLength="10" CssClass="multisteps-form__input form-control" OnTextChanged="txtCedula_TextChanged" placeholder="Cedula"  runat="server"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="Red" runat="server" ErrorMessage="La cedula es requerida" ControlToValidate="txtCedula" ValidationGroup="Info"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="col-12 col-sm-4">
                                                                    <asp:TextBox ID="txtNombre" type="text" CssClass="multisteps-form__input form-control" placeholder="Nombres"  runat="server"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ForeColor="Red" runat="server" ErrorMessage="Los nombres son requeridos" ControlToValidate="txtNombre" ValidationGroup="Info"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="col-12 col-sm-4 mt-4 mt-sm-0">
                                                                    <asp:TextBox ID="txtApellido" type="text" CssClass="multisteps-form__input form-control" placeholder="Apellidos"  runat="server"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ForeColor="Red" runat="server" ErrorMessage="Los apellidos son requeridos" ControlToValidate="txtApellido" ValidationGroup="Info"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                            <div class="form-row mt-4">
                                                                <div class="col-12 col-sm-6">
                                                                    <asp:TextBox ID="txtDireccion" type="text" CssClass="multisteps-form__input form-control" placeholder="Dirección"  runat="server"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ForeColor="Red" runat="server" ErrorMessage="La dirección es requerida" ControlToValidate="txtDireccion" ValidationGroup="Info"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="col-12 col-sm-6 mt-4 mt-sm-0">
                                                                    <asp:TextBox ID="txtCelular" type="number" MaxLength="10" CssClass="multisteps-form__input form-control phone-number" placeholder="Celular"  runat="server"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ForeColor="Red" runat="server" ErrorMessage="El celular es requerido" ControlToValidate="txtCelular" ValidationGroup="Info"></asp:RequiredFieldValidator>
                                                                    <br />
                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ForeColor="Red" ErrorMessage="Ingrese correctamente su numero de telefono" ControlToValidate="txtCelular" ValidationGroup="Info" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>
                                                            <div class="form-row mt-4">
                                                                <div class="col-12 col-sm-6">
                                                                    <asp:TextBox ID="txtArea" type="text" CssClass="multisteps-form__input form-control" placeholder="Area de trabajo"  runat="server"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ForeColor="Red" runat="server" ErrorMessage="La area de trabajo es requerida" ControlToValidate="txtArea" ValidationGroup="Info"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="col-12 col-sm-6 mt-4 mt-sm-0">
                                                                    <asp:TextBox ID="txtCargo" type="text" CssClass="multisteps-form__input form-control" placeholder="Cargo"  runat="server"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ForeColor="Red" runat="server" ErrorMessage="El cargo es requerido" ControlToValidate="txtCargo" ValidationGroup="Info"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                            <div class="button-row d-flex mt-4">
                                                                <button class="btn btn-primary js-btn-prev" type="button" title="Anterior">Anterior</button>
                                                                <asp:Button ID="btnGuardar" OnClick="lnbGuardar_Click" CssClass="btn btn-success ml-auto" ValidationGroup="Info" runat="server" Text="Enviar" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
