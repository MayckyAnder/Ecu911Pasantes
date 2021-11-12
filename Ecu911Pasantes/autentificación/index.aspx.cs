using CapaDatos;
using CapaNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Ecu911Pasantes.autentificación
{
    public partial class index : System.Web.UI.Page
    {
        private static int con = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
            Session["con"] = Session["Conantiguo"];
        }
        private void Ingresar()
        {
            bool existenom = cnUsuarios.autentificarxNom(txtUser.Text);
            bool existe = cnUsuarios.autentificar(txtUser.Text, encriptar(txtPass.Text));
            {
                if (existenom)
                {
                    if (existe)
                    {
                        Tbl_Usuarios usuario = new Tbl_Usuarios();
                        usuario = cnUsuarios.autentificarxLogin(txtUser.Text, encriptar(txtPass.Text));

                        int tusuario = Convert.ToInt32(usuario.Tusu_id);
                        if (tusuario == 1)
                        {
                            Session["Admin"] = usuario.Usu_id.ToString();
                            Session["nombre"] = usuario.Nombres.ToString();
                            Session["apellido"] = usuario.Apellidos.ToString();
                            Response.Redirect("~/views/admin/inicio.aspx");
                            Limpiar();
                        }
                        else
                        {
                            Session["Pasante"] = usuario.Usu_id.ToString();
                            Session["nombre"] = usuario.Nombres.ToString();
                            Session["apellido"] = usuario.Apellidos.ToString();
                            Response.Redirect("~/views/pasantes/asistencia.aspx");
                            Limpiar();
                        }
                    }
                    else
                    {
                        string intentos = (con + (Convert.ToInt32(Session["con"]))).ToString();
                        Session["Conantiguo"] = intentos.ToString();
                        string js1 = "alert('Credenciales Incorrectas!, Intento #" + intentos + "')";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", js1, true);
                        txtPass.Text = "";
                        if (Convert.ToInt32(intentos) == 3)
                        {
                            string jsl1 = "alert('A superado el limite de intentos..')";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", jsl1, true);
                            lnbIngresar.Visible = false;
                            Session.RemoveAll();
                            Response.Redirect("~/autentificación/recuperar.aspx");
                        }
                    }
                }
                else
                {
                    string js1 = "alert('Usuario No existe..')";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", js1, true);
                }
            }
        }
        private void Limpiar()
        {
            txtPass.Text = "";
            txtUser.Text = "";
        }
        string encriptar(string cadena)
        {
            string resultado = string.Empty;
            byte[] encriptar = System.Text.Encoding.Unicode.GetBytes(cadena);
            resultado = Convert.ToBase64String(encriptar);
            return resultado;
        }

        protected void lnbIngresar_Click(object sender, EventArgs e)
        {
            Ingresar();
        }
    }
}