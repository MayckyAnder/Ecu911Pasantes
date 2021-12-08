using CapaDatos;
using CapaNegocio;
using System;
using System.Web.UI;

namespace Ecu911Pasantes.views.admin
{
    public partial class pasante : System.Web.UI.Page
    {
        private Tbl_Pasantes pasinfo = new Tbl_Pasantes();
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
                    pasinfo = cnPasantes.obtenerPasantesxUsuario(usu);
                    actualizar();
                    if (usuinfo != null)
                    {
                        txtUser.Text = usuinfo.Usuario.ToString();
                        txtApellido.Text = usuinfo.Apellidos.ToString();
                        txtNombre.Text = usuinfo.Nombres.ToString();
                        txtCedula.Text = usuinfo.Cedula.ToString();
                        txtCelular.Text = usuinfo.Celular.ToString();
                        txtEmail.Text = usuinfo.Correo.ToString();
                        txtArea.Text = usuinfo.Area.ToString();
                        txtDireccion.Text = usuinfo.Direccion.ToString();
                        txtPass.Text = usuinfo.Password.ToString();
                        txtConfirmar.Text = usuinfo.Password.ToString();
                        if (pasinfo != null)
                        {
                            txtCarrera.Text = pasinfo.Carrera.ToString();
                            txtNivel.Text = pasinfo.Nsemestre.ToString();
                            txtUniversidad.Text = pasinfo.Universidad.ToString();
                            txtCodPa.Text = pasinfo.Codigo_Pasante.ToString();
                            txtCodEcu.Text = pasinfo.CodigoEcu.ToString();
                            ddlActividad.SelectedValue = pasinfo.Actividad.ToString();
                        }
                    }
                }
                Timer1.Enabled = false;
            }
        }
        private void Guardar()
        {
            try
            {
                usuinfo = new Tbl_Usuarios();
                usuinfo.Usuario = txtUser.Text;
                usuinfo.Password = encriptar(txtPass.Text);
                usuinfo.Apellidos = txtApellido.Text;
                usuinfo.Nombres = txtNombre.Text;
                usuinfo.Cedula = Convert.ToInt32(txtCedula.Text);
                usuinfo.Celular = Convert.ToInt32(txtCelular.Text);
                usuinfo.Correo = txtEmail.Text;
                usuinfo.Area = txtArea.Text;
                usuinfo.Direccion = txtDireccion.Text;
                usuinfo.Tusu_id = 2;

                cnUsuarios.save(usuinfo);

                pasinfo = new Tbl_Pasantes();
                pasinfo.Carrera = txtCarrera.Text;
                pasinfo.Nsemestre = txtNivel.Text;
                pasinfo.Universidad = txtUniversidad.Text;
                pasinfo.Codigo_Pasante = txtCodPa.Text;
                pasinfo.CodigoEcu = txtCodEcu.Text;
                pasinfo.Actividad = ddlActividad.SelectedValue;
                pasinfo.Usu_id = usuinfo.Usu_id;

                cnPasantes.save(pasinfo);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Éxito!', 'Datos guardados con éxito.', 'success')", true);
                Timer1.Enabled = true;
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "swal('Error!', 'No se pudo guardar los datos" + ex.Message + " intentelo de nuevo.', 'error')", true);
            }
        }
        private void Modificar(Tbl_Pasantes pas,Tbl_Usuarios usu)
        {
            try
            {
                usu.Usuario = txtUser.Text;
                usu.Apellidos = txtApellido.Text;
                usu.Nombres = txtNombre.Text;
                usu.Cedula = Convert.ToInt32(txtCedula.Text);
                usu.Celular = Convert.ToInt32(txtCelular.Text);
                usu.Correo = txtEmail.Text;
                usu.Area = txtArea.Text;
                usu.Direccion = txtDireccion.Text;
                cnUsuarios.modify(usu);

                pas.Carrera = txtCarrera.Text;
                pas.Nsemestre = txtNivel.Text;
                pas.Universidad = txtUniversidad.Text;
                pas.Codigo_Pasante = txtCodPa.Text;
                pas.CodigoEcu = txtCodEcu.Text;
                pas.Actividad = ddlActividad.SelectedValue;
                pas.Usu_id = usuinfo.Usu_id;

                cnPasantes.modify(pas);
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
                pasinfo = cnPasantes.obtenerPasantesxUsuario(usu);
                if (usuinfo != null)
                {
                    if (pasinfo != null)
                    {
                        Modificar(pasinfo, usuinfo);
                    }
                }
            }
        }
        protected void lnbGuardar_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                guardar_modificar_datos(Convert.ToInt32(Request["cod"]), Convert.ToInt32(usuinfo.Usu_id.ToString()));
            }  
        }

        protected void lnbCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/views/admin/pasantes.aspx");
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
            Response.Redirect("~/views/admin/pasantes.aspx");
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