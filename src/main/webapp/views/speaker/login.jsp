<%--
  Created by IntelliJ IDEA.
  User: OKK
  Date: 30.07.2016
  Time: 20:13
  To change this template use File | Settings | File Templates.
--%>
<head>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login page</title>
</head>
<div class="contentContainer">
    <img src="/resources/images/login.jpg">
    <div class ="formContainer">
    <table>
<form:form action="/loginprocessing" method="post">
    <tr>
        <td>
            E-Mail or phone
        </td>
        <td>
            <input name="username" type="text" placeholder="Login">
        </td>
    </tr>
    <tr>
        <td>
            Password
        </td>
        <td>
            <input name="password" type="password" placeholder="Password">
        </td>
    </tr>
    <tr>
        <td>

        </td>
        <td>
            <input class="button" type="submit" style="border: none" value="sing in!">
        </td>
    </tr>


</form:form>
    </table>
        </div>
</div>
