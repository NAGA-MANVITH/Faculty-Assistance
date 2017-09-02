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
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Vasishta
 */
public class Servlet12 extends HttpServlet {

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
            String typeOfExam = request.getParameter("typeofexam");
            int length = typeOfExam.length();
            String assesment_number = ""+typeOfExam.charAt(length - 1);
            String assesment_type = typeOfExam.substring(0, length - 1);
            Class.forName("com.mysql.jdbc.Driver");
            String connectionURL = "jdbc:mysql://localhost:3306/marks_attend?zeroDateTimeBehavior=convertToNull";
            Connection con = DriverManager.getConnection(connectionURL,"root","");
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("SELECT course_outcomes FROM regulations WHERE program_key='"+program+"'");
            rs.next();
            String noOfCourseOutcomes = rs.getString(1);
            if(noOfCourseOutcomes.compareTo("3") == 0) {
                String query = "SELECT co1, co2, co3 FROM course_outcomes WHERE fac_id='"+fac_id+"'AND acad_year='"+acad_year+"' AND program='"+program+"' AND branch='"+branch+"' AND semester='"+semester+"' AND section='"+section+"' AND subject='"+subject+"' AND assesment_type='"+assesment_type+"' AND assesment_number='"+assesment_number+"'";
                rs = statement.executeQuery(query);
                if(!rs.next()) {
                    response.setContentType("text/plain");
                    response.getWriter().write("Null");
                }
                else {
                    List<String> list = new ArrayList<String>();
                    String json1 = null;
                    list.add(rs.getString(1)+";"+rs.getString(2)+";"+rs.getString(3));
                    json1 = new Gson().toJson(list);
                    response.setContentType("application/json");
                    response.getWriter().write(json1);
                }
            }
            else if(noOfCourseOutcomes.compareTo("5") == 0) {
                String query = "SELECT co1, co2, co3, co4, co5 FROM course_outcomes WHERE fac_id='"+fac_id+"'AND acad_year='"+acad_year+"' AND program='"+program+"' AND branch='"+branch+"' AND semester='"+semester+"' AND section='"+section+"' AND subject='"+subject+"' AND assesment_type='"+assesment_type+"' AND assesment_number='"+assesment_number+"'";
                System.out.println(query);
                rs = statement.executeQuery(query);
                if(!rs.next()) {
                    response.setContentType("text/plain");
                    response.getWriter().write("Null");
                }
                else {
                    List<String> list = new ArrayList<String>();
                    String json1 = null;
                    list.add(rs.getString(1)+";"+rs.getString(2)+";"+rs.getString(3)+";"+rs.getString(4)+";"+rs.getString(5));
                    System.out.println(list);
                    json1 = new Gson().toJson(list);
                    response.setContentType("application/json");
                    response.getWriter().write(json1);
                }
            }
            else {
                response.setContentType("text/plain");
                System.out.println(noOfCourseOutcomes);
                response.getWriter().write("Didnt get into any loop");
            }
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
