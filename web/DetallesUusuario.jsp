<%-- 
    Document   : DetallesUusuario
    Created on : 17/05/2021, 01:33:26 PM
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
        <title>JSP Page</title>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            if (session.getAttribute("usuario") == null) {
                response.sendRedirect("index.html");
            }
        %>
    </head>
    <body class="detalles">
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

        %>
        <div>
            <h1 align="center" style="color: snow">Datos de usuario</h1>
            <table>
                <thead>
                <th>ID</th>
                <th>E-mail</th>
                <th>Password</th>
                </thead>

                <%while (rs.next()) {%>
                <tr>
                    <th><%=rs.getInt("id")%></th>
                    <th><%=rs.getString("usuario")%></th>
                    <th><%=rs.getString("contrasena")%></th>

                </tr>
                <%}%>
            </table>
            <center>
                <a class="atras" href="inicio.jsp">Atrás</a>
            </center>
        </div>
    </body>
</html>
