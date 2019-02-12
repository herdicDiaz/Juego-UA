using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Uniamazonia_Juego.Conexion;

namespace Uniamazonia_Juego.Models
{
    public class Empresa
    {
        private int id_empresa { set; get; }
        private String nombre_empresa { set; get; }
        private String descripcion_empresa { set; get; }
        private int nit_empresa { set; get; }

        private Connection conexion { set; get; }

        // construcctor

        public Empresa(int id_company,String name_company, String descrip_company,int nit_company ) {
            this.id_empresa = id_company;
            this.nombre_empresa = name_company;
            this.descripcion_empresa = descrip_company;
            this.nit_empresa = nit_company;
            this.conexion = new Connection();

        }
        // metodos

        public Boolean estado_conexion_BD() {

            if (conexion.openConnection())
            {
                return true;
            }
            return false;
        }





        public Boolean actualizar_empresa() {
            string Query = "update empresa set nombre_empresa='"+this.nombre_empresa+"',descripcion='"+this.descripcion_empresa+"',nit_emprea='"+this.nit_empresa+"' where id_empresa='1';";
            if (conexion.update_BD(Query))
            {
                return true;
            }
            return false;
        }

        public String consulta_nombre_BD() {
            String nombre_aux = "";
            String Query = "select nombre_empresa from empresa where id_empresa='1';";
            nombre_aux = conexion.consulta_universal(Query);
            return nombre_aux;
        }


        public String consulta_descripcion_BD() {
            String desp_aux = "";
            String Query = "select descripcion from empresa where id_empresa='1';";
            desp_aux = conexion.consulta_universal(Query);
            return desp_aux;
        }


        public String consulta_nit_BD() {
            String nit_aux = "";
            String Query = "select nit_emprea from empresa where id_empresa='1';";
            nit_aux = conexion.consulta_universal(Query);
            return nit_aux;
        }


    }
}