using Proyecto1.Controllers;
using Proyecto1.Models;
using System;
using System.Collections.Generic;
using controlador = Proyecto1.Controllers;
using modelo = Proyecto1.Models;

namespace Proyecto1.Views
{
    public partial class GuardarCarrito : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                User user = (User)Session["User"];

                if (user != null)
                {
                    Int16 LibroId = Convert.ToInt16(Request.QueryString["LibroId"]);
                    controlador.BooksController Libros = new controlador.BooksController();
                    List<modelo.Books> lista_libros = Libros.Getbook(LibroId);
                    Rep_Carrito.DataSource = lista_libros;
                    Rep_Carrito.DataBind();
                }
                else
                {
                    Response.Redirect("Books.aspx?user=nosession");
                }
            }
        }
        protected void btnSaveCarri_ServerClick(object sender, EventArgs e)
        {
            User user = (User)Session["User"];

            if (user != null)
            {

                int LibroId = Convert.ToInt16(Request.QueryString["LibroId"].ToString());
                CarritoController Carri = new CarritoController();


                modelo.Carrito car = new modelo.Carrito()
                {
                    Id = LibroId,
                    Email = user.Email

                };
                Carri.SaveCarrito(car);
                MostrarAlert("Agregado Al Carrito Correctamente", "info");
            }
            else
            {
                MostrarAlert("Error al agregar", "danger");

            }

        }
        public void MostrarAlert(string message, string tipMensaje)
        {
            divAlert.Attributes.Add("class", "alert alert-" + tipMensaje);
            divAlert.Attributes.Remove("hidden");
            lblAlert.InnerText = message;
        }
    }

}
