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
public class Servlet5 extends HttpServlet {

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
        Connection connection=null;
        ResultSet rs=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String connectionURL = "jdbc:mysql://localhost:3306/marks_attend?zeroDateTimeBehavior=convertToNull";
            connection = DriverManager.getConnection(connectionURL,"root",""); 
            System.out.println("Loaded driver");            
            Statement statement = connection.createStatement();
            String branch=request.getParameter("branch");
            String semester=request.getParameter("semester");
            String sub_code=request.getParameter("sub_code");
            String section=request.getParameter("section");
            String fac_id=request.getParameter("fac_id");
            System.out.println(branch+semester+sub_code+fac_id);
            String query="SELECT reg_no FROM secondtable JOIN studentstatus_tmp WHERE branch='"+branch+"' AND studentstatus_tmp.semester='"+semester+"' AND sub_code='"+sub_code+"' AND studentstatus_tmp.section='"+section+"' AND fac_id='"+fac_id+"'";
            String query1="SELECT b.reg_no FROM secondtable a,studentstatus_tmp b WHERE a.branch='"+branch+"' AND b.semester='"+semester+"' AND a.sub_code='"+sub_code+"' AND b.section='"+section+"' AND a.fac_id='"+fac_id+"'";
            System.out.println(query);
            System.out.println(query1);
            rs=statement.executeQuery(query); 
            List<String> list = new ArrayList<String>();
                //List<String> list1=new ArrayList<String>();
            String json = null;
            while(rs.next()){
               
                list.add(rs.getString(1));
                //System.out.println("hello");
                        
            }
                /* if (branchName.equals("Select branch")) {
                        list.add("Select semester");
                        list1.add("select sub_code");
                 }*/
            json = new Gson().toJson(list);
            response.setContentType("application/json");
            response.getWriter().write(json);
            connection.close();
        }
        catch(Exception e) {
            System.out.println(e);
        }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
//    @Override
  //  protected void doPost(HttpServletRequest request, HttpServletResponse response)
    //        throws ServletException, IOException {
      //  processRequest(request, response);
    //}

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    //@Override
    //public String getServletInfo() {
     //   return "Short description";
    //}// </editor-fold>

}
}