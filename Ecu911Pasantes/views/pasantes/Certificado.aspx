<%@ Page Title="" Language="C#" MasterPageFile="~/views/pasantes/pasante.Master" AutoEventWireup="true" CodeBehind="Certificado.aspx.cs" Inherits="Ecu911Pasantes.views.pasantes.Certificado" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTitle" runat="server">
    Certificado de Finalizacion | Pasantes - Sistema Pasantes
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
                                <li class="breadcrumb-item"><a href="javascript: void(0);">Documentos</a></li>
                                <li class="breadcrumb-item active">Certificado</li>
                            </ol>
                        </div>
                        <h4 class="page-title">Certificado de Finalización</h4>
                    </div>
                </div>
            </div>

            <%--CERTIFICADO--%>

            <div class="card">
                <div class="card-body">
                    <div class="col-auto p-5 text-center">
                        <div class="col-auto">
                            <img src="../../resources/images/escudo2.PNG" style="width: 1000px; height: 175px;" />
                        </div>
                    </div>
                    <div class="col-auto text-end">
                        <div class="col-auto">
                            <asp:Label ID="Label15" runat="server" Style="align-items: center; text-transform: uppercase; margin-right: 13%"></asp:Label>
                        </div>
                    </div>

                    <br />
                    <br />
                    <h2 style="text-align: center; font-family: Arial">CERTIFICADO</h2>
                    <br />
                    <br />

                    <p class="card-text align-content-center" style="text-align: justify; padding-left: 245px; padding-right: 245px; font-family: Arial">
                        El Servicio Integrado de Seguridad ECU 911 entrega el presente Certificado a
                                            <asp:Label ID="Label16" runat="server" Text="Sosa Bryan" Font-Bold="true"></asp:Label>
                        con cédula de identidad
                                            <asp:Label ID="Label17" runat="server" Text="1725431397" Font-Bold="true"></asp:Label>
                        estudiante de 
                                            <asp:Label ID="Label18" runat="server" Text="Desarrollo de Software" Font-Bold="true"></asp:Label>
                        de la Universidad
                                            <asp:Label ID="Label19" runat="server" Text="Tecnologico Superior Cordillera" Font-Bold="true"></asp:Label>, 
                                            por haber formado parte del Proyecto Académico
                                            <asp:Label ID="Label20" runat="server" Text="“Desarrollo del sistema para registro de 
                                                horas de las y los estudiantes que realizan proyectos académicos en el ECU 911, Desarrollo del sistema médico del ECU 911"
                                                Font-Bold="true"></asp:Label>
                        con una duración de
                                            <asp:Label ID="Label21" runat="server" Text="240" Font-Bold="true"></asp:Label>
                        horas, 
                                            a partir del
                                            <asp:Label ID="Label22" runat="server" Text="02 de Agosto del 2021" Font-Bold="true"></asp:Label>
                        al
                                            <asp:Label ID="Label23" runat="server" Text="10 de Noviembre del 2021" Font-Bold="true"></asp:Label>

                        <br />
                        <br />

                        Durante este periodo demostró su colaboración y responsabilidad en lo encomendado.

                                            <br />
                        <br />

                        Es todo cuanto se puede declarar en honor a la verdad. El interesado puede hacer uso del presente certificado
                                            para los fines pertinentes.

                                            <br />
                        <br />

                        Se expide el presente certificado para los fines pertinentes.
                                            
                                            <br />
                        <br />

                        Atentamente,

                                            <br />
                        <br />

                        <div class="col-auto p-5 text-center">
                            <div class="col-auto">
                                <img src="../../resources/images/firmas.PNG" style="width: 1000px; height: 175px;" />
                            </div>
                        </div>
                        <br />
                        <div class="text-right" style="border: solid 1px; width: 250px; height: 100px; box-shadow: -10px -10px 1px gray;">
                            <div class="col-auto">
                                <label style="text-align: center; font-size: 11px">
                                    Dirección Nacional Académico para Emergencias Subdirección Técnica de Doctrina<br />
                                    Fecha:
                                    <asp:Label ID="Label24" runat="server" Font-Bold="true"></asp:Label><br />
                                    <asp:Label ID="Label25" runat="server" Font-Bold="true" Text="UIO-DNAE-VIN-0323-R "></asp:Label>
                                </label>
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="col-auto p-5 text-center">
                            <div class="col-auto">
                                <img src="../../resources/images/final.png" style="width: 800px; height: 125px;" />
                            </div>
                        </div>
                        <p>
                        </p>
                        <p>
                        </p>
                        <p>
                        </p>
                    </p>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphFooter" runat="server">
</asp:Content>
