<%--
  Created by IntelliJ IDEA.
  User: albuquerque
  Date: 04.04.19
  Time: 19:20
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List User</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <style>
        <%@include file="/WEB-INF/resources/css/styles.css"%>
        <%@include file="/WEB-INF/resources/css/common.css"%>
    </style>
</head>
<body>
<c:if test="${!empty users}">
    <div class="container">
        <div class="row">
            <table class="table table-dark center">
                <tbody>
                <caption style="color: aliceblue">Зарегистрированные пользователи</caption>
                <th class="WH">ID пользователя</th>
                <th class="WH">Имя пользователя</th>
                <th class="WH">Пароль</th>
                <th class="WH">Роль</th>
                <th></th>
                <c:forEach items="${users}" var="i">
                    <c:forEach items="${i.roles}" var="j">
                       <c:if test="${!j.name.equals('ROLE_ADMIN')}">
                        <tr>
                            <td>${i.id}</td>
                            <td>${i.username}</td>
                            <td>${i.password}</td>
                            <td>${j.name}</td>
                            <td>
                                <form:form action="/app/us/usersList/remove_user/${i.id}">
                                    <button style="height:35px; width:85px; vertical-align: middle;" type="submit" class="btn btn-primary myButton">Удалить</button>
                                </form:form>
                            </td>
                        </tr>
                       </c:if>
                    </c:forEach>
                </c:forEach>
                <tr>
                    <td>
                        <a  href="<c:url value="/welcome"/>"><font size="4">Назад</font></a>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</c:if>
</body>
</html>
