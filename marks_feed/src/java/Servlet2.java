

import java.util.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
//import org.apache.commons.dbutils.DbUtils;
//import com.db.DBdetails;

public class Servlet2 extends HttpServlet {

        private static final long serialVersionUID = 2L;

        protected void doGet(HttpServletRequest request,
                HttpServletResponse response) throws ServletException, IOException {
            
 
  Connection connection=null;
   ResultSet rs=null;
   try{
  // Load the database driver
       //System.out.println("hello");
   Class.forName("com.mysql.jdbc.Driver");
            String connectionURL = "jdbc:mysql://localhost:3306/marks_attend";
            Connection con = DriverManager.getConnection(connectionURL,"root","");
   System.out.println("Loaded driver");
   Statement statement = con.createStatement();
   String semestersName = request.getParameter("semestersName1");
   //System.out.println(semestersName);
   String branchName = request.getParameter("branchName1");
    String fac_id = request.getParameter("fac_id");
    String acad_year=request.getParameter("acad_year");
    String program=request.getParameter("program");
   System.out.println(semestersName+" "+branchName+" "+fac_id+" "+acad_year+" "+program);
    System.out.println("select DISTINCT secondtable.sub_code,semwisesubject.sub_name from secondtable inner join semwisesubject on semwisesubject.sub_code=secondtable.sub_code  where semwisesubject.semester=secondtable.semester and secondtable.semester='"+semestersName+"' and secondtable.branch=semwisesubject.branch and secondtable.branch='"+branchName+"'and fac_id='"+fac_id+"' and acad_year='"+acad_year+"' and acad_year=accdyear and secondtable.program='"+program+"' and secondtable.program=semwisesubject.program");
   rs=statement.executeQuery("select DISTINCT secondtable.sub_code,semwisesubject.sub_name from secondtable inner join semwisesubject on semwisesubject.sub_code=secondtable.sub_code  where semwisesubject.semester=secondtable.semester and secondtable.semester='"+semestersName+"' and secondtable.branch=semwisesubject.branch and secondtable.branch='"+branchName+"'and fac_id='"+fac_id+"' and acad_year='"+acad_year+"' and acad_year=accdyear and secondtable.program='"+program+"' and secondtable.program=semwisesubject.program");
     
                List<String> list = new ArrayList<String>();
                String json1 = null;
while(rs.next()){
               
                        list.add(rs.getString(1)+";"+rs.getString(2));
                        
}
                /* if (branchName.equals("Select Branch")) {
                        list.add("Select semester");
                }*/
System.out.println(list);
                json1 = new Gson().toJson(list);
                response.setContentType("application/json");
                response.getWriter().write(json1);
                con.close();
        }
   catch(Exception e){
   System.out.println(e+"In Servlet2");
   }
        
        }
}