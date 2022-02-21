<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 13/2/2022
  Time: 2:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Profile</title>

    <style>
        .container {
            position: relative;
            border-radius: 5px;
            background-color: white;
            padding: 20px 0 30px 0;
            width: 30%;
            border: 2px grey;
            border-style:solid;
        }
    </style>
</head>
<body style="background-color:#D7EAE8;">
<%@include file="navbaruser.html"%>
<center>
    <br><br>
    <div class="container">
        <h1>Account Profile</h1>

        <img src="https://cdn-icons-png.flaticon.com/512/194/194931.png"  style="width:154px;height:152px;">
        <h3>User</h3>
        <br>
        <%
            String userid = (String)session.getAttribute("userid");
            try{
                Class.forName("org.postgresql.Driver");
                String dbURL = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/ddn4nslo8pnje3";
                String user = "qoyqwxbjtgaycf";
                String pass = "4114ea71f4f849e6cd6d107aefe44df92996eeea835a25ef81cd9869307cd3ff";
                Connection conn = DriverManager.getConnection(dbURL, user, pass);

                Statement st = conn.createStatement();
                ResultSet rs;
                rs = st.executeQuery("select * from users where user_id='" + userid+"'" );
                while (rs.next()){
        %>
        <table>
            <tr>
                <td>Id : &nbsp;</td>
                <td><input type="text" name="fid" value="<%=rs.getString("user_id")%>"></td>
            </tr>
            <tr>
                <td>Name : </td>
                <td><input type="text" name="lname" value="<%=rs.getString("user_name")%>"></td>
            </tr>
            <tr>
                <td>Email : </td>
                <td><input type="email" name="lmail" value="<%=rs.getString("user_email")%>"></td>
            </tr>
            <tr>
                <td>Address : </td>
                <td><input type="text" name="ldress" value="<%=rs.getString("user_address")%>"></td>
            </tr>
            <tr>
                <td>Phone number : </td>
                <td><input type="text" name="lnum" value="<%=rs.getString("user_phonenumber")%>"></td>
            </tr>
            <tr>
                <td>Password : </td>
                <td><input type="password" name="lpass" value="<%=rs.getString("user_password")%>"></td>
            </tr>
        </table>
        <br><br>
        <a href="updateProUser.jsp"><button>Update</button></a> &nbsp;
        <a href="deleteProUser.jsp"><button>Delete</button></a>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </div>
</center>
</body>
</html>
