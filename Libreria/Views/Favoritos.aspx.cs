using System;
using Proyecto1.Controllers;
using Proyecto1.Models;

namespace Proyecto1.Views
{
    public partial class Favoritos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            User user = (User)Session["User"];

            if (user != null)
            {
                string Email = user.Email;
                FavController favController = new FavController();

                Rep_Favoritos.DataSource = favController.Getfav(Email);
                Rep_Favoritos.DataBind();
            }
            else
            {
                Response.Redirect("Books.aspx?user=nosession");
            }
        }
    }
}