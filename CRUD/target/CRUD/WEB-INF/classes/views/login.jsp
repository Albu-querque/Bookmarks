<%--
  Created by IntelliJ IDEA.
  User: albuquerque
  Date: 10.03.19
  Time: 21:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Login</title>
</head>
<body>
    <c:url value="try_login" var="login_form_url"/>

    <c:if test="${not empty error}">
        <div class="alert alert-error" style="border:2px solid #e9322d;background: #eed3d7;">
                ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
        </div>
    </c:if>

    <form action="${login_form_url}"/>">
        <table>
            <tr>
                <td>Login</td>
                <td><input type="text" name = "username"></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" name = "password"></td>
            </tr>
            <tr>
                <td colspan = 2>
                    <input type = "submit" value="Login"/>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
