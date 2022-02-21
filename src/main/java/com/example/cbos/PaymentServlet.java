package com.example.cbos;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "PaymentServlet", value = "/PaymentServlet")
public class PaymentServlet extends HttpServlet {

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
            String orderid= (String)session.getAttribute("orderid");

            Class.forName("org.postgresql.Driver");
            String dbURL = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/ddn4nslo8pnje3";
            String user = "qoyqwxbjtgaycf";
            String pass = "4114ea71f4f849e6cd6d107aefe44df92996eeea835a25ef81cd9869307cd3ff";
            Connection conn = DriverManager.getConnection(dbURL, user, pass);

            try {
                part = request.getPart("payimage");
            } catch (Exception err) {
                err.printStackTrace();
                System.out.println(err.getMessage());
                return;
            }

            String host = request.getScheme() + "://" + request.getHeader("host") + "/";
            String imageFileName = part.getSubmittedFileName();
            String urlPathForDB = host + "upload/" + imageFileName;
            String applicationPath = getServletContext().getRealPath("");
            String savePath = applicationPath + "upload" + File.separator + imageFileName;

            if(!new File(applicationPath + "upload").exists()) {
                boolean created  = new File(applicationPath + "upload").mkdir();
                if(!created) {
                    System.out.println("Could not create folder: " + applicationPath + "upload");
                }
            }

            try {
                part.write(savePath);
            } catch (Exception err) {
                err.printStackTrace();
                System.out.println("Could not upload image file!");
                return;
            }

            st = conn.prepareStatement("insert into payments (payment_id, order_id, payment_evident) values (nextval('payment_sequence'),?,?,?)");
            st.setString(2,orderid);
            st.setString(3,urlPathForDB);
            int count = st.executeUpdate();

            if(count>0)
            {
                out.println("insert successfully");
                RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard.jsp");
                dispatcher.forward (request, response);
            }
            else
            {
                out.println("Not successfully");
                RequestDispatcher dispatcher = request.getRequestDispatcher("uploadpayment.jsp");
                dispatcher.forward (request, response);
            }
        }catch(Exception e){
            out.println(e);
            e.printStackTrace();
        }
    }
}
