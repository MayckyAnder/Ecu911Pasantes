﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecu911Pasantes.views.pasantes
{
    public partial class Certificado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Label24.Text = DateTime.Now.ToShortDateString();
                Label15.Text = DateTime.Now.ToString("QUITO, dd 'de' MMMM 'del' yyyy ");
                
            } 
        }
    }
}