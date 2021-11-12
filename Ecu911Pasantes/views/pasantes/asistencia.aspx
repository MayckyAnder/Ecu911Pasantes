<%@ Page Title="" Language="C#" MasterPageFile="~/views/pasantes/pasante.Master" AutoEventWireup="true" CodeBehind="asistencia.aspx.cs" Inherits="Ecu911Pasantes.views.pasantes.asistencia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTitle" runat="server">
    Asistencia | Pasantes - Sistema Pasantes
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphCabecera" runat="server">
    <link href="../../resources/css/vendor/asistencia.css" rel="stylesheet">
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
                                <li class="breadcrumb-item"><a href="javascript: void(0);">Asistencias</a></li>
                                <li class="breadcrumb-item active">Registrar asistencias</li>
                            </ol>
                        </div>
                        <h4 class="page-title">Registrar asistencias</h4>
                    </div>
                </div>
            </div>
            <div id="container" class="container">
                <h2>ASISTENCIA</h2>
                <p>Ingresa tu ID de asistencia</p>
                <asp:TextBox ID="txtAsistencia" type="text" placeholder="ID de asistencia" required="required" runat="server"></asp:TextBox>
                <br />
                <br />
                <asp:TextBox ID="txtActividades" Rows="3" TextMode="MultiLine" CssClass="actividades" type="text" placeholder="Ingrese sus actividades" runat="server"></asp:TextBox>
                <br />
                <asp:Button ID="btnAsistencia" OnClick="btnAsistencia_Click" CssClass="registar" runat="server" Text="Registrar" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphFooter" runat="server">
</asp:Content>
