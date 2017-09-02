package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import javax.sql.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    String userid=request.getParameter("username"); 
    String pwd=request.getParameter("pwd"); 
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
        response.sendRedirect("home.jsp");
    }
    else {
        out.println("Invalid password");
        response.sendRedirect("index.jsp");
    }

    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
