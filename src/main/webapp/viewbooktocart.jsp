<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 22/1/2022
  Time: 12:17 PM
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
        width: 60%;
        border: 2px grey;
        border-style:solid;
        height:auto;
    }

    hr.solid {
        border-top: 3px solid #bbb;
    }

    .card {
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
        max-width: 80%;
        margin: auto;
        text-align: center;
    }

    .price {
        color: grey;
        font-size: 18px;
    }

    .card button {
        border: none;
        outline: 0;
        padding: 12px;
        color: white;
        background-color: #28D434;
        text-align: center;
        cursor: pointer;
        width: 100%;
    }

    .card button:hover {
        opacity: 0.7;
    }

</style>

<body style="background-color:#D7EAE8;">
<%@include file="navbar.html"%>
<br>
<center>
    <div class="container">
        <h1>View Book</h1>
        <br>
        <hr class="solid"><br>
        <table style="width:100%">
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

