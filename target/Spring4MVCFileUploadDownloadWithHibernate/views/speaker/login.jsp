<%--
  Created by IntelliJ IDEA.
  User: OKK
  Date: 30.07.2016
  Time: 20:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<form:form action="/loginprocessing" method="post">

    <input name="username" type="text" placeholder="Login">
    <input name="password" type="password" placeholder="Password">
    <input type="submit" value="Sing in!">

</form:form>
