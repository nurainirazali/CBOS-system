<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 26/1/2022
  Time: 10:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dashboard</title>
</head>
<body style="background-color:#D7EAE8;">
<%@include file="navbaruser.html"%>
<%
    String name=(String)session.getAttribute("userid");
    out.print("Hello User "+name);
%>
</body>
</html>