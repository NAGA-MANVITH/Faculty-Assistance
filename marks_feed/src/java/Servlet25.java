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
public class Servlet25 extends HttpServlet {

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
            String q1=request.getParameter("q1");
            String q2=request.getParameter("q2");
            String q3=request.getParameter("q3");
            String q4=request.getParameter("q4");
            String q5=request.getParameter("q5");
            String q6=request.getParameter("q6");
            String q7=request.getParameter("q7");
            String q8=request.getParameter("q8");
            String q9=request.getParameter("q9");
            String q10=request.getParameter("q10");
            String q11=request.getParameter("q11");
            String q12=request.getParameter("q12");
            String q13=request.getParameter("q13");
            String q14=request.getParameter("q14");
            String q15=request.getParameter("q15");
            String faculty = request.getParameter("faculty");
            String rating=request.getParameter("rating");
            String comment=request.getParameter("comment");
            String acad_year = request.getParameter("acad_year");
            String semester = request.getParameter("semester");
            String reg_no = request.getParameter("reg_no");
            String sub_code = request.getParameter("sub_code");
            String feedback_no = request.getParameter("feedback_no");
            Class.forName("com.mysql.jdbc.Driver");
            String connectionURL = "jdbc:mysql://localhost:3306/marks_attend?zeroDateTimeBehavior=convertToNull";
            Connection con = DriverManager.getConnection(connectionURL,"root","");
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("Select fac_id from thirdtable where fac_name ='" +faculty + "'");
            rs.next();
            String fac_id = rs.getString("fac_id");
            rs = statement.executeQuery("Select section from studentstatus_tmp where reg_no ='" +reg_no + "'");
            rs.next();
            String section = rs.getString("section");
            rs = (ResultSet) statement.executeQuery("SELECT branch FROM students_tmp WHERE reg_no = '"+reg_no+"'");
            rs.next();
            String branch = rs.getString("branch");
            int i = statement.executeUpdate("INSERT INTO feedback_store(year,semester,branch,section,sub_id,fac_id,student_id,q1,q2,q3,q4,q5,q6,q7,q8,q9,q10,q11,q12,q13,q14,q15,rating,comment,feedback_no)VALUES('" + acad_year + "','" + semester + "','" + branch + "','" + section + "','" + sub_code + "','" + fac_id + "','" + reg_no + "','"+q1+"','"+q2+"','"+q3+"','"+q4+"','"+q5+"','"+q6+"','"+q7+"','"+q8+"','"+q9+"','"+q10+"','"+q11+"','"+q12+"','"+q13+"','"+q14+"','"+q15+"','"+rating+"','"+comment+"', '" + feedback_no + "')");
            
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
