﻿using CapaDatos;
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
                TotalesResp();
                TotalAct();
                TotalInac();
                TotalUsu();
                TotalPasantesxUniversidades();
                TotalPasantesxCarrera();
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
        private void TotalPasantesxUniversidades()
        {
            var list = dc.TotalPasantesxUniversidad();
            if (list != null)
            {
                string chartData = "";
                string pasantes = "";
                string universidades = "";
                chartData += "<script>";
                foreach (var item in list)
                {
                    universidades += "\"" + item.Universidad + "\",";
                    pasantes += item.TotalPasantes + ",";
                }
                universidades = universidades.Substring(0, universidades.Length - 1);
                pasantes = pasantes.Substring(0, pasantes.Length - 1);
                chartData += "chartuniversidades = [" + universidades + "]; chartPasantes = [" + pasantes + "]";
                chartData += "</script>";
                ltChartData.Text = chartData;
            }
        }
        private void TotalPasantesxCarrera()
        {
            var list = dc.TotalPasantesxCarrera();
            if (list != null)
            {
                string chartData1 = "";
                string pasantes = "";
                string carreras = "";
                chartData1 += "<script>";
                foreach (var item in list)
                {
                    carreras += "\"" + item.Carrera + "\",";
                    pasantes += item.TotalPasantes + ",";
                }
                carreras = carreras.Substring(0, carreras.Length - 1);
                pasantes = pasantes.Substring(0, pasantes.Length - 1);
                chartData1 += "chartcarreras = [" + carreras + "]; chartPasantes = [" + pasantes + "]";
                chartData1 += "</script>";
                ltChartData1.Text = chartData1;
            }
        }
        private void TotalesResp()
        {
            var resp = dc.TotalResponsables();
            if (resp != null)
            {
                foreach(var item in resp)
                {
                    lblResponsables.Text += item.Responsables;
                };
            }
        }
        private void TotalUsu()
        {
            var usu = dc.TotalUsuarios();
            if (usu != null)
            {
                foreach (var item in usu)
                {
                    lblUsuarios.Text += item.Usuarios;
                };
            }
        }
        private void TotalAct()
        {
            var act = dc.TotalPasantesActivos();
            if (act != null)
            {
                foreach (var item in act)
                {
                    lblActivos.Text += item.Activos;
                };
            }
        }
        private void TotalInac()
        {
            var ina = dc.TotalPasantesInactivos();
            if (ina != null)
            {
                foreach (var item in ina)
                {
                    lblInactivos.Text += item.Inactivos;
                };
            }
        }
    }
}