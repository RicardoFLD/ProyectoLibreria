using Proyecto1.Controllers;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using Proyecto1.Models;
using controlador = Proyecto1.Controllers;
using modelo = Proyecto1.Models;

namespace Proyecto1.Views
{
    public partial class Books : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)

        {
            User user = (User)Session["User"];

            if (user == null)
            {
                NoSession();
            }
            else
            {
                ActiveSession(user);
            }

            if (Request.QueryString["user"] == "nosession")
            {
                ShowMessage("You must log in to access this page");
            }
            BooksController bookController = new BooksController();

            RepBook.DataSource = bookController.GetBooks();
            RepBook.DataBind();
        }

        protected void BtnIngresar_Click(object sender, EventArgs e)
        {
            User user = new User()
            {
                Email = email.Value,
                Password = password.Value
            };

            UserController userController = new UserController();

            if (userController.Login(user))
            {
                Session["User"] = user;
                ActiveSession(user);
            }
            else
            {
                ShowMessage("Incorrect username or password");
            }
        }



        protected void Logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            NoSession();
            ShowMessage("Thank you for your visit");
        }


        public void NoSession()
        {
            cardLogin.Visible = true;
            cardLogout.Attributes.Add("hidden", "hidden");
        }

        public void ActiveSession(User user)
        {
            ShowMessage(string.Format("Welcome {0}", user.Email));
            lblUser.InnerText = user.Email;
            cardLogin.Visible = false;
            cardLogout.Attributes.Remove("hidden");
        }

        public void ShowMessage(string message)
        {
            divAlert.InnerText = message;
            divAlert.Attributes.Remove("hidden");
        }

    }
    }
