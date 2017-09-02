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
import org.json.simple.JSONObject;

/**
 *
 * @author Vasishta
 */
public class Servlet24 extends HttpServlet {

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
            String reg_no = request.getParameter("reg_no");
            String semester = request.getParameter("semester");
            String feedback_no = request.getParameter("feedback_no");
            String query = "SELECT sub_code FROM subjectselection_tmp WHERE acad_year='" + acad_year + "' AND reg_no='" + reg_no + "' AND semester='" + semester + "' ORDER BY sub_code";
            Class.forName("com.mysql.jdbc.Driver");
            String connectionURL = "jdbc:mysql://localhost:3306/marks_attend?zeroDateTimeBehavior=convertToNull";
            Connection con = DriverManager.getConnection(connectionURL,"root","");
            Statement statement = con.createStatement();
            ResultSet rs = (ResultSet) statement.executeQuery(query);
            List<String> list = new ArrayList<String>();
            while(rs.next()) {
                list.add(rs.getString(1));
            }
            String query_1 = "SELECT sub_id FROM feedback_store WHERE year='" + acad_year + "' AND student_id='" + reg_no + "' AND semester='" + semester + "' AND feedback_no='" + feedback_no + "' ORDER BY sub_id";
            rs = (ResultSet) statement.executeQuery(query_1);
            List<String> list2 = new ArrayList<String>();
            while(rs.next()) {
                list2.add(rs.getString(1));
            }
            JSONObject obj = new JSONObject();
            for (int i = 0; i < list.size(); i++) {
                if(list2.contains(list.get(i))) {
                    obj.put(list.get(i), 1);
                }
                else {
                    obj.put(list.get(i), 0);
                }
            }
            String json1 = "";
            json1 = new Gson().toJson(obj);
            response.setContentType("application/json");
            response.getWriter().write(json1);
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
