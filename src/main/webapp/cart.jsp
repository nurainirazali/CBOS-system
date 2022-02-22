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
                <tr>
                    <th>Book Title</th>
                    <th>Quantity</th>
                    <th>Price (RM)</th>
                    <th>Total Price (RM)</th>
                </tr>
                <%
                    int grantot=0;
                    int ship=5;
                    int tax=1;
                    int totlast=0;
                    String userid = (String)session.getAttribute("userid");
                    try{
                        Class.forName("org.postgresql.Driver");
                        String dbURL = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/ddn4nslo8pnje3";
                        String user = "qoyqwxbjtgaycf";
                        String pass = "4114ea71f4f849e6cd6d107aefe44df92996eeea835a25ef81cd9869307cd3ff";
                        Connection conn = DriverManager.getConnection(dbURL, user, pass);

                        Statement st = conn.createStatement();
                        ResultSet rs;
                        rs = st.executeQuery("select * " +
                                "from BOOKS b  inner join cart c ON c.book_id=b.book_id AND c.user_id='"+userid+"'");
                    while (rs.next()){
                %>
                <tr rowspan ="4" >
                    <td style="text-align: center;"><br><br><%=rs.getString("book_title")%></td>
                    <td style="text-align: center;"><br><br><%=rs.getInt("cart_quantity")%></td>
                    <td style="text-align: center;"><br><br><%=rs.getInt("book_price")%></td>
                    <%
                        int price=rs.getInt("book_price");
                        int totprice=price*rs.getInt("cart_quantity");
                        grantot=grantot+totprice;
                        totlast=grantot+tax+ship;
                    %>
                    <td style="text-align: center;"><br><br><%=totprice%></td>
                </tr >
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </table>
            <br><br><br>
            <hr class="solid">
            <a style="margin-left: 45%; ">Sub Total: &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;<%=grantot%></a><br>
            <a style="margin-left: 45%; ">Tax :  &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;<%=tax%></a><br>
            <a style="margin-left: 45%; ">Shipping:  &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;<%=ship%></a><br>
            <a style="margin-left: 45%; ">Grand Total (RM): <%=totlast%></a>
            <hr class="solid">
            <br>
            <form action="OrderConfirmServlet" method="post">
                <input type="hidden" name="totalprice" value="<%=totlast%>">
                <button>Confirm</button>
            </form>
            <a href="cancelorder.jsp"><button>Cancel Order</button></a>
        </div>
        <br><br>
    </div>
</center>
</body>
</html>

