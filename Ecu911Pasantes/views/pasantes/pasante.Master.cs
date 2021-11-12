using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecu911Pasantes.views.pasantes
{
    public partial class pasante : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Pasante"] != null)
                {
                    string usulogeado = Session["Pasante"].ToString();
                    string resNom = Session["nombre"].ToString();
                    string resApe = Session["apellido"].ToString();
                    lblNombre.Text = resNom + " " + resApe;
                }
                else
                {
                    Response.Redirect("../../autentificación/index.aspx");
                }
            }
        }

        protected void lnbLogout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("../../autentificación/logout.aspx");
        }
    }
}