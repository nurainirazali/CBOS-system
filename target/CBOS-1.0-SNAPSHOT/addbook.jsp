<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 1/1/2022
  Time: 9:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
    .container {
        position: relative;
        border-radius: 5px;
        background-color: white;
        padding: 20px 0 30px 0;
        width: 50%;
        border: 2px grey;
        border-style:solid;
    }
    table, th, td {
        border:1px ;
    }
</style>

<body style="background-color:#D7EAE8;">
<%@include file="navbar.html"%>
<center>
    <br>
    <div class="container">
        <h1>Add Book</h1>
        <form method="post" action="BookAddServlet" enctype="multipart/form-data">
            <label for="fid">Book ID :</label>
            <input type="text" id="fid" name="fid"><br><br>
            <label for="ltitle">Title :</label>
            <input type="text" id="ltitle" name="ltitle"><br><br>
            <label for="lname">Author Name :</label>
            <input type="text" id="lname" name="lname"><br><br>
            <label for="lpub">Publisher :</label>
            <input type="text" id="lpub" name="lpub"><br><br>
            <label for="lisbn">ISBN :</label>
            <input type="text" id="lisbn" name="lisbn"><br><br>
            <label for="ldes">Description :</label>
            <input type="text" id="ldes" name="ldes"><br><br>
            <label for="lprice">Price (RM):</label>
            <input type="number" id="lprice" name="lprice"><br><br>
            <label for="lstock">Stock :</label>
            <input type="number" id="lstock" name="lstock"><label> pcs</label><br><br>
            <label for="lpubdate">Publish Date :</label>
            <input type="date" id="lpubdate" name="lpubdate"><br><br>
            <label for="myFile">Book Cover :</label>
            <input type="file" id="myFile" name="limage" accept="image/jpeg, image/png, image/jpg"><br><br><br>
            <input type="submit" value="Add">
        </form>
        <br><br>
    </div>
</center>
</body>
</html>
