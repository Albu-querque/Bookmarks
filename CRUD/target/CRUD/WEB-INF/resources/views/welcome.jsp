<%--
  Created by IntelliJ IDEA.
  User: albuquerque
  Date: 27.02.19
  Time: 14:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
    <title>Welcome</title>
    <style type="text/css">
    a {
    display: flex;
    flex-direction: column;
    align-items: center;
    }
    </style>
  </head>
  <body>
    <h1 align="center">Hello tany from tomcat</h1>
    <br>
    <br>
    <a href="<c:url value="/bookmarks"/>" target="_blank">BOOKMARKS</a>
  </body>
</html>
