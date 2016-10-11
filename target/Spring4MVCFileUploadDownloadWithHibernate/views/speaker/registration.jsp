<%--
  Created by IntelliJ IDEA.
  User: OKK
  Date: 09.08.2016
  Time: 12:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<form:form action="/registration" method="post" modelAttribute="speaker">
    <table cellpadding="5px">
        <tr>
            <td align="right">
                Ім´я:
            </td>
            <td align="left">
                <form:errors path="firstName"/>
                <form:input path="firstName"/>
            </td>
        </tr>
        <tr>
            <td align="right">
                Прізвище:
            </td>
            <td align="left">
                <form:errors path="secondName"/>
                <form:input path="secondName"/>
            </td>
        </tr>
        <tr>
            <td align="right">
                email
            </td>
            <td align="left">
                <form:errors path="email"/>
                <form:input path="email"/>
            </td>
        </tr>
        <tr>
            <td align="right">
                Телефон:
            </td>
            <td align="left">
                <form:errors path="phone"/>
                <form:input path="phone"/>
            </td>
        </tr>
        <tr>
            <td align="right">
                Пароль:
            </td>
            <td align="left">
                <form:errors path="password"/>
                <form:password path="password"/>
            </td>
        </tr>
        <tr>
            <td align="right">
                Підтвердження паролю:
            </td>
            <td align="left">
                <form:errors path="password"/>
                <form:password path="passwordConfirm"/>
            </td>
        </tr>

        <tr>
            <td>

            </td>
            <td align="left">
                <form:button>Sign in!</form:button>
            </td>
        </tr>
    </table>


</form:form>
