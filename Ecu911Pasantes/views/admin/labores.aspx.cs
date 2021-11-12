using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaNegocio;

namespace Ecu911Pasantes.views.admin
{
    public partial class labores : System.Web.UI.Page
    {
        private DataClasses1DataContext dc = new DataClasses1DataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarLabor();
            }
        }
        private void cargarLabor()
        {
            var listaLab = dc.labores();
            if (listaLab != null)
            {
                grvLabores.DataSource = listaLab.ToList();
                grvLabores.DataBind();
            }
        }

        protected void lnbAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/views/admin/labor.aspx");
        }

        protected void grvLabores_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int codigo = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "Editar")
            {
                Response.Redirect("~/views/admin/labores.aspx?cod=" + codigo, true);
            }
            else if (e.CommandName == "Eliminar")
            {
                Tbl_Labores labpe = new Tbl_Labores();
                labpe = cnLabores.obtenerLaboresxId(codigo);
                if (labpe != null)
                {
                    cnLabores.delete(labpe);
                    cargarLabor();
                }
            }
        }
    }
}