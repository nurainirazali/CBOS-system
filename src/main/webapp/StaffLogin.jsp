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
<html>


<%
    String staffid = request.getParameter("fid");
    String pwd = request.getParameter("lpass");

    Class.forName("org.postgresql.Driver"); // ni stay
    String dbURL = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/ddn4nslo8pnje3"; //ni url dri heroku database
    String user = "qoyqwxbjtgaycf"; //ni user dri heroku database
    String pass = "4114ea71f4f849e6cd6d107aefe44df92996eeea835a25ef81cd9869307cd3ff"; //ni password dri heroku database
    Connection conn = DriverManager.getConnection(dbURL, user, pass);

    Statement st = conn.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from staffs where staff_id='" + staffid + "' and staff_password='" + pwd + "'");

    if (rs.next()) {
        session.setAttribute("staffid", staffid);
        response.sendRedirect("dashboardStaff.jsp");
    } else {
        out.println("Invalid password <a href='index.jsp'>try again</a>");

        response.sendRedirect("indexStaff.jsp");
    }
%>
<head>
    <script>
        function demo(){
            if (document.loginS.fid.value == ""){
                alert ( "Please enter the User ID." );
                document.getElementById("fid").focus();
                return false;
            }
            if (document.loginS.lpass.value == ""){
                alert ( "Please enter the password." );
                document.getElementById("lpass").focus();
                return false;
            }
            alert ( "Welcome User thanks for login" );
            return true;
        }
    </script>
</head>
</html>
