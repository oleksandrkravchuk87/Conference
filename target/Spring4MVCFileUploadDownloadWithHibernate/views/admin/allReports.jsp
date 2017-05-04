<%--
  Created by IntelliJ IDEA.
  User: OKK
  Date: 04.05.2017
  Time: 13:47
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

    <title>allReports</title>
</head>
<body>
<div class="contentContainer"><span class="lead">List of Documents </span>

    <c:if test="${empty reports}">
    <p>No uploaded documents...</p>
    </c:if>
    <c:if test="${not empty reports}">
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
            <c:forEach items="${reports}" var="rep" varStatus="counter">
            <tr>
                <td  width="10%">${counter.index + 1}</td>
                <td width="30%">${rep.title}</td>
                <td width="10%">${rep.speaker.id}</td>
                <td width="30%">${rep.speaker.firstName} ${rep.speaker.secondName}</td>
                <td width="10%"><a href="<c:url value='/download-report-${rep.id}' />" class="button">download</a></td>
                <td width="10%"><a href="<c:url value='/admin-delete-report-${rep.id}' />" class="button">delete</a></td>
            </tr>
            </c:forEach>
            </c:if>

</div>
</div>
    <hr>

         <div class ="formContainer">
          <div class="panel-heading"><span class="lead">Upload New Document</span></div>
             <div class="uploadcontainer">

                <form:form action="/report/adminNew?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">

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
                                Speaker id
                            </td>
                            <td align="left">
                               <input type="text" name="speakerId"  maxlength="150" required/>
                            </td>
                        </tr>
                        <tr>



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


</body>
</html>
