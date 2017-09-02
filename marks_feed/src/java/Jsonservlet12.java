
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
import javax.swing.JOptionPane;


public class Jsonservlet12 extends HttpServlet {

        private static final long serialVersionUID = 1L;

        protected void doPost(HttpServletRequest request,
                HttpServletResponse response) throws ServletException, IOException {
 
  Connection connection=null;
    String json=null;
     List<String> list = new ArrayList<String>();
   try{
  // Load the database driver
Class.forName("com.mysql.jdbc.Driver");
            String connectionURL = "jdbc:mysql://localhost:3306/temp_hostgvp?zeroDateTimeBehavior=convertToNull";
            connection = DriverManager.getConnection(connectionURL,"root","");
  Statement statement1 = connection.createStatement();
  Statement statement = connection.createStatement();
   String branch = request.getParameter("branch");
   String semester = request.getParameter("semester");
   String sub_code = request.getParameter("sub_code");
   String program = request.getParameter("program");
   String year = request.getParameter("year");
   String acad_year = request.getParameter("acad_year");
   String sub_name = request.getParameter("sub_name");
   String sub_type = request.getParameter("sub_type");
   String category = request.getParameter("category");
   String regl_no = request.getParameter("regl_no");
   String order1=request.getParameter("order1");
   String credits = request.getParameter("credits");
 int i;
 
  i=statement.executeUpdate("insert into semwisesubject(regl_no,branch,program,semester,sub_code,sub_type,sub_category,sub_name,year,acad_year,order1,credits) values('"+regl_no+"','"+branch+"','"+program+"','"+semester+"','"+sub_code+"' ,'"+sub_type+"','"+category+"','"+sub_name+"','"+year+"','"+acad_year+"','"+order1+"', '" + credits + "')");
             //response.setStatus(200); 
 //JOptionPane.showMessageDialog(null,"Inserted successfully");
 if(i==1)
 {
     list.add("Data Inserted Successfully");
 }
 else
 {
     list.add("Data Not Inserted!!!");
 }
                //json = new Gson().toJson(list);
                //response.setContentType("application/json");
                //response.getWriter().write(json);
 
        }
   
   catch(Exception e){
   
   System.out.println("eXCEPTION HAPPENED AT JsonServlet12"+e);
   list.add("Exception Occured.Data Not Inserted");
   }finally {
        json = new Gson().toJson(list);
                response.setContentType("application/json");
                response.getWriter().write(json);
   
}
        
        }
}