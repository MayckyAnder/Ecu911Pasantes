<%@ Page Title="" Language="C#" MasterPageFile="~/views/admin/admin.Master" AutoEventWireup="true" CodeBehind="responsables.aspx.cs" Inherits="Ecu911Pasantes.views.admin.responsables" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTitle" runat="server">
    Responsables | Admin - Sistema Pasantes
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
                                <li class="breadcrumb-item"><a href="javascript: void(0);">Responsables</a></li>
                                <li class="breadcrumb-item active">Listado de responsables</li>
                            </ol>
                        </div>
                        <h4 class="page-title">Listado de responsables</h4>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row mb-2">
                                <div class="col-sm-4">
                                    <asp:LinkButton ID="lnbAgregar" OnClick="lnbAgregar_Click" CssClass="btn btn-danger mb-2" runat="server"><i class="mdi mdi-plus-circle me-2"></i>Agregar responsable</asp:LinkButton>
                                </div>
                            </div>
                            <div class="table-responsive">
                                <asp:GridView ID="grvResponsables" AutoGenerateColumns="False" CssClass="table table-centered w-100 dt-responsive nowrap" OnRowCommand="grvResponsables_RowCommand" GridLines="None" Width="100%" runat="server">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Codigo">
                                            <ItemTemplate>
                                                <asp:Label ID="Usu_id" runat="server" Text='<%#Eval("Usu_id")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Usuario">
                                            <ItemTemplate>
                                                <asp:Label ID="Usuario" runat="server" Text='<%#Eval("Usuario")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Nombres">
                                            <ItemTemplate>
                                                <asp:Label ID="Nombres" runat="server" Text='<%#Eval("Nombres")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Apellidos">
                                            <ItemTemplate>
                                                <asp:Label ID="Apellidos" runat="server" Text='<%#Eval("Apellidos")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cedula">
                                            <ItemTemplate>
                                                <asp:Label ID="Cedula" runat="server" Text='<%#Eval("Cedula")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Area">
                                            <ItemTemplate>
                                                <asp:Label ID="Area" runat="server" Text='<%#Eval("Area")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cargo">
                                            <ItemTemplate>
                                                <asp:Label ID="Cargo" runat="server" Text='<%#Eval("Cargo")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Celular">
                                            <ItemTemplate>
                                                <asp:Label ID="Celular" runat="server" Text='<%#Eval("Celular")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Correo">
                                            <ItemTemplate>
                                                <asp:Label ID="Correo" runat="server" Text='<%#Eval("Correo")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-Width="17" HeaderStyle-Width="17" HeaderText="Editar">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnbEditar" Width="16" Height="16" CommandArgument='<%#Eval("Usu_id")%>' CommandName="Editar" runat="server"><i class="mdi mdi-square-edit-outline"></i></asp:LinkButton>
                                            </ItemTemplate>
                                            <HeaderStyle Width="17px" />
                                            <ItemStyle Width="17px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-Width="17" HeaderStyle-Width="17" HeaderText="Eliminar">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnbEliminar" Width="16" Height="16" CommandArgument='<%#Eval("Usu_id")%>' CommandName="Eliminar" OnClientClick="return confirm('Esta seguro que desea eliminar este registro..')" runat="server"><i class="mdi mdi-delete"></i></asp:LinkButton>
                                            </ItemTemplate>
                                            <HeaderStyle Width="17px" />
                                            <ItemStyle Width="17px" />
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
    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%=grvResponsables.ClientID%>').prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable();
                    responsive: true
                });
    </script>
</asp:Content>

