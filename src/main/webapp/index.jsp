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
        <img src="https://scontent.xx.fbcdn.net/v/t39.30808-6/271818214_359858489195274_8560785430061830537_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=730e14&_nc_ohc=buLq4AKuapoAX_uKuwN&_nc_ht=scontent.xx&oh=00_AT-fm0bfbSTVeRebAc3gyuwOBorehmDUHS36KLLdicb4AA&oe=61EB0A15"  style="width:154px;height:152px;">
            <br>
            <h2>User</h2>
            <br>
        <form action="UserLogin.jsp" method="post">
            <label for="fid">Id &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</label>
            <input type="text" id="fid" name="fid"><br><br>
            <label for="lpass">Password &nbsp;</label>
            <input type="password" id="lpass" name="lpass"><br><br><br>
            <input type="submit" value="Login">
            <br>
            <br>
            <div class="text-center p-t-12">
                <a href="createaccUsr.jsp">Create Account
                    <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
                </a>
            </div>
        </form>
    </div>
</center>
</body>
</html>
