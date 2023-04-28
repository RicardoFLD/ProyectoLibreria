<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Books.aspx.cs" Inherits="Proyecto1.Views.Books" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

    <title>Libreria</title>
</head>

<body>
    <form id="form1" runat="server">
        <div>
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container-fluid">
                    <a class="navbar-brand" href="Books.aspx">Librería Internacional</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarColor01">
                        <ul class="navbar-nav me-auto">

                            <li class="nav-item">
                                <a class="nav-link" href="Favoritos.aspx">Favoritos</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Carrito.aspx">Carrito</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Compras.aspx">Compras</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">Login</a>
                            </li>
                        </ul>  
                         
                    </div>
                </div>
            </nav>

            <div id="divAlert" runat="server" class="alert alert-dark" role="alert" hidden="hidden">
                <label id="lblAlert" runat="server"></label>
            </div>
           
            <div class="container-fluid ml-3" style="margin-top: 0,5%">
            <div class="row">
                <asp:Repeater ID="RepBook" runat="server">
                    <ItemTemplate>
                        <div class="card" style="width: 17rem; margin-right: 1%; margin-left: 2%; margin-top: 1%;">                      
                            <img src="<%# Eval("Foto") %>" class="card-img-top" style="width: 225px; height: 305px; margin:auto; margin-top:3%"; />
                            <div class="card-body">
                                <h5 class="card-title"><%# Eval("Titulo") %></h5>
                                <p class="card-text">Autor: <%# Eval("Autor") %></p>
                                <p class="card-text">Fecha de publicación: <%# Eval("FechaPublicacion") %></p>
                                <p class="card-text">ISBN: <%# Eval("ISBN") %></p>
                                <strong class="card-text">Precio:$<%# Eval("Precio") %></strong>                                  
                           <a style="float: left; margin-top: 10%" href="GuardarCarrito.aspx?LibroId=<%# Eval("Id") %>" class="btn btn-dark">Añadir a mi carrito</a>
                           <a style="float: left; margin-top: 10%; margin-left: 3%" href="GuardarFav.aspx?LibroId=<%# Eval("Id") %>" class="btn btn-outline-warning"><span> &#11088;</span></a>
                            </div>       
                           
                        </div>
                    </ItemTemplate>
                </asp:Repeater>


            </div>
                     
            </div>             
            <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
                <div class="offcanvas-header">
                    <h5 id="offcanvasRightLabel">Log in</h5>
                    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="offcanvas-body">
                    <div class="card" style="border-radius: 15px;">
                        <div runat="server" id="cardLogin" class="card-body">
                            <div class="form-floating mb-3">
                                <input runat="server" type="email" class="form-control" id="email" placeholder="name@example.com" />
                                <label for="floatingInput">Email address</label>
                            </div>
                            <div class="form-floating">
                                <input runat="server" type="password" class="form-control" id="password" placeholder="Password" />
                                <label for="floatingPassword">Password</label>
                            </div>
                            <hr />

                            <button id="btnLogin" runat="server" class="btn btn-dark" style="float: right" onserverclick="BtnIngresar_Click">Log in</button>
                        </div>

                        <div runat="server" id="cardLogout" class="card-body" hidden="hidden">
                            <div class="form-floating">
                                <label runat="server" id="lblUser"></label>
                            </div>
                            <button id="btnLogout" runat="server" class="btn btn-dark" style="float: right" onserverclick="Logout_Click">Log Out</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </form>
</body>
</html>
