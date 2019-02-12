using System;
using System.Collections.Generic;
using System.Data;
using Uniamazonia_Juego.Conexion;

namespace Uniamazonia_Juego.Models
{
    public class Prueba
    {
        private int id_prueba { set; get; }
        private String nombre_prueba { set; get; }
        private int numero_preguntas { set; get; }
        private String estado_prueba { set; get; }
        private int fk_contenido { set; get;}
        private Connection conexion=new Connection();
        //List<int> listaNumeroOutp = new List<int>();
        Random aletorio = new Random();

        // constructor
        public Prueba() {
        }

        public Prueba(int id_proof,String name_proof, int number_proof,String state_proof, int fk_content) {
            this.id_prueba = id_proof;
            this.nombre_prueba = name_proof;
            this.numero_preguntas = number_proof;
            this.estado_prueba = state_proof;
            this.fk_contenido = fk_content;
            this.conexion = new Connection();
        }


        // metodos
        public Boolean crear_prueba(String aux_nombre_contenido) {
            // 1). bsucar id del contenido seleccionado
            String Query = "select id_contenido from contenido where nombre_contenido='"+aux_nombre_contenido+"';";
            int aux_fk_contenido = conexion.buscar_ID_BD(Query);
            if (aux_fk_contenido!=777)
            {

                // 2) realizar insert
                this.fk_contenido = aux_fk_contenido;
                String Scritp = "insert into prueba(nombre_prueba,estado_prueba,fk_contenido) values('"+nombre_prueba+"','A','"+this.fk_contenido+"');";
                if (conexion.insert_BD(Scritp))
                {
                    return true;
                }

            }
            
            return false;
        }


        public DataTable consultaParametroNombre(String nombre_prueba)
        {
            DataTable consulta = new DataTable();
            String Query = "select id_prueba,nombre_prueba,estado_prueba from prueba where nombre_prueba='"+nombre_prueba+"';";
            consulta = conexion.consultar_BD(Query);
            return consulta;
        }

        public DataTable consultaParametroId_prueba(String id_prueba)
        {
            DataTable consulta = new DataTable();
            String Query = "select *from prueba where id_prueba='"+id_prueba+"';";
            consulta = conexion.consultar_BD(Query);
            return consulta;
        }
        public DataTable consultaGrid()
        {
            DataTable consulta = new DataTable();
            String Query = "select id_pregunta,nombre_pregunta from pregunta";
            consulta = conexion.consultar_BD(Query);
            return consulta;
        }


        public DataTable filtrando_registros_prueba( String dato) {
            DataTable consulta = new DataTable();
            String Query = "select * from prueba where nombre_prueba like '%"+dato+"%';";

            consulta = conexion.consultar_BD(Query);

            return consulta;
        }

        public DataTable consultar_pruebas(String q)
        {
            DataTable consulta = new DataTable();
            String Query = "select id_prueba, nombre_prueba, estado_prueba from prueba where nombre_prueba='"+q+"';";
            consulta = conexion.consultar_BD(Query);
            return consulta;
        }

        public DataTable consulta_pruebas_general() {
            DataTable consulta_aux = new DataTable();
            String Query = "select id_prueba,nombre_prueba,estado_prueba,fk_contenido from prueba;";
            consulta_aux = conexion.consultar_BD(Query);
            return consulta_aux;
        }


        public DataTable consulta_combox_nombre()
        {
            DataTable consulta = new DataTable();
            String Query = "select id_prueba, nombre_prueba from prueba where estado_prueba = 'A';";
            consulta = conexion.consulta_comboBox(Query);
            return consulta;
        }

        public DataTable consulta_parametro_fk_contenido(int id_contenido)
        {
            DataTable consulta = new DataTable();
            String Query = "select id_prueba, nombre_prueba from prueba where fk_contenido = '"+id_contenido+"';";
            consulta = conexion.consulta_comboBox(Query);
            return consulta;
        }

        public DataTable consulta_prueba_x_contenido_combox()
        {
            DataTable consulta = new DataTable();
            String Query = "select id_prueba, nombre_prueba from prueba where estado_prueba = 'A' and fk_contenido='"+fk_contenido+"';";
            consulta = conexion.consulta_comboBox(Query);
            return consulta;
        }




        public Boolean editar_pruebas(String aux_nombre) {
            String Query = "SET SQL_SAFE_UPDATES = 0;update prueba set nombre_prueba='"+this.nombre_prueba+"' where nombre_prueba='"+aux_nombre+"';";

            if (conexion.update_BD(Query))
            {
                return true;
            }
            return false;
        }


        public Boolean eliminar_pruebas() {
            String Query = "update prueba set estado_prueba='D' where nombre_prueba='"+this.nombre_prueba+"';";

            if (conexion.delete_BD(Query))
            {
                return true;
            }
            return false;
        }

        public DataTable consulta_prueba_x_contenido(String nombre_contenido) {
            DataTable consulta = new DataTable();
            int aux_fk_contenido = 0;
            String query = "select id_contenido from contenido where nombre_contenido='"+nombre_contenido+"';";

            aux_fk_contenido = Convert.ToInt32(conexion.consulta_universal(query));

            String Query = "select id_prueba, nombre_prueba,numero_preguntas,estado_prueba,fk_contenido " +
                "from prueba where fk_contenido='"+aux_fk_contenido+"';";
            consulta = conexion.consultar_BD(Query);
            
            return consulta;
        }
    }
}