package com.example.cbos;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet(name = "BookAddServlet", value = "/BookAddServlet")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50
)
public class BookAddServlet extends HttpServlet {
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
            String staffid= (String)session.getAttribute("staffid");
            String fid=request.getParameter("fid");
            String ltitle=request.getParameter("ltitle");
            String lstock=request.getParameter("lstock");
            String lname=request.getParameter("lname");
            String lisbn=request.getParameter("lisbn");
            String lpubdate=request.getParameter("lpubdate");
            String ldes=request.getParameter("ldes");
            String lpub=request.getParameter("lpub");
            String lprice=request.getParameter("lprice");

            Class.forName("org.postgresql.Driver");
            String dbURL = "jdbc:postgresql://ec2-3-212-143-188.compute-1.amazonaws.com:5432/ddn4nslo8pnje3";
            String user = "qoyqwxbjtgaycf";
            String pass = "4114ea71f4f849e6cd6d107aefe44df92996eeea835a25ef81cd9869307cd3ff";
            Connection conn = DriverManager.getConnection(dbURL, user, pass);

            try {
                part = request.getPart("limage");
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

            st = conn.prepareStatement("insert into BOOKS (book_id, book_title, book_stock, book_author, book_isbn, book_publishdate, book_publisher, book_price,STAFF_ID, book_cover,book_description) values (?,?,?,?,?,?,?,?,?,?,?)");
            st.setString(1, fid);
            st.setString(2, ltitle);
            st.setString(3, lstock);
            st.setString(4, lname);
            st.setString(5, lisbn);
            st.setString(6, lpubdate);
            st.setString(7, lpub);
            st.setString(8, lprice);
            st.setString(9, staffid);
            st.setString(10,urlPathForDB);
            st.setString(11,ldes);
            int count = st.executeUpdate();

            if(count>0)
            {
                out.println("insert successfully");
                RequestDispatcher dispatcher = request.getRequestDispatcher("bookList.jsp");
                dispatcher.forward (request, response);
            }
            else
            {
                out.println("Not successfully");
                RequestDispatcher dispatcher = request.getRequestDispatcher("addbook.jsp");
            }
        }catch(Exception e){
            out.println(e);
        }
    }
}
