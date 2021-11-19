using CapaDatos;
using System;
using System.Linq;

namespace CapaNegocio
{

    public class cnPasantes
    {
        //Instanciamos el dbml
        private static DataClasses1DataContext dc = new DataClasses1DataContext();

        //Metodo para obtener pasantes por usuario
        public static Tbl_Pasantes obtenerPasantesxUsuario(int id)
        {
            var pasaid = dc.Tbl_Pasantes.FirstOrDefault(pasa => pasa.Usu_id.Equals(id) && pasa.Estado == "Activo" || pasa.Estado == "Pendiente");
            return pasaid;
        }
        //Metodo para verificar codigo del pasante mediante la session
        public static bool autentificarxCodigo(int Usu, int cod)
        {
            var auto = dc.Tbl_Pasantes.Any(pasa => pasa.Usu_id.Equals(Usu) && pasa.Codigo_Pasante.Equals(cod));
            return auto;
        }
        //Metodo para verifiar si el pasante esta activo
        public static bool autentificarxEstado(int Usu)
        {
            var est = dc.Tbl_Pasantes.Any(esta => esta.Usu_id.Equals(Usu) && esta.Estado == "Activo");
            return est;
        }
        //Metodo para obtener pasantes por su id
        public static Tbl_Pasantes obtenerPasantesxId(int id)
        {
            var pasaid = dc.Tbl_Pasantes.FirstOrDefault(pasa => pasa.Pasantes_id.Equals(id) && pasa.Estado == "Pendiente");
            return pasaid;
        }
        public static void save(Tbl_Pasantes pasa)
        {
            try
            {
                pasa.Estado = "Pendiente";
                pasa.Acuerdo = "no aceptado";
                pasa.Fecha = DateTime.Now;
                dc.Tbl_Pasantes.InsertOnSubmit(pasa);
                dc.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw new ArgumentException("Los datos no han sido guardados <br/>" + ex.Message);
            }
        }
        public static void modify(Tbl_Pasantes pasa)
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
        public static void delete(Tbl_Pasantes pasa)
        {
            try
            {
                pasa.Estado = "Inactivo";
                dc.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw new ArgumentException("Los datos no han sido eliminados <br/>" + ex.Message);
            }
        }
        public static void acuerdo(Tbl_Pasantes pasa)
        {
            try
            {
                pasa.Acuerdo = "aceptado";
                dc.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw new ArgumentException("Los datos no han sido actualizados <br/>" + ex.Message);
            }
        }
        public static void status(Tbl_Pasantes pasa)
        {
            try
            {
                pasa.Estado = "Activo";
                dc.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw new ArgumentException("El estado no ha sido actualizado <br/>" + ex.Message);
            }
        }
    }

}
