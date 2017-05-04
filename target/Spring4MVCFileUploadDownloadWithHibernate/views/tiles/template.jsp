<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%--
  Created by IntelliJ IDEA.
  User: OKK
  Date: 07.08.2016
  Time: 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>SciCon 2017</title>
    <link rel="shortcut icon" href="/resources/images/ico.ico">
    <meta charset="utf-8">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="//ajax.aspnetcdn.com/ajax/jquery.ui/1.10.3/jquery-ui.min.js"></script>


        <%--linking of the style sheet--%>
        <style>
        <%@include file="/resources/css/style.css"%>
    </style>



</head>
<body>
<div style="height: 120px;">
    <tiles:insertAttribute name="header"/>
</div>
<div class="blueStripe">
</div>

<div style="background-color: white">
    <tiles:insertAttribute name="body"/>
</div>

<div class="blueStripe">
</div>
<div><tiles:insertAttribute name="footer"/></div>
<div id="buttom">

</div>

</body>
</html>
