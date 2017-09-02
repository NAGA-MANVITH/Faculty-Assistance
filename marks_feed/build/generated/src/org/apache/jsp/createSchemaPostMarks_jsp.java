package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import javax.servlet.http.*;
import javax.sql.*;

public final class createSchemaPostMarks_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

String facid, facname,faclevel;//!!!! 
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
      out.write("\n");
      out.write('\n');
      out.write('\n');

    facid = (String) session.getAttribute("fac_id");
    Class.forName("com.mysql.jdbc.Driver");
            String connectionURL = "jdbc:mysql://localhost:3306/marks_attend";
            Connection con = DriverManager.getConnection(connectionURL,"root",""); 
    Statement statement = con.createStatement();
    Statement statement2 = con.createStatement();
    Statement statement1 = con.createStatement();
    Statement statement3 = con.createStatement();
    faclevel=(String)session.getAttribute("fac_level");
    if ((session.getAttribute("fac_id") != null)&&(faclevel.equals("2"))) {
        facid = (String) session.getAttribute("fac_id");//getting session attribute
        facname = (String) session.getAttribute("fac_name");
        
        System.out.println(facid);
    } else if (session.getAttribute("fac_id") == null) {
        response.sendRedirect("new.html"); //else redirection page
    }

      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <meta http-equiv='cache-control' content='no-cache'>\n");
      out.write("        <meta http-equiv='expires' content='0'>\n");
      out.write("        <meta http-equiv='pragma' content='no-cache'>\n");
      out.write("        <link rel=\"stylesheet\" href=\"./css/bootstrap.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"./css/w3-css.css\">\n");
      out.write("\t<link rel=\"stylesheet\" href=\"./css/style.css\">\n");
      out.write("        <script src=\"./js/jquery-3.1.1.min.js\"></script>\n");
      out.write("        <script src=\"./js/bootstrap.min.js\"></script>\n");
      out.write("        <script src=\"./js/angular.min.js\"></script>\n");
      out.write("        <script src=\"./js/app.js\"></script>\n");
      out.write("        <script src=\"./js/script_3.js\"></script>\n");
      out.write("        <script>\n");
      out.write("            var facid = '");
      out.print( session.getAttribute("fac_id"));
      out.write("';\n");
      out.write("            callServletForSchemas(facid);\n");
      out.write("        </script>\n");
      out.write("        <script>\n");
      out.write("            $(document).ready(function() {\n");
      out.write("\n");
      out.write("                var facid = $(\"#facid\").val();  //accessing faculty ID\n");
      out.write("                $(\"#test1\").empty();   //these are 4 div tags in which sudents are entered here dynamically after selecting credentials\n");
      out.write("                $(\"#test2\").empty();  //these are called empty beacuse new entries will be shown upon refresh of page\n");
      out.write("                $(\"#test3\").empty();\n");
      out.write("                $(\"#test4\").empty();\n");
      out.write("\n");
      out.write("                $('#branch').change(function(event) {\n");
      out.write("                    $(\"#test1\").empty();   //these are called empty beacuse new entries will be shown upon changing of values\n");
      out.write("                    $(\"#test2\").empty();\n");
      out.write("                    $(\"#test3\").empty();\n");
      out.write("                    $(\"#test4\").empty();\n");
      out.write("                    var acad_year = $(\"#academicyear\").val();\n");
      out.write("                    var branch = $(\"select#branch\").val(); //getting values of branch select box\n");
      out.write("                    /// alert(branch);\n");
      out.write("                    ///alert(facid);\n");
      out.write("                    var program = $(\"#program1\").val();\n");
      out.write("                    $.get('JsonServlet1', {\n");
      out.write("                        branchName: branch, fac_id: facultyId, acad_year: acad_year, program: program  //calling servlet1 and sending branch , facid in it\n");
      out.write("                    }, function(response) {\n");
      out.write("                        //response from that page will be caught here\n");
      out.write("                        console.log(response);\n");
      out.write("                        var select = $('#semester');\n");
      out.write("                        select.find('option').remove();\n");
      out.write("                        select.append('<option value=0>Select semester</option>'); //appending static option to select box of semester\n");
      out.write("                        $.each(response, function(index, value) {\n");
      out.write("                            $('<option>').val(value).text(value).appendTo(select); //this is for each reponse the values is obtained and appended to select\n");
      out.write("                        });\n");
      out.write("                        var select1 = $('#sub_code');\n");
      out.write("                        select1.find('option').remove(); //removing deafult one and selecting desired one on next step\n");
      out.write("                        select1.append('<option value=0>Select subject_code</option>');\n");
      out.write("\n");
      out.write("                        var select2 = $('#section');\n");
      out.write("                        select2.find('option').remove(); //removing deafult one and selecting desired one on next step\n");
      out.write("                        select2.append('<option value=0>Select section</option>');\n");
      out.write("\n");
      out.write("                    });\n");
      out.write("\n");
      out.write("                });\n");
      out.write("            $('#semester').change(function(event) {\n");
      out.write("                    $(\"#test1\").empty();  //these are called empty beacuse new entries will be shown upon changing of values\n");
      out.write("                    $(\"#test2\").empty();\n");
      out.write("                    $(\"#test3\").empty();\n");
      out.write("                    $(\"#test4\").empty();\n");
      out.write("                    var acad_year=$(\"#academicyear\").val();\n");
      out.write("                    var program = $(\"#program1\").val();\n");
      out.write("                    var branch1 = $(\"select#branch\").val();\n");
      out.write("                    var semesters1 = $(\"select#semester\").val();// getting values of semester select box                    \n");
      out.write("                    $.get('Servlet2', {\n");
      out.write("                        branchName1: branch1, semestersName1: semesters1, fac_id: facid,acad_year:acad_year,program:program //calling servlet2 and sending credentials to that page\n");
      out.write("                    }, function(response) {\n");
      out.write("                                console.log(response);\n");
      out.write("                        //response from that page will be caught here\n");
      out.write("                        var select = $('#sub_code');\n");
      out.write("                        select.find('option').remove();\n");
      out.write("                        select.append('<option value=1>Select subject code</option>'); //appending static option to select box of subject code\n");
      out.write("                        $.each(response, function(index, value) { //this is for each reponse the values is obtained and appended to select\n");
      out.write("                            //alert(value);\n");
      out.write("                            var a1=value.split(\";\");\n");
      out.write("                            $('<option>').val(a1[0]).text(a1[1]+\"-\"+a1[0]).appendTo(select);\n");
      out.write("                        });\n");
      out.write("                        var select1 = $('#section');\n");
      out.write("                        select1.find('option').remove(); //removing deafult one and selecting desired one on next step\n");
      out.write("                        select1.append('<option value=1>Select section</option>');\n");
      out.write("                    });\n");
      out.write("                });\n");
      out.write("                var ele_info;\n");
      out.write("                $('#sub_code').change(function(event) {\n");
      out.write("                    $(\"#test1\").empty(); //these are called empty beacuse new entries will be shown upon changing of values\n");
      out.write("                    $(\"#test2\").empty();\n");
      out.write("                    $(\"#test3\").empty();\n");
      out.write("                    $(\"#test4\").empty();\n");
      out.write("                    var acad_year=$(\"#academicyear\").val();\n");
      out.write("                    var program = $(\"#program1\").val();\n");
      out.write("                    \n");
      out.write("                    var branch = $(\"select#branch\").val();\n");
      out.write("                    var semesters = $(\"select#semester\").val();\n");
      out.write("                    var sub_code = $(\"select#sub_code\").val();\n");
      out.write("                    \n");
      out.write("                    var ele_name=\"Section\";\n");
      out.write("                    \n");
      out.write("                     $.get('Servlet3', {\n");
      out.write("                        branchName: branch, semestersName: semesters, sub_code: sub_code,acad_year:acad_year,program:program\n");
      out.write("                    }, function(response) {\n");
      out.write("                        //alert(response);\n");
      out.write("                        ele_info=response[0];\n");
      out.write("                        //alert(ele_info);\n");
      out.write("                        if(ele_info===\"ET\"||ele_info===\"EL\")\n");
      out.write("                        {\n");
      out.write("                            $('#secname').text(\"Elective Batch\");\n");
      out.write("                            ele_name=\"Elective Batch\";\n");
      out.write("                            //$('#section option[value=\"selection] ').text(\"Elective Batch\");\n");
      out.write("                        }\n");
      out.write("                        else if(ele_info===\"CT\"||ele_name===\"CL\")\n");
      out.write("                        {\n");
      out.write("                            $('#secname').text(\"Section\");\n");
      out.write("                            ele_name=\"Section\";\n");
      out.write("                        }\n");
      out.write("                        \n");
      out.write("                         $.get('Servlet4', {\n");
      out.write("                        branchName: branch, semestersName: semesters, sub_code: sub_code, fac_id: facid,acad_year:acad_year,program:program\n");
      out.write("                    }, function(response) {\n");
      out.write("                        //alert(ele_name);\n");
      out.write("                        var select = $('#section');\n");
      out.write("                        select.find('option').remove();\n");
      out.write("                        select.append('  <option value=\"selection\" selected disabled>-'+ele_name+'-</option>\t');\n");
      out.write("                        $.each(response, function(index, value) {\n");
      out.write("                            $('<option>').val(value).text(value).appendTo(select);\n");
      out.write("                        });\n");
      out.write("                    });\n");
      out.write("                    });\n");
      out.write("                });\n");
      out.write("                $('#assesmentType').change(function() {\n");
      out.write("                   var type = document.getElementById('assesmentType').value;\n");
      out.write("                   if(type == 'test') {\n");
      out.write("                       document.getElementById('assesmentMethodDiv').style.display = 'none';\n");
      out.write("                       document.getElementById('othersBox').style.display = 'none';\n");
      out.write("                       $('#assesmentNumber').empty();\n");
      out.write("                       $('#assesmentNumber').append('<option value=1>1</option><option value=2>2</option>');\n");
      out.write("                   }\n");
      out.write("                   else if(type == 'assesment') {\n");
      out.write("                       document.getElementById('assesmentMethodDiv').style.display = 'block';\n");
      out.write("                       document.getElementById('othersBox').style.display = 'none';\n");
      out.write("                       $('#assesmentNumber').empty();\n");
      out.write("                       $('#assesmentNumber').append('<option value=1>1</option><option value=2>2</option><option value=3>3</option><option value=4>4</option>');\n");
      out.write("                   }\n");
      out.write("                });\n");
      out.write("                $('#assesmentMethod').change(function() {\n");
      out.write("                    if(document.getElementById('assesmentMethod').value == \"Others\") {\n");
      out.write("                        document.getElementById('othersBox').style.display = 'block';\n");
      out.write("                    }\n");
      out.write("                });\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("        <title>Create Schema and Post Marks</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <div class=\"container-fluid\">\n");
      out.write("            <input id=\"facid\" type=\"hidden\"value=");
      out.print(facid);
      out.write(">\n");
      out.write("            <div class=\"container-fluid\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-md-3\">\n");
      out.write("                        <label for=\"sel1\" style=\"margin-top:10px;\">Academic Year:</label>\n");
      out.write("                        <select name=\"academicyear\" id=\"academicyear\" class=\"form-control\" >\n");
      out.write("                            <option value=\"2015-16\">2015-16</option>\n");
      out.write("                            <option value=\"2016-17\" selected>2016-17</option>\n");
      out.write("                            <option value=\"2017-18\">2017-18</option>\n");
      out.write("                            <option value=\"2018-19\">2018-19</option>\n");
      out.write("                            <option value=\"2019-20\">2019-20</option>\n");
      out.write("                            <option value=\"2020-21\">2020-21</option>\t\n");
      out.write("                        </select>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-3\">\n");
      out.write("                        <label for=\"sel1\" style=\"margin-top:10px;\">Program:</label>\n");
      out.write("                        <select  name=\"program1\" id=\"program1\" class=\"form-control\">\n");
      out.write("                        <option selected disabled name=\"start\">-Program-</option>\n");
      out.write("                        ");

                              String branch1 = "";
                              ResultSet progresult = statement.executeQuery("select DISTINCT program from secondtable where fac_id='"+facid+"' ");
                              while (progresult.next()) {
                                  branch1 = progresult.getString(1);
                                  ResultSet result1 = null;
                                  String k = "";
                                  System.out.print(branch1);
                                  if (branch1 != "") {
                                      result1 = statement1.executeQuery("select program_NAME from HOSTGVP_PROGRAM where PROGRAM_KEY='"+branch1+"'");
                                      while (result1.next()) {
                                          k = result1.getString(1);
                                          System.out.println(k);
                        
      out.write("\n");
      out.write("                        <option value =");
out.println(branch1);
      out.write('>');
      out.write(' ');
      out.print(k);
      out.write("</option>    \n");
      out.write("                        ");
 }
                                }
                            }
                        
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                        </select> \n");
      out.write("                    </div>\n");
      out.write("                    <div  class=\"col-md-3\">\n");
      out.write("                        <label for=\"sel1\" style=\"margin-top:10px;\">Branch:</label>\n");
      out.write("                        <select  name=\"branch\" id=\"branch\" class=\"form-control\">\n");
      out.write("                          <option selected disabled name=\"start\">-Branch-</option>\n");
      out.write("                            ");

                                String k = "";
                                String branch = "";
                                ResultSet branchresult = statement.executeQuery("select DISTINCT branch from secondtable where fac_id='"+facid+"' ");
                                while (branchresult.next()) {
                                    branch = branchresult.getString(1);
                                    ResultSet result1 = null;

                                    if (branch != "") {
                                        result1 = statement1.executeQuery("select BRANCH_NAME from HOSTGVP_BRANCH where BRANCH_KEY=" + Integer.parseInt(branch));
                                        while (result1.next()) {
                                            k = result1.getString(1);
                            
      out.write("\n");
      out.write("                            <option value =");
out.println(branch);
      out.write('>');
      out.write(' ');
      out.print(k);
      out.write("</option>    \n");
      out.write("                            ");
 }
                                    }
                                }
                            
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("                        </select>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"col-md-3\">\n");
      out.write("                        <label for=\"sel1\" style=\"margin-top:10px;\">Semester:</label>\n");
      out.write("                        <select name=\"semester\"  id=\"semester\" class=\"form-control\">\n");
      out.write("                            <option>  -SEMESTER- </option>>\n");
      out.write("                        </select>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-md-5\">\n");
      out.write("                        <label for=\"sel1\" style=\"margin-top:10px;\">Subject:</label>\n");
      out.write("                        <select  name=\"sub_code\" id=\"sub_code\" class=\"form-control\">\n");
      out.write("                            <option>-SUBJECT-</option>\t\t\t\t\t\t                                            \n");
      out.write("                        </select> \n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-3\">\n");
      out.write("                        <label for=\"sel1\" style=\"margin-top:10px;\" id=\"secname\">Section:</label>\n");
      out.write("                        <select name=\"section1\" id=\"section\" class=\"form-control\">\n");
      out.write("                            <option value=\"selection\" selected disabled>-SECTION-</option>\t\t\t\t\t\n");
      out.write("                        </select> \n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-md-3\">\n");
      out.write("                        <label for=\"assesmentType\" style=\"margin-top: 10px;\">Assessment Type</label>\n");
      out.write("                        <select id=\"assesmentType\" class=\"form-control\">\n");
      out.write("                            <option value=\"selection\" selected disabled>-Assessment Type-</option>\n");
      out.write("                            <option value=\"test\">Test</option>\n");
      out.write("                            <option value=\"assesment\">Assessment</option>\n");
      out.write("                        </select>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-3\" id=\"assesmentMethodDiv\">\n");
      out.write("                        <label for=\"assesmentMethod\" style=\"margin-top: 10px;\">Assessment Method</label>\n");
      out.write("                        <select id=\"assesmentMethod\" class=\"form-control\">\n");
      out.write("                            <option value=\"Assignment\">Assignment</option>\n");
      out.write("                            <option value=\"Quiz\">Quiz</option>\n");
      out.write("                            <option value=\"Term Paper\">Term Paper</option>\n");
      out.write("                            <option value=\"Tutorial\">Tutorial</option>\n");
      out.write("                            <option value=\"Surprise Test\">Surprise Test</option>\n");
      out.write("                            <option value=\"Open Book Test\">Open Book Test</option>\n");
      out.write("                            <option value=\"Seminar\">Seminar</option>\n");
      out.write("                            <option value=\"Case Study\">Case Study</option>\n");
      out.write("                            <option value=\"Lab Activity\">Lab Activity</option>\n");
      out.write("                            <option value=\"Project\">Project</option>\n");
      out.write("                            <option value=\"Others\">Others</option>\n");
      out.write("                        </select>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-3\">\n");
      out.write("                        <label for=\"assesmentNumber\" style=\"margin-top: 10px;\">Assessment Number</label>\n");
      out.write("                        <select id=\"assesmentNumber\" class=\"form-control\">\n");
      out.write("                            <option value=\"selection\" selected disabled>-Assessment Number-</option>\n");
      out.write("                        </select>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-3\" id=\"othersBox\" style=\"display: none\">\n");
      out.write("                        <label for=\"others\" style=\"margin-top: 10px;\">Others</label>\n");
      out.write("                        <input type=\"text\" id=\"others\" class=\"form-control\">\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-md-3\">\n");
      out.write("                        <button class=\"btn btn-primary\" id=\"submit\" onclick=\"askForSchema()\">Submit</button>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"container-fluid\" id=\"createSchemaDiv\">\n");
      out.write("                \n");
      out.write("            </div>\n");
      out.write("            <div class=\"container-fluid\" id=\"postMarksDiv\">\n");
      out.write("                \n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
