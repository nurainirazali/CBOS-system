<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 20/2/2022
  Time: 6:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String orderid= (String)session.getAttribute("orderid");

    try{
        Class.forName("org.postgresql.Driver");
        String dbURL = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/ddn4nslo8pnje3";
        String user = "qoyqwxbjtgaycf";
        String pass = "4114ea71f4f849e6cd6d107aefe44df92996eeea835a25ef81cd9869307cd3ff";
        Connection conn = DriverManager.getConnection(dbURL, user, pass);

        String query="DELETE FROM orders WHERE order_id="+orderid;
        PreparedStatement st= null;
        st = conn.prepareStatement(query);
        int row= st.executeUpdate();

        if(row>0){
            out.println("Record deleted");
            RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard.jsp");
            dispatcher.forward (request, response);
        }else{
            out.println("Record deleted failed");
        }

    }catch (Exception e){
        e.printStackTrace();
    }
%>
