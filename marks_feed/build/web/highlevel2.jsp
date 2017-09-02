<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import ="java.sql.*" %>
<%@page import ="javax.sql.*" %>

<%
    String department=request.getParameter("department"); 
    String fac_name=request.getParameter("fac_name"); 
    Class.forName("com.mysql.jdbc.Driver");
            String connectionURL = "jdbc:mysql://localhost:3306/marks_attend";
            Connection con = DriverManager.getConnection(connectionURL,"root",""); 
    Statement st= con.createStatement(); 
    session.setAttribute("fac_name",fac_name); //setting session variable in each page
    session.setAttribute("fac_dept",department);
    response.sendRedirect("home1.jsp");
%>