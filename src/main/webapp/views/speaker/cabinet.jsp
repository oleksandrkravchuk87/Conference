<%--
  Created by IntelliJ IDEA.
  User: OKK
  Date: 21.09.2016
  Time: 23:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Upload/Download/Delete Documents</title>
<style>

    input :invalid {
        border: 1px solid red;
    }

    input:valid {
        border: 1px solid green;
    }
</style>
</head>
<body>

<div>${speaker.firstName}</div>
<div>${speaker.secondName}</div>
<div class="generic-container">
    <div class="panel panel-default">
        <!-- Default panel contents -->
        <div class="panel-heading"><span class="lead">List of Documents </span></div>
        <div class="tablecontainer">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>No.</th>
                    <th>File Name</th>
                    <th>Type</th>
                    <th>Description</th>
                    <th width="100"></th>
                    <th width="100"></th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${spReports}" var="rep" varStatus="counter">
                    <tr>
                        <td>${counter.index + 1}</td>
                        <td>${rep.title}</td>
                        <td>${rep.annotation}</td>

                        <td><a href="<c:url value='/download-report-${rep.id}' />" class="btn btn-success custom-width">download</a></td>
                        <td><a href="<c:url value='/delete-report-${rep.id}' />" class="btn btn-danger custom-width">delete</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="panel panel-default">

        <div class="panel-heading"><span class="lead">Upload New Document</span></div>
        <div class="uploadcontainer">
            <form:form action="/report/new?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">

                <table cellpadding="5px">
                    <tr>
                        <td align="right">
                            Назва:
                        </td>
                        <td align="left">
                            <form:errors path="title"/>
                            <input type="text" name="title" minlength ="5" maxlength="100" required/>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            Опис:
                        </td>
                        <td align="left">
                            <form:errors path="discription"/>
                            <textarea id="t3" name="annotation" minlength ="50" maxlength="2000" rows="5" required></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            Файл
                        </td>
                        <td align="left">
                            <form:errors path="presentation"/>
                            <input type="file" name="presentation" required>
                        </td>
                    </tr>


                    <tr>
                        <td>

                        </td>
                        <td align="left">
                            <button type="submit">Додати</button>
                        </td>
                    </tr>
                </table>


            </form:form>
        </div>
    </div>
    <div class="well">
        Go to <a href="<c:url value='/' />">Home</a>
    </div>
</div>
<div id="search">
    <form:form action="/search" method="post">

        <input id="query" name="query" size="30" />
        <input type="submit" value="Search" />
    </form:form>
</div>
</body>
</html>