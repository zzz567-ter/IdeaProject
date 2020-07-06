<%--
  Created by IntelliJ IDEA.
  User: 457884933
  Date: 2020/6/19
  Time: 0:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%-- prefix写成大c --%>
<html>
<head>
    <title>成功页面</title>
</head>
<body>
    <h1>mvc成功</h1>
<h1>${username}</h1>
    <h1>${searchmsg}</h1>
    <c:forEach items="${books.get('A')}" var="book" varStatus="status" >
<%--        <c:forEach var="i" begin="0" end="10" >--%>
<%--            <h1>${i}</h1>--%>
<%--        </c:forEach>--%>
        <tr>
        <td><c:out value="${book.bno}"/></td>
            <td>${book.byear}</td>
            <td>${books.get('A').get(1)}</td>
            <td>${books.get('A').get(1).toString()}</td>
            <td>${books.get('A').get(1).bauthor}</td>
        </tr>
    </c:forEach>

</body>
</html>
