<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Закладки</title>
    <meta charset="UTF-8">
    <style>
    <%@include file="/WEB-INF/css/styles.css"%>
    </style>
</head>
<body class="center" style="background: linear-gradient(to right, #fafffb 20%, #bddcff 20%, #bddcff 80%, #fffdf8 80%);">
    <c:if test="${!empty bookmarks}">
        <table class="tg">
            <caption>Закладки</caption>
            <th width="150">Название закладки</th>
            <th width="150">Дата</th>
            <th width="150">Ссылка на ресурс</th>
            <th width="150">Описание закладки</th>
            <th width="150">Удалить закладку</th>
        <c:forEach items="${bookmarks}" var="i">
            <tr>
                <td>${i.name}</td>
                <td><fmt:formatDate pattern="dd-MM-yyyy" value="${i.date}" /></td>
                <td><a href="<c:url value="${i.reference}"/>" target="_blank">Перейти на сайт</a></td>
                <td>${i.description}</td>
                <td><form:form action="/remove/${i.id}"><input type="submit" value="Удалить"></form:form></td>
            </tr>
        </c:forEach>
        </table>
    </c:if>
    <c:if test="${empty bookmarks}">
        <h1>У вас нет закладок. Чтобы добавить закладки воспользуйтесь формой заполнения ниже.</h1>
    </c:if>
<br>
<br>
<form:form action="/bookmarks/add" modelAttribute="bookmark" id="formAddedBookmarks">
    <table class="tg">
        <tr>
            <td><form:label path="name">Название закладки</form:label></td>
            <td><form:input path="name" required="true" autocomplete="off"/></td>
        </tr>
        <tr>
            <td><form:label path="reference">Ссылка на ресурс</form:label></td>
            <td><form:input path="reference" required="true" autocomplete="off"/></td>
        </tr>
        <tr>
            <td><form:label path="description">Добавьте описание</form:label></td>
            <td><form:textarea path="description" cols="20" rows="5"/></td>
        </tr>
        <tr>
            <td colspan="2" width="50">
            <c:if test="${empty bookmark.name}">
                <input type="submit" value="В закладки"/>
            </c:if>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>
