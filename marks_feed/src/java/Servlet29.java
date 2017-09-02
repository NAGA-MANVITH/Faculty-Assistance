/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Vasishta
 */
public class Servlet29 extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String connectionURL = "jdbc:mysql://localhost:3306/marks_attend?zeroDateTimeBehavior=convertToNull";
            Connection con = DriverManager.getConnection(connectionURL,"root","");
            Statement statement = con.createStatement();
            String reg_no = request.getParameter("reg_no");
            String sub_code = request.getParameter("sub_code");
            String co1 = request.getParameter("co1");
            String co2 = request.getParameter("co2");
            String co3 = request.getParameter("co3");
            String co4 = request.getParameter("co4");
            String co5 = request.getParameter("co5");
            String acad_year = request.getParameter("acad_year");
            String faculty = request.getParameter("faculty");
            String semester = request.getParameter("semester");
            ResultSet rs = statement.executeQuery("Select fac_id from thirdtable where fac_name ='" +faculty + "'");
            rs.next();
            String fac_id = rs.getString("fac_id");
            rs = statement.executeQuery("Select section from studentstatus_tmp where reg_no ='" +reg_no + "'");
            rs.next();
            String section = rs.getString("section");
            rs = (ResultSet) statement.executeQuery("SELECT branch FROM students_tmp WHERE reg_no = '"+reg_no+"'");
            rs.next();
            String branch = rs.getString("branch");
            String query = "INSERT INTO courseend_survey(acad_year,semester,branch,section,sub_id,fac_id,student_id,co1,co2,co3,co4,co5) VALUES('" + acad_year + "','" + semester + "','" + branch + "','" + section + "','" + sub_code + "','" + fac_id + "','" + reg_no + "','" + co1 + "','" + co2 + "','" + co3 + "','" + co4 + "','" + co5 + "')";
            statement.executeUpdate(query);
            con.close();
        }
        catch(Exception e) {
            System.out.println(e);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
