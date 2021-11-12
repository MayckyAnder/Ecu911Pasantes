<%@ Page Title="" Language="C#" MasterPageFile="~/views/admin/admin.Master" AutoEventWireup="true" CodeBehind="completadas.aspx.cs" Inherits="Ecu911Pasantes.views.admin.completadas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTitle" runat="server">
    Horas Completadas | Admin - Sistema Pasantes
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphCabecera" runat="server">
    <link href="../../resources/css/vendor/dataTables.bootstrap5.css" rel="stylesheet" type="text/css">
    <link href="../../resources/css/vendor/responsive.bootstrap5.css" rel="stylesheet" type="text/css">
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
                                <li class="breadcrumb-item"><a href="javascript: void(0);">Reportes</a></li>
                                <li class="breadcrumb-item active">Listado de horas completadas</li>
                            </ol>
                        </div>
                        <h4 class="page-title">Listado de horas completadas</h4>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <asp:GridView ID="grvNumHoras" runat="server" AllowPaging="false" AutoGenerateColumns="false" CssClass="table table-centered w-100 dt-responsive nowrap" GridLines="None" Width="100%">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Pasante">
                                            <ItemTemplate>
                                                <asp:Label ID="Pasante" runat="server" Text='<%#Eval("Pasante")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Labor">
                                            <ItemTemplate>
                                                <asp:Label ID="ConceptoL" runat="server" Text='<%#Eval("ConceptoL")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Horas a Cumplir">
                                            <ItemTemplate>
                                                <asp:Label ID="Nhoras" runat="server" Text='<%#Eval("Nhoras")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Horas cumplidas">
                                            <ItemTemplate>
                                                <asp:Label ID="HorasA" runat="server" Text='<%#Eval("HorasA")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphFooter" runat="server">
    <script src="../../resources/js/vendor/jquery.dataTables.min.js"></script>
    <script src="../../resources/js/vendor/dataTables.bootstrap5.js"></script>
    <script src="../../resources/js/vendor/dataTables.responsive.min.js"></script>
    <script src="../../resources/js/vendor/responsive.bootstrap5.min.js"></script>
    <script src="../../resources/js/vendor/dataTables.checkboxes.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#<%=grvNumHoras.ClientID%>').prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable();
            responsive: true
        });
    </script>
</asp:Content>
