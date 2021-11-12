using CapaDatos;
using System;
using System.Linq;
using System.Web.UI.WebControls;

namespace Ecu911Pasantes.views.admin
{
    public partial class inicio : System.Web.UI.Page
    {
        private DataClasses1DataContext dc = new DataClasses1DataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarAsistencias();
                //TotalxUniversidades();
            }
        }
        private void cargarAsistencias()
        {
            var query = dc.Asistencias();
            if (query != null)
            {
                grvAsistencias.DataSource = query.ToList();
                grvAsistencias.DataBind();
            }
        }
        //private void TotalxUniversidades()
        //{
        //    var list = dc.Totales();
        //    if (list != null)
        //    {
        //        string chartData = "";
        //        string pasantes = "";
        //        string carreras = "";
        //        string universidades = "";
        //        chartData += "<script>";
        //        foreach (var item in list)
        //        {
        //            universidades += "\"" + item.Universidad + "\",";
        //            pasantes += item.TotalPasantes + ",";
        //            carreras += item.TotalCarreras + ",";
        //        }
        //        universidades = universidades.Substring(0, universidades.Length - 1);
        //        pasantes = pasantes.Substring(0, pasantes.Length - 1);
        //        carreras = carreras.Substring(0, carreras.Length - 1);
        //        chartData += "chartlabels = [" + universidades + "]; chartPasantes = [" + pasantes + "]; chartCarreras = [" + carreras + "]";
        //        chartData += "</script>";
        //        ltChartData.Text = chartData;
        //    }
        //}
    }
}