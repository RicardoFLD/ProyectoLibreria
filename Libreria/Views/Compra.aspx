<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Compra.aspx.cs" Inherits="Proyecto1.Views.Compra" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script type="text/javascript">
        function CalcularMontoHospedaje() {

            const lblMontoHospedaje = document.querySelector("#lblMontoconIVA");
            var montodetalle = lblMontoconIVA.innerText;

            var monto = parseInt(montodetalle)

            lblMontoHospedaje.innerText = monto;

            lblMontoFinal.innerText = (monto + 5);
        }

        function CalcularMontoNocheDetalle() {
            const lblMontoconIVA = document.querySelector("#lblMontoconIVA");
            const lblMontoUnidad = document.querySelector("#lblMontoUnidad");
            const intLibros = document.querySelector("#intLibros");
            const montoNoche = parseInt(lblMontoUnidad.innerText);
            const lblMontosinIVA = document.querySelector("#lblMontosinIVA");

            if (intLibros.value >= 1) {
                var impuesto = (montoNoche * 0.13);
                lblMontoconIVA.innerText = (montoNoche + impuesto) * intLibros.value;
                lblMontosinIVA.innerText = montoNoche * intLibros.value;
            }
            else {
                lblMontoconIVA.innerText = montoNoche;
                lblMontosinIVA.innerText = montoNoche;
            }

            CalcularMontoHospedaje();
        }

        function CalcularCantidadNoches() {
            CalcularMontoHospedaje();
        }
    </script>
    <title></title>
</head>
<body>
    <style>
        body {
            background-size: 20%;
            background-image: url("https://previews.123rf.com/images/zinako/zinako1708/zinako170800763/85385162-diversi%C3%B3n-de-patrones-sin-fisuras-con-libros-de-dibujos-animados-se-puede-utilizar-para-fondo-de-pan.jpg");
            width: 100vw;
            height: 100vh;
            position: absolute;
        }
    </style>

    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarColor01">
                        <ul class="navbar-nav me-auto">

                            <li class="nav-item">
                                <a class="nav-link" href="Favoritos.aspx">Favoritos </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Carrito.aspx">Carrito de compras </a>
                            </li>
                             <li class="nav-item">
                                <a class="nav-link" href="Compras.aspx">Compras </a>
                            </li>

                        </ul>
                       
                    </div>
        </div>
    </nav>
    <br />
    <br />
    <div id="divAlert" hidden="hidden" role="alert" runat="server">
        <label id="lblAlert" runat="server"></label>
    </div>
    <form id="form1" runat="server">
        <div class="container-fluid ml-3" style="margin-top: 3%">
            <div class="row">
                <asp:Repeater ID="Rep_Carrito" runat="server">
                    <ItemTemplate>
                        <div class="card" style="max-width: 20%; height: 5%; margin-right: 2%; margin-left: 2%">
                            <img src="<%# Eval("Foto") %>" class="card-img-top" style="margin-top: 3%" />
                            <div class="card-body">
                                <h5 class="card-title"><%# Eval("Titulo") %></h5>
                                <p class="card-text">Autor: <%# Eval("Autor") %></p>
                                <p class="card-text">Fecha de publicacion: <%# Eval("Fechapublicacion") %></p>
                                <strong class="card-text">Precio: ₡<%# Eval("Precio") %> / p</strong>

                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <div class="card" style="width: 30rem; height: 65rem; margin-left: 2%">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <h5 class="card-title"><strong>Unidad ₡<label id="lblMontoUnidad" runat="server"></label></strong></h5>
                            </div>
                        </div>
                        <hr />
                        <div class="row mb-2">
                            <div class="col">
                                Dia de la compra<br />
                                <input runat="server" type="date" class="form-control" id="dt_Dia_Compra" readonly />
                            </div>
                            <div class="col">
                                Llegada de la compra<br />
                                <input runat="server" type="date" class="form-control" id="dt_Llegad_Compra" readonly />
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col">
                                Cantidad de libros
                                <br />
                                <input runat="server" type="number" class="form-control" id="intLibros" min="1" max="10" onmouseover="CalcularMontoNocheDetalle()" onmouseleave="CalcularMontoNocheDetalle()" onclick="CalcularMontoNocheDetalle()" />
                            </div>

                        </div>
                        <div class="row mb-2">
                            <div class="col text-rigth">Precio sin IVA</div>
                            <div class="col text-end">
                                $
                                <label runat="server" id="lblMontosinIVA"></label>
                            </div>
                        </div>
                        <div class="row mb-2">
                            <div class="col text-rigth">Precio incluyendo IVA</div>
                            <div class="col text-end">
                                $
                                <label runat="server" id="lblMontoconIVA"></label>
                            </div>
                        </div>
                        <div class="row mb-2">
                            <div class="col text-rigth">Precio de Entrega</div>
                            <div class="col text-end">
                                
                                $
                                <label>5</label>
                            </div>
                        </div>
                        <hr />
                        <div class="row mb-2">
                            <div class="col text-rigth"><strong>Total</strong> </div>
                            <div class="col text-end">
                                <strong>₡
                                <label runat="server" id="lblMontoFinal"></label>
                                </strong>
                            </div>
                        </div>
                        <hr />
                        <div class="row mb-2">
                            <div class="col text-center"><strong>Ingreso sus datos para la compra:</strong></div>
                            <br />
                            <br />
                            <div class="row mb-2">
                                <div class="input-group mb-3">
                                    <input runat="server" id="txt_Nombre" type="text" class="form-control" placeholder="Nombre" />
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="input-group mb-3">
                                    <input runat="server" id="txt_Direccion_de_entrega" type="text" class="form-control" placeholder="Direccion de entrega" />
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="input-group mb-3">
                                    <input runat="server" id="txt_Codigo_postal" class="form-control" type="text" placeholder="Codigo postal" />
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="input-group mb-3">
                                    <input runat="server" id="txt_Numero_de_tarjeta" type="text" class="form-control" placeholder="Numero de tarjeta" />
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="input-group mb-3">
                                    <input runat="server" id="txt_Fecha_de_expiracion" type="text" class="form-control" placeholder="Fecha de expiracion" />
                                </div>
                            </div>
                            <div class="row mb-2">
                                <div class="input-group mb-3">
                                    <input runat="server" id="txt_Codigo_de_seguridad" type="password" class="form-control" placeholder="Codigo de seguridad" />
                                </div>
                            </div>

                        </div>

                        <hr />

                        <div class="row mb-2">
                            <div class="col mb-2">

                                <asp:Button ID="btnGuardarReservacion" runat="server" Text="Guardar Compra" PostBack="false" OnClick="Btn_Guardar_Compra_Click" class="btn btn-primary" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
