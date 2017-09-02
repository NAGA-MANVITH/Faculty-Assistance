
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;
import org.json.simple.parser.JSONParser;
//import org.json.simple.JSONObject;




/**
 *
 * @author Vasishta
 */



public class NewServlet extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        out.println("Hello");
        System.out.println("Hello");
        try {
            JSONParser parser = new JSONParser();
            String str = request.getParameter("schemaObject");
            JSONObject obj = new JSONObject(str);
            System.out.println(obj);
            String facid = (String) obj.get("facid");
            String schemaName = "";
            String acad_year = request.getParameter("acad_year");
            String program = request.getParameter("program");
            String branch = request.getParameter("branch");
            String semester = request.getParameter("semester");
            String sub_code = request.getParameter("sub_code");
            String section = request.getParameter("section");
            String assesment_type = request.getParameter("assesment_type");
            String assesment_method = request.getParameter("assesment_method");
            String assesment_number = request.getParameter("assesment_number");
            Object jsonFile = parser.parse(new FileReader("C:\\Users\\hp\\Documents\\NetBeansProjects\\marks_feed\\web\\js\\test.json"));
            org.json.simple.JSONObject newObj = (org.json.simple.JSONObject) jsonFile;
            Class.forName("com.mysql.jdbc.Driver");
            String connectionURL = "jdbc:mysql://localhost:3306/marks_attend?zeroDateTimeBehavior=convertToNull";
            Connection con = DriverManager.getConnection(connectionURL,"root","");
            System.out.println("Loaded driver"); 
            Statement statement = con.createStatement();
            Statement statement1 = con.createStatement();
            String query = "SELECT sno FROM schemas_table ORDER BY sno DESC";
            ResultSet rs = statement.executeQuery(query);
            Integer sno;
            if(!rs.next()) {
                sno = 0;
            }
            else {
                sno = rs.getInt("sno");
                System.out.println(sno);
            }
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Date date = new Date();
            String encoding = dateFormat.format(date);
            encoding = encoding.replace("/", "");
            encoding = encoding.replace(" ", "");
            encoding = encoding.replace(":", "");
            System.out.println(encoding);
            String jsonObjectKey = "schemaId" + encoding;
            String query_1 = "INSERT INTO schemas_table(fac_id, schema_id, schema_name) VALUES('" + facid + "', '"+jsonObjectKey+"', '"+schemaName+"')";
            System.out.println(query_1);
            statement.executeUpdate(query_1);
            //int flag=statement.executeUpdate(query);
            System.out.println("hello");
           // if(flag==0)
           //{
           //  System.out.println("data updated");
           //}
            newObj.put(jsonObjectKey, obj);
            String query_2 = "INSERT INTO schemas_status(`acad_year`, `program`, `branch`, `semester`, `sub_code`, `section`, `assesment_type`, `assesment_method`, `assesment_number`,`fac_id`,`schema_used`)values('" + acad_year + "', '" + program + "','" + branch + "','" + semester + "','" + sub_code + "','" + section + "','" + assesment_type + "','" + assesment_method + "','" + assesment_number + "','" + facid + "','" + jsonObjectKey + "')";
            System.out.println(query_2);
            statement1.executeUpdate(query_2);
            FileWriter file = new FileWriter("C:\\Users\\hp\\Documents\\NetBeansProjects\\marks_feed\\web\\js\\test.json");
            file.append(newObj.toString());
            file.close();
            con.close();
        }
        catch(Exception e) {
            out.println(e);
        }
        processRequest(request, response);
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
