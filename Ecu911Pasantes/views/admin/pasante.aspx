<%@ Page Title="" Language="C#" MasterPageFile="~/views/admin/admin.Master" AutoEventWireup="true" CodeBehind="pasante.aspx.cs" Inherits="Ecu911Pasantes.views.admin.pasante" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTitle" runat="server">
    Pasante | Admin - Sistema Pasantes
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
                                <h4>Registrar un pasante</h4>
                            </div>
                            <nav aria-label="breadcrumb" role="navigation">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="inicio.aspx">Inicio</a></li>
                                    <li class="breadcrumb-item"><a href="proyectos.aspx">Listado de pasantes</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Registrar un pasante</li>
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
                                                                    <asp:TextBox ID="txtUser" CssClass="multisteps-form__input form-control"  placeholder="Nombre de usuario" runat="server"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ErrorMessage="El nombre de usuario es requerido" ControlToValidate="txtUser" ValidationGroup="Info"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="col-12 col-sm-6 mt-4 mt-sm-0">
                                                                    <asp:TextBox ID="txtEmail" TextMode="Email" CssClass="multisteps-form__input form-control" placeholder="Correo electrónico"  runat="server"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ErrorMessage="El correo electrónico es requerido" ControlToValidate="txtEmail" ValidationGroup="Info"></asp:RequiredFieldValidator>
                                                                    <br />
                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red" ErrorMessage="El correo ingresado no es valido" ControlToValidate="txtEmail" ValidationGroup="Info" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>
                                                            <div class="form-row mt-4">
                                                                <div class="col-12 col-sm-6">
                                                                    <asp:TextBox ID="txtPass" TextMode="Password" CssClass="multisteps-form__input form-control"  placeholder="Contraseña" runat="server"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" ErrorMessage="La contraseña es requerida" ControlToValidate="txtPass"  ValidationGroup="Info"></asp:RequiredFieldValidator>
                                                                    <%--<br />
                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ForeColor="Red" ErrorMessage="Contraseña invalida:Debe tener al menos 10 caracteres,
                                                                        Debe contener al menos una letra minúscula, una letra mayúscula, un dígito y un carácter especial y Los caracteres especiales válidos son - @ # $% ^ & + =" ControlToValidate="txtPass" ValidationGroup="Info" ValidationExpression="^.*(?=.{10,})(?=.*\D)(?=.*[Az])(?=.*[AZ])(?=.*[@#$%^&+=_-]).*$"></asp:RegularExpressionValidator>--%>                    
                                                                </div>
                                                                <div class="col-12 col-sm-6 mt-4 mt-sm-0">
                                                                    <asp:TextBox ID="txtConfirmar" TextMode="Password" CssClass="multisteps-form__input form-control"  placeholder="Repetir contraseña" runat="server"></asp:TextBox>
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
                                                                    <asp:TextBox ID="txtCedula" TextMode="Phone" MaxLength="10" CssClass="multisteps-form__input form-control" placeholder="Cedula"  runat="server"></asp:TextBox>
                                                                    <asp:CustomValidator ID="CustomValidator1" runat="server" ForeColor="Red" ErrorMessage="Ya existe una persona registrado con ese numero de cedula" ControlToValidate="txtCedula" ValidationGroup="Info" OnServerValidate="CustomValidator1_ServerValidate" Display="Dynamic"></asp:CustomValidator>
                                                                    <br />
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ForeColor="Red" runat="server" ErrorMessage="La cedula es requerida" ControlToValidate="txtCedula" ValidationGroup="Info"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="col-12 col-sm-4">
                                                                    <asp:TextBox ID="txtNombre"  CssClass="multisteps-form__input form-control" placeholder="Nombres"  runat="server"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ForeColor="Red" runat="server" ErrorMessage="Los nombres son requeridos" ControlToValidate="txtNombre" ValidationGroup="Info"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="col-12 col-sm-4 mt-4 mt-sm-0">
                                                                    <asp:TextBox ID="txtApellido"  CssClass="multisteps-form__input form-control" placeholder="Apellidos"  runat="server"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ForeColor="Red" runat="server" ErrorMessage="Los apellidos son requeridos" ControlToValidate="txtApellido" ValidationGroup="Info"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                            <div class="form-row mt-4">
                                                                <div class="col-12 col-sm-4">
                                                                    <asp:TextBox ID="txtDireccion"  CssClass="multisteps-form__input form-control" placeholder="Dirección"  runat="server"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ForeColor="Red" runat="server" ErrorMessage="La dirección es requerida" ControlToValidate="txtDireccion" ValidationGroup="Info"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="col-12 col-sm-4 mt-4 mt-sm-0">
                                                                    <asp:TextBox ID="txtCelular" TextMode="Phone" MaxLength="10" CssClass="multisteps-form__input form-control phone-number" placeholder="Celular"  runat="server"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ForeColor="Red" runat="server" ErrorMessage="El celular es requerido" ControlToValidate="txtCelular" ValidationGroup="Info"></asp:RequiredFieldValidator>
                                                                    <br />
                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ForeColor="Red" ErrorMessage="Ingrese correctamente su numero de telefono" ControlToValidate="txtCelular" ValidationGroup="Info" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                                                </div>
                                                                <div class="col-12 col-sm-4 mt-4 mt-sm-0">
                                                                    <asp:TextBox ID="txtArea"  CssClass="multisteps-form__input form-control" placeholder="Area designada"  runat="server"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ForeColor="Red" runat="server" ErrorMessage="La area designada es requerida" ControlToValidate="txtArea" ValidationGroup="Info"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                            <div class="form-row mt-4">
                                                                <div class="col-12 col-sm-4">
                                                                    <asp:TextBox ID="txtUniversidad"  CssClass="multisteps-form__input form-control" placeholder="Universidad"  runat="server"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ForeColor="Red" runat="server" ErrorMessage="La universidad es requerida" ControlToValidate="txtUniversidad" ValidationGroup="Info"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="col-12 col-sm-4 mt-4 mt-sm-0">
                                                                    <asp:TextBox ID="txtCarrera"  CssClass="multisteps-form__input form-control" placeholder="Carrera"  runat="server"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ForeColor="Red" runat="server" ErrorMessage="La carrera es requerida" ControlToValidate="txtCarrera" ValidationGroup="Info"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="col-12 col-sm-4 mt-4 mt-sm-0">
                                                                    <asp:TextBox ID="txtNivel"  CssClass="multisteps-form__input form-control" placeholder="Nivel de semestre"  runat="server"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator13" ForeColor="Red" runat="server" ErrorMessage="El nivel de semestre es requerido" ControlToValidate="txtNivel" ValidationGroup="Info"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                            <div class="form-row mt-4">
                                                                <div class="col-12 col-sm-4">
                                                                    <asp:DropDownList ID="ddlActividad" CssClass="multisteps-form__input form-control" runat="server">
                                                                        <asp:ListItem Value="0">Selecciona una actividad</asp:ListItem>
                                                                        <asp:ListItem Value="Vinculación">Vinculación</asp:ListItem>
                                                                        <asp:ListItem Value="prácticas">prácticas</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" ForeColor="Red" runat="server" ErrorMessage="La actividad es requerida" ControlToValidate="ddlActividad" InitialValue="0" ValidationGroup="Info"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="col-12 col-sm-4 mt-4 mt-sm-0">
                                                                    <asp:TextBox ID="txtCodPa"  CssClass="multisteps-form__input form-control" placeholder="Codigo de asistencia"  runat="server"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" ForeColor="Red" runat="server" ErrorMessage="El codigo de asistencia es requerido" ControlToValidate="txtCodPa" ValidationGroup="Info"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <div class="col-12 col-sm-4 mt-4 mt-sm-0">
                                                                    <asp:TextBox ID="txtCodEcu" CssClass="multisteps-form__input form-control" placeholder="Codigo del Ecu"  runat="server"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" ForeColor="Red" runat="server" ErrorMessage="El codigo del Ecu es requerido" ControlToValidate="txtCodEcu" ValidationGroup="Info"></asp:RequiredFieldValidator>
                                                                </div>
                                                            </div>
                                                            <div class="button-row d-flex mt-4">
                                                                <button class="btn btn-primary js-btn-prev" type="button" title="Prev">Anterior</button>
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
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnGuardar"/>
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphFooter" runat="server">
    <script type="text/javascript" src="../../resources/vendors/scripts/function.js"></script>
    <script type="text/javascript" src="../../resources/src/plugins/sweetalert2/sweetalert2.all.js"></script>
    <script type="text/javascript" src="../../resources/src/plugins/sweetalert2/sweet-alert.init.js"></script>
</asp:Content>
