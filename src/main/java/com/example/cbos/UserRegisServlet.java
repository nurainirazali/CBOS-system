package com.example.cbos;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet(name = "UserRegisServlet", value = "/UserRegisServlet")
public class UserRegisServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try{
            //  dlm parameter ni pastikan nama sama dalam form jsp name=""
            String usrfid   = request.getParameter("fid");
            String usrname   = request.getParameter("lname");
            String usrpass = request.getParameter("lpass");
            String usrdress = request.getParameter("ldress");
            String usrmail = request.getParameter("lmail");
            String usrnum = request.getParameter ("lnum");

            //nk testing keluar masuk data pastikan xampp, heroku , database connected
            Class.forName("org.postgresql.Driver"); // ni stay
            String dbURL = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/ddn4nslo8pnje3"; //ni url dri heroku database
            String user = "qoyqwxbjtgaycf"; //ni user dri heroku database
            String pass = "4114ea71f4f849e6cd6d107aefe44df92996eeea835a25ef81cd9869307cd3ff"; //ni password dri heroku database
            Connection conn = DriverManager.getConnection(dbURL, user, pass);
            // klau buat postgress atas2 ni amik yg details dri heroku

            PreparedStatement st;
            String query="INSERT INTO users (user_id, user_name, user_email, user_address, user_phonenumber, user_password) VALUES (?,?,?,?,?,?)";
            st = conn.prepareStatement(query);
            st.setString(1,usrfid);
            st.setString(2,usrname);
            st.setString(3,usrmail);
            st.setString(4,usrdress);
            st.setString(5,usrnum);
            st.setString(6,usrpass);
            int row= st.executeUpdate();//return no of row effected

            if(row>0){
                out.println("Record inserted");
                RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
                dispatcher.forward (request, response);
            }else{
                out.println("Record failed");
            }

        }catch(Exception e){
            out.println(e);
        }
    }
}
