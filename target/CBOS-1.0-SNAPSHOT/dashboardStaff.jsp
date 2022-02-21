<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 26/1/2022
  Time: 10:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dashboard</title>
</head>
<body style="background-color:#D7EAE8;">
<%@include file="navbar.html"%>
<br><br>
<%
    String name=(String)session.getAttribute("staffid");
    out.print("Hello Staff "+name);
%>
</body>
</html>
