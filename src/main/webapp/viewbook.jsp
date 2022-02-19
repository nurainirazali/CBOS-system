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
<center>
<br>
<center>
    <div class="container">
        <h1>Book</h1>
        <br><br>
        <%
            String staffid = (String)session.getAttribute("staffid");
            try{
                Class.forName("org.postgresql.Driver");
                String dbURL = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/ddn4nslo8pnje3";
                String user = "qoyqwxbjtgaycf";
                String pass = "4114ea71f4f849e6cd6d107aefe44df92996eeea835a25ef81cd9869307cd3ff";
                Connection conn = DriverManager.getConnection(dbURL, user, pass);

                Statement st = conn.createStatement();
                ResultSet rs;
                rs = st.executeQuery("select * from BOOKS " );
        %>
        <table>
            <tr>
                <td >
                    <div class="card">
                        <img src="https://ababooks.com.my/wp-content/uploads/2021/07/WhatsApp-Image-2021-07-12-at-3.03.32-PM-300x300.jpeg" alt="Denim Jeans" style="width:35%">
                        <h2>ENT223</h2>
                        <p class="price">$19.99</p>
                        <p>Author:</p>
                        <p>Publisher:</p>
                        <p>ISBN:</p>
                        <p>Publish Date:</p>
                        <p>Description:</p>
                        <label for="lstock">Quantity :</label>
                        <input type="number" id="lstock" name="lstock" style="width: 50px;"><label> pcs </label>
                        <p><button>Add to Cart</button></p>
                    </div>
                </td>
            </tr>
        </table>
        <br><br><br>
        <br>
    </div>
    <br><br>
</center>
</body>
</html>
