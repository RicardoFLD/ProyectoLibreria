using System;
using Proyecto1.Controllers;
using Proyecto1.Models;

namespace Proyecto1.Views
{
    public partial class Carrito : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            User user = (User)Session["User"];

            if (user != null)
            {
                string Email = user.Email;
                CarritoController carriController = new CarritoController();

                Repcarri.DataSource = carriController.GetCarri(Email);
                Repcarri.DataBind();
            }
            else
            {
                Response.Redirect("Books.aspx?user=nosession");
            }
        }
    }
}