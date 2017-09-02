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
import org.json.JSONObject;

/**
 *
 * @author Vasishta
 */
public class Servlet14 extends HttpServlet {

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
            String feedback_no = request.getParameter("feedback_no");
            Class.forName("com.mysql.jdbc.Driver");
            String connectionURL = "jdbc:mysql://localhost:3306/marks_attend?zeroDateTimeBehavior=convertToNull";
            Connection con = DriverManager.getConnection(connectionURL,"root","");
            Statement statement = con.createStatement();
            String query = "SELECT  * FROM feedback_store WHERE year='" + acad_year + "' AND branch='" + branch + "' AND semester='" + semester + "' AND sub_id='" + subject + "' AND section='" + section + "' AND fac_id='" + fac_id + "' AND feedback_no='" + feedback_no + "'";            
            ResultSet rs = (ResultSet) statement.executeQuery(query);
            //String q1="select level from thirdtable where fac_id='" + fac_id +"'";
            List<String> list = new ArrayList<String>();
            JSONObject obj = new JSONObject();
            int totalNoofFeedbacks = 0;
            int c=0;
            for(int i = 1; i < 16; i++) {
                obj.put("q" + i, 0);
                obj.put("qexcellent"+i, 0);
                obj.put("qverygood"+i, 0);
                obj.put("qgood"+i, 0);
                obj.put("qaverage"+i, 0);
                obj.put("qpoor"+i, 0);
            }
            System.out.println(obj.toString());
            obj.put("excellent", 0);
            obj.put("verygood", 0);
            obj.put("good", 0);
            obj.put("average", 0);
            obj.put("poor", 0);
            obj.put("comments","");
            int existing = 0;
            String exist = "";
            while(rs.next()) {
                System.out.println(rs.getString("student_id"));
                c=c+1;
                if(rs.getString(1) == null)
                    break;
                String rating = rs.getString("rating");
                if(rating.compareTo("1") == 0) {
                    existing = (Integer) obj.get("poor");
                    ////existing = (int) obj.get("poor");
                    obj.put("poor", existing + 1);
                }
                else if(rating.compareTo("2") == 0) {
                    existing = (Integer) obj.get("average");
                    ////existing = (int) obj.get("average");
                    obj.put("average", existing + 1);
                }
                else if(rating.compareTo("3") == 0) {
                    existing = (Integer) obj.get("good");
                    ////existing = (int) obj.get("good");
                    obj.put("good", existing + 1);
                }
                else if(rating.compareTo("4") == 0) {
                    existing = (Integer) obj.get("verygood");
                    ////existing = (int) obj.get("verygood");
                    obj.put("verygood", existing + 1);
                }
                else if(rating.compareTo("5") == 0) {
                    existing = (Integer) obj.get("excellent");
                    ////existing = (int) obj.get("excellent");
                    obj.put("excellent", existing + 1);
                }
                exist = (String) obj.get("comments");
                if(rs.getString("comment").compareTo("") != 0){
                    obj.put("comments", rs.getString("comment") + ";" + exist);
                }   
                existing=0;
                for(int i = 1; i < 16; i++) {
                    String answer = rs.getString("q" + i);
                    System.out.println("S");
                    //System.out.println(answer);
                    //System.out.println("S");
                if(answer.compareTo("1") == 0) {
                    existing = (Integer) obj.get("qpoor"+i);
                    ////existing = (int) obj.get("poor");
                    obj.put("qpoor"+i, existing + 1);
                }
                else if(answer.compareTo("2") == 0) {
                    existing = (Integer) obj.get("qaverage"+i);
                    ////existing = (int) obj.get("average");
                    obj.put("qaverage"+i, existing + 1);
                }
                else if(answer.compareTo("3") == 0) {
                    existing = (Integer) obj.get("qgood"+i);
                    ////existing = (int) obj.get("good");
                    obj.put("qgood"+i, existing + 1);
                }
                else if(answer.compareTo("4") == 0) {
                    existing = (Integer) obj.get("qverygood"+i);
                    ////existing = (int) obj.get("verygood");
                    obj.put("qverygood"+i, existing + 1);
                }
                else if(answer.compareTo("5") == 0) {
                    existing = (Integer) obj.get("qexcellent"+i);
                    System.out.println("excellent");
                    System.out.println(existing);
                    ////existing = (int) obj.get("excellent");
                    obj.put("qexcellent"+i, existing + 1);
                }
                }
            }
            totalNoofFeedbacks=c;
            for(int i=1;i<16;i++)
            {
                int poor=(Integer)obj.get("qpoor"+i);
                int average=(Integer)obj.get("qaverage"+i);
                int good=(Integer)obj.get("qgood"+i);
                int verygood=(Integer)obj.get("qverygood"+i);
                int excellent=(Integer)obj.get("qexcellent"+i);
                int avg=((poor*1)+(average*2)+(good*3)+(verygood*4)+(excellent*5));
                System.out.println("avg");
                int avg1=avg/totalNoofFeedbacks;
                System.out.println(avg1);
                obj.put("q"+i,avg1);
            }
            
            obj.put("totalNoofFeedbacks", totalNoofFeedbacks);
            System.out.println(obj);
            response.setContentType("application/json");
            response.getWriter().write(obj.toString());
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
