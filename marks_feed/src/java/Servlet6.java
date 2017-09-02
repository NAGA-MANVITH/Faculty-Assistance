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
public class Servlet6 extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Servlet6</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Servlet6 at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
        catch(Exception e){
            System.out.println(e);
        }
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
            String str =  request.getParameter("marks");
            JSONObject obj = new JSONObject(str);
            Iterator<?> keys = obj.keys();
            String fac_id = request.getParameter("facid");
            String acad_year = request.getParameter("acad_year");
            String program = request.getParameter("program");
            String branch = request.getParameter("branch");
            String semester = request.getParameter("semester");
            String subject = request.getParameter("subject");
            String section = request.getParameter("section");
            String assesment_type = request.getParameter("assesment_type");
            String assesment_number = request.getParameter("assesment_number");
            String max_marks = request.getParameter("max_marks");
            String query_1 = "SELECT * FROM internal_marks WHERE fac_id='"+fac_id+"'AND acad_year='"+acad_year+"' AND program='"+program+"' AND branch='"+branch+"' AND semester='"+semester+"' AND section='"+section+"' AND subject='"+subject+"' AND assesment_type='"+assesment_type+"' AND assesment_number='"+assesment_number+"'";
            ResultSet rs = statement.executeQuery(query_1);
            if(!rs.next()) {
                while( keys.hasNext() ) {
                    String key = (String)keys.next();
                    String marksLocal = (String) obj.get(key);
                    String query = "INSERT INTO `internal_marks` (`reg_no`, `fac_id`, `acad_year`, `program`, `branch`, `semester`, `subject`, `section`, `assesment_type`, `assesment_number`, `total_marks`, `max_marks`) VALUES('"+key+"', '"+fac_id+"', '"+acad_year+"', '"+program+"', '"+branch+"', '"+semester+"', '"+subject+"', '"+section+"', '"+assesment_type+"', '"+assesment_number+"', '"+marksLocal+"', '" + max_marks + "')";
                    statement.executeUpdate(query);
                }
            }
            
            else {
                while( keys.hasNext() ) {
                    String key = (String)keys.next();
                    String marksLocal = (String) obj.get(key);
                    String query = "UPDATE internal_marks SET max_marks='" + max_marks + "', total_marks='" + marksLocal + "' WHERE fac_id='"+fac_id+"'AND acad_year='"+acad_year+"' AND program='"+program+"' AND branch='"+branch+"' AND semester='"+semester+"' AND section='"+section+"' AND subject='"+subject+"' AND assesment_type='"+assesment_type+"' AND assesment_number='"+assesment_number+"' AND reg_no='" + key + "'";
                    System.out.println(query);
                    statement.executeUpdate(query);
                }
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
