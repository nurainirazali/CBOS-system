<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 22/1/2022
  Time: 12:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.css">

<style>
    .container {
        position: relative;
        border-radius: 5px;
        background-color: white;
        padding: 20px 0 30px 0;
        width: 90%;
        border: 2px grey;
        border-style:solid;
        height:auto;
    }

</style>
<body style="background-color:#D7EAE8;">
<div>
    <%@include file="navbaruser.html"%>
</div>
<br>
<center>
    <div class="container">
        <h1>Book</h1>
        <br><br>
        <%
            String userid = (String)session.getAttribute("userid");
            String bookid = request.getParameter("id");
            try{
                Class.forName("org.postgresql.Driver");
                String dbURL = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/ddn4nslo8pnje3";
                String user = "qoyqwxbjtgaycf";
                String pass = "4114ea71f4f849e6cd6d107aefe44df92996eeea835a25ef81cd9869307cd3ff";
                Connection conn = DriverManager.getConnection(dbURL, user, pass);

                Statement st = conn.createStatement();
                ResultSet rs;
                rs = st.executeQuery("select * from BOOKS where book_id='"+bookid+"'" );
                while(rs.next()){
        %>
        <form method="post" action="OrderServlet" enctype="multipart/form-data">
        <div class="card">
            <input type="hidden"  name="fid" value="<%=rs.getInt("book_id")%>">
            <input type="hidden" name="lprice" value="<%=rs.getInt("book_price")%>">
            <img src="<%=rs.getString("book_cover")%>"style="width:35%">
            <h2><%= rs.getString("book_title") %></h2>
            <p class="price">Price: RM <%= rs.getInt("book_price") %></p>
            <p>Author: <%= rs.getString("book_author") %></p>
            <p><%= rs.getString("book_description") %></p>
            <label for="lquan">Quantity :</label>
            <input type="number" id="lquan" name="lquan" style="width: 50px;"><label> pcs </label>
            <p><button>Add to Cart</button></p>
        </div>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
        </form>
    </div>
</center>
</body>
</html>

