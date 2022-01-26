package com.example.cbos;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "StaffRegisServlet", value = "/StaffRegisServlet")
public class StaffRegisServlet extends HttpServlet {

    public StaffRegisServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(); // if nk wujudkan session mcm sir buat

        // tarik value dri form dalam jsp lalu kot javascript bawah tu
        String sffid = (String) session.getAttribute("sdid");
        String sffname = (String) session.getAttribute("sdName");
        String sffpass = (String) session.getAttribute("sdEmail");
        String sffmail = (String) session.getAttribute("sdPnum");
        String sffdress = (String) session.getAttribute("sdPnum");
        String sffnum = (String) session.getAttribute("sdPnum");

        //masukkan value ke dlm java class StudentDetails
        Staff stf = new Staff(sffid, sffname, sffpass, sffmail, sffdress, sffnum);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try{
            //  dlm parameter ni pastikan nama sama dalam form jsp name=""
            String stfid   = request.getParameter("fid");
            String stfname   = request.getParameter("lname");
            String stfpass = request.getParameter("lpass");
            String stfdress = request.getParameter("ldress");
            String stfmail = request.getParameter("lmail");
            String stfnum = request.getParameter ("lnum");


            //nk testing keluar masuk data pastikan xampp, heroku , database connected

            Class.forName("org.postgresql.Driver"); // ni stay
            String dbURL = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/ddn4nslo8pnje3"; //ni url dri heroku database
            String user = "qoyqwxbjtgaycf"; //ni user dri heroku database
            String pass = "4114ea71f4f849e6cd6d107aefe44df92996eeea835a25ef81cd9869307cd3ff"; //ni password dri heroku database
            Connection conn = DriverManager.getConnection(dbURL, user, pass);
            // klau buat postgress atas2 ni amik yg details dri heroku

            PreparedStatement st;
            String query="INSERT INTO staffs (staff_id, staff_name, staff_email, staff_address, staff_phonenumber, staff_password) VALUES (?,?,?,?,?,?)";
            st = conn.prepareStatement(query);
            st.setString(1,stfid);
            st.setString(2,stfname);
            st.setString(3,stfpass);
            st.setString(4,stfdress);
            st.setString(5,stfmail);
            st.setString(6,stfnum);
            int row= st.executeUpdate();//return no of row effected

            if(row>0){
                out.println("Record inserted");
            }else{
                out.println("Record failed");
            }

        }catch(Exception e){
            out.println(e);
        }
    }
}
