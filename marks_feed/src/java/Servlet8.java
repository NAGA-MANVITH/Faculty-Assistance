/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import com.google.gson.Gson;
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
public class Servlet8 extends HttpServlet {

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
            String acad_year = request.getParameter("acad_year");
            String program = request.getParameter("program");
            String branch = request.getParameter("branch");
            String semester = request.getParameter("semester");
            String subject = request.getParameter("subject");
            String section = request.getParameter("section");
            String fac_id = request.getParameter("facid");
           Class.forName("com.mysql.jdbc.Driver");
            String connectionURL = "jdbc:mysql://localhost:3306/marks_attend?zeroDateTimeBehavior=convertToNull";
            Connection con = DriverManager.getConnection(connectionURL,"root","");
            Statement statement = con.createStatement();
            String query = "SELECT * FROM internal_marks_temp WHERE fac_id='"+fac_id+"'AND acad_year='"+acad_year+"' AND program='"+program+"' AND branch='"+branch+"' AND semester='"+semester+"' AND section='"+section+"' AND subject='"+subject+"'";
            ResultSet rs = statement.executeQuery(query);
            String exist = "Yes";
            
            if(!rs.next()) {
                exist = "No";
                //String json = new Gson().toJson(exist);
                response.setContentType("text/plain");
                response.getWriter().write(exist);
                con.close();
            }
            response.setContentType("text/plain");
            response.getWriter().write(exist);
            System.out.println("Existing status is : " + exist);
            con.close();
        }
        catch (Exception e) {
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
