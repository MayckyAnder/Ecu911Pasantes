﻿using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaNegocio;

namespace Ecu911Pasantes.views.admin
{
    public partial class hora : System.Web.UI.Page
    {
        private Tbl_Horas horinfo = new Tbl_Horas();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request["cod"] != null)
                {
                    int codigo = Convert.ToInt32(Request["cod"]);
                    horinfo = cnHoras.obtenerHorasxId(codigo);
                    
                    if (horinfo != null)
                    {
                        txtCantidad.Text = horinfo.Cantidad.ToString();
                        txtConcepto.Text = horinfo.ConceptoH.ToString();
                        ddlLabor.SelectedValue = horinfo.Labor_id.ToString();
                    }
                }
                cargarLabores();
            }
        }
        private void cargarLabores()
        {
            List<Tbl_Labores> listaLab = new List<Tbl_Labores>();
            listaLab = cnLabores.obtenerLabor();
            listaLab.Insert(0, new Tbl_Labores() { ConceptoL = "Seleccione un labor" });
            ddlLabor.DataSource = listaLab;
            ddlLabor.DataTextField = "ConceptoL";
            ddlLabor.DataValueField = "Labor_id";
            ddlLabor.DataBind();
        }
        private void guardar_modificar_datos(int id)
        {
            horinfo = cnHoras.obtenerHorasxId(id);
            if (horinfo != null)
            {
                modifcar(horinfo);
            }

        }

        private void modifcar(Tbl_Horas horinfo)
        {
            try
            {
                horinfo.Cantidad = Convert.ToInt32(txtCantidad.Text);
                horinfo.ConceptoH = txtConcepto.Text;
                horinfo.Labor_id = Convert.ToInt32(ddlLabor.SelectedValue);

                cnHoras.modify(horinfo);
                string js1 = "alert('Datos Modificados Con Exito..')";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", js1, true);
                Response.Redirect("~/views/admin/horas.aspx");
            }
            catch (Exception ex)
            {
                string js1 = "alert('Datos No Modificados.." + ex.Message + "')";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", js1, true);
            }
        }

        protected void lnbCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/views/admin/horas.aspx");
        }

        protected void lnbGuardar_Click(object sender, EventArgs e)
        {
            guardar_modificar_datos(Convert.ToInt32(Request["cod"]));
        }
    }
}