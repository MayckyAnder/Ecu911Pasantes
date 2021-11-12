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
            var auto = dc.Tbl_Pasantes.Any(pasa => pasa.Usu_id.Equals(Usu) && pasa.Codigo_Pasante.Equals(cod) && pasa.Estado == "Activo");
            return auto;
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
    }

}
