<%@ Page Title="" Language="C#" MasterPageFile="~/views/admin/admin.Master" AutoEventWireup="true" CodeBehind="actividades.aspx.cs" Inherits="Ecu911Pasantes.views.admin.actividades" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTitle" runat="server">
    Actividades | Admin - Sistema Pasantes
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphCabecera" runat="server">
    <link rel="stylesheet" type="text/css" href="../../resources/src/plugins/sweetalert2/sweetalert2.css" />
    <link rel="stylesheet" type="text/css" href="../../resources/src/plugins/datatables/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" type="text/css" href="../../resources/src/plugins/datatables/css/responsive.bootstrap4.min.css">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMensajes" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphContenido" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="min-height-200px">
                <div class="page-header">
                    <div class="row">
                        <div class="col-md-6 col-sm-12">
                            <div class="title">
                                <h4>Actividades diarias</h4>
                            </div>
                            <nav aria-label="breadcrumb" role="navigation">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="inicio.aspx">Inicio</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Actividades diarias</li>
                                </ol>
                            </nav>
                        </div>

                    </div>
                </div>
                <div class="card-box mb-30">
                    <div class="pd-20">
                        <div class="row">
                            <div class="col-6"></div>
                            <div class="col-6 text-right">
                                <div class="input-group custom">
                                    <asp:TextBox ID="txtBuscar" CssClass="form-control search-input" placeholder="Ingrese el numero de cedula del pasante" runat="server"></asp:TextBox>
                                    <div class="input-group-append custom">
                                        <span class="input-group-text">
                                            <asp:LinkButton ID="lnbBuscar" CssClass="dw dw-search2 search-icon" OnClick="lnbBuscar_Click" runat="server"></asp:LinkButton></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <asp:GridView ID="grvActividades" runat="server" EmptyDataText="No hay datos disponibles en la tabla." AllowPaging="false" AutoGenerateColumns="false" CssClass="table table-centered w-100 dt-responsive nowrap" GridLines="None" Width="100%">
                            <Columns>
                                <asp:TemplateField HeaderText="Cedula">
                                    <ItemTemplate>
                                        <asp:Label ID="Cedula" runat="server" Text='<%#Eval("Cedula")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Apellidos">
                                    <ItemTemplate>
                                        <asp:Label ID="Apellidos" runat="server" Text='<%#Eval("Apellidos")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Nombres">
                                    <ItemTemplate>
                                        <asp:Label ID="Nombres" runat="server" Text='<%#Eval("Nombres")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Actividades">
                                    <ItemTemplate>
                                        <asp:Label ID="Actividades" runat="server" Text='<%#Eval("Actividades")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Fecha">
                                    <ItemTemplate>
                                        <asp:Label ID="Fecha" runat="server" Text='<%#Eval("Fecha")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphFooter" runat="server">
    <script type="text/javascript" src="../../resources/src/plugins/sweetalert2/sweetalert2.all.js"></script>
    <script type="text/javascript" src="../../resources/src/plugins/sweetalert2/sweet-alert.init.js"></script>
    <script type="text/javascript" src="../../resources/src/plugins/datatables/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="../../resources/src/plugins/datatables/js/dataTables.bootstrap4.min.js"></script>
    <script type="text/javascript" src="../../resources/src/plugins/datatables/js/dataTables.responsive.min.js"></script>
    <script type="text/javascript" src="../../resources/src/plugins/datatables/js/responsive.bootstrap4.min.js"></script>
    <script>
        $('document').ready(function () {
            $('#<%=grvActividades.ClientID%>').prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable({
                scrollCollapse: true,
                autoWidth: false,
                responsive: true,
                columnDefs: [{
                    targets: "datatable-nosort",
                    orderable: false,
                }],
                "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "Todos"]],
                "language": {
                    "info": "Mostrando _START_-_END_ de _TOTAL_ Registros",
                    "zeroRecords": "No se encontró nada - lo siento",
                    "lengthMenu": "Mostrar _MENU_ Registros por página",
                    "emptyTable": "No hay datos disponibles en la tabla",
                    "search": "Buscar:",
                    searchPlaceholder: "Buscar",
                    paginate: {
                        next: '<i class="ion-chevron-right"></i>',
                        previous: '<i class="ion-chevron-left"></i>'
                    }
                },
            });
        });
    </script>
</asp:Content>
