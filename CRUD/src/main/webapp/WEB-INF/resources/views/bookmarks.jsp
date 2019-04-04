<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>Закладки</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
    <style>
        <%@include file="/WEB-INF/resources/css/styles.css"%>
        <%@include file="/WEB-INF/resources/css/common.css"%>
    </style>
</head>
<body class="center" style="background: linear-gradient(to top, #FBF2EB, #352A3B);">
<c:if test="${pageContext.request.userPrincipal.name != null}">
    <form id="logoutForm" method="post" action="${contextPath}/logout">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
    <h2>
        Пользователь - ${pageContext.request.userPrincipal.name} |
        <button class="btn btn-danger" onclick="document.forms['logoutForm'].submit()">Выйти</button>
    </h2>
</c:if>
    <c:if test="${!empty bookmarks}">
      <div class="container">
       <div class="row">
        <table class="table table-dark center">
        <tbody>
            <caption>Закладки</caption>
            <th class="WH">Название закладки</th>
            <th class="WH">Дата</th>
            <th class="WH">Ссылка на ресурс</th>
            <th class="WH">Описание закладки</th>
            <th class="WH">Удалить закладку</th>
            <th></th>
        <c:forEach items="${bookmarks}" var="i">
            <tr>
                <td>${i.name}</td>
                <td><fmt:formatDate pattern="dd-MM-yyyy" value="${i.date}" /></td>
                <td><a href="<c:url value="${i.reference}"/>" target="_blank">Перейти на сайт</a></td>
                <td>${i.description}</td>
                <td>
                    <form:form action="/app/bm/remove/${i.id}">
                        <button style="height:35px; width:85px; vertical-align: middle;" type="submit" class="btn btn-primary myButton">Удалить</button>
                    </form:form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
        </table>
       </div>
      </div>
    </c:if>

    <c:if test="${empty bookmarks}">
        <h1>У вас нет закладок. Чтобы добавить закладки воспользуйтесь формой заполнения ниже.</h1>
    </c:if>
<br>
<br>
<form:form action="/app/bm/bookmarks/add" modelAttribute="bookmark" id="formAddedBookmarks" name="formAddedBookmarks">
    <div class="container">
    <div class="form-group">
            <form:label path="name">Название закладки</form:label>
            <form:input cssClass="form-control" path="name" required="true" autocomplete="off"/>
    </div>
    <div class="form-group">
            <form:label path="reference">Ссылка на ресурс</form:label>
            <form:input cssClass="form-control"  path="reference" required="true" autocomplete="off"/>
    </div>
    <div class="form-group">
            <form:label path="description">Добавьте описание</form:label>
            <form:textarea cssClass="form-control" path="description" cols="20" rows="5"/>
    </div>
    <div class="form-group">
            <c:if test="${empty bookmark.name}">
                <input class="btn btn-success" type="submit" value="В закладки"/>
            </c:if>
    </div>
    </div>
</form:form>
</body>
</html>
