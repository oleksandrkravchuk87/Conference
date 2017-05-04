<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Registered participants</title>
    <%@ page import="java.time.LocalDateTime" %><%--
  Created by IntelliJ IDEA.
  User: OKK
  Date: 25.04.2017
  Time: 13:35
  To change this template use File | Settings | File Templates.
--%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%--getting of the current date--%>
    <% LocalDateTime today = LocalDateTime.now();
        String date = today.getMonth()+"."+today.getDayOfMonth()+"."+today.getYear();
    %>
</head>

<body>
<%--number of the registered participants for current date--%>
<div class="contentContainer">
<p>Number of registered participants at <%= date%>: ${participantsNumber}</p>

    <%--a table containing the registered participants and related reports--%>
<table id="participantsTable">
    <thead>
        <td>No.</td>
        <td>Name</td>
        <td>Reports</td>
    </thead>
    <c:forEach items="${allParticipants}" var="participant" varStatus="counter">
    <tr>
        <td>${counter.index + 1}</td>
        <td>${participant.title} ${participant.firstName} ${participant.secondName}</td>
        <td><c:if test="${empty participant.reports}">
            <p style="font-style: italic;
            color: #c5c5c5">No uploaded documents...</p>
        </c:if>
            <c:if test="${not empty participant.reports}">
        ${participant.reports}</td>
        </c:if>
    </tr>
</c:forEach>
</table>

<br>

<c:if test="${participantsNumber > 10}">

    <% int proPage = 10; /*number of participants pro page*/
        int partNo =  (int) request.getAttribute("participantsNumber");
        /*a loop creating required numper of pages*/
        for(int i = 0; i <= partNo/proPage; i+=1) { %>
        <a href="/participants-<%=i%>-<%=proPage%>"><%=i+1%></a>
    <% } %>
</c:if>
</div>
</body>
</html>


