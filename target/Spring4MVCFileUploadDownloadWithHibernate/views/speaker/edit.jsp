<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: OKK
  Date: 28.04.2017
  Time: 18:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<%--editing of the current user's data.
this block is loaded at the "edit"-button press to the "cabinet" page--%>
<div  id="editPage">
<p>Please edit your profile</p>
<form action="/speaker/edit?${_csrf.parameterName}=${_csrf.token}" method="post">

<table>
    <tr>
        <td align="right">
            Title
        </td>
        <td align="left">
            <select name="title">
                <option value="Dr.">Dr.</option>
                <option value="Mr.">Mr.</option>
                <option value="Mrs.">Mrs.</option>
                <option value="Mss.">Mss.</option>
                <option selected value="">-</option>
            </select>

        </td>
        <td align="left">
        </td>
    </tr>

    <tr>
        <td align="right">
            First name
        </td>
        <td align="left">
            <input type="text"  name="firstName" value="${speaker.firstName}">
        </td>
    </tr>
    <tr>
        <td align="right">
            Second name
        </td>
        <td align="left">
            <input type="text" name="secondName" value="${speaker.secondName}">
        </td>
    </tr>
    <tr>
    <td align="right">
        Phone
    </td>
    <td align="left">
        <input required type="text" name="phone" value="${speaker.phone}">
    </td>
</tr>
    <tr>
        <td>

        </td>
        <td align="left">
            <button class="button" type="submit">edit</button>
        </td>
    </tr>

</table>
    </form>
</div>
</body>
</html>
