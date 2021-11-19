﻿using CapaDatos;
using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecu911Pasantes.views.pasantes
{
    public partial class hora : System.Web.UI.Page
    {
        private Tbl_Horas horinfo = new Tbl_Horas();
        private DataClasses1DataContext dc = new DataClasses1DataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string usulogeado = Session["Pasante"].ToString();
                bool activo = cnPasantes.autentificarxEstado(Convert.ToInt32(usulogeado));
                if (activo)
                {
                    cargarLabores();
                    lblError.Visible = false;
                    lnbGuardar.Visible = true;
                }
                else
                {
                    Validar();
                    lblError.Visible = true;
                    lblError.Text = "Usted aun no se encuentra habilitado para poder registar sus horas";
                }
            }
        }
        private void cargarLabores()
        {
            string usulogeado = Session["Pasante"].ToString();
            var listaLab = dc.LaboresPorPasante(Convert.ToInt32(usulogeado));
            ddlLabor.DataSource = listaLab.ToList();
            ddlLabor.DataTextField = "ConceptoL";
            ddlLabor.DataValueField = "Labor_id";
            ddlLabor.DataBind();
        }

        private void Guardar()
        {
            try
            {
                horinfo = new Tbl_Horas();
                horinfo.Cantidad = Convert.ToInt32(txtCantidad.Text);
                horinfo.ConceptoH = txtConcepto.Text;
                horinfo.Labor_id = Convert.ToInt32(ddlLabor.SelectedValue);

                cnHoras.save(horinfo);

                string js1 = "alert('Datos Guardados Con Exito..')";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", js1, true);
                Response.Redirect("~/views/pasantes/horas.aspx");
            }
            catch (Exception ex)
            {
                string js1 = "alert('Datos No Guardados.." + ex.Message + "')";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", js1, true);
            }
        }

        protected void lnbCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/views/pasantes/horas.aspx");
        }

        protected void lnbGuardar_Click(object sender, EventArgs e)
        {
            Guardar();
        }
        private void Validar()
        {
            txtCantidad.Enabled = false;
            txtConcepto.Enabled = false;
            ddlLabor.Enabled = false;
            lnbGuardar.Visible = false;
        }
    }
}