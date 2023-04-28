using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Proyecto1.Models
{
    public class Carrito : Books
    {
        public int ID { get; set; }
        public int LibroID { get; set; }
        public string Email { get; set; }
    }
}