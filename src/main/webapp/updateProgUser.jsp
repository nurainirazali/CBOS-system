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
    String userid = (String)session.getAttribute("userid");
    String usrfid   = request.getParameter("fid");
    String usrname   = request.getParameter("lname");
    String usrpass = request.getParameter("lpass");
    String usrmail = request.getParameter("lmail");
    String usrnum = request.getParameter ("lnum");
    String usrdress = request.getParameter("ldress");

    try{
        Class.forName("org.postgresql.Driver");
        String dbURL = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/ddn4nslo8pnje3";
        String user = "qoyqwxbjtgaycf";
        String pass = "4114ea71f4f849e6cd6d107aefe44df92996eeea835a25ef81cd9869307cd3ff";
        Connection conn = DriverManager.getConnection(dbURL, user, pass);

        String query="update USERS set user_id=?, USER_NAME=?, USER_PASSWORD=?, USER_EMAIL=?, USER_PHONENUMBER=?, USER_ADDRESS=? where USER_ID='"+usrfid+"'";
        PreparedStatement st= null;
        st = conn.prepareStatement(query);
        st.setString(1,userid);
        st.setString(2,usrname);
        st.setString(3,usrmail);
        st.setString(4,usrdress);
        st.setString(5,usrnum);
        st.setString(6,usrpass);
        int row= st.executeUpdate();//return no of row effected

        if(row>0){
            out.println("Record inserted");
            RequestDispatcher dispatcher = request.getRequestDispatcher("profileUser.jsp");
            dispatcher.forward (request, response);
        }else{
            out.println("Record failed");
        }

    }catch (Exception e){
        e.printStackTrace();
    }
%>

