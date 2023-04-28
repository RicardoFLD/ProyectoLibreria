using Proyecto1.Controllers;
using Proyecto1.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto1.Views
{
    public partial class Compras : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            User user = (User)Session["User"];

            if (user != null)
            {
                string Email = user.Email;
                CompraController carriController = new CompraController();

                Repcompra.DataSource = carriController.GetCompras(Email);
                Repcompra.DataBind();
            }
            else
            {
                Response.Redirect("Books.aspx?user=nosession");
            }
        }

    }
    }
