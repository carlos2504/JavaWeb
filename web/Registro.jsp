<%-- 
    Document   : Registro
    Created on : 28/04/2021, 12:43:05 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/Estilos.css" rel="stylesheet" type="text/css"/>
        <link rel="preconnect" href="https://fonts.gstatic.com"> 
        <link href="https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap" rel="stylesheet">
        <title>JSP Page</title>
    </head>
    <body class="registro">
        <div>
            <center>
                <form action="IngresarUsuario" method="post" style="font-size: 40px;">
                    <h1 style="font-size: 50px; color: snow;">Registro</h1>
                    <h1 style="font-size: 30px; color: snow">Llena el formulario para crear tu usuario y contraseña</h1>
                <p style="font-size: 30px; color: snow">E-mail</p>
                <input type="text" name="txtusuario" size="30" required="" placeholder="Ingresa tu E-mail">
            <p style="font-size: 30px; color: snow">Contraseña</p>
            <input type="password" name="txtpass" size="30" required="" placeholder="Ingresa un password"><br><br>
            <input type="submit" class="pagRegistro" value="Registrarse" style="font-size: 35px">
                </form>
            </center>
        </div>
    </body>
</html>
