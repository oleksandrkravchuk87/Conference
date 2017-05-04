<%--
  Created by IntelliJ IDEA.
  User: OKK
  Date: 07.08.2016
  Time: 11:31
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
    #topWrapper {
        height: 20px;
        width: 1000px;
        margin: 0px;
        padding: 0px;
        background: url('/resources/images/top1.png') no-repeat;
    }
    body {
        word-wrap:break-word !important;
    }
    h1 {

        text-align:center;
        font-size:60px;

    }


    p {
        text-align: center;
    }

    nav {

        background-color: white;
    }

    nav ul {
        padding: 0;
        margin: 0;
        list-style: none;
        position: relative;
    }

    nav ul li {
        display:inline-block;
        background-color: white;
    }

    nav a {
        display:block;
        padding:0 10px;
        color: dodgerblue;
        font-size:20px;
        line-height: 45px;
        text-decoration:none;
    }

    nav a:hover {
        background-color: dodgerblue;
        color: white;
    }


    nav ul ul {
        display: none;
        position: absolute;
        top: 60px; /* the height of the main nav */
    }

  /*on hover*/
    nav ul li:hover > ul {
        display:inherit;
    }

    /* in case of using dropdown */
    nav ul ul li {
        width:170px;
        float:none;
        display:list-item;
        position: relative;
    }



</style>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id = "topWrapper">
</div>

<header style = "text-align:  center;
font-size: 2.2em;
">

<div style= "background-color: white;
 height: 150px;" >

        <table style="text-align: center">
            <tr>
                <td style="width: 30%"><a href="/"><img src="/resources/images/logo1.png"></a></td>
               <%--administrator's menu button. appears only when logged as administrator--%>
                <td style="width: 20%">

                    <sec:authorize access="hasRole('ROLE_ADMIN')">

                        <form:form method="get" action="/admin/adminpage">
                            <button type="submit">Admin menu</button>
                        </form:form>
                    </sec:authorize>

                </td>
                <td>
                    <%--navigation--%>
                    <nav>
                        <ul>
                            <li><a href="/calendar">Calendar</a></li>

                            <li><a href="/location">Location</a></li>
                            <li><a href="/participants-0-10">Participants</a></li>
                            <%--"login page" case user is not logged, otherwise "log out"--%>
                            <li> <sec:authorize access="isAnonymous()"><a href="/loginpage">Log in</a> </sec:authorize>
                                <sec:authorize access="isAuthenticated()">
                                    <form:form method="post" action="/logout">
                                        <button class="button" type="submit">Log out</button>
                                    </form:form>
                                </sec:authorize></li>

                            <%--"registration page" case user is not logged, otherwise "cabinet page"--%>
                            <li><sec:authorize access="isAnonymous()"><a href="/registration">Registration</a> </sec:authorize>

                                <sec:authorize access="isAuthenticated()">


                                    <form:form method="get" action="/cabinet">
                                        <button class="button" type="submit">Cabinet</button>
                                    </form:form>


                                </sec:authorize></li>

                        </ul>
                    </nav>


            </tr>
        </table>

    </div>
</header>


