﻿using CapaDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class cnAsistencias
    {
        //Instanciamos el dbml
        private static DataClasses1DataContext dc = new DataClasses1DataContext();
        public static bool autentificarxCodigo(int cod)
        {
            var auto = dc.Tbl_Asistencia.Any(pasa => pasa.Usu_id.Equals(cod) && pasa.Fecha == DateTime.Today && pasa.Tipo == "Solo Ingreso" && pasa.Estado == "Activo");
            return auto;
        }
        public static bool autentificarDiaxCodigo(int cod)
        {
            var dia = dc.Tbl_Asistencia.Any(pasa => pasa.Usu_id.Equals(cod) && pasa.Fecha == DateTime.Today && pasa.Tipo == "Ingreso y Salida" && pasa.Estado == "Activo");
            return dia;
        }
        public static Tbl_Asistencia obtenerAsistenciaxCodigo(int cod)
        {
            var asiscod = dc.Tbl_Asistencia.FirstOrDefault(pasa => pasa.Usu_id.Equals(cod) && pasa.Fecha == DateTime.Today && pasa.Tipo == "Solo Ingreso" && pasa.Estado == "Activo");
            return asiscod;
        }
        public static void save(Tbl_Asistencia asis)
        {
            try
            {
                asis.Estado = "Activo";
                asis.HoraEntrada = Convert.ToDateTime(DateTime.Now.ToString("HH:mm:ss"));
                asis.Fecha = Convert.ToDateTime(DateTime.Now.ToString("dd/MM/yyyy"));
                asis.Tipo = "Solo Ingreso";
                dc.Tbl_Asistencia.InsertOnSubmit(asis);
                dc.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw new ArgumentException("Su ingreso no ha sido registrado <br/>" + ex.Message);
            }
        }
        public static void modify(Tbl_Asistencia asis)
        {
            try
            {
                asis.Tipo = "Ingreso y Salida";
                asis.HoraSalida = Convert.ToDateTime(DateTime.Now.ToString("HH:mm:ss"));
                dc.SubmitChanges();
            }
            catch (Exception ex)
            {
                throw new ArgumentException("Su salida no ha sido registrada <br/>" + ex.Message);
            }
        }
    }
}
