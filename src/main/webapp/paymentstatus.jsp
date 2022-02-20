<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 22/1/2022
  Time: 12:22 PM
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
<%@include file="navbar.html"%>
<br>
<center>
  <div class="container">
    <h1>Payment Status</h1>
    <br>
      <table id="voteList" class="display" cellspacing="0" width="100%" >
        <tr>
          <th >Payment ID</th>
          <th >Image</th>
          <th ></th>
        </tr>
        <tr>
          <td> 10001</td>
          <td><img src="http://cbos-postgres.herokuapp.com/upload/ELC091-Manual-.jpg"></td>
          <td style="text-align: center;"><br><br><a href="paymentstatus.jsp"><button>Valid</button></a></td>
        </tr>
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
            rs = st.executeQuery("select * from payments");
            if (rs.next()){
        %>
        <tr rowspan ="4" >
          <td style="text-align: center;"><br><br><%=rs.getInt("payment_id")%></td>
          <td style="text-align: center;"><br><br><img src="<%=rs.getString("payment_evident")%>"  style="width:250px;height:250px;"></td>
          <td style="text-align: center;"><br><br><a href="updatepayStat.jsp"><button>Valid</button></a></td>
        </tr >
      </table>
      <%
          }
        } catch (Exception e) {
          e.printStackTrace();
        }
      %>
      <br><br>
      <hr class="solid">
      <br><br><br>
    </div>
    <br><br>
  </div>
</center>
</body>
</html>

