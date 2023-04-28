<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="Proyecto1.Views.Carrito" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Carrito</title>
</head>
<body style="background-color:aliceblue">
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
                                <a class="nav-link" href="Favoritos.aspx">Favoritos </a>
                            </li>
                         
                             <li class="nav-item">
                                <a class="nav-link" href="Compras.aspx">Compras </a>
                            </li>
                        </ul>                      
                    </div>
                </div>
            </nav>
              <div class="container-fluid ml-3" style="margin-top: 7%; margin-left: 1%">
            <div class="row">
                <asp:Repeater ID="Repcarri" runat="server">
                    <ItemTemplate>
                        <div class="card mb-3" style="max-width: 43%; max-height: 30%; margin-top: 10%; margin: auto;">
                            <div class="row g-0">
                                <div class="col-md-4">
                                    <img style="margin-top: 5%;" src="<%# Eval("Foto") %>" class="img-fluid rounded-start">
                                    <br />
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body">
                                        <h5 class="card-title"><%# Eval("Titulo") %></h5>
                                        <p style="font-size: small" class="card-text">Autor: <%# Eval("Autor") %></p>
                                        <p style="font-size: small" class="card-text">Fecha de publicacion: <%# Eval("FechaPublicacion") %></p>
                                         <p style="font-size: small" class="card-text">ISBN: <%# Eval("ISBN") %></p>
                                        <p style="font-size: small" class="card-text">Precio: $<%# Eval("Precio") %></p>
                                        <a style="float: left; margin-top: 10%; margin-left: 3%" href="Compra.aspx?LibroId=<%# Eval("LibroID") %>" class="btn btn-dark">Comprar libro</a>
                                         <a style="float: left; margin-top: 10%; margin-left: 3%" href="EliminarCarrito.aspx?ID=<%# Eval("ID") %>" class="btn btn-danger">Eliminar</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>         
        </div>
    </form>
</body>
</html>
