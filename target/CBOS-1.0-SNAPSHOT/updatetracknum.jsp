<%@ page import="java.sql.*" %>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 13/2/2022
  Time: 9:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String staffid = (String)session.getAttribute("staffid");
    int orderid = Integer.parseInt(request.getParameter("orderid"));
    String track=request.getParameter("tracking");

    try{
        Class.forName("org.postgresql.Driver");
        String dbURL = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/ddn4nslo8pnje3";
        String user = "qoyqwxbjtgaycf";
        String pass = "4114ea71f4f849e6cd6d107aefe44df92996eeea835a25ef81cd9869307cd3ff";
        Connection conn = DriverManager.getConnection(dbURL, user, pass);

        String query="update orders set order_trackingnumber=? where order_id='"+orderid+"'";
        PreparedStatement st= null;
        st = conn.prepareStatement(query);
        st.setString(1,track);
        int row= st.executeUpdate();//return no of row effected

        if(row>0){
            out.println("Record inserted");
            RequestDispatcher dispatcher = request.getRequestDispatcher("trackingnum.jsp");
            dispatcher.forward (request, response);
        }else{
            out.println("Record failed");
        }

    }catch (Exception e){
        e.printStackTrace();
    }
%>

