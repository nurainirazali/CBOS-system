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
    table {
        font-family: arial, sans-serif;
        border-collapse: collapse;
        width: 80%;
    }

    td, th {
        border: 1px solid #dddddd;
        text-align: left;
        padding: 8px;
    }

    tr:nth-child(even) {
        background-color: #dddddd;
    }

</style>

<body style="background-color:#D7EAE8;">
<div>
    <%@include file="navbaruser.html"%>
</div>
<br>
<center>
    <div class="container">
        <h1>History</h1>
        <br><br>
        <table>
            <tr>
                <th>Order ID</th>
                <th>Date</th>
                <th>Book ID</th>
                <th>Quantity</th>
                <th>Total Price (RM)</th>
            </tr>
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
                    rs = st.executeQuery("select * from orders " );
                    while(rs.next()){ %>
            <tr>
                <td> 1001</td>
                <td> 2022-02-20</td>
                <td> 100</td>
                <td> 1</td>
                <td> 40</td>
            </tr>
            <tr>
                <td> <%= rs.getInt("order_id") %></td>
                <td> <%= rs.getDate("order_date") %></td>
                <td> <%= rs.getInt("book_id") %></td>
                <td> <%= rs.getInt("order_quan") %></td>
                <td> <%= rs.getInt("order_price") %></td>
            </tr>
            <% }
            } catch (Exception e) {
                e.printStackTrace();
            }
            %>
        </table>
    </div>
</center>
</body>
</html>

