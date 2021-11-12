<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="logout.aspx.cs" Inherits="Ecu911Pasantes.Autentificación.logout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Cierre de sesión | Sistema Pasantes</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta content="A fully featured admin theme which can be used to build CRM, CMS, etc." name="description" />
    <meta content="Coderthemes" name="author" />
    <link rel="shortcut icon" href="../resources/images/ECU911.svg.png" />
    <link href="../resources/css/icons.min.css" rel="stylesheet" type="text/css" />
    <link href="../resources/css/app.min.css" rel="stylesheet" type="text/css" />
</head>
<body class="authentication-bg pb-0">
    <form runat="server">
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
                                <div class="text-center">
                                    <h4 class="mt-0">Hasta luego !</h4>
                                    <p class="text-muted mb-4">Ahora ha salido correctamente.</p>
                                </div>

                                <div class="logout-icon m-auto">
                                    <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                                        viewBox="0 0 161.2 161.2" enable-background="new 0 0 161.2 161.2" xml:space="preserve">
                                        <path class="path" fill="none" stroke="#0acf97" stroke-miterlimit="10" d="M425.9,52.1L425.9,52.1c-2.2-2.6-6-2.6-8.3-0.1l-42.7,46.2l-14.3-16.4
                                    c-2.3-2.7-6.2-2.7-8.6-0.1c-1.9,2.1-2,5.6-0.1,7.7l17.6,20.3c0.2,0.3,0.4,0.6,0.6,0.9c1.8,2,4.4,2.5,6.6,1.4c0.7-0.3,1.4-0.8,2-1.5
                                    c0.3-0.3,0.5-0.6,0.7-0.9l46.3-50.1C427.7,57.5,427.7,54.2,425.9,52.1z" />
                                        <circle class="path" fill="none" stroke="#0acf97" stroke-width="4" stroke-miterlimit="10" cx="80.6" cy="80.6" r="62.1" />
                                        <polyline class="path" fill="none" stroke="#0acf97" stroke-width="6" stroke-linecap="round" stroke-miterlimit="10" points="113,52.8
                                    74.1,108.4 48.2,86.4 " />

                                        <circle class="spin" fill="none" stroke="#0acf97" stroke-width="4" stroke-miterlimit="10" stroke-dasharray="12.2175,12.2175" cx="80.6" cy="80.6" r="73.9" />
                                    </svg>
                                </div>
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
                <script src="../resources/js/vendor.min.js"></script>
                <script src="../resources/js/app.min.js"></script>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
