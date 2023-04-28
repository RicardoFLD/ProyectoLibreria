using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Proyecto1.Models
{
    public class Compra : Books
    {

        public int CodigoLibro { get; set; }
        public string Correo { get; set; }
        public int Cantidadlibros { get; set; }
        public string Fechacompra { get; set; }
        public string Fechallegadacompra { get; set; }
        public int MontoIVA { get; set; }
        public int MontosinIVA { get; set; }
        public int Montofinal { get; set; }
        public int MontoUnidad { get; set; }
        public string Nombre { get; set; }
        public string Direccionentrega { get; set; }
        public string Codigopostal { get; set; }
        public string Numerotarjeta { get; set; }
        public string Fechaexpiracion { get; set; }
        public string Codigoseguridad { get; set; }
    }
}