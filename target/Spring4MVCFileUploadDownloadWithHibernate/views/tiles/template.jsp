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
    <title>Title</title>
</head>
<body style="align:center; background-color: white">
<div><tiles:insertAttribute name="header"/> </div>
<div><tiles:insertAttribute name="menu"/> </div>
<div style = "text-align:  center;
    padding-left: 10% ;
    padding-right: 10%
    ">

    <div style= "padding: 5px;
background-color: antiquewhite;
color: saddlebrown;
margin-top: 50px;
 " >

        <tiles:insertAttribute name="body"/> </div></div>
<div ><tiles:insertAttribute name="footer"/> </div>
</body>
</html>
