/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.IOException;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Servlet3 extends HttpServlet {

        private static final long serialVersionUID = 1L;

        protected void doGet(HttpServletRequest request,
                HttpServletResponse response) throws ServletException, IOException {
            

  Connection connection=null;
   ResultSet rs=null;
   try{
  // Load the database driver
  Class.forName("com.mysql.jdbc.Driver");
            String connectionURL = "jdbc:mysql://localhost:3306/marks_attend";
            connection = DriverManager.getConnection(connectionURL,"root","");
  System.out.println("Loaded driver");   
  Statement statement = connection.createStatement();
  String program=request.getParameter("program");
  String acad_year=request.getParameter("acad_year");
String semestersName = request.getParameter("semestersName");
String branchName = request.getParameter("branchName");
String sub_code = request.getParameter("sub_code");
// String fac_id = request.getParameter("fac_id");
   
   
   rs=statement.executeQuery("select sub_type from semwisesubject where branch='"+branchName+"' and program='"+program+"' and semester='"+semestersName+"' and acad_year='"+acad_year+"' and sub_code='"+sub_code+"' ");
               
                List<String> list = new ArrayList<String>();
                List<String> list1=new ArrayList<String>();
                String json = null;
                while(rs.next()){
               
                        list.add(rs.getString(1));
                        
                }
                /* if (branchName.equals("Select branch")) {
                        list.add("Select semester");
                        list1.add("select sub_code");
                 }*/
                System.out.println(list);
                json = new Gson().toJson(list);
                response.setContentType("application/json");
                response.getWriter().write(json);
                connection.close();
        }
        catch(Exception e){
            System.out.println(e);
        }
    }
}