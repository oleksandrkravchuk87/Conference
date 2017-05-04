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
    <title>User's cabinet</title>

    <%--Loading of the “edit of the users data”-block--%>
    <script>
        jQuery(window).ready(function () {jQuery("#divEdit").hide()});
        jQuery(window).ready(function () {jQuery("#edit").click(function () {
            jQuery("#divEdit").load("/speaker/edit #editPage",    function(){ jQuery("#divEdit").show("slow",
                    function () {jQuery("#edit").hide("fast")})});
        })});
    </script>
</head>

<body>
<div class="contentContainer">

<table style="width: 100%">
    <tr>
        <td style="width: 50%;
             text-align: center;">
            <%--User data--%>
            <h3>${speaker.title} ${speaker.firstName} ${speaker.secondName}</h3>
            <h4>${speaker.email}</h4>

            <div id="edit" class="button">edit profile</div>
        </td>
        <td style="width: 50%;
        align-content: center;
        ">
            <%--Full-text search in all uploaded reports (title and annotation are used)--%>
            <div id="search">
                <form:form action="/search" method="post">

                    <input id="query" name="query" size="30" required />
                    <input style="border: none" class="button" type="submit" value="search" />
                </form:form>
            </div>
        </td>
    </tr>

</table>

    <%--“edit of the users data”-block--%>
<div id="divEdit"></div>



<div>
    <hr>
    <div class="panel panel-default">
        <!-- Default panel contents -->
        <div class="panel-heading"><span class="lead">List of Documents </span></div>
        <c:if test="${empty spReports}">
        <p>No uploaded documents...</p>
        </c:if>
        <c:if test="${not empty spReports}">
        <div>
            <table id = "reportsTable">
                <thead>
                <tr>
                    <td width="10%">No.</td>
                    <td width="70%">File Name</td>
                    <td width="10%"></td>
                    <td width="10%"></td>
                </tr>
                </thead>
                <c:forEach items="${spReports}" var="rep" varStatus="counter">
                    <tr>
                        <td  width="10%">${counter.index + 1}</td>
                        <td width="70%">${rep.title}</td>
                        <td width="10%"><a href="<c:url value='/download-report-${rep.id}' />" class="button">download</a></td>
                        <td width="10%"><a href="<c:url value='/delete-report-${rep.id}' />" class="button">delete</a></td>
                    </tr>
                </c:forEach>

            </table>
        </div>
        </c:if>
    </div>
    <hr>
     <div class ="formContainer">
        <div class="panel-heading"><span class="lead">Upload New Document</span></div>
        <div class="uploadcontainer">
            <form:form action="/report/new?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">

                <table cellpadding="5px">
                    <tr>
                        <td align="right">
                            Title
                        </td>
                        <td align="left">
                            <form:errors path="title"/>
                            <input type="text" name="title" minlength ="5" maxlength="150" required/>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            Annotation
                        </td>
                        <td align="left">
                            <form:errors path="discription"/>
                            <textarea id="t3" name="annotation" minlength ="50" maxlength="2000" rows="7" required></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            File
                        </td>
                        <td align="left">
                            <form:errors path="presentation"/>
                            <input  type="file" name="presentation" required>
                        </td>
                    </tr>


                    <tr>
                        <td>

                        </td>
                        <td align="left">
                            <button class="button" type="submit">add report</button>
                        </td>
                    </tr>
                </table>


            </form:form>
        </div>
    </div>


</div>
</div>
</body>
</html>