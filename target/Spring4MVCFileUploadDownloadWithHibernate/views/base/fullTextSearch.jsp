<%--
  Created by IntelliJ IDEA.
  User: OKK
  Date: 08.10.2016
  Time: 21:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Search results</title>
</head>
<body>
<div class="contentContainer">
    <%--Full-text search in all uploaded reports (title and annotation are used)--%>
<div id="search">
    <form:form action="/search" method="post">
        <input id="query" name="query" size="30" />
        <input class="button" type="submit" value="Search" style="border: none" />
    </form:form>


</div>
<div>
    <%--Search results--%>
<c:if test="${empty searchResults}">
    <p>No matches found...</p>
</c:if>
<c:if test="${not empty searchResults}">
    <%--A table containing reports title as well as related speaker's name.
    Allows user to download founded reports--%>
    <table id="reportsTable">
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

        <c:forEach items="${searchResults}" var="sr" varStatus="counter">
            <tr>
                <td>${counter.index + 1}</td>
                <td>${sr.title}</td>
                <td width="30%">${sr.speaker.title} ${sr.speaker.firstName} ${sr.speaker.secondName}</td>
                <td><a class = "button" href="<c:url value='/download-report-${sr.id}' />" class="btn btn-success custom-width">download</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>
</div>
</div>
</body>