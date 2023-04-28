using Proyecto1.Controllers;
using Proyecto1.Models;
using System;
using System.Collections.Generic;
using controlador = Proyecto1.Controllers;
using modelo = Proyecto1.Models;

namespace Proyecto1.Views
{
    public partial class Compra : System.Web.UI.Page
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
                    lblMontoUnidad.InnerText = lista_libros[0].Precio.ToString();

                    lblMontoconIVA.InnerText = (lista_libros[0].Precio * 1).ToString();
                    lblMontoFinal.InnerText = (lista_libros[0].Precio * 1).ToString();
                    lblMontosinIVA.InnerText = (lista_libros[0].Precio * 1).ToString();
                    dt_Dia_Compra.Value = DateTime.Today.ToString("yyyy-MM-dd");
                    dt_Llegad_Compra.Value = DateTime.Now.AddDays(30).ToString("yyyy-MM-dd");
                    intLibros.Value = "1";

                    Rep_Carrito.DataSource = lista_libros;
                    Rep_Carrito.DataBind();
                }
                else
                {
                    Response.Redirect("Carrito.aspx?user=nosession");
                }
            }
        }

        protected void Btn_Guardar_Compra_Click(object sender, EventArgs e)
        {
            User user = (User)Session["User"];

            if (user != null)
            {

                int LibroID = Convert.ToInt16(Request.QueryString["LibroID"]);
                btnGuardarReservacion.Attributes.Add("onclick", "return false");
               
                
                controlador.BooksController Libros = new controlador.BooksController();
                List<modelo.Books> listalibros = Libros.Getbook(LibroID);

                double cantidadlibros = Convert.ToDouble(intLibros.Value);

                double monto_sin_iva = (listalibros[0].Precio * cantidadlibros);
                double IVA = monto_sin_iva * 0.13;
                double monto_con_iva = monto_sin_iva + IVA;
                double tot = monto_con_iva + 5;


                modelo.Compra Compras = new modelo.Compra()
                {
                    CodigoLibro = LibroID,
                    Correo = user.Email,
                    Cantidadlibros = Convert.ToInt16(intLibros.Value),
                    Fechacompra = Convert.ToDateTime(dt_Dia_Compra.Value).ToShortDateString(),
                    Fechallegadacompra = Convert.ToDateTime(dt_Llegad_Compra.Value).ToShortDateString(),
                    MontoIVA = Convert.ToInt32(monto_con_iva),
                    MontosinIVA = Convert.ToInt32(monto_sin_iva),
                    Montofinal = Convert.ToInt32(tot),
                    MontoUnidad = Convert.ToInt32(lblMontoUnidad.InnerText),
                    Nombre = Convert.ToString(txt_Nombre.Value),
                    Pais = txt_Pais.Value,
                    Estado = txt_Estado.Value,
                    Direccionentrega = txt_Direccion_de_entrega.Value,
                    Codigopostal = txt_Codigo_postal.Value,
                    Numerotarjeta = txt_Numero_de_tarjeta.Value,
                    Fechaexpiracion = txt_Fecha_de_expiracion.Value,
                    Codigoseguridad = txt_Codigo_de_seguridad.Value

                };
                controlador.CompraController compras = new controlador.CompraController();
                compras.Guardar_Compras(Compras);
                MostrarAlert("Compra realizada con éxito", "info");
            }
            else
            {
                MostrarAlert("Error al realizar la compra", "danger");

            }

        }


        public void MostrarAlert(string mensaje, string tipoMensaje)
        {
            divAlert.Attributes.Add("class", "alert alert-" + tipoMensaje);
            divAlert.Attributes.Remove("hidden");
            lblAlert.InnerText = mensaje;
        }
    }
}