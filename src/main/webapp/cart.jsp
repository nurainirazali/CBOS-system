<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 22/1/2022
  Time: 12:26 PM
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
    }

    .frame {
        width: auto;
        margin: 40px auto 10px;
        padding: 20px;
        border: 1px solid black;
        background: white;
        border-radius: 10px 10px 10px 10px;
    }

    hr.solid {
        border-top: 3px solid #bbb;
    }
</style>
<body style="background-color:#D7EAE8;">
<%@include file="navbaruser.html"%>
<br>
<center>
    <div class="container">
        <h1>Cart</h1>
        <br>
        <div class="frame" style="margin: 0px 20px; border-radius: 0px 0px 10px 10px;">
            <table class="display" cellspacing="0" width="100%" >
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
                        rs = st.executeQuery("select b.book_cover, b.book_title, o.order_id, o.order_price, o.order_quan " +
                                "from BOOKS b  inner join orders o ON book_id='"+bookid+"'" );
                    if (rs.next()){
                %>
                <tr rowspan ="4" >
                    <td style="text-align: center;"><br><br><%=rs.getInt("order_id")%></td>
                    <td style="text-align: center;"><br><br><a href="<%=rs.getString("book_cover")%>"></a></td>
                    <td style="text-align: center;"><br><br><%=rs.getString("book_title")%></td>
                    <td style="text-align: center;"><br><br><%=rs.getInt("book_price")%></td>
                    <td style="text-align: center;"><br><br><%=rs.getInt("order_quan")%></td>
                </tr >
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
                <tr>
                    <th>Order ID</th>
                    <th>Book Image</th>
                    <th>Book Title</th>
                    <th>Price (RM)</th>
                    <th>Quantity</th>
                </tr>
            </table>
            <br><br><br>
            <hr class="solid">
            <a style="margin-left: 45%; ">Sub Total: </a><br>
            <a style="margin-left: 45%; ">Tax (5%): </a><br>
            <a style="margin-left: 45%; ">Shipping: </a><br>
            <a style="margin-left: 45%; ">Grand Total:RM </a>
            <hr class="solid">
            <br>
            <p><a href="uploadpayment.jsp?"><button>CheckOut</button></a>/p>
            <p><a href="cancelorder.jsp?"><button>Cancel Order</button></a></p>
        </div>
        <br><br>
    </div>
</center>
</body>
</html>

