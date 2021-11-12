<%@ Page Title="" Language="C#" MasterPageFile="~/views/pasantes/pasante.Master" AutoEventWireup="true" CodeBehind="contraseña.aspx.cs" Inherits="Ecu911Pasantes.views.pasantes.contraseña" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitle" runat="server">
    Cambio de contraseña | Pasantes - Sistema Pasantes
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
                                <li class="breadcrumb-item"><a href="javascript: void(0);">Contraseña</a></li>
                                <li class="breadcrumb-item active">Cambio de contraseña</li>
                            </ol>
                        </div>
                        <h4 class="page-title">Cambio de contraseña</h4>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">
                        <asp:Label ID="lblPasante" runat="server" Text=""></asp:Label></h5>
                    <div class="row">
                        <div class="col-12">
                            <div class="mb-3">
                                <label for="password" class="form-label">Contraseña anterior</label>
                                <div class="input-group input-group-merge">
                                    <asp:TextBox ID="txtActual" CssClass="form-control" type="password" required="" placeholder="Ingrese su contraseña anterior" runat="server"></asp:TextBox>
                                    <div class="input-group-text" data-password="false">
                                        <span class="password-eye"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Nueva contraseña</label>
                                <div class="input-group input-group-merge">
                                    <asp:TextBox ID="txtPass" CssClass="form-control" type="password" required="" placeholder="Ingrese su nueva contraseña" runat="server"></asp:TextBox>
                                    <div class="input-group-text" data-password="false">
                                        <span class="password-eye"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="password" class="form-label">Confirmar contraseña</label>
                                <div class="input-group input-group-merge">
                                    <asp:TextBox ID="txtConfirmar" CssClass="form-control" type="password" required="" placeholder="Confirme su nueva contraseña" runat="server"></asp:TextBox>
                                    <div class="input-group-text" data-password="false">
                                        <span class="password-eye"></span>
                                    </div>
                                </div>
                                <asp:CompareValidator ID="CompareValidator1" ControlToCompare="txtConfirmar" ControlToValidate="txtPass" Type="String" Operator="Equal" Display="Dynamic" runat="server" ErrorMessage="Los valores ingresados no son iguales" SetFocusOnError="True" Text="Las claves ingresadas son distintas"></asp:CompareValidator>
                            </div>
                        </div>
                        <div class="mb-3">
                            <asp:LinkButton ID="lnbGuardar" type="submit" CssClass="btn btn-success mb-2" OnClick="lnbGuardar_Click" runat="server"><i class="mdi mdi-send me-2"></i>Guardar Cambios</asp:LinkButton>
                        </div>
                    </div>
                </div>
                <footer>
                    <footer class="footer footer-alt">
                        <asp:Label ID="lblMensaje" CssClass="alert alert-success" runat="server" Text=""></asp:Label>
                        <asp:Label ID="lblError" CssClass="alert alert-danger" runat="server" Text=""></asp:Label>
                    </footer>
                </footer>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphFooter" runat="server">
</asp:Content>
