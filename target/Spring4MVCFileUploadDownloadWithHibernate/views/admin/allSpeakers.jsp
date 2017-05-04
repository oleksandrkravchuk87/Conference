<%--
  Created by IntelliJ IDEA.
  User: OKK
  Date: 04.05.2017
  Time: 15:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>

    <title>allSpeakers</title>
</head>
<body>
<div class="contentContainer">
    <span class="lead">List of Documents </span>

    <c:if test="${empty speakers}">
        <p>No registered speakers...</p>
    </c:if>
    <c:if test="${not empty speakers}">
    <div>
        <table style="width: 100%">

            <c:forEach items="${speakers}" var="speaker" varStatus="counter">
            <tr>
                <td  width="10%">${speaker.id}</td>
                <td width="20%">${speaker.title} ${speaker.firstName} ${speaker.secondName}</td>
                <td width="10%">${speaker.email} <br> ${speaker.phone} <br>  ${speaker.registrationDate}</td>
                <td width="50%">


                                <c:if test="${empty speaker.reportList}">
                                <p>No uploaded documents...</p>
                                </c:if>
                                <c:if test="${not empty speaker.reportList}">
                                <div>
                                    <ul>

                                        <c:forEach items="${speaker.reportList}" var="rep" varStatus="counter">

                                            <li>id ${rep.id}; ${rep.title}; <a href="<c:url value='/download-report-${rep.id}' />">download</a>;  <a href="<c:url value='/admin-delete-speaker-report-${rep.id}' />">delete</a> </li>

                                        </c:forEach>
                                    </ul>
                                </div>
                                        </c:if>


                </td>


                <td width="10%"><a href="<c:url value='/admin-delete-speaker-${speaker.id}' />" class="button">delete</a></td>
            </tr>
            </c:forEach>
            </c:if>

    </div>

<hr>

    <div class ="formContainer">
        <form:form action="/admin-registration" method="post" modelAttribute="speaker">
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
</html>
