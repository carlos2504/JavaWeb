<%-- 
    Document   : Modificar
    Created on : 17/05/2021, 02:27:13 PM
    Author     : Lenovo
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/Estilos.css" rel="stylesheet" type="text/css"/>
        <link rel="preconnect" href="https://fonts.gstatic.com"> 
        <link href="https://fonts.googleapis.com/css2?family=Permanent+Marker&display=swap" rel="stylesheet">
        <script src="Alertas.js"></script>
        <title>JSP Page</title>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            if (session.getAttribute("usuario") == null) {
                response.sendRedirect("index.html");
            }
        %>
    </head>
    <body>
        <%
            //Información de usuario
            HttpSession obj = request.getSession(false);
            String us = (String) obj.getAttribute("usuario");
            //Conectar con la base de datos
            String USERNAME = "root";
            String PASSWORD = "1234";
            String HOST = "localhost";
            String PORT = "3306";
            String DATABASE = "examen";
            String CLASSNAME = "com.mysql.jdbc.Driver";
            String URL = "jdbc:mysql://" + HOST + ":" + PORT + "/" + DATABASE + "?useSSL=false";
            Connection con;
            con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            Class.forName(CLASSNAME);
            PreparedStatement pst;
            ResultSet rs;
            pst = con.prepareStatement("select * from usuarios where usuario = ?");
            pst.setString(1, us);
            rs = pst.executeQuery();
            while (rs.next()) {

        %>

    <center>
        <form action="" method="post" style="font-size: 40px;">
            <h1 style="font-size: 50px; color: black;">Modificar Información de usuario</h1>
            <h1 style="font-size: 30px; color: black">Llena el formulario para actualizar tu usuario y contraseña</h1>
            <p style="font-size: 30px; color: black">ID</p>
            <input type="text" name="txtid" size="30" value="<%=rs.getInt("id")%>" readonly="">
            <p style="font-size: 30px; color: black">Usuario</p>
            <input type="text" name="txtusuario" size="30" required="" value="<%=rs.getString("usuario")%>">
            <p style="font-size: 30px; color: black">Contraseña</p>
            <input type="text" name="txtpass" size="30" required="" value="<%=rs.getString("contrasena")%>"><br><br>
            <input type="submit" class="pagRegistro" value="Modificar" style="font-size: 35px" onclick="alertaCambio()">
        </form>
        <%}%>
    </center>
</body>
</html>
<%
    String id = request.getParameter("txtid");
    String u = request.getParameter("txtusuario");
    String c = request.getParameter("txtpass");
    if (id != null && u != null && c != null) {
        pst = con.prepareStatement("update usuarios set usuario='" + u + "',contrasena='" + c + "'where id =" + id);
        pst.executeUpdate();
        HttpSession sesion = request.getSession();
        sesion.removeAttribute("usuario");
        response.sendRedirect("index.html");
    }
%>
