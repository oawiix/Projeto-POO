
<%-- 
    Document   : index
    Created on : 5 de jun. de 2024, 15:51:37
    Author     : dange
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="test.AppListener" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <% AppListener appListener = new AppListener();
        Connection c = appListener.getConnection();
        Statement s = c.createStatement();
        appListener.initializeLog += new Date()+ ": Initializing database creation; ";
        ResultSet rs = s.executeQuery("SELECT * FROM users");
        while (rs.next()) {
             rs.getLong("rowid");
             appListener.initializeLog += rs.getString("name");

        } %>
        <%= test.AppListener.initializeLog %>
    </body>
</html>
