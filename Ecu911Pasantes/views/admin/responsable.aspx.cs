using CapaDatos;
using CapaNegocio;
using System;
using System.Web.UI;

namespace Ecu911Pasantes.views.admin
{
    public partial class responsable : System.Web.UI.Page
    {
        private Tbl_Responsable respinfo = new Tbl_Responsable();
        private Tbl_Usuarios usuinfo = new Tbl_Usuarios();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request["cod"] != null)
                {
                    int codigo = Convert.ToInt32(Request["cod"]);
                    usuinfo = cnUsuarios.obtenerUsuariosxId(codigo);
                    int usu = Convert.ToInt32(usuinfo.Usu_id.ToString());
                    respinfo = cnResponsables.obtenerResponsablesxUsuario(usu);
                    actualizar();
                    if (usuinfo != null)
                    {
                        txtUser.Text = usuinfo.Usuario.ToString();
                        txtNombre.Text = usuinfo.Nombres.ToString();
                        txtApellido.Text = usuinfo.Apellidos.ToString();
                        txtCedula.Text = usuinfo.Cedula.ToString();
                        txtArea.Text = usuinfo.Area.ToString();
                        txtEmail.Text = usuinfo.Correo.ToString();
                        txtCelular.Text = usuinfo.Celular.ToString();
                        if (respinfo != null)
                        {    
                            txtCargo.Text = respinfo.Cargo.ToString();
                        }
                    }
                }
                Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
            }
        }

        protected void lnbCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/views/admin/responsables.aspx");
        }

        protected void lnbGuardar_Click(object sender, EventArgs e)
        {
            guardar_modificar_datos(Convert.ToInt32(Request["cod"]),Convert.ToInt32(usuinfo.Usu_id.ToString()));
        }
        private void Guardar()
        {
            try
            {
                usuinfo = new Tbl_Usuarios();
                usuinfo.Usuario = txtUser.Text;
                usuinfo.Password = encriptar(txtPass.Text);
                usuinfo.Nombres = txtNombre.Text;
                usuinfo.Apellidos = txtApellido.Text;
                usuinfo.Cedula = txtCedula.Text;
                usuinfo.Area = txtArea.Text;
                usuinfo.Celular = txtCelular.Text;
                usuinfo.Correo = txtEmail.Text;
                usuinfo.Tusu_id = 1;
                cnUsuarios.save(usuinfo);

                respinfo = new Tbl_Responsable();
                respinfo.Cargo = txtCargo.Text;
                respinfo.Usu_id = usuinfo.Usu_id;

                cnResponsables.save(respinfo);
                string js1 = "alert('Datos Guardados Con Exito..')";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", js1, true);
                Response.Redirect("~/Views/admin/responsables.aspx");
            }
            catch (Exception ex)
            {
                string js1 = "alert('Datos No Guardados.." + ex.Message + "')";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", js1, true);
            }
        }
        private void modificar(Tbl_Responsable respmd, Tbl_Usuarios usu)
        {
            try
            {
                usu.Usuario = txtUser.Text;
                usu.Nombres = txtNombre.Text;
                usu.Apellidos = txtApellido.Text;
                usu.Cedula = txtCedula.Text;
                usu.Area = txtArea.Text;
                usu.Celular = txtCelular.Text;
                usu.Correo = txtEmail.Text;
                cnUsuarios.modify(usu);
      
                respmd.Cargo = txtCargo.Text;
                cnResponsables.modify(respmd);

                string js1 = "alert('Datos Modificados Con Exito..')";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", js1, true);
                Response.Redirect("~/Views/admin/responsables.aspx");
            }
            catch (Exception ex)
            {
                string js1 = "alert('Datos No Modificados.." + ex.Message + "')";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", js1, true);
            }
        }
        private void guardar_modificar_datos(int id,int usu)
        {
            if (id == 0 && usu == 0)
            {
                Guardar();
            }
            else
            {
                usuinfo = cnUsuarios.obtenerUsuariosxId(id);
                usu = Convert.ToInt32(usuinfo.Usu_id.ToString());
                respinfo = cnResponsables.obtenerResponsablesxUsuario(usu);
                if (usuinfo != null)
                {
                    if (respinfo != null)
                    {
                        modificar(respinfo, usuinfo);
                    }
                }
            }
        }
        private void actualizar()
        {
            txtPass.Enabled = false;
            txtConfirmar.Enabled = false;
            lblInfo.Text = "De un click en el boton actualizar para terminar con la actualizacion de la informacion del responsable";
            lnbGuardar.Text = "Actualizar";
        }
        string encriptar(string cadena)
        {
            string resultado = string.Empty;
            byte[] encriptar = System.Text.Encoding.Unicode.GetBytes(cadena);
            resultado = Convert.ToBase64String(encriptar);
            return resultado;
        }
    }
}