<%-- 
    Document   : index
    Created on : 6 de mai. de 2024, 22:45:29
    Author     : dange
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index - Projeto POO</title>
        <%@ include file="WEB-INF/jspf/html-head-libs.jspf" %>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/navbar.jspf" %>
        <% if (userName != null) { %>
        <div class="m-3">
            <h2>Pagina Inicial</h2
            <div>Conteudo da Pagina</div>

        </div>
        <% }%>
        <%@include file="WEB-INF/jspf/html-body-libs.jspf" %>
    </body>
</html>
