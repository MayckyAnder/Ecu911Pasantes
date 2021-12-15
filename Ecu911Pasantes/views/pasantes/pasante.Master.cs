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
                if (Session["PASANTE"] != null)
                {
                    string usulogeado = Session["PASANTE"].ToString();
                    string pasNom = Session["nombre"].ToString();
                    string pasApe = Session["apellido"].ToString();
                    string pasRol = Session["rol"].ToString();
                    lblNombre.Text = pasNom + " " + pasApe;
                    //lblRol.Text = pasRol;
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
            Response.Redirect("../../autentificación/index.aspx");
        }
    }
}