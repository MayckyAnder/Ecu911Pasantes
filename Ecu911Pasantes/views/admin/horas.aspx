<%@ Page Title="" Language="C#" MasterPageFile="~/views/admin/admin.Master" AutoEventWireup="true" CodeBehind="horas.aspx.cs" Inherits="Ecu911Pasantes.views.admin.horas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTitle" runat="server">
    Horas | Admin - Sistema Pasantes
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
                                <li class="breadcrumb-item"><a href="javascript: void(0);">Pasantes</a></li>
                                <li class="breadcrumb-item active">Listado de horas</li>
                            </ol>
                        </div>
                        <h4 class="page-title">Listado de horas</h4>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive">
                                <asp:GridView ID="grvHoras" OnRowCommand="grvHoras_RowCommand" AutoGenerateColumns="false" Width="100%" CssClass="table table-centered w-100 dt-responsive nowrap" GridLines="None" runat="server">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Codigo">
                                            <ItemTemplate>
                                                <asp:Label ID="Horas_id" runat="server" Text='<%#Eval("Horas_id")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Descipción">
                                            <ItemTemplate>
                                                <asp:Label ID="ConceptoH" runat="server" Text='<%#Eval("ConceptoH")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Cantidad de Horas">
                                            <ItemTemplate>
                                                <asp:Label ID="Cantidad" runat="server" Text='<%#Eval("Cantidad")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Pasante">
                                            <ItemTemplate>
                                                <asp:Label ID="Pasante" runat="server" Text='<%#Eval("Pasante")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Fecha">
                                            <ItemTemplate>
                                                <asp:Label ID="Fecha" runat="server" Text='<%#Eval("Fecha")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Labor">
                                            <ItemTemplate>
                                                <asp:Label ID="ConceptoL" runat="server" Text='<%#Eval("ConceptoL")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Estado">
                                            <ItemTemplate>
                                                <asp:Label ID="Estado" runat="server" Text='<%#Eval("Estado")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-Width="17" HeaderStyle-Width="17" HeaderText="Editar">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnbEditar" Width="16" Height="16" CommandArgument='<%#Eval("Horas_id")%>' CommandName="Editar" runat="server"><i class="mdi mdi-square-edit-outline"></i></asp:LinkButton>
                                            </ItemTemplate>
                                            <HeaderStyle Width="17px" />
                                            <ItemStyle Width="17px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-Width="17" HeaderStyle-Width="17" HeaderText="Eliminar">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnbEliminar" Width="16" Height="16" CommandArgument='<%#Eval("Horas_id")%>' CommandName="Eliminar" OnClientClick="return confirm('Esta seguro que desea eliminar este registro..')" runat="server"><i class="mdi mdi-delete"></i></asp:LinkButton>
                                            </ItemTemplate>
                                            <HeaderStyle Width="17px" />
                                            <ItemStyle Width="17px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-Width="17" HeaderStyle-Width="17" HeaderText="Actualizar">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnbActualizar" Width="16" Height="16" CommandArgument='<%#Eval("Horas_id")%>' CommandName="Actualizar" OnClientClick="return confirm('Esta seguro que desea validar esta hora..')" runat="server"><i class="mdi mdi-check-decagram"></i></asp:LinkButton>
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
        <%--<Triggers>
            <asp:PostBackTrigger ControlID="lnbActualizar"/>
        </Triggers>--%>
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
            $('#<%=grvHoras.ClientID%>').prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable();
                    responsive: true
                });
    </script>
</asp:Content>
