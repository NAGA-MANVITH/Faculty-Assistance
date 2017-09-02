
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

public class JsonServlet1 extends HttpServlet {

        private static final long serialVersionUID = 1L;

        protected void doGet(HttpServletRequest request,
                HttpServletResponse response) throws ServletException, IOException {

  Connection conn=null;
   ResultSet rs=null;
   try{
  // Load the database driver
       
  Class.forName("com.mysql.jdbc.Driver");
            String connectionURL = "jdbc:mysql://localhost:3306/marks_attend?zeroDateTimeBehavior=convertToNull";
            conn = DriverManager.getConnection(connectionURL,"root","");
   Statement statement = conn.createStatement();
   String branchName = request.getParameter("branchName");
   String fac_id = request.getParameter("fac_id");
   String acad_year=request.getParameter("acad_year");
   String program=request.getParameter("program");
   
   System.out.println(branchName+"--- "+fac_id+"---");
   rs=statement.executeQuery("select distinct semester from secondtable where branch='"+branchName+"' and fac_id='"+fac_id+"' and program='"+program+"' and accdyear='"+acad_year+"'");
  // System.out.println("select distinct semester from secondtable where branch='"+branchName+"' and fac_id='"+fac_id+"' and program='"+program+"' and accdyear='"+acad_year+"'");
                List<String> list = new ArrayList<String>();
                //List<String> list1=new ArrayList<String>();
                String json = null;
        
while(rs.next()){
               System.out.println(rs.getString(1));
                        list.add(rs.getString(1));
                             
}
System.out.println(list);
                json = new Gson().toJson(list);
                response.setContentType("application/json");
                response.getWriter().write(json);
                conn.close();
        }
   catch(Exception e){System.out.println("Exception in JsonServlet1");}
        
        }
}