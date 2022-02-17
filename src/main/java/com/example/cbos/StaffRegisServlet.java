package com.example.cbos;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "StaffRegisServlet", value = "/StaffRegisServlet")
public class StaffRegisServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        HttpSession session=request.getSession();
        PrintWriter out = response.getWriter();

        try{

            String stfid   = request.getParameter("fid");
            String stfname   = request.getParameter("lname");
            String stfpass = request.getParameter("lpass");
            String stfdress = request.getParameter("ldress");
            String stfmail = request.getParameter("lmail");
            String stfnum = request.getParameter ("lnum");


            Class.forName("org.postgresql.Driver");
            String dbURL = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/ddn4nslo8pnje3";
            String user = "qoyqwxbjtgaycf";
            String pass = "4114ea71f4f849e6cd6d107aefe44df92996eeea835a25ef81cd9869307cd3ff";
            Connection conn = DriverManager.getConnection(dbURL, user, pass);

            PreparedStatement st;
            String query="INSERT INTO staffs (staff_id, staff_name, staff_email, staff_address, staff_phonenumber, staff_password) VALUES (?,?,?,?,?,?)";
            st = conn.prepareStatement(query);
            st.setString(1,stfid);
            st.setString(2,stfname);
            st.setString(3,stfmail);
            st.setString(4,stfdress);
            st.setString(5,stfnum);
            st.setString(6,stfpass);
            int row= st.executeUpdate();

            if(row>0){
                out.println("Record inserted");
                RequestDispatcher dispatcher = request.getRequestDispatcher("indexStaff.jsp");
                dispatcher.forward (request, response);
            }else{
                out.println("Record failed");
            }

        }catch(Exception e){
            out.println(e);
        }
    }
}
