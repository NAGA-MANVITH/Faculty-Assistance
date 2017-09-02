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
import org.json.simple.JSONObject;

/**
 *
 * @author Vasishta
 */
public class Servlet17 extends HttpServlet {

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
            String branch = request.getParameter("branch");
            String semester = request.getParameter("semester");
            String subject = request.getParameter("subject");
            String section = request.getParameter("section");
            String fac_id = request.getParameter("fac_id");
            String program = request.getParameter("program");
            String query = "SELECT distinct reg_no, assesment_type, assesment_number, total_marks, max_marks FROM internal_marks WHERE fac_id='" + fac_id + "' and acad_year='" + acad_year + "' and program='" + program + "' and branch='" + branch + "' and semester='" + semester + "' and subject='" + subject + "' and section='" + section + "' ORDER BY reg_no";
            System.out.println(query);
            Class.forName("com.mysql.jdbc.Driver");
            String connectionURL = "jdbc:mysql://localhost:3306/marks_attend?zeroDateTimeBehavior=convertToNull";
            Connection con = DriverManager.getConnection(connectionURL,"root","");
            Statement statement = con.createStatement();
            Statement statement_1 = con.createStatement();
            ResultSet rs = statement.executeQuery(query);
            JSONObject obj = new JSONObject();
            while(rs.next()) {
                JSONObject studentObject = new JSONObject();
                obj.put(rs.getString("reg_no"), studentObject);
                String query_1 = "SELECT name FROM students_tmp WHERE reg_no='" + rs.getString("reg_no") + "'";
                ResultSet res = (ResultSet) statement_1.executeQuery(query_1);
                res.next();
                JSONObject existing = (JSONObject) obj.get(rs.getString("reg_no"));
                String name = res.getString("name");
                existing.put("studentName", name);
            }
            rs = statement.executeQuery(query);
            while(rs.next()) {
                JSONObject existing = (JSONObject) obj.get(rs.getString("reg_no"));
                String testName = rs.getString(2) + rs.getString(3);
                existing.put(testName, rs.getString(4));
                existing.put("maxMarks"+testName, rs.getString(5));
            }
            System.out.println(obj);
            String json1 = null;
            response.setContentType("application/json");
            response.getWriter().write(obj.toJSONString());
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
