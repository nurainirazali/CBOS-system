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

<body style="background-color:#D7EAE8;padding-top: 50px;">
<center>
    <div class="container">
        <h1>LOGIN ACCOUNT</h1>

        <img src="https://scontent.xx.fbcdn.net/v/t39.30808-6/271818214_359858489195274_8560785430061830537_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=730e14&_nc_ohc=buLq4AKuapoAX_uKuwN&_nc_ht=scontent.xx&oh=00_AT-fm0bfbSTVeRebAc3gyuwOBorehmDUHS36KLLdicb4AA&oe=61EB0A15"  style="width:154px;height:152px;">
        <br>
        <br>
        <input type="radio" id="user" name="fav_language" value="user">
        <label for="user">USER</label>
        <input type="radio" id="staff" name="fav_language" value="staff">
        <label for="staff">STAFF</label>
            <br>
            <br>
            <label for="fname">Id &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</label>
            <input type="text" id="fname" name="fname"><br><br>
            <label for="lname">Password &nbsp;</label>
            <input type="text" id="lname" name="lname"><br><br><br>
            <input type="submit" value="Login">
            <br>
            <br>
            <div class="text-center p-t-12">
                <a href="#">Create Account
                    <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
                </a>
            </div>
    </div>
    <a href="createaccUsr.jsp">Create acc user</a>
    <a href="createaccStff.jsp">Create acc staff</a>
    <a href="delupduser.jsp">del up user</a>
    <a href="delupdStff.jsp">del up staff</a>
    <a href="addbook.jsp">add book</a>
    <a href="delupdbook.jsp">del up book</a>
    <a href="viewbooktocart.jsp">view book add to cart</a>
    <a href="booklist.jsp">booklist</a>
    <a href="paymentstatus.jsp">update payment status</a>
    <a href="uploadpayment.jsp">upload payment</a>
    <a href="updatetrackingnum.jsp">update track</a>
    <a href="booklistedit.jsp">edit book</a>
</center>
</body>
</html>
