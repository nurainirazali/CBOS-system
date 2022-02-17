<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 26/1/2022
  Time: 10:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String staffid = request.getParameter("fid");
    String pwd = request.getParameter("lpass");

    Class.forName("org.postgresql.Driver");
    String dbURL = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/ddn4nslo8pnje3";
    String user = "qoyqwxbjtgaycf";
    String pass = "4114ea71f4f849e6cd6d107aefe44df92996eeea835a25ef81cd9869307cd3ff";
    Connection conn = DriverManager.getConnection(dbURL, user, pass);

    Statement st = conn.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from staffs where staff_id='" + staffid + "' and staff_password='" + pwd + "'");

    if (rs.next()) {
        session.setAttribute("staffid", staffid);
        response.sendRedirect("dashboardStaff.jsp");
    } else {
        out.println("Invalid password <a href='indexStaff.jsp'> try again</a>");
        response.sendRedirect("indexStaff.jsp");
    }
%>
