<%--
  Created by IntelliJ IDEA.
  User: albuquerque
  Date: 27.02.19
  Time: 14:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
  <head>
    <title>Welcome</title>
      <style>
          .ch {
              display: flex;
              justify-content: center;
              align-items: center;
          }
      </style>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
  </head>
  <body style="background: linear-gradient(to top, #FBF2EB, #352A3B);">
    <div class="container ch">
        <a  href="<c:url value="/bm/bookmarks"/>"><font size="11">Закладки</font></a>
    </div>
    <br/>
    <div class="container ch">
      <a  href="<c:url value="/us/usersList"/>"><font size="11">Список пользователей</font></a>
    </div>

    <div class="container ch">
      <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <h2>
          Добро пожаловать, ${pageContext.request.userPrincipal.name} |
          <button class="btn btn-danger" onclick="document.forms['logoutForm'].submit()">Выйти</button>
        </h2>
      </c:if>
    </div>
  </body>
</html>
