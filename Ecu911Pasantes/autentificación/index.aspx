<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Ecu911Pasantes.autentificación.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="es">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Inicio de Sesión | Sistema Pasantes</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
    <meta content="Coderthemes" name="author" />
    <link rel="shortcut icon" href="../resources/images/ECU911.svg.png" />
    <link href="../resources/css/icons.min.css" rel="stylesheet" type="text/css" />
    <link href="../resources/css/app.min.css" rel="stylesheet" type="text/css" />
</head>
<body class="authentication-bg pb-0">
    <form action="#" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="auth-fluid">
                    <div class="auth-fluid-form-box">
                        <div class="align-items-center d-flex h-100">
                            <div class="card-body">
                                <div class="auth-brand text-center text-lg-start">
                                    <a href="javascript: void(0);" class="logo-dark">
                                        <span>
                                            <img src="../resources/images/ECU911.SVG.PNG" alt="" height="100" /></span>
                                    </a>
                                </div>
                                <h4 class="mt-0">Iniciar Sesión</h4>
                                <p class="text-muted mb-4">Ingrese su nombre de usuario y contraseña para acceder a su cuenta.</p>
                                <div class="mb-3">
                                    <label for="emailaddress" class="form-label">Nombre de usuario</label>
                                    <asp:TextBox ID="txtUser" CssClass="form-control" type="text" required="" placeholder="Ingrese su nombre de usuario" runat="server"></asp:TextBox>
                                </div>
                                <div class="mb-3">
                                    <a href="recuperar.aspx" class="text-muted float-end"><small>Olvidates tu contraseña?</small></a>
                                    <label for="password" class="form-label">Contraseña</label>
                                    <div class="input-group input-group-merge">
                                        <asp:TextBox ID="txtPass" CssClass="form-control" type="password" required="" placeholder="Ingrese su contraseña" runat="server"></asp:TextBox>
                                        <div class="input-group-text" data-password="false">
                                            <span class="password-eye"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input" id="checkbox-signin" />
                                        <label class="form-check-label" for="checkbox-signin">Recuérdame</label>
                                    </div>
                                </div>
                                <div class="d-grid mb-0 text-center">
                                    <asp:LinkButton ID="lnbIngresar" OnClick="lnbIngresar_Click" class="btn btn-primary" type="submit" runat="server"><i class="mdi mdi-login"></i>Iniciar Sesión</asp:LinkButton>
                                </div>
                                <!-- Footer-->
                                <%--<footer class="footer footer-alt">
                        <p class="text-muted">Don't have an account? <a href="pages-register-2.html" class="text-muted ms-1"><b>Sign Up</b></a></p>
                    </footer>--%>
                            </div>
                        </div>
                    </div>
                    <div class="auth-fluid-right text-center">
                        <div class="auth-user-testimonial">
                            <h2 class="mb-3">I love the color!</h2>
                            <p class="lead">
                                <i class="mdi mdi-format-quote-open"></i>It's a elegent templete. I love it very much! . <i class="mdi mdi-format-quote-close"></i>
                            </p>
                            <p>
                                - Sistema Pasantes
                            </p>
                        </div>
                    </div>
                </div>
                <script src="../resources/js/vendor.min.js"></script>
                <script src="../resources/js/app.min.js"></script>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
