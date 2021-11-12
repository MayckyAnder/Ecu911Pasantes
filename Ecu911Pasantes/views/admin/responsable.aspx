<%@ Page Title="" Language="C#" MasterPageFile="~/views/admin/admin.Master" AutoEventWireup="true" CodeBehind="responsable.aspx.cs" Inherits="Ecu911Pasantes.views.admin.responsable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTitle" runat="server">
    Responsable | Admin - Sistema Pasantes
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphCabecera" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMensajes" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphContenido" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box">
                        <div class="page-title-right">
                            <ol class="breadcrumb m-0">
                                <li class="breadcrumb-item"><a href="javascript: void(0);">Inicio</a></li>
                                <li class="breadcrumb-item"><a href="javascript: void(0);">Responsables</a></li>
                                <li class="breadcrumb-item"><a href="javascript: void(0);">Listado de responsables</a></li>
                                <li class="breadcrumb-item active">Crear un responsable</li>
                            </ol>
                        </div>
                        <h4 class="page-title">Crear un responsable</h4>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <div id="progressbarwizard">
                        <ul class="nav nav-pills nav-justified form-wizard-header mb-3">
                            <li class="nav-item">
                                <a href="#account-2" data-bs-toggle="tab" data-toggle="tab" class="nav-link rounded-0 pt-2 pb-2">
                                    <i class="mdi mdi-account-circle me-1"></i>
                                    <span class="d-none d-sm-inline">Cuenta</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="#profile-tab-2" data-bs-toggle="tab" data-toggle="tab" class="nav-link rounded-0 pt-2 pb-2">
                                    <i class="mdi mdi-face-profile me-1"></i>
                                    <span class="d-none d-sm-inline">Perfil</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="#finish-2" data-bs-toggle="tab" data-toggle="tab" class="nav-link rounded-0 pt-2 pb-2">
                                    <i class="mdi mdi-checkbox-marked-circle-outline me-1"></i>
                                    <span class="d-none d-sm-inline">Finalizar</span>
                                </a>
                            </li>
                        </ul>
                        <div class="tab-content b-0 mb-0">
                            <div id="bar" class="progress mb-3" style="height: 7px;">
                                <div class="bar progress-bar progress-bar-striped progress-bar-animated bg-success"></div>
                            </div>
                            <div class="tab-pane" id="account-2">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="row mb-3">
                                            <div class="form-floating mb-3">
                                                <asp:TextBox ID="txtUser" type="text" CssClass="form-control" required="" placeholder="ander23" runat="server"></asp:TextBox>
                                                <label for="floatingInput">Nombre de usuario</label>
                                            </div>
                                        </div>
                                        <div class="row mb-3" id="pass">
                                            <div class="form-floating mb-3">
                                                <asp:TextBox ID="txtPass" type="password" CssClass="form-control" required="" placeholder="*****" runat="server"></asp:TextBox>
                                                <label for="floatingInput">Contraseña</label>
                                            </div>
                                        </div>
                                        <div class="row mb-3">
                                            <div class="form-floating mb-3">
                                                <asp:TextBox ID="txtConfirmar" type="password" CssClass="form-control" required="" placeholder="*****" runat="server"></asp:TextBox>
                                                <label for="floatingInput">Confirmar contraseña</label>
                                            </div>
                                            <asp:CompareValidator ID="CompareValidator1" ControlToCompare="txtConfirmar" ControlToValidate="txtPass" Type="String" Operator="Equal" Display="Dynamic" runat="server" ErrorMessage="Los valores ingresados no son iguales" SetFocusOnError="True" Text="Las claves ingresadas son distintas"></asp:CompareValidator>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="profile-tab-2">
                                <div class="row">
                                    <div class="col-4">
                                        <div class="form-floating mb-3">
                                            <asp:TextBox ID="txtCedula" type="number" CssClass="form-control" placeholder="Ejm.1234567890" required="" runat="server"></asp:TextBox>
                                            <label for="floatingInput">Cedula</label>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="form-floating mb-3">
                                            <asp:TextBox ID="txtNombre" type="text" CssClass="form-control" placeholder="Ejm.Jose Maria" required="" runat="server"></asp:TextBox>
                                            <label for="floatingInput">Nombres</label>
                                        </div>
                                    </div>
                                    <div class="col-4">
                                        <div class="form-floating mb-3">
                                            <asp:TextBox ID="txtApellido" type="text" CssClass="form-control" placeholder="Ejm.Garcia Lopez" required="" runat="server"></asp:TextBox>
                                            <label for="floatingInput">Apellidos</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-6">
                                        <div class="form-floating mb-3">
                                            <asp:TextBox ID="txtEmail" type="email" CssClass="form-control" placeholder="Ejm.name@example.com" required="" runat="server"></asp:TextBox>
                                            <label for="floatingInput">Correo Electronico</label>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-floating mb-3">
                                            <asp:TextBox ID="txtCargo" type="text" CssClass="form-control" placeholder="Ejm.Gerente" required="" runat="server"></asp:TextBox>
                                            <label for="floatingInput">Cargo</label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-6">
                                        <div class="form-floating mb-3">
                                            <asp:TextBox ID="txtArea" type="text" CssClass="form-control" placeholder="Ejm.Talento humano" required="" runat="server"></asp:TextBox>
                                            <label for="floatingInput">Area</label>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-floating mb-3">
                                            <asp:TextBox ID="txtCelular" type="number" CssClass="form-control phone-number" placeholder="Ejm.0987456123" required="" runat="server"></asp:TextBox>
                                            <label for="floatingInput">Celular</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="finish-2">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="text-center">
                                            <h2 class="mt-0"><i class="mdi mdi-check-all"></i></h2>
                                            <h3 class="mt-0">Ultimo paso!</h3>
                                            <asp:Label ID="lblInfo" CssClass="w-75 mb-2 mx-auto" runat="server" Text="De un click en el boton enviar para terminar con el registro de la informacion del responsable"></asp:Label>
                                            <div class="mb-3">
                                                <asp:LinkButton ID="lnbGuardar" CssClass="btn btn-success mb-2" OnClick="lnbGuardar_Click" runat="server"><i class="mdi mdi-send me-2"></i>Enviar</asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <ul class="list-inline mb-0 wizard">
                                <li class="list-inline-item">
                                    <asp:LinkButton ID="lnbCancelar" OnClick="lnbCancelar_Click" CssClass="btn btn-outline-secondary mb-2" runat="server"><i class="mdi mdi-cancel me-2"></i>Regresar</asp:LinkButton>
                                </li>
                                <li class="next list-inline-item float-end" style="margin-left: 2px">
                                    <a href="#" type="button" class="btn btn-info">Siguiente<i class="mdi mdi-arrow-right-bold-outline me-2"></i></a>
                                </li>
                                <li class="previous list-inline-item float-end">
                                    <a href="#" class="btn btn-info"><i class="mdi mdi-arrow-left-bold-outline me-2"></i>Previo</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphFooter" runat="server">
    <script src="../../resources/js/pages/demo.form-wizard.js"></script>
</asp:Content>
