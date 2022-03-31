using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecu911Pasantes.views.admin
{
    public partial class actividades : System.Web.UI.Page
    {
        private DataClasses1DataContext dc = new DataClasses1DataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }

        protected void lnbBuscar_Click(object sender, EventArgs e)
        {
            
        }

        protected void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            var query = dc.Actividades(Convert.ToInt32(txtBuscar.Text));
            if (query != null)
            {
                grvActividades.DataSource = query.ToList();
                grvActividades.DataBind();
            }
        }
    }
}