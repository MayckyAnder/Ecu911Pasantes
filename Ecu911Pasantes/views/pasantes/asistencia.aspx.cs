using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaNegocio;

namespace Ecu911Pasantes.views.pasantes
{
    public partial class asistencia : System.Web.UI.Page
    {
        private Tbl_Asistencia asisinfo = new Tbl_Asistencia();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtActividades.Visible = false;
                string usulogeado = Session["Pasante"].ToString();
                bool existe = cnAsistencias.autentificarxCodigo(Convert.ToInt32(usulogeado));
                bool dia = cnAsistencias.autentificarDiaxCodigo(Convert.ToInt32(usulogeado));
                if (dia)
                {
                    txtAsistencia.Enabled = false;
                    txtActividades.Enabled = false;
                }
                else
                {
                    if (existe)
                    {
                        txtActividades.Visible = true;
                    }
                }
            }
        }
        private void Guardar()
        {
            try
            {
                string usulogeado = Session["Pasante"].ToString();
                bool validar = cnPasantes.autentificarxCodigo(Convert.ToInt32(usulogeado), Convert.ToInt32(txtAsistencia.Text));
                bool activo = cnPasantes.autentificarxEstado(Convert.ToInt32(usulogeado));
                if (validar)
                {
                    if (activo)
                    {
                        asisinfo = new Tbl_Asistencia();
                        asisinfo.Usu_id = Convert.ToInt32(usulogeado);
                        asisinfo.Codigo_Pasante = txtAsistencia.Text;
                        cnAsistencias.save(asisinfo);
                        string js1 = "alert('Ingreso registrado con existo..')";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", js1, true);
                        txtAsistencia.Text = "";
                        txtActividades.Visible = true;
                    }
                    else
                    {
                        string js1 = "alert('Usted aun no se encuentra habilitado para poder registar su asistencia')";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", js1, true);
                    }
                }
                else
                {
                    string js1 = "alert('El codigo ingresado es incorrecto')";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", js1, true);
                }
            }
            catch (Exception ex)
            {
                string js1 = "alert('Ingreso no registrado.." + ex.Message + "')";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", js1, true);
                txtAsistencia.Text = "";
            }
        }
        private void Modificar(Tbl_Asistencia asismd)
        {
            try
            {
                string usulogeado = Session["Pasante"].ToString();
                bool validar = cnPasantes.autentificarxCodigo(Convert.ToInt32(usulogeado), Convert.ToInt32(txtAsistencia.Text));
                if (validar)
                {
                    asismd.Actividades = txtActividades.Text;
                    asismd.Usu_id = Convert.ToInt32(usulogeado);
                    cnAsistencias.modify(asismd);
                    string js1 = "alert('Salida registrada con existo..')";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", js1, true);
                    txtAsistencia.Text = "";
                    txtActividades.Text = "";
                    txtActividades.Visible = false;
                    txtAsistencia.Enabled = false;
                    txtActividades.Enabled = false;
                }
                else
                {
                    string js1 = "alert('El codigo ingresado es incorrecto')";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", js1, true);
                }
            }
            catch (Exception ex)
            {
                string js1 = "alert('Salida no registrada.." + ex.Message + "')";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", js1, true);
                txtAsistencia.Text = "";
            }
        }
        protected void btnAsistencia_Click(object sender, EventArgs e)
        {
            Tbl_Asistencia asi = new Tbl_Asistencia();
            string usulogeado = Session["Pasante"].ToString();
            asi = cnAsistencias.obtenerAsistenciaxCodigo(Convert.ToInt32(usulogeado));
            bool dia = cnAsistencias.autentificarDiaxCodigo(Convert.ToInt32(usulogeado));
            if (dia)
            {
                string js1 = "alert('Ya has registrado tu asistencia del dia de hoy')";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", js1, true);
            }
            else
            {
                if (asi != null)
                {
                    Modificar(asi);
                }
                else
                {
                    Guardar();
                }
            }
        }
    }
}