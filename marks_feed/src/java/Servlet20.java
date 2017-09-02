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
public class Servlet20 extends HttpServlet {

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
            System.out.println("Hello Hai");
            String acad_year = request.getParameter("acad_year");
            String fac_id = request.getParameter("fac_id");
            String program = request.getParameter("program");
            String branch = request.getParameter("branch");
            String semester = request.getParameter("semester");
            String sub_code = request.getParameter("sub_code");
            String section = request.getParameter("section");
            String assesment_type = request.getParameter("assesment_type");
            String assesment_method = request.getParameter("assesment_method");
            String assesment_number = request.getParameter("assesment_number");
            String temp_marks = request.getParameter("temp_marks");
            Class.forName("com.mysql.jdbc.Driver");
            String connectionURL = "jdbc:mysql://localhost:3306/marks_attend?zeroDateTimeBehavior=convertToNull";
            Connection con = DriverManager.getConnection(connectionURL,"root","");
            Statement statement = con.createStatement();
            Statement statement_1 = con.createStatement();
            String query = "SELECT * FROM internal_temp WHERE fac_id='" + fac_id + "' AND acad_year='" + acad_year + "' AND program='" + program + "' AND branch='" + branch + "' AND semester='" + semester + "' AND sub_code='" + sub_code + "' AND section='" + section + "' AND assesment_type='" + assesment_type + "' AND assesment_method='" + assesment_method + "' AND assesment_number='" + assesment_number + "'";
            System.out.println(query);
            ResultSet rs = (ResultSet) statement.executeQuery(query);
            if(!rs.next()) {
                String query_1 = "INSERT INTO internal_temp(`fac_id`, `acad_year`, `program`, `branch`, `semester`, `sub_code`, `section`, `assesment_type`, `assesment_method`, `assesment_number`, `temp_marks`) VALUES('" + fac_id + "', '" + acad_year + "', '" + program + "', '" + branch + "', '" + semester + "', '" + sub_code + "', '" + section + "', '" + assesment_type + "', '" + assesment_method + "', '" + assesment_number + "', '" + temp_marks + "')";
                System.out.println(query_1);
                statement_1.executeUpdate(query_1);
            }
            else {
                String query_2 = "UPDATE internal_temp SET temp_marks='" + temp_marks + "' WHERE fac_id='" + fac_id + "' AND acad_year='" + acad_year + "' AND program='" + program + "' AND branch='" + branch + "' AND semester='" + semester + "' AND sub_code='" + sub_code + "' AND section='" + section + "' AND assesment_type='" + assesment_type + "' AND assesment_method='" + assesment_method + "' AND assesment_number='" + assesment_number + "'";
                System.out.println(query_2);
                statement_1.executeUpdate(query_2);
            }
            System.out.println("Hello");
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
