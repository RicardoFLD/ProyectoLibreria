using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Proyecto1.Models
{
    public class Favoritos : Books
    {
       
        public int IdLibro { get; set; }
        public string Email { get; set; }
    }

}
