<%-- 
    Document   : Empleado
    Created on : 28/10/2023, 12:51:57 p. m.
    Author     : SEBAS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <c:if test="${not empty mensaje}">
            <script>
                alert("${mensaje}");
            </script>
        </c:if>
        <div class="d-flex">
            <div class="card col-sm-6">
                <div class="card-body">
                    <form action="Controlador?menu=Semilleros" method="POST">
                        <div class="form-group">
                            <label>ID SEMILLERO</label>
                            <input type="text" value="${semillero.getId_semi()}" name="txt_IdSemi" class="form-control" readonly>
                        </div>
                        <div class="form-group">
                            <label>Nombre</label>
                            <input type="text" value="${semillero.getNombre_s()}" name="txt_nombre" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>GRUPO INVESTIGACION (ID)</label>
                            <input type="text" value="${semillero.getGrupo_in_id()}" name="txt_GrupoInID" class="form-control" required>
                        </div>
                        <input type="submit" name="accion" value="Agregar" class="btn btn-info">
                        <input type="submit" name="accion" value="Actualizar" class="btn btn-success">
                    </form>
                </div>
            </div>
            <div class="col-sm-8">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>NOMBRE</th>
                            <th>ID GRUPO INVESTIGACION</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="s" items="${semilleros}">
                            <tr>
                                <td>${s.getId_semi()}</td>
                                <td>${s.getNombre_s()}</td>
                                <td>${s.getGrupo_in()}</td>
                                <td>
                                    <a class="btn btn-warning" href="Controlador?menu=Semilleros&accion=Editar&id_s=${s.getId_semi()}">Editar</a>
                                    <a class="btn btn-danger" href="Controlador?menu=Semilleros&accion=Eliminar&id_se=${s.getId_semi()}">Eliminar</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
    </body>
</html>
