<%-- 
    Document   : inicio
    Created on : 5/04/2021, 05:04:24 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
HttpSession obj = request.getSession(false);
String us = (String)obj.getAttribute("usuario");
if(us.equals("")){
    response.sendRedirect("index.html");
}
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/Estilos.css" rel="stylesheet" type="text/css"/>
        <link rel="preconnect" href="https://fonts.gstatic.com"> 
        <link href="https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap" rel="stylesheet">
        <title>JSP Page</title>
        <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        if(session.getAttribute("usuario") == null){
            response.sendRedirect("index.html");
        }
        %>
    </head>
    <body class="fondoInicio">
        <div>
            <center><h1 style="font-size: 50px; color: snow">Hola <%out.println(us);%></h1></center>
            <center>
                <nav>
                    <ul>
                        <li><a href="inicio.jsp" class="irInicio">Inicio</a></li>
                        <li><a href="DetallesUusuario.jsp" class="irInfo">Información de Usuario</a></li>
                        <li><a href="Acciones.jsp" class="irAcc">Ajustes</a></li>
                    </ul>
                </nav>
                
                <p style="font-size: 45px; color: snow">
                    Bienvenid@ a la página de inicio<br>
                    tus credenciales son válidas.<br>
                </p><br>
                <p style="font-size: 45px; color: snow">
                    Haz click en el botón rojo para<br>
                    cerrar tu sesión y regresar al<br>
                    inicio de sesión.
                </p>
        <form action="CerrarSesion" method="post">
            <input type="submit" value="Cerrar Sesión" style="background-color: red; color: snow;  font-size: 35px" class="cerrar">
        </form>
    </center>
        </div>
    
    </body>
</html>
