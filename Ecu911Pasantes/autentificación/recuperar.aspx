<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="recuperar.aspx.cs" Inherits="Ecu911Pasantes.autentificación.recuperar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Recuperar contraseña | Sistema Pasantes</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
    <meta content="Coderthemes" name="author" />
    <link rel="shortcut icon" href="../resources/images/ECU911.svg.png" />
    <link href="../resources/css/icons.min.css" rel="stylesheet" type="text/css" />
    <link href="../resources/css/app.min.css" rel="stylesheet" type="text/css" />
</head>
<body class="authentication-bg pb-0">
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
                    <h4 class="mt-0">Restablecer la contraseña</h4>
                    <p class="text-muted mb-4">Ingrese su dirección de correo electrónico y le enviaremos un correo electrónico con instrucciones para restablecer su contraseña.</p>
                    <form runat="server">
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                         <asp:Timer ID="Timer1" runat="server" Interval="3000" OnTick="Timer1_Tick"></asp:Timer>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <div class="mb-3">
                                    <label for="emailaddress" class="form-label">Dirección de correo electrónic</label>
                                    <asp:TextBox ID="txtEmail" CssClass="form-control" type="email" required="" placeholder="Ingrese su correo electronico" runat="server"></asp:TextBox>
                                </div>
                                <div class="mb-0 text-center d-grid">
                                    <asp:LinkButton ID="lnbRecuperar" OnClick="lnbRecuperar_Click" CssClass="btn btn-primary" type="submit" runat="server"><i class="mdi mdi-lock-reset"></i>Restablecer la contraseña</asp:LinkButton>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </form>
                    <footer class="footer footer-alt">
                        <p class="text-muted">Volver a<a href="index.aspx" class="text-muted ms-1"><b>Iniciar Sesión</b></a></p>
                    </footer>
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
    <script src="assets/js/vendor.min.js"></script>
    <script src="assets/js/app.min.js"></script>
</body>
</html>
