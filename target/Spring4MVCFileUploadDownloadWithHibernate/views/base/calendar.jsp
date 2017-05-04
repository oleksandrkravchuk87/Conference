<%@ page import="java.time.LocalDateTime" %><%--
  Created by IntelliJ IDEA.
  User: OKK
  Date: 02.05.2017
  Time: 11:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Important dates</title>
    <%--Getting of the current date--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <% LocalDateTime today = LocalDateTime.now();
    String date = today.getMonth()+"."+today.getDayOfMonth()+"."+today.getYear();%>


</head>
<body>
<div class="contentContainer">

    <img src="/resources/images/agenda.jpg">
    <%--Displaying of the current date--%>
    <h3> <%= date%></h3>
    <div>
        <%--A table containing important dates. They are compared to the current date.
        Light gray – already past. Dark gray – still ahead.--%>
        <table id="calTable">
            <tr>
                <td>
                    <c:if test="<%= today.getDayOfYear() < 91 %>">
                        <img src="/resources/images/pic1.png">
                    </c:if>
                    <c:if test="<%= today.getDayOfYear() > 91 %>">
                        <img src="/resources/images/pic1gray.png">
                    </c:if>
                </td>
                <td>
                    <c:if test="<%= today.getDayOfYear() < 121 %>">
                        <img src="/resources/images/pic2.png">
                    </c:if>
                    <c:if test="<%= today.getDayOfYear() > 121 %>">
                        <img src="/resources/images/pic2gray.png">
                    </c:if>

                </td>
                <td>
                     <c:if test="<%= today.getDayOfYear() < 152 %>">
                        <img src="/resources/images/pic3.png">
                     </c:if>
                    <c:if test="<%= today.getDayOfYear() > 152 %>">
                        <img src="/resources/images/pic3gray.png">
                    </c:if>
                </td>
                <td>
                         <c:if test="<%= today.getDayOfYear() < 182 %>">
                        <img src="/resources/images/pic4.png">
                    </c:if>
                    <c:if test="<%= today.getDayOfYear() > 182 %>">
                        <img src="/resources/images/pic4gray.png">
                    </c:if>
                </td>
                <td>
                <c:if test="<%= today.getDayOfYear() < 213 %>">
                    <img src="/resources/images/pic5.png">
                </c:if>
                <c:if test="<%= today.getDayOfYear() > 213 %>">
                    <img src="/resources/images/pic5gray.png">
                </c:if>
                </td>
            </tr>
            <tr>
                <td class=<c:if test="<%= today.getDayOfYear() <= 91 %>">
                            'befor'
                </c:if>
                <c:if test="<%= today.getDayOfYear() > 91 %>">
                    'after'
                </c:if>>
                    Receipt of papers:
                </td>
                <td class=<c:if test="<%= today.getDayOfYear() <= 121 %>">
                    'befor'
                </c:if>
                 <c:if test="<%= today.getDayOfYear() > 121 %>">
                    'after'
                </c:if>>
                    Notification of acceptance:
                </td>
                <td class=<c:if test="<%= today.getDayOfYear() <= 152 %>">
                            'befor'
                </c:if>
                <c:if test="<%= today.getDayOfYear() > 152 %>">
                    'after'
                </c:if>>
                Registration opening:
                </td>
                <td class=<c:if test="<%= today.getDayOfYear() <= 182 %>">
                            'befor'
                </c:if>
                <c:if test="<%= today.getDayOfYear() > 182 %>">
                    'after'
                </c:if>>
                    Final report version:
                </td>
                <td class=<c:if test="<%= today.getDayOfYear() <= 213 %>">
                            'befor'
                </c:if>
                <c:if test="<%= today.getDayOfYear() > 213 %>">
                    'after'
                </c:if>>
                    Conference start:
                </td>
            </tr>
            <tr>
                <td class=<c:if test="<%= today.getDayOfYear() <= 91 %>">
                            'befor'
                </c:if>
                <c:if test="<%= today.getDayOfYear() > 91 %>">
                    'after'
                </c:if>>
                    Apr. 1. 2017
                </td>
                <td class=<c:if test="<%= today.getDayOfYear() <= 121 %>">
                            'befor'
                </c:if>
                <c:if test="<%= today.getDayOfYear() > 121 %>">
                    'after'
                </c:if>>
                    May. 1. 2017
                </td>
                <td class=<c:if test="<%= today.getDayOfYear() <= 152 %>">
                            'befor'
                </c:if>
                <c:if test="<%= today.getDayOfYear() > 152 %>">
                    'after'
                </c:if>>
                    Jun. 1. 2017
                </td>
                <td class=<c:if test="<%= today.getDayOfYear() <= 182 %>">
                            'befor'
                </c:if>
                <c:if test="<%= today.getDayOfYear() > 182 %>">
                    'after'
                </c:if>>
                    Jul. 1. 2017
                </td>
                <td class=<c:if test="<%= today.getDayOfYear() <= 213 %>">
                            'befor'
                </c:if>
                <c:if test="<%= today.getDayOfYear() > 213 %>">
                    'after'
                </c:if>>
                    Aug. 1. 2017
                </td>
            </tr>
        </table>

    </div>

</div>
</body>
</html>
