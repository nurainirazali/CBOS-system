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
    String fid=request.getParameter("fid");
    String ltitle=request.getParameter("ltitle");
    int lstock=Integer.parseInt(request.getParameter("lstock"));
    String lname=request.getParameter("lname");
    String lisbn=request.getParameter("lisbn");
    String pubdate=request.getParameter("lpubdate");
    Date lpubdate = Date.valueOf(pubdate);
    String ldes=request.getParameter("ldes");
    String lpub=request.getParameter("lpub");
    int lprice=Integer.parseInt(request.getParameter("lprice"));

    try{
        Class.forName("org.postgresql.Driver");
        String dbURL = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/ddn4nslo8pnje3";
        String user = "qoyqwxbjtgaycf";
        String pass = "4114ea71f4f849e6cd6d107aefe44df92996eeea835a25ef81cd9869307cd3ff";
        Connection conn = DriverManager.getConnection(dbURL, user, pass);

        String query="update BOOKS set BOOK_TITLE=?, BOOK_STOCK=?, BOOK_AUTHOR=?,BOOK_ISBN=?,BOOK_PUBLISHDATE=?,BOOK_PUBLISHER=?,BOOK_PRICE=?,BOOK_DESCRIPTION=?, STAFF_ID=? where BOOK_ID='"+fid+"'";
        PreparedStatement st= null;
        st = conn.prepareStatement(query);
        st.setString(1,ltitle);
        st.setInt(2,lstock);
        st.setString(3,lname);
        st.setString(4,lisbn);
        st.setDate(5,lpubdate);
        st.setString(6,lpub);
        st.setInt(7,lprice);
        st.setString(8,ldes);
        st.setString(9,staffid);
        int row= st.executeUpdate();//return no of row effected

        if(row>0){
            out.println("Record inserted");
            RequestDispatcher dispatcher = request.getRequestDispatcher("bookList.jsp");
            dispatcher.forward (request, response);
        }else{
            out.println("Record failed");
        }

    }catch (Exception e){
        e.printStackTrace();
    }
%>

