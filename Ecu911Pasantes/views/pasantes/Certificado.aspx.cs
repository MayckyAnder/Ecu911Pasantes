using CapaDatos;
using CapaNegocio;
using HtmlAgilityPack;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using iTextSharp.tool.xml;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecu911Pasantes.views.pasantes
{
    public partial class Certificado : System.Web.UI.Page
    {
        private Tbl_Pasantes pasinfo = new Tbl_Pasantes();
        private Tbl_Usuarios usuinfo = new Tbl_Usuarios();
        private Tbl_Labores uslabores = new Tbl_Labores();
        private Tbl_Proyecto usProyecto = new Tbl_Proyecto();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblFecha2.Text = DateTime.Now.ToShortDateString();
                lblFecha.Text = DateTime.Now.ToString("dd 'de' MMMM 'del' yyyy ");

                string formato = "<b>d</b> 'de' <b>MMMM</b> 'del' <b>yyyy</b>";

                string usulogeado = Session["Pasante"].ToString();
                int codigo = Convert.ToInt32(Convert.ToInt32(usulogeado));
                usuinfo = cnUsuarios.obtenerUsuariosxId(codigo);
                int usu = Convert.ToInt32(usuinfo.Usu_id.ToString());
                pasinfo = cnPasantes.obtenerPasantesxUsuario(usu);
                int labor = Convert.ToInt32(pasinfo.Pasantes_id);
                uslabores = cnLabores.obtenerLaboresxPasante(labor);
                int proyecto = Convert.ToInt32(uslabores.Proyecto_id);
                usProyecto = cnProyectos.obtenerProyectosxId(proyecto);

                if (usuinfo != null && pasinfo != null && uslabores != null && usProyecto != null)
                {
                    lblNombre.Text = usuinfo.PrimerApellido.ToString() + " " + usuinfo.SegundoApellido.ToString() + " " + usuinfo.PrimerNombre.ToString() + " " + usuinfo.SegundoNombre.ToString() + " ";
                    lblCedula.Text = usuinfo.Cedula.ToString() + " ";
                    LblInicio.Text = " " + pasinfo.Fecha.Equals(formato) + " ";
                    lblFin.Text = " " + DateTime.Now.ToString("<b>d</b> 'de' <b>MMMM</b> 'del' <b>yyyy</b>") + " ";
                    lblCarrera.Text = pasinfo.Carrera.ToString() + " ";
                    lblUniversidad.Text = pasinfo.Universidad.ToString();
                    lblProyectos.Text = usProyecto.Nombre.ToString();
                    lblHoras.Text = uslabores.Nhoras.ToString() + " ";
                }

            } 
        }

        protected void btnExportar_Click(object sender, EventArgs e)
        {
            HtmlNode.ElementsFlags["img"] = HtmlElementFlag.Closed;
            HtmlNode.ElementsFlags["br"] = HtmlElementFlag.Closed;
            using (StringWriter sw = new StringWriter())
            {
                using (HtmlTextWriter hw = new HtmlTextWriter(sw))
                {
                    dvtext.RenderControl(hw);
                    StringReader sr = new StringReader(sw.ToString());
                    Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 10f);
                    PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
                    pdfDoc.Open();
                    XMLWorkerHelper.GetInstance().ParseXHtml(writer, pdfDoc, sr);
                    pdfDoc.Close();
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("content-disposition", "attachment;filename=Certificado_Finalizacion.pdf");
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    Response.Write(pdfDoc);
                    Response.End();
                }
            }
        }
    }
}