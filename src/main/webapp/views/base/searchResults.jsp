<%--
  Created by IntelliJ IDEA.
  User: OKK
  Date: 08.10.2016
  Time: 21:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

        <c:forEach items="${searchResults}" var="sr" varStatus="counter">
            <tr>
                <td>${counter.index + 1}</td>
                <td>${sr.title}</td>
                <td>${sr.annotation}</td>

                <td><a href="<c:url value='/download-report-${sr.id}' />" class="btn btn-success custom-width">download</a></td>
                <td><a href="<c:url value='/delete-report-${sr.id}' />" class="btn btn-danger custom-width">delete</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
