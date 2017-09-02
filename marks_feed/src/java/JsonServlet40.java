
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


public class JsonServlet40 extends HttpServlet {

        private static final long serialVersionUID = 1L;

        protected void doGet(HttpServletRequest request,
                HttpServletResponse response) throws ServletException, IOException {
   ResultSet rs=null;
   Connection connection = null;
   try{
       Class.forName("com.mysql.jdbc.Driver");
            String connectionURL = "jdbc:mysql://localhost:3306/temp_hostgvp?zeroDateTimeBehavior=convertToNull";
            connection = DriverManager.getConnection(connectionURL,"root","");
    Statement statement = connection.createStatement();
   String branch = request.getParameter("branch");
   String semester = request.getParameter("semester");
   
   String program = request.getParameter("program");
   String year = request.getParameter("year");
   String acad_year = request.getParameter("acad_year");
   
   String regl_no = request.getParameter("regl_no");
  
   
                 rs=statement.executeQuery("select distinct order1 from semwisesubject where branch='"+branch+"' and program='"+program+"' and acad_year='"+acad_year+"' and regl_no='"+regl_no+"' and year='"+year+"' and semester='"+semester+"' ORDER BY cast(order1 as unsigned) asc");
                List<String> list = new ArrayList<String>();
                //List<String> list1=new ArrayList<String>();
                String json = null;
        
                while(rs.next()){
                            System.out.println(rs.getString(1));
                            list.add(rs.getString(1));
                             
                }
                json = new Gson().toJson(list);
                response.setContentType("application/json");
                response.getWriter().write(json);
                connection.close();
        }
   catch(Exception e){System.out.println("Exception in JsonServlet1");}
   finally {
}       
        }
}