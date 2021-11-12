using CapaDatos;
using CapaNegocio;
using System;
using System.Web.UI.WebControls;

namespace Ecu911Pasantes.views.admin
{
    public partial class pasantes : System.Web.UI.Page
    {
        private DataClasses1DataContext dc = new DataClasses1DataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarPasantes();
            }
        }
        private void cargarPasantes()
        {
            var listaPas = dc.UsuariosyPasantes();
            if (listaPas != null)
            {
                grvPasantes.DataSource = listaPas;
                grvPasantes.DataBind();
            }
        }

        protected void lnbAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/views/admin/pasante.aspx");
        }

        protected void grvPasantes_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            int codigo = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "Editar")
            {
                Response.Redirect("~/views/admin/pasante.aspx?cod=" + codigo, true);
            }
            else if (e.CommandName == "Eliminar")
            {
                Tbl_Pasantes pasape = new Tbl_Pasantes();
                Tbl_Usuarios usupe = new Tbl_Usuarios();
                usupe = cnUsuarios.obtenerUsuariosxId(codigo);
                int usu = Convert.ToInt32(usupe.Usu_id.ToString());
                pasape = cnPasantes.obtenerPasantesxUsuario(usu);
                if (usupe != null)
                {
                    cnUsuarios.delete(usupe);
                    if (pasape != null)
                    {
                        cnPasantes.delete(pasape);
                        cargarPasantes();
                    }
                }
            }
        }
    }
}