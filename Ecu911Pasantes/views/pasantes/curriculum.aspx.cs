using CapaDatos;
using CapaNegocio;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecu911Pasantes.views.pasantes
{
    public partial class curriculum : System.Web.UI.Page
    {
        private Tbl_Pasantes pasinfo = new Tbl_Pasantes();
        private Tbl_Usuarios usuinfo = new Tbl_Usuarios();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void btnSubir_Click(object sender, EventArgs e)
        {
            string usulogeado = Session["Pasante"].ToString();
            pasinfo = cnPasantes.obtenerPasantesxUsuario(Convert.ToInt32(usulogeado));
            if (pasinfo != null)
            {
                subir(pasinfo);
            }
        }
        private void subir(Tbl_Pasantes pasmd)
        {
            string usulogeado = Session["Pasante"].ToString();
            usuinfo = cnUsuarios.obtenerUsuariosxId(Convert.ToInt32(usulogeado));
            string info = usuinfo.Cedula.ToString();
            try
            {
                bool existe = cnPasantes.autentificarxUsu(Convert.ToInt32(usulogeado));
                if (existe)
                {
                    if (fuCurriculum.HasFile)
                    {
                        string stRuta = Server.MapPath(@"~\resources\tmp\") + fuCurriculum.FileName;
                        fuCurriculum.PostedFile.SaveAs(stRuta);
                        string stRutaDestino = Server.MapPath(@"~\resources\documentos\") + info + Path.GetExtension(fuCurriculum.FileName);
                        if (File.Exists(stRutaDestino))
                        {
                            File.SetAttributes(stRutaDestino,FileAttributes.Normal);
                            File.Delete(stRutaDestino);
                        }
                        File.Copy(stRuta, stRutaDestino);
                        File.SetAttributes(stRuta, FileAttributes.Normal);
                        File.Delete(stRuta);
                        pasmd.Curriculum = stRutaDestino;
                        cnPasantes.curriculum(pasmd);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Éxito!', 'Curriculum subido con éxito.', 'success')", true);
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Error!', 'No se pudo subir el curriculum." + ex.Message + " intentelo de nuevo.', 'error')", true);
            }
        }
    }
}