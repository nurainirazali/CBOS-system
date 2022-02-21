package com.example.cbos;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "OrderConfirmServlet", value = "/OrderConfirmServlet")
public class OrderConfirmServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session=request.getSession();
        int orderid=0;
        int ordernum=1000;
        PreparedStatement st = null;
        PreparedStatement st1 = null;
        PreparedStatement st2 = null;
        PreparedStatement st3 = null;
        PreparedStatement st4 = null;
        ResultSet rs=null;
        ResultSet rs1=null;
        Part part;

        try{
            String userid = (String)session.getAttribute("userid");
            int totprice=Integer.parseInt(request.getParameter("totalprice"));
            java.util.Date date = new java.util.Date();
            Date sqlDate = new Date(date.getTime());
            String track="1234";

            Class.forName("org.postgresql.Driver");
            String dbURL = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/ddn4nslo8pnje3";
            String user = "qoyqwxbjtgaycf";
            String pass = "4114ea71f4f849e6cd6d107aefe44df92996eeea835a25ef81cd9869307cd3ff";
            Connection conn = DriverManager.getConnection(dbURL, user, pass);

            PreparedStatement st5=null;
            st5=conn.prepareStatement("select max(order_num) from orders");
            ResultSet rs5=st5.executeQuery();
            while (rs5.next()){
                ordernum=rs5.getInt(1);
                ordernum=ordernum+1000;

                st = conn.prepareStatement("insert into orders (order_id,order_date, order_price, order_trackingnumber, user_id, order_num) values (default,?,?,?,?,?)");
                st.setDate(1,sqlDate);
                st.setInt(2,totprice);
                st.setString(3,track);
                st.setString(4, userid);
                st.setInt(5,ordernum);
                int count1 = st.executeUpdate();

                if(count1>0)
                {
                    st1=conn.prepareStatement("select cart_quantity,book_id from cart where user_id=?");
                    st1.setString(1,userid);
                    rs= st1.executeQuery();
                    while (rs.next()){
                        int cartquan=rs.getInt("cart_quantity");
                        int bookid1=rs.getInt("book_id");

                        st2= conn.prepareStatement("select max(order_id) from orders");
                        rs1=st2.executeQuery();
                        if(rs1.next()){
                            orderid=rs1.getInt(1);
                        }

                        st3=conn.prepareStatement("insert into orderbook (ob_id, ob_quantity, order_id, book_id) VALUES (nextval('ob_sequence'),?,?,?)");
                        st3.setInt(1,cartquan);
                        st3.setInt(2,orderid);
                        st3.setInt(3,bookid1);
                        st3.executeUpdate();
                    }
                    out.println("insert successfully");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("uploadpayment.jsp");
                    dispatcher.forward (request, response);
                }
                else
                {
                    out.println("Not successfully");
                }
                ordernum++;
            }

            st4=conn.prepareStatement("delete from cart where user_id='"+userid+"'");
            st4.executeUpdate();

        }catch(Exception e){
            out.println(e);
            e.printStackTrace();
        }
    }
}
