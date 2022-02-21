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
    String stffid   = request.getParameter("fid");
    String stfname   = request.getParameter("lname");
    String stfpass = request.getParameter("lpass");
    String stfmail = request.getParameter("lmail");
    String stfnum = request.getParameter ("lnum");
    String stfdress = request.getParameter("ldress");

    try{
        Class.forName("org.postgresql.Driver");
        String dbURL = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/ddn4nslo8pnje3";
        String user = "qoyqwxbjtgaycf";
        String pass = "4114ea71f4f849e6cd6d107aefe44df92996eeea835a25ef81cd9869307cd3ff";
        Connection conn = DriverManager.getConnection(dbURL, user, pass);

        String query="update STAFFS set STAFF_ID=?, STAFF_NAME=?, STAFF_EMAIL=?, staff_address=?, STAFF_PHONENUMBER=?, staff_password=? where STAFF_ID='"+stffid+"'";
        PreparedStatement st= null;
        st = conn.prepareStatement(query);
        st.setString(1,staffid);
        st.setString(2,stfname);
        st.setString(3,stfmail);
        st.setString(4,stfdress);
        st.setString(5,stfnum);
        st.setString(6,stfpass);
        int row= st.executeUpdate();//return no of row effected

        if(row>0){
            out.println("Record inserted");
            RequestDispatcher dispatcher = request.getRequestDispatcher("profileStaff.jsp");
            dispatcher.forward (request, response);
        }else{
            out.println("Record failed");
        }

    }catch (Exception e){
        e.printStackTrace();
    }
%>

