﻿<%@ Page Title="" Language="C#" MasterPageFile="~/views/admin/admin.Master" AutoEventWireup="true" CodeBehind="labor.aspx.cs" Inherits="Ecu911Pasantes.views.admin.labor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTitle" runat="server">
    Labor | Admin - Sistema Pasantes
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphCabecera" runat="server">
    <link href="../../resources/css/vendor/select2.min.css" rel="stylesheet">
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
                                <li class="breadcrumb-item"><a href="javascript: void(0);">Pasantes</a></li>
                                <li class="breadcrumb-item"><a href="javascript: void(0);">Listado de labores</a></li>
                                <li class="breadcrumb-item active">Crear un labor</li>
                            </ol>
                        </div>
                        <h4 class="page-title">Crear un labor</h4>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-body">
                    <div class="col-12">
                        <div class="row mb-3">
                            <div class="form-floating mb-3">
                                <asp:TextBox ID="txtDescripcion" type="text" CssClass="form-control" required="" placeholder="Ejm.Sistema pasantes" runat="server"></asp:TextBox>
                                <label for="floatingInput">Descripcion</label>
                            </div>
                        </div>
                        <div class="row mb-3" id="pass">
                            <div class="form-floating mb-3">
                                <asp:DropDownList ID="ddlPasantes" CssClass="form-control select2" data-toggle="select2" runat="server">
                                    <asp:ListItem>Seleccione un pasante</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="form-floating mb-3">
                                <asp:DropDownList ID="ddlProyecto" CssClass="form-control select2" data-toggle="select2" runat="server">
                                    <asp:ListItem>Seleccione un proyecto</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="form-floating mb-3">
                                <asp:TextBox ID="txtNumHoras" type="number" CssClass="form-control" required="" placeholder="Ejm.240" runat="server"></asp:TextBox>
                                <label for="floatingInput">Numero de Horas</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-footer align-content-end">
                    <asp:LinkButton ID="lnbCancelar" OnClick="lnbCancelar_Click" CssClass="btn btn-outline-secondary mb-2" runat="server"><i class="mdi mdi-cancel me-2"></i>Regresar</asp:LinkButton>
                    <asp:LinkButton ID="lnbGuardar" CssClass="btn btn-success mb-2" OnClick="lnbGuardar_Click" runat="server"><i class="mdi mdi-send me-2"></i>Enviar</asp:LinkButton>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphFooter" runat="server">
    <script src="../../resources/js/vendor/select2.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#<%=ddlProyecto.ClientID%>').select2();
        });
    </script>
    <script>
        $(document).ready(function () {
            $('#<%=ddlPasantes.ClientID%>').select2();
        });
    </script>
</asp:Content>
