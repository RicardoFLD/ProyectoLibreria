using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto1.Views
{
    public partial class EliminarCarrito : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int ID = Convert.ToInt16(Request.QueryString["ID"]);

            Controllers.CarritoController Carri = new Controllers.CarritoController();

            Carri.DeleteCarri(ID);

            Response.Redirect("Carrito.aspx");
        }
    }
}