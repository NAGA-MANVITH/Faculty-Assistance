/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;


/**
 *
 * @author Vasishta
 */
public class Servlet22 extends HttpServlet {

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
        try{
            String questionsArray = request.getParameter("questionsArray");
            String acad_year = request.getParameter("acad_year");
            String regl_no = request.getParameter("regl_no");
            String program = request.getParameter("program");
            String semester = request.getParameter("semester");
            String branch = request.getParameter("branch");
            String sub_code = request.getParameter("sub_code");
            String year = request.getParameter("year");
            JSONObject obj = new JSONObject(questionsArray);
            Class.forName("com.mysql.jdbc.Driver");
            String connectionURL = "jdbc:mysql://localhost:3306/marks_attend?zeroDateTimeBehavior=convertToNull";
            Connection con = DriverManager.getConnection(connectionURL,"root","");
            Statement statement = con.createStatement();
            String query = "UPDATE semwisesubject SET co1 ='"+ obj.get("co1") +"',co2='"+ obj.get("co2") +"',co3='"+ obj.get("co3") +"',co4='"+ obj.get("co"+ "4") +"',co5='"+ obj.get("co5") +"' WHERE acad_year='" + acad_year + "' AND regl_no='" + regl_no + "' AND branch='" + branch + "' AND program='" + program + "' AND semester='" + semester + "' AND sub_code='" + sub_code + "' year='" + year + "'";
            statement.executeUpdate(query);
        }
        catch(Exception e){
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
