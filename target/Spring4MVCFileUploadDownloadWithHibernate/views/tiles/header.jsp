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


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<header style = "text-align:  center;
font-size: 2.2em;
padding-left: 10% ;
padding-right: 10%
">

    <div style= "padding: 5px;
background-color: antiquewhite;
color: saddlebrown;
 height: 150px;" >


        <table>
            <tr>
                <td style="width: 35%">QQQ</td>
                <td style="width: 55%"><div>
                    <h1>Conference</h1>

                </div> </td>
                <td style="width: 10%">

                    <sec:authorize access="isAnonymous()"><a href="/loginpage">Уівйти</a> </sec:authorize>
                    <br>
                    <sec:authorize access="isAnonymous()"><a href="/registration">Зареєструватися</a> </sec:authorize>
                    <sec:authorize access="isAuthenticated()">
                        Привіт, <sec:authentication property="name"/>

                        <form:form method="get" action="/cabinet">
                            <button type="submit">Кабінет</button>
                        </form:form>

                        <form:form method="post" action="/logout">
                            <button type="submit">Logout</button>
                        </form:form>
                    </sec:authorize>
                    <sec:authorize access="hasRole('ROLE_ADMIN')">

                        <form:form method="get" action="/AdminMenu">
                            <button type="submit">Адміністративне меню</button>
                        </form:form>
                    </sec:authorize>
                </td>
            </tr>
        </table>







    </div>
</header>


