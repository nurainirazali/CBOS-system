<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        width: 30%;
        border: 2px grey;
        border-style:solid;
    }
</style>
<body style="background-color:#D7EAE8;">
<%@include file="indexbar.html"%>
<br>
<center>
    <div class="container">
        <h1>LOGIN ACCOUNT</h1>
        <img src="https://cdn-icons-png.flaticon.com/512/194/194931.png"  style="width:154px;height:152px;">
            <br>
            <h2>Staff</h2>
            <br>
        <form action="StaffLogin.jsp" method="post">
            <label for="fid">Id &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</label>
            <input type="text" id="fid" name="fid"><br><br>
            <label for="lpass">Password &nbsp;</label>
            <input type="password" id="lpass" name="lpass"><br><br><br>
            <input type="submit" value="Login" name="submit">
            <br>
            <br>
            <div class="text-center p-t-12">
                <a href="createaccStff.jsp">Create Account
                    <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
                </a>
            </div>
        </form>
    </div>
</center>
</body>
</html>
