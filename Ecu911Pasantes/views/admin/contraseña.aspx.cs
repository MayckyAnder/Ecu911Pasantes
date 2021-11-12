using CapaDatos;
using CapaNegocio;
using System;
using System.Web.UI;

namespace Ecu911Pasantes.views.admin
{
    public partial class contraseña : System.Web.UI.Page
    {
        private Tbl_Usuarios usuinfo = new Tbl_Usuarios();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblError.Visible = false;
                lblMensaje.Visible = false;
                string resNom = Session["nombre"].ToString();
                string resApe = Session["apellido"].ToString();
                lblResponsable.Text = "Responsable:" + resNom + " " + resApe;
            }
            Page.UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        }

        protected void lnbGuardar_Click(object sender, EventArgs e)
        {
            Tbl_Usuarios usu = new Tbl_Usuarios();
            int usulogeado = Convert.ToInt32(Session["Admin"].ToString());
            usu = cnUsuarios.obtenerUsuariosxId(usulogeado);
            if (usu != null)
            {
                cambiarClave(usu);
            }
        }
        private void cambiarClave(Tbl_Usuarios usu)
        {
            try
            {
                int usulogueado = Convert.ToInt32(Session["Admin"].ToString());
                bool existe = cnUsuarios.autentificarxUsuario(usulogueado, encriptar(txtActual.Text));
                if (existe)
                {
                    Tbl_Usuarios usuc = new Tbl_Usuarios();
                    usuc = cnUsuarios.obtenerUsuariosxId(usulogueado);
                    string anterior = usuc.Password.ToString();
                    if (anterior == encriptar(txtPass.Text))
                    {
                        lblError.Visible = true;
                        lblError.Text = "Su nueva clave no puede ser igual a la anterior";
                        Limpiar();
                    }
                    else
                    {
                        usu.Password = encriptar(txtPass.Text);
                        cnUsuarios.change(usu);
                        lblError.Visible = false;
                        lblMensaje.Visible = true;
                        lblMensaje.Text = "Su clave a sido modificada con exito..";
                        Limpiar();
                    }
                }
                else
                {
                    lblError.Visible = true;
                    lblError.Text = "La contraseña anterior ingresada es incorrecta";
                    Limpiar();
                }
            }
            catch(Exception ex)
            {
                lblError.Visible = true;
                lblError.Text = "No se a podido realizar el cambio de su clave" + ex.Message + "'";
                Limpiar();
            }
        }
        private void Limpiar()
        {
            txtActual.Text = "";
            txtPass.Text = "";
            txtConfirmar.Text = "";
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