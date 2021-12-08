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
                        txtDireccion.Text = usuinfo.Direccion.ToString();
                        txtPass.Text = usuinfo.Password.ToString();
                        txtConfirmar.Text = usuinfo.Password.ToString();
                        if (respinfo != null)
                        {
                            txtCargo.Text = respinfo.Cargo.ToString();
                        }
                    }
                }
                Timer1.Enabled = false;
            }
        }

        protected void lnbCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/views/admin/responsables.aspx");
        }

        protected void lnbGuardar_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                guardar_modificar_datos(Convert.ToInt32(Request["cod"]), Convert.ToInt32(usuinfo.Usu_id.ToString()));
            }
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
                usuinfo.Cedula = Convert.ToInt32(txtCedula.Text);
                usuinfo.Area = txtArea.Text;
                usuinfo.Celular = Convert.ToInt32(txtCelular.Text);
                usuinfo.Correo = txtEmail.Text;
                usuinfo.Direccion = txtDireccion.Text;
                usuinfo.Tusu_id = 1;
                cnUsuarios.save(usuinfo);

                respinfo = new Tbl_Responsable();
                respinfo.Cargo = txtCargo.Text;
                respinfo.Usu_id = usuinfo.Usu_id;

                cnResponsables.save(respinfo);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Éxito!', 'Datos guardados con éxito.', 'success')", true);
                Timer1.Enabled = true;
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Error!', 'No se pudo guardar los datos" + ex.Message + " intentelo de nuevo.', 'error')", true);
            }
        }
        private void modificar(Tbl_Responsable respmd, Tbl_Usuarios usu)
        {
            try
            {
                usu.Usuario = txtUser.Text;
                usu.Nombres = txtNombre.Text;
                usu.Apellidos = txtApellido.Text;
                usu.Cedula = Convert.ToInt32(txtCedula.Text);
                usu.Area = txtArea.Text;
                usu.Celular = Convert.ToInt32(txtCelular.Text);
                usu.Correo = txtEmail.Text;
                usu.Direccion = txtDireccion.Text;
                cnUsuarios.modify(usu);

                respmd.Cargo = txtCargo.Text;
                cnResponsables.modify(respmd);

                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Éxito!', 'Datos modificados con éxito.', 'success')", true);
                Timer1.Enabled = true;
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Error!', 'No se puedo modificar los datos." + ex.Message + " intentelo de nuevo.', 'error')", true);
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
            btnGuardar.Text = "Actualizar";
        }
        string encriptar(string cadena)
        {
            string resultado = string.Empty;
            byte[] encriptar = System.Text.Encoding.Unicode.GetBytes(cadena);
            resultado = Convert.ToBase64String(encriptar);
            return resultado;
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Response.Redirect("~/Views/admin/responsables.aspx");
        }

        protected void CustomValidator1_ServerValidate(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
        {
            bool existe = cnUsuarios.autentificarxCedula(Convert.ToInt32(txtCedula.Text));
            if (existe)
            {
                Tbl_Usuarios resp = new Tbl_Usuarios();
                resp = cnUsuarios.obtenerUsuariosxCedula(Convert.ToInt32(txtCedula.Text));
                if (resp != null)
                {
                    args.IsValid = false;
                }
                else
                {
                    args.IsValid = true;
                }
            }
        }
    }
}