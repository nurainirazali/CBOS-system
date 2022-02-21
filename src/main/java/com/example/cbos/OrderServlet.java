package com.example.cbos;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.applet.Applet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "OrderServlet", value = "/OrderServlet")
public class OrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session=request.getSession();

        PreparedStatement st = null;
        ResultSet rs=null;
        Part part;

        try{
            String bookid = request.getParameter("fid");
            String userid = (String)session.getAttribute("userid");
            int price=Integer.parseInt(request.getParameter("lprice"));
            int quan=Integer.parseInt(request.getParameter("lquan"));
            java.util.Date date = new java.util.Date();
            Date sqlDate = new Date(date.getTime());
            int totprice=price*quan;

            Class.forName("org.postgresql.Driver");
            String dbURL = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/ddn4nslo8pnje3";
            String user = "qoyqwxbjtgaycf";
            String pass = "4114ea71f4f849e6cd6d107aefe44df92996eeea835a25ef81cd9869307cd3ff";
            Connection conn = DriverManager.getConnection(dbURL, user, pass);

            st = conn.prepareStatement("insert into orders (order_id, order_date, order_price, book_id, user_id, order_quan) values (nextval('order_sequence'),?,?,?,?,?)");
            st.setDate(1,sqlDate);
            st.setInt(2,totprice);
            st.setString(3, bookid);
            st.setString(4, userid);
            st.setInt(5,quan);
            int count1 = st.executeUpdate();

            if(count1>0)
            {
                out.println("insert successfully");
                RequestDispatcher dispatcher = request.getRequestDispatcher("cart.jsp");
                dispatcher.forward (request, response);
            }
            else
            {
                out.println("Not successfully");
            }

        }catch(Exception e){
            out.println(e);
            e.printStackTrace();
        }
    }
}
