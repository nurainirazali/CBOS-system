<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 26/1/2022
  Time: 9:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Logout</title>
</head>
<body>
<%
    session.setAttribute("fid", null);
    session.invalidate();
    response.sendRedirect("index.jsp");
%>
</body>
</html>
