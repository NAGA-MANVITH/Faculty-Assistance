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
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;

/**
 *
 * @author Vasishta
 */
public class Servlet9 extends HttpServlet {

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
            System.out.println("Hello");
            String acad_year = request.getParameter("acad_year");
            String program = request.getParameter("program");
            String branch = request.getParameter("branch");
            String semester = request.getParameter("semester");
            String subject = request.getParameter("subject");
            String section = request.getParameter("section");
            String fac_id = request.getParameter("facid");
            String str = request.getParameter("coObj");
            JSONObject obj = new JSONObject(str);
            Class.forName("com.mysql.jdbc.Driver");
            String connectionURL = "jdbc:mysql://localhost:3306/marks_attend?zeroDateTimeBehavior=convertToNull";
            Connection con = DriverManager.getConnection(connectionURL,"root","");
            String assesment_type = request.getParameter("assesment_type");
            String assesment_number = request.getParameter("assesment_number");            
            Statement statement = con.createStatement();
            String query = "SELECT * FROM course_outcomes WHERE fac_id='"+fac_id+"'AND acad_year='"+acad_year+"' AND program='"+program+"' AND branch='"+branch+"' AND semester='"+semester+"' AND section='"+section+"' AND subject='"+subject+"' AND assesment_type='"+assesment_type+"' AND assesment_number='"+assesment_number+"'";
            ResultSet rs = statement.executeQuery(query);
            JSONObject tempObj1 = (JSONObject) obj.get("co1");
            String co1Percentage = (String) tempObj1.get("co1Percentage");
            String co1Attempted = (String) tempObj1.get("attempted");
            String co1Passed = (String) tempObj1.get("passed");
            System.out.println(tempObj1);
            JSONObject tempObj2 = (JSONObject) obj.get("co2");
            String co2Percentage = (String) tempObj2.get("co2Percentage");
            String co2Attempted = (String) tempObj2.get("attempted");
            String co2Passed = (String) tempObj2.get("passed");
            JSONObject tempObj3 = (JSONObject) obj.get("co3");
            String co3Percentage = (String) tempObj3.get("co3Percentage");
            String co3Attempted = (String) tempObj3.get("attempted");
            String co3Passed = (String) tempObj3.get("passed");
            JSONObject tempObj4 = (JSONObject) obj.get("co4");
            String co4Percentage = (String) tempObj4.get("co4Percentage");
            String co4Attempted = (String) tempObj4.get("attempted");
            String co4Passed = (String) tempObj4.get("passed");
            JSONObject tempObj5 = (JSONObject) obj.get("co5");
            String co5Percentage = (String) tempObj5.get("co5Percentage");
            String co5Attempted = (String) tempObj5.get("attempted");
            String co5Passed = (String) tempObj5.get("passed");
            if(!rs.next()) {    
                String query_2 = "INSERT INTO `course_outcomes` (`fac_id`, `acad_year`, `program`, `branch`, `semester`, `subject`, `section`, `assesment_type`, `assesment_number`, `co1`, `co1a`, `co1p`, `co2`, `co2a`, `co2p`, `co3`, `co3a`, `co3p`, `co4`, `co4a`, `co4p`, `co5`, `co5a`, `co5p`) VALUES('"+fac_id+"', '"+acad_year+"', '"+program+"', '"+branch+"', '"+semester+"', '"+subject+"', '"+section+"', '"+assesment_type+"', '"+assesment_number+"', '"+co1Percentage+"', '" + co1Attempted + "', '" + co1Passed + "', '"+co2Percentage+"', '" + co2Attempted + "', '" + co2Passed + "', '"+co3Percentage+"', '" + co3Attempted + "', '" + co3Passed + "', '"+co4Percentage+"', '" + co4Attempted + "', '" + co4Passed + "', '"+co5Percentage+"', '" + co5Attempted + "', '" + co5Passed + "')";
                System.out.println(query_2);
                statement.executeUpdate(query_2);
            }
            else {
                String query_3 = "UPDATE course_outcomes SET co1='"+co1Percentage+"', co1a='" + co1Attempted + "', co1p='" + co1Passed + "', co2='"+co2Percentage+"', co2a='" + co2Attempted + "', co2p='" + co2Passed + "', co3a='" + co3Attempted + "', co3p='" + co3Passed + "', co4a='" + co4Attempted + "', co4p='" + co4Passed + "', co5a='" + co5Attempted + "', co5p='" + co5Passed + "', co3='"+co3Percentage+"', co4='"+co4Percentage+"', co5='"+co5Percentage+"' WHERE fac_id='"+fac_id+"'AND acad_year='"+acad_year+"' AND program='"+program+"' AND branch='"+branch+"' AND semester='"+semester+"' AND section='"+section+"' AND subject='"+subject+"' AND assesment_type='" + assesment_type + "' AND assesment_number='" + assesment_number + "'";
                statement.executeUpdate(query_3);
              
            }
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
