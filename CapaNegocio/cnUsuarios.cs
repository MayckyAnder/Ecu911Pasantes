using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;

namespace CapaNegocio
{
    public class cnUsuarios
    {
        //Instanciamos el dbml
        private static DataClasses1DataContext dc = new DataClasses1DataContext();
        //metodo para verificar credenciales
        public static bool autentificar(string nombre, string pass)
        {
            var auto = dc.Tbl_Usuarios.Any(usu => usu.Estado == "Activo" && usu.Usuario.Equals(nombre) && usu.Password.Equals(pass));
            return auto;
        }
        //metodo para verificar si existe el nombre
        public static Tbl_Usuarios obtenerUsuariosxCedula(int cedula)
        {
            var usuced = dc.Tbl_Usuarios.FirstOrDefault(usu => usu.Cedula.Equals(cedula) && usu.Estado == "Activo");
            return usuced;
        }
        //metodo para verificar si existe el nombre
        public static bool autentificarxCedula(int cedula)
        {
            var auto = dc.Tbl_Usuarios.Any(usu => usu.Estado == "Activo" && usu.Cedula == (cedula));
            return auto;
        }
        //metodo para verificar si existe el nombre
        public static bool autentificarxNom(string nombre)
        {
            var auto = dc.Tbl_Usuarios.Any(usu => usu.Estado == "Activo" && usu.Usuario == (nombre));
            return auto;
        }
        //metodo para traer el objeto
        public static Tbl_Usuarios autentificarxLogin(string nombre, string pass)
        {
            var nlogin = dc.Tbl_Usuarios.Single(usu => usu.Estado == "Activo" && usu.Usuario.Equals(nombre) && usu.Password.Equals(pass));
            return nlogin;
        }
        //metodo para obtener los usuarios por su id
        public static Tbl_Usuarios obtenerUsuariosxId(int id)
        {
            var respid = dc.Tbl_Usuarios.FirstOrDefault(usu => usu.Usu_id.Equals(id) && usu.Estado == "Activo");
            return respid;
        }
        //Metodo para obtener contraseña anterior
        public static bool autentificarxUsuario(int usu, string pass)
        {
            var auto = dc.Tbl_Usuarios.Any(usup => usup.Estado == "Activo" && usup.Usu_id.Equals(usu) && usup.Password.Equals(pass));
            return auto;
        }
        //metodo para verificar si existe el correo
        public static bool autentificarxCorreo(string correo)
        {
            var auto = dc.Tbl_Usuarios.Any(usu => usu.Estado == "Activo" && usu.Correo == (correo));
            return auto;
        }
        //metodo para obtener el correo
        public static Tbl_Usuarios obtenerCorreo(string correo)
        {
            var contra = dc.Tbl_Usuarios.Single(usu => usu.Estado == "Activo" && usu.Correo.Equals(correo));
            return contra;
        }
        public static void save(Tbl_Usuarios usu)
        {
            try
            {
                usu.Estado = "Activo";
                dc.Tbl_Usuarios.InsertOnSubmit(usu);
                dc.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw new ArgumentException("Los datos no han sido guardados <br/>" + ex.Message);
            }
        }
        public static void modify(Tbl_Usuarios usu)
        {
            try
            {
                dc.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw new ArgumentException("Los datos no han sido modificados <br/>" + ex.Message);
            }
        }
        public static void delete(Tbl_Usuarios usu)
        {
            try
            {
                usu.Estado = "Inactivo";
                dc.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw new ArgumentException("Los datos no han sido eliminados <br/>" + ex.Message);
            }
        }
        public static void change(Tbl_Usuarios usu)
        {
            try
            {
                dc.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw new ArgumentException("Los datos no han sido modificados <br/>" + ex.Message);
            }
        }
    }
}
