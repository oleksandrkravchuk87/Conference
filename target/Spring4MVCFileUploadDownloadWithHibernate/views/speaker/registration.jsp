<%--
  Created by IntelliJ IDEA.
  User: OKK
  Date: 09.08.2016
  Time: 12:52
  To change this template use File | Settings | File Templates.
--%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Registration</title>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    </head>
        <body>
                    <div class="contentContainer">
                        <img src="/resources/images/registration.jpg">
                        <div class ="formContainer">
                    <form:form action="/registration" method="post" modelAttribute="speaker">
                        <table cellpadding="5px">
                            <tr>
                                <td align="right">
                                    Title
                                </td>
                                <td align="left">
                                    <form:select path="title">
                                        <form:option value="Dr.">Dr.</form:option>
                                        <form:option value="Mr.">Mr.</form:option>
                                        <form:option value="Mrs.">Mrs.</form:option>
                                        <form:option value="Mss.">Mss.</form:option>
                                        <form:option selected="selected" value="">-</form:option>
                                    </form:select>
                                </td>
                                <td align="left">
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    First name
                                </td>
                                <td align="left">
                                    <form:input path="firstName"/>
                                </td>
                                <td align="left">
                                    <form:errors path="firstName"/>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    Second name
                                </td>
                                <td align="left">
                                    <form:input path="secondName"/>
                                </td>
                                    <td align="left">
                                        <form:errors path="secondName"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        E-mail
                                    </td>
                                    <td align="left">
                                        <form:input path="email"/>
                                    </td>
                                    <td align="left">
                                        <form:errors path="email"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Phone
                                    </td>
                                    <td align="left">
                                        <form:input path="phone"/>
                                    </td>
                                    <td align="left">
                                        <form:errors path="phone"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Password
                                    </td>
                                    <td align="left">
                                        <form:password minlength="6" path="password"/>
                                    </td>
                                    <td align="left">
                                        <form:errors path="password"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        Password confirmation
                                    </td>
                                    <td align="left">
                                        <form:password path="passwordConfirm"/>
                                    </td>
                                    <td align="left">
                                        <form:errors path="password"/>
                                    </td>
                                </tr>

                                <tr>
                                    <td>

                                    </td>
                                    <td align="left">
                                        <form:button class="button">sign in!</form:button>
                                    </td>
                                </tr>
                            </table>


                            </form:form>
                        </div>
             </div>
        </body>