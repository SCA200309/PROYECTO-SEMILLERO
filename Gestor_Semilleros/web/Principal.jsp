<%-- 
    Document   : Principal
    Created on : 9/10/2023, 6:37:48 a. m.
    Author     : SEBAS
--%>

<%@page import="config.CheckIP"%>
<%@page import="modelo.Empleado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<% HttpSession sesion = request.getSession();
    Empleado em = (Empleado) sesion.getAttribute("usuario");
    if (em != null) {
%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="https://www.cjexpressenvios.com/media/wysiwyg/alothemes/shopping-cart-empty.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-info" >
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a style="margin-left: 10px; border: none" class="nav-link" href="#">Home </a>
                    </li>
                    <li class="nav-item">
                        <a style="margin-left: 10px; border: none" class="nav-link" href="Controlador?menu=Producto&accion=Listar" target="myFrame">Producto</a>
                    </li>
                    <li class="nav-item">
                        <a style="margin-left: 10px; border: none" class="nav-link" href="Controlador?menu=Empleado&accion=Listar" target="myFrame">Empleado</a>
                    </li>
                    <li class="nav-item">
                        <a style="margin-left: 10px; border: none" class="nav-link" href="Controlador?menu=Clientes&accion=Listar" target="myFrame">Clientes</a>
                    </li>
                    <li class="nav-item">
                        <a style="margin-left: 10px; border: none" class="nav-link" href="Controlador?menu=NuevaVenta&accion=default" target="myFrame">Nueva Venta</a>
                    </li>
                </ul>
            </div>
            <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false">
                    <%= em.getNombres()%>
                </button>
                <div class="dropdown-menu text-center">
                    <a class="dropdown-item" href="#">
                        <img src="https://cdn-icons-png.flaticon.com/512/6073/6073873.png" alt="Descripción de la imagen" width="60" height="60" />
                    </a>
                    <a class="dropdown-item" href="#"><%= em.getUser()%></a>
                    <div class="dropdown-divider"></div>
                    <form action="Validar" method="POST">
                        <input name="accion" type="submit" value="Salir" class="dropdown-item" href="#">
                    </form>
                </div>
            </div>
        </nav>
        <div class="m-4" style="height: 650px">
            <iframe name="myFrame" style="height: 100%; width: 100%; border: none"></iframe>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
    </body>
</html>
<%} else {
        request.getRequestDispatcher("Controlador?menu=Bloqueo").forward(request, response);
    }%>


