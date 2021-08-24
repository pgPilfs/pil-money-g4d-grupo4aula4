﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/*GUÍA DE REFERENCIA
 private string aliascvu; //DEFINIR BIEN EL TIPO DE DATO
 private string propietario; //PARA PENSAR
 private string correo;
 private int dni;
 */

namespace Monar.Models
{
    public class GestorDestino  //¿SE MODIFICA?
    {
        private const string StrConexion = "Server=LAPTOP-0CRE86U4\\SQLEXPRESS;Database=Personas;User Id=sa;Password=123456;";
        public void RegistrarDestino(Destino nuevo)
        {
            SqlConnection cx = new SqlConnection(StrConexion);
            cx.Open();

            SqlCommand cm = cx.CreateCommand();
            cm.CommandText = "INSERT INTO Destino(aliascvu, propietario, correo, dni) VALUES (@Aliascvu, @Propietario, @Correo, @Propietario, @Dni)";
            cm.Parameters.Add(new SqlParameter("@Aliascvu", nuevo.Aliascvu));
            cm.Parameters.Add(new SqlParameter("@Propietario", nuevo.Propietario));
            cm.Parameters.Add(new SqlParameter("@Correo", nuevo.Correo));
            cm.Parameters.Add(new SqlParameter("@Dni", nuevo.Dni));


            cm.ExecuteNonQuery();

            cx.Close();
        }

        public void EliminarDestino(int id)
        {
            SqlConnection cx = new SqlConnection(StrConexion);
            cx.Open();

            SqlCommand cm = cx.CreateCommand();
            cm.CommandText = "DELETE FROM Destino WHERE id=@Id";
            cm.Parameters.Add(new SqlParameter("@Id", id));

            cm.ExecuteNonQuery();

            cx.Close();

        }
    }
}