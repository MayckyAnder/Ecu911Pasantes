using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class cnLabores
    {
        //Instanciamos el dbml
        private static DataClasses1DataContext dc = new DataClasses1DataContext();

        //metodo para retornar todos los usuarios
        public static List<Tbl_Labores> obtenerLabor()
        {
            var lista = dc.Tbl_Labores.Where(lab => lab.Estado == "Activo");
            return lista.ToList();
        }
        public static Tbl_Labores obtenerLaboresxId(int id)
        {
            var labid = dc.Tbl_Labores.FirstOrDefault(lab => lab.Labor_id.Equals(id) && lab.Estado == "Activo");
            return labid;
        }
        public static Tbl_Labores obtenerLaboresxNombre(string nombre)
        {
            var labnom = dc.Tbl_Labores.FirstOrDefault(lab => lab.ConceptoL.Equals(nombre) && lab.Estado == "Activo");
            return labnom;
        }
        //metodo para verificar si existe el nombre
        public static bool autentificarxNom(string nombre)
        {
            var auto = dc.Tbl_Labores.Any(lab => lab.Estado == "Activo" && lab.ConceptoL == (nombre));
            return auto;
        }
        public static void save(Tbl_Labores lab)
        {
            try
            {
                lab.Estado = "Activo";
                dc.Tbl_Labores.InsertOnSubmit(lab);
                dc.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw new ArgumentException("Los datos no han sido guardados <br/>" + ex.Message);
            }
        }

        public static void modify(Tbl_Labores lab)
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
        public static void delete(Tbl_Labores lab)
        {
            try
            {
                lab.Estado = "Inactivo";
                dc.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw new ArgumentException("Los datos no han sido eliminados <br/>" + ex.Message);
            }
        }
    }
}
