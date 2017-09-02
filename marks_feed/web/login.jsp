<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import ="java.sql.*" %>
<%@page import ="javax.sql.*" %>

<%
    String userid=request.getParameter("username"); 
    String pwd=request.getParameter("pwd"); 
    String button =request.getParameter("hdnbt");
    String level;
    System.out.println(button);
    Class.forName("com.mysql.jdbc.Driver");
            String connectionURL = "jdbc:mysql://localhost:3306/marks_attend";
            Connection con = DriverManager.getConnection(connectionURL,"root",""); 
    Statement st= con.createStatement(); 
    String query1="select fac_id,level,fac_name,department from thirdtable where username=? and pwd=?";
    PreparedStatement pstmt = con.prepareStatement( query1 );
    pstmt.setString( 1, userid);
    pstmt.setString( 2, pwd); 
    ResultSet rs=pstmt.executeQuery( ); //getting values in result set from thirdtable 
    if(rs.next()) { 
        session.setAttribute("fac_id",rs.getString(1)); //setting session variable in each page
        session.setAttribute("fac_name",rs.getString(3));
        session.setAttribute("fac_level", rs.getString(2));
        session.setAttribute("fac_dept",rs.getString(4));
        level=session.getAttribute("fac_level").toString();
        if(button.compareTo("Log In As Faculty")==0){
            System.out.println("yes");
            response.sendRedirect("home.jsp");}
        else if(button.compareTo("Log In As Hod")==0){
            if(level.compareTo("100")==0)
                response.sendRedirect("highlevel1.jsp");
            else
                response.sendRedirect("index.jsp");
                }
    }
    else {
        out.println("Invalid password");
        response.sendRedirect("index.jsp");
    }
%>