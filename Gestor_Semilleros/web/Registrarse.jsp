<%-- 
    Document   : Registrarse
    Created on : 15/10/2023, 7:40:35 p. m.
    Author     : SEBAS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="https://www.cjexpressenvios.com/media/wysiwyg/alothemes/shopping-cart-empty.png">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <title>Registros</title>
    </head>
    <body>
        <!-- Formulario -->
        <div class ="container mt-4 col-lg-5">
            <div class="card col-sm-8">
                <div class="card-body">
                    <form class="form-sign" action="Registrar" method="POST" id="registroForm">
                        <div class="form-group text-center">
                            <h3>REGISTRO</h3>
                            <img src="IMAGES/vender-mas-navidad.png" alt="250" width="250"/>
                            <label id="Login">Bienvenido de Nuevo al Sistema</label>
                        </div>
                        <div class="form-group">
                            <label id="User">Usuario:</label>
                            <input type="text" name="txt_usuario" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label id="Password">Contraseña:</label>
                            <input type="password" name="txt_contraseña" class="form-control" required>
                        </div>
                        <input type="submit" name="accion" value="LISTO" class="btn btn-primary btn-block" data-toggle="modal" data-target="#successModal"> 
                        <br>
                    </form>
                    <form class="form-sign" action="Registrar" method="POST">
                        <input type="submit" name="accion" value="Regresar" class="btn btn-primary btn-block">
                    </form>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
    </body>
</html>
