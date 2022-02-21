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
        max-width: 200px;
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
        background-color: #8CCBC8;
        text-align: center;
        cursor: pointer;
        width: 100%;
    }

    .card button:hover {
        opacity: 0.7;
    }

</style>

<body style="background-color:#D7EAE8;">
<div>
    <%@include file="navbar.html"%>
</div>
<br>
<center>
    <div class="container">
        <h1>Book</h1>
        <br>
            <%
            String staffid = (String)session.getAttribute("staffid");
            String bookid = request.getParameter("id");
            try{
                Class.forName("org.postgresql.Driver");
                String dbURL = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/ddn4nslo8pnje3";
                String user = "qoyqwxbjtgaycf";
                String pass = "4114ea71f4f849e6cd6d107aefe44df92996eeea835a25ef81cd9869307cd3ff";
                Connection conn = DriverManager.getConnection(dbURL, user, pass);

                Statement st = conn.createStatement();
                ResultSet rs;
                rs = st.executeQuery("select * from BOOKS where book_id="+ bookid);
                while (rs.next()){
            %>
        <form action="updateProgBook.jsp" method="post">
            <div>
                Book Id : <input type="text" name="fid" value="<%=rs.getString("book_id")%>"><br><br>
                Title : <input type="text" name="ltitle" value="<%=rs.getString("book_title")%>"><br><br>
                Stock : <input type="number" name="lstock" value="<%=rs.getString("book_stock")%>"><br><br>
                Author : <input type="tetx" name="lname" value="<%=rs.getString("book_author")%>"><br><br>
                ISBN : <input type="text" name="lisbn" value="<%=rs.getString("book_isbn")%>"><br><br>
                Publish date : <input type="date" name="lpubdate" value="<%=rs.getString("book_publishdate")%>"><br><br>
                Publisher : <input name="lpub" type="text" value="<%=rs.getString("book_publisher")%>"><br><br>
                Description : <input name="ldes" type="text" value="<%=rs.getString("book_description")%>"><br><br>
                Price : RM <input name="lprice" type="number" value="<%=rs.getString("book_price")%>"><br><br>
                <input type="hidden" name="staffid" id="staffid" value=" ${sessionScope['staffid']}"/>
                <button>Update</button></a> &nbsp;
            </div>
        </form>
            <%
                }
                }catch (Exception e){
                    e.printStackTrace();
                }
            %>

</body>
</html>
