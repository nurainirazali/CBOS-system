<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 22/1/2022
  Time: 12:24 PM
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
        <h1>Payment</h1>
        <br>
        <div class="frame" style="margin: 0px 20px; border-radius: 0px 0px 10px 10px;">
            <table id="voteList" class="display" cellspacing="0" width="100%" >
                <thead>
                <tr>
                    <th ><a href="https://www.maybank2u.com.my/home/m2u/common/login.do"><img src="https://play-lh.googleusercontent.com/dEcCRYBuzpFUd2R_ZjTfPxKbRrZoiNoMiO2QULQu17k1jI9itzDQ4QM7kjMI_eFyRaI"  style="width:94px;height:92px;"></a></th>
                    <td >Maybank <br>158023902021<br>LucyTech Empire</td>
                    <th ><a href="https://www.bankislam.biz/"><img src="https://play-lh.googleusercontent.com/P5QxSIOc7_Jp38I-oz7OPzDSSpFiYTY2317tCOan6RvsekOZQr3704P3GBPly1xh0Ag"   style="width:94px;height:92px;"></a></th>
                    <td >Bank Islam <br>083249290123<br>ClickUS</td>
                </tr>
                </thead>
            </table>
            <br><br><br>
            <hr class="solid">
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
                    rs = st.executeQuery("select * from orders where user_id='"+userid+"'");
                    if (rs.next()){
            %>
            <a>Total: RM <%=rs.getInt("order_price")%></a><br>
            <hr class="solid">
            <br>
            <p style="background-color:red; color:white;">Please screenshot or capture the payment receipt as an evidence to be upload</p>
            <form method="post" action="PaymentServlet" enctype="multipart/form-data">
                <input type="hidden" name="orderid" value="<%=rs.getInt("order_id")%>">
                <label for="myFile">Upload Payment Evidence :</label>
                <input type="file" id="myFile" name="payimage" accept="image/jpeg, image/png, image/jpg">
                <button>Submit</button>
            </form>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </div>
        <br><br>
    </div>
</center>
</body>
</html>

