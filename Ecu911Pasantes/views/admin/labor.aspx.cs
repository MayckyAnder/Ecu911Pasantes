using CapaDatos;
using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecu911Pasantes.views.admin
{
    public partial class labor : System.Web.UI.Page
    {
        private Tbl_Labores labinfo = new Tbl_Labores();
        private DataClasses1DataContext dc = new DataClasses1DataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request["cod"] != null)
                {
                    int codigo = Convert.ToInt32(Request["cod"]);
                    labinfo = cnLabores.obtenerLaboresxId(codigo);
                    if (labinfo != null)
                    {
                        txtDescripcion.Text = labinfo.ConceptoL.ToString();
                        ddlPasantes.SelectedValue = labinfo.Pasantes_id.ToString();
                        ddlProyecto.SelectedValue = labinfo.Proyecto_id.ToString();
                        txtNumHoras.Text = labinfo.Nhoras.ToString();
                    }
                }
                cargarPasantes();
                cargarProyectos();
            }
        }
        private void cargarProyectos()
        {
            List<Tbl_Proyecto> listaPro = new List<Tbl_Proyecto>();
            listaPro = cnProyectos.obtenerProyectos();
            listaPro.Insert(0, new Tbl_Proyecto() { Nombre = "Seleccione un proyecto" });
            ddlProyecto.DataSource = listaPro;
            ddlProyecto.DataTextField = "Nombre";
            ddlProyecto.DataValueField = "Proyecto_id";
            ddlProyecto.DataBind();
        }

        private void cargarPasantes()
        {
            var listaPro = dc.pasantes();
            ddlPasantes.DataSource = listaPro.ToList();
            ddlPasantes.DataTextField = "Pasantes";
            ddlPasantes.DataValueField = "Pasantes_id";
            ddlPasantes.DataBind();
        }

        private void guardar_modificar_datos(int id)
        {
            if (id == 0)
            {
                Guardar();
            }
            else
            {
                labinfo = cnLabores.obtenerLaboresxId(id);
                if (labinfo != null)
                {
                    modifcar(labinfo);
                }
            }
        }

        private void modifcar(Tbl_Labores labinfo)
        {
            try
            {
                labinfo.ConceptoL = txtDescripcion.Text;
                labinfo.Pasantes_id = Convert.ToInt32(ddlPasantes.SelectedValue);
                labinfo.Proyecto_id = Convert.ToInt32(ddlProyecto.SelectedValue);
                labinfo.Nhoras = Convert.ToInt32(txtNumHoras.Text);

                cnLabores.modify(labinfo);
                string js1 = "alert('Datos Modificados Con Exito..')";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", js1, true);
                Response.Redirect("~/views/admin/labores.aspx");
            }
            catch (Exception ex)
            {
                string js1 = "alert('Datos No Modificados.." + ex.Message + "')";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", js1, true);
            }
        }

        private void Guardar()
        {
            try
            {
                labinfo = new Tbl_Labores();
                labinfo.ConceptoL = txtDescripcion.Text;
                labinfo.Pasantes_id = Convert.ToInt32(ddlPasantes.SelectedValue);
                labinfo.Proyecto_id = Convert.ToInt32(ddlProyecto.SelectedValue);
                labinfo.Nhoras = Convert.ToInt32(txtNumHoras.Text);

                cnLabores.save(labinfo);
                string js1 = "alert('Datos Guardados Con Exito..')";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", js1, true);
                Response.Redirect("~/views/admin/labores.aspx");
            }
            catch (Exception ex)
            {
                string js1 = "alert('Datos No Guardados.." + ex.Message + "')";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", js1, true);
            }
        }

        protected void lnbCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/views/admin/labores.aspx");
        }

        protected void lnbGuardar_Click(object sender, EventArgs e)
        {
            guardar_modificar_datos(Convert.ToInt32(Request["cod"]));
        }
    }
}