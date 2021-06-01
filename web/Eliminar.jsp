<%-- 
    Document   : Eliminar
    Created on : 17/05/2021, 02:27:21 PM
    Author     : Lenovo
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            pst = con.prepareStatement("delete from usuarios where usuario = ?");
            pst.setString(1, us);
            pst.executeUpdate();
            HttpSession sesion = request.getSession();
            sesion.removeAttribute("usuario");
            response.sendRedirect("index.html");

        %>

    </body>
</html>
