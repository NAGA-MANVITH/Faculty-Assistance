<%-- 
  
    Document   : semwisesubjectpost.jsp
    Created on : Feb 1, 2016, 9:24:16 PM
    Author     : ARDS
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%@page import="javax.servlet.http.*"%>
<%@page language="java" session="true"%>
<%@page import ="javax.sql.*" %>
<%!String facid,facname,facdept;%>
<%
    session = request.getSession(false);  
   Class.forName("com.mysql.jdbc.Driver");
            String connectionURL = "jdbc:mysql://localhost:3306/marks_attend?zeroDateTimeBehavior=convertToNull";
            Connection con = DriverManager.getConnection(connectionURL,"root",""); 
Statement statement= con.createStatement();
Statement statement2= con.createStatement();
Statement statement1=con.createStatement();
Statement statement3 =con.createStatement();
if(session.getAttribute("fac_id")!=null)
          {
            facid = (String)session.getAttribute("fac_id");
            facname=(String)session.getAttribute("fac_name");
            facdept=(String)session.getAttribute("fac_dept");
          }
else if(session.getAttribute("fac_id")==null)
{
   response.sendRedirect("new.html"); 
}
%>
           

<html>
      <head>
         <script>
            function signout(){
                
                window.location="new.html";
            }
            </script>   
          <script src="./js/script_4.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Semester Wise Subject Allocation</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet"/>
        <link href="css/payment_details.css" rel="stylesheet"/>
        <link rel="shortcut icon" href="img/fevicon1.png" type="image/x-icon" />
        <link rel="stylesheet" href="./css/w3-css.css">
        
         <!--<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">-->
<!--  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>-->
  <!--<link rel="stylesheet" href="/resources/demos/style.css">-->
      
 <!--<script src="http://jqueryjs.googlecode.com/files/jquery-1.2.6.min.js" type="text/javascript"></script>-->

        
        <script src="js/respond.js"></script>
        <title>AJAX in Servlet using JQuery and JSON</title>
<script src="js/jquery-3.1.1.min.js" type="text/javascript"> </script>
<script src="./js/script_4.js"></script>
<script>   
$(document).ready(function() {
    

                $('#submit').click(function(event) {

                      var branch = $("select#branch").val();
                      var semester = $("select#semester1").val();
                      var regl_no = $("select#regl_no").val();
                      var year = $("select#year").val();
                      var acad_year = $("select#acad_year").val();
                      var sub_code = $("#sub_code").val();
                         var sub_name = $('#sub_name').val();
                         var category = $('#category').val();
                         var sub_type = $('select#sub_type').val();
                         var program = $('select#program').val();
                         var order1=$('#order1').val();
                         var credits=$('#credits').val();
                         if(branch===""||semester===null||year===null||sub_code===""||sub_name===""||sub_type==="default"||category===null||credits==="default")
                         {
                            alert(branch+" "+semester+" "+year+" "+sub_code+" "+sub_name+" "+sub_type+" "+category);
                         alert("Please Enter All Details!!!");
                         return;
                         }
                         else{
                         $.post('Jsonservlet12', {
                                regl_no:regl_no,branch:branch,semester:semester,year:year,acad_year:acad_year,sub_code:sub_code,
                                sub_name:sub_name,category:category,sub_type:sub_type,program:program,order1:order1,credits:credits

                        }, function(response) {    
                       alert(response);
                       var table = '';
    table += '<tr><th>S.No</th><th>Course Outcome</th><th>Question</th></tr>';
    for(var i = 1; i <= 5; i++) {
        table += '<tr><td>' + i + '</td><td>CO-' + i + '</td><td><input type="text" class="form-control" id="co' + i + '"></td></tr>';
    }
    document.getElementById('courseEndSurvey').innerHTML = '<table border=2 class="w3-table w3-striped myTable">' + table + '</table><div class="row"><div class="col-md-3"><button class="btn btn-primary" onclick="saveQuestions()">Submit</button></div></div>';
                        });
                         }
                        });
        
                        $('#year').change(function(){
                        var yr=$('#year').val();
                        //alert(yr);
                             $('select#semester1').empty();
                             $('#semester1').append('<option name="sub1" value="default" readonly disabled selected>-Select Semester-</option>');
                             if(yr==='1')
                        {

                            $('#semester1').append('<option val="1">1</option>');
                            $('#semester1').append('<option val="2">2</option>');
                        }
                        if(yr==='2')
                        {

                            $('#semester1').append('<option val="3">3</option>');
                            $('#semester1').append('<option val="4">4</option>');
                        }
                        else if(yr==='3')
                          {

                            $('#semester1').append('<option val="5">5</option>');
                            $('select#semester1').append('<option val="6">6</option>');
                        }
                        else if(yr==='4')
                        {

                            $('select#semester1').append('<option val="7">7</option>');
                            $('select#semester1').append('<option val="8">8</option>');
                        }




                        });
        
                    $('#semester1').change(function(){
                        $('select#order1').empty();
                       $('select#order1').append('<option value="1">1</option>');
                       $('select#order1').append('<option value="2">2</option>');
                       $('select#order1').append('<option value="3">3</option>');
                       $('select#order1').append('<option value="4">4</option>');
                       $('select#order1').append('<option value="5">5</option>');
                       $('select#order1').append('<option value="6">6</option>');
                       $('select#order1').append('<option value="7">7</option>');
                       $('select#order1').append('<option value="8">8</option>');
                       $('select#order1').append('<option value="9">9</option>');
                       $('select#order1').append('<option value="10">10</option>');
                       $('select#order1').append('<option value="11">11</option>');
                       $('select#order1').append('<option value="12">12</option>');
                       $('select#order1').append('<option value="13">13</option>');
                       $('select#order1').append('<option value="14">14</option>');
                       $('select#order1').append('<option value="15">15</option>');
                       var branch = $("select#branch").val();
                       var semester = $("select#semester1").val();
                       var regl_no = $("select#regl_no").val();
                       var year = $("select#year").val();
                       var acad_year = $("select#acad_year").val();
                       var program = $('select#program').val();
                       $.get('JsonServlet40', {
                           regl_no: regl_no, branch: branch, semester: semester, year: year, acad_year: acad_year, program: program

                       }, function(response) {
                           //alert(response);
                           $.each(response, function(index, value) {
                               $('select#order1').find('[value="' + value + '"]').remove();
                               //alert(value);
                           });

                       });

                   });


        $('#regl_no').change(function() {
            //alert("reg");
        });
        
        $('#sub_type').change(function(){
            var subtype=$('#sub_type').val();
            var regl=$('#regl_no').val();
             $('#category').empty();
                $('#category').append('<option value="default" disabled selected>-Select Category-</option>');
         if(regl==='R15'){
            
            if(subtype==="CT"||subtype==="CL")
            {
                
                $('#category').append('<option value="BASIC SCIENCES">BASIC SCIENCES</option>');
                $('#category').append('<option value="HUMANITIES  &  SOCIAL  SCIENCES">HUMANITIES  &  SOCIAL  SCIENCES</option>');
                $('#category').append('<option value="ENGINEERING  SCIENCES">ENGINEERING  SCIENCES</option>');
                $('#category').append('<option value="DISCIPLINE  SPECIFIC  CORE  COURSES">DISCIPLINE  SPECIFIC  CORE  COURSES</option>');
                $('#category').append('<option value="PROJECT WORK/SEMINARS">PROJECT WORK/SEMINARS</option>');
            }
            else if(subtype==="ET"||subtype==="EL")
            {
                
                $('#category').append('<option value="BASIC SCIENCES ELECTIVE">BASIC SCIENCES ELECTIVE</option>');
                $('#category').append(' <option value="HUMANITIES  &  SOCIAL  SCIENCES ELECTIVE">HUMANITIES  &  SOCIAL  SCIENCES ELECTIVE</option>');
                $('#category').append(' <option value="ENGINEERING SCIENCE ELECTIVE">ENGINEERING SCIENCE ELECTIVE</option>');
                $('#category').append('<option value="PROFESSIONAL ELECTIVE-I">PROFESSIONAL ELECTIVE-I</option>');
                $('#category').append('<option value="PROFESSIONAL ELECTIVE-II">PROFESSIONAL ELECTIVE-II</option>');
                $('#category').append('<option value="PROFESSIONAL ELECTIVE-III">PROFESSIONAL ELECTIVE-III</option>');
                $('#category').append('<option value="PROFESSIONAL ELECTIVE-IV">PROFESSIONAL ELECTIVE-IV</option>');
                $('#category').append(' <option value="PROFESSIONAL ELECTIVE-V">PROFESSIONAL ELECTIVE-V</option>');
                $('#category').append('<OPTION VALUE="PROFESSIONAL ELECTIVE-VI">PROFESSIONAL ELECTIVE-VI</OPTION>    ');
                $('#category').append(' <option value="NOTIFIED ONLINE ELECTIVE COURSES">NOTIFIED ONLINE ELECTIVE COURSES</option>');
                $('#category').append(' <OPTION VALUE="SKILL BASED LAB ELECTIVES">SKILL BASED LAB ELECTIVES</OPTION>');
                $('#category').append('<option value="OPEN ELECTIVES">OPEN ELECTIVES</option>');
                $('#category').append('<option value="FREE ELECTIVES">FREE ELECTIVES</option>');
                                                 
            }}
        else if(regl==='R13'){
             //$('#category').empty();
             
             if(subtype==="CT"||subtype==="CL")
            {
                
                 $('#category').append('<option value="COMPULSORY">COMPULSORY</option>');
                
            }
            else
            {
              //  $('#category').empty();
                $('#category').append('<option value="ELECTIVE-I">ELECTIVE-I</option>');
                $('#category').append('<option value="ELECTIVE-II">ELECTIVE-II</option>');
                $('#category').append('<option value="ELECTIVE-III">ELECTIVE-III</option>');
                $('#category').append('<option value="ELECTIVE-IV">ELECTIVE-IV</option>');
                $('#category').append('<option value="OPEN ELECTIVE">OPEN ELECTIVE</option>');
            }
        }
            
        });

    });
</script>

    </head>
    <body oncontextmenu="return false;">
        <div class="container-fluid">
            <header class="nav navbar-default">
                <div class="nav navbar-default">                
                    <a class="brand" href="http://www.gvpce.ac.in/"><img src="img/gvp_banner.jpg" alt="G. V. P. College of Engineering (A)" class="img-responsive img-thumbnail"></a>
                    <div class="pull-right">
                        <button type="button" onclick="signout()"  class="btn btn-info navbar-btn"><span class="glyphicon glyphicon-off"></span> Sign Out</button>
                    </div>
                </div>
            </header>
            Welcome <b> <%=facname %></b>,
            <div class="container">
                <form class="form-horizontal">
                    <div class="row">
                        <div class="col-md-10 col-sm-10 col-lg-offset-1 col-sm-offset-1">
                            <div class="card">
                                <div class="heading">
                                    <h3><i class="glyphicon glyphicon-list-alt"></i> Subject List</h3>
                                </div>  
                                <div class="card-content"> 
                                    <div class="form-group">
                                        <div class="col-sm-12">
                                            <h4 style="color:#FF4081"><var>Enter</var> Subject list</h4><hr>
                                        </div>
                                         <div class="col-sm-2">
                                            <label for="sel1" style="margin-top:10px;">Regulation:</label>
                                            <select name="type" id="regl_no" class="form-control">
                                                <option name="two" value="R12">R12</option>
                                                <option name="three" value="R13">R13</option>
                                               
                                                  <option name="one" value="R15" selected>R15</option>
                                                   
                                            </select> 
                                        </div>
                                        <div class="col-sm-2">
                                            <label for="sel1" style="margin-top:10px;">Academic Year:</label>
                                            <select name="type" id="acad_year" class="form-control">
                                                <option name="one" value="2012-13">2012-13</option>
                                                <option name="one" value="2013-14">2013-14</option>
                                                <option name="one" value="2014-15">2014-15</option>
                                                <option name="one" value="2015-16">2015-16</option>
                                                <option name="two" value="2016-17" >2016-17</option>
                                                 <option name="two" value="2017-18" selected>2017-18</option>
                                                  <option name="two" value="2018-19">2018-19</option>
                                            </select> 
                                        </div>
                                        <div class="col-sm-2">
                                            <label for="sel1" style="margin-top:10px;">Course:</label>
                                            <select name="type" id="program" class="form-control">
                                                <%
             String program="";
             ResultSet programresult =statement.executeQuery("select program_key  from HOSTGVP_PROGRAM where program_key<>'5A' ");   
             while(programresult.next())
             {
                 program =programresult.getString(1);
                 ResultSet result2=null;
                 String k="";
                 if(program!="")
                 {
                 result2=statement1.executeQuery("select PROGRAM_NAME from HOSTGVP_PROGRAM where PROGRAM_KEY='"+program+"'");
                    while(result2.next())
                        {
                            k=result2.getString(1);
                %>
                <option value =<%out.println(program);%>> <%=k %></option>    
                      <% }
                 }
             }
            %>
                                            </select> 
                                        </div>
                                        <div class="col-sm-2">
                                            <label for="sel1" style="margin-top:10px;">Branch:</label>
                                            
                                            <select name="type" id="branch" class="form-control" >
                                               
            <%
              String branch=""; 
             ResultSet branchresult =statement.executeQuery("select BRANCH_KEY  from HOSTGVP_BRANCH where branch_key<>0 ");   
             while(branchresult.next())
             {
                 branch =branchresult.getString(1);
                 ResultSet result1=null;
                 String k="";
                 if(branch!="")
                 {
                 result1=statement1.executeQuery("select BRANCH_NAME from HOSTGVP_BRANCH where BRANCH_KEY="+Integer.parseInt(branch));
                    while(result1.next())
                        {
                            k=result1.getString(1);
                            if(k.equals(facdept)){
                                %>
                <option value =<%out.println(branch);%> selected > <%=k %></option>    
                      <%
                            
                        }
                            else
                            {
                                if(facdept.equals("ALL"))
                                {
                    
                %>
                <option value =<%out.println(branch);%>> <%=k %></option>    
                      <% 
                            }}
                        }
                 }
             }
            %>
            </select>  
            <input type="hidden" id="alldept" value="<%=facdept %>"></input>
                                        </div>
                                        
                                        <div class="col-sm-2">
                                            <label for="sel1" style="margin-top:10px;">Year:</label>
                                            <select name="type" id="year" class="form-control">
                                                <option name="sub1" value="default" readonly disabled selected>-Select Year-</option>
                                                <% 
                                                if(facdept.equals("ALL"))
                                                { %>
                                                <option name="sub2" value="1">1</option>
                                                <%} else { %>
                                                <option name="sub2" value="2">2</option>    
                                                 <option name="sub2" value="3">3</option>    
                                                  <option name="sub2" value="4">4</option>
                                                  <% } %>
                                            </select> 
                                        </div>
                                        <div class="col-sm-2">
                                            <label for="sel1" style="margin-top:10px;">Semester:</label>
                                            <select name="type" id="semester1" class="form-control">
                                                <option name="sub1" value="default" readonly disabled selected>-Select Semester-</option>
                                                <!--option name="one" value="1">1</option-->
                                                <!--option name="two" value="2">2</option-->
                                                                                                                                       
                                            </select> 
                                        </div>
                                        
                                       
                                        <div class="col-sm-2">
                                            <label for="sel1" style="margin-top:10px;">Subject Code:</label>
                                            <input  id="sub_code"   type="text" class="form-control" />
                                        </div>
                                        <div class="col-sm-5">
                                            <label for="sel1" style="margin-top:10px;">Subject Name:</label>
                                            <input id="sub_name"   type="text" class="form-control" />
                                        </div>
                                        <div class="col-sm-3">
                                            <label for="sel1" style="margin-top:10px;">Subject Type</label>
                                            <!--input id='sub_type'  type="text" class="form-control" /-->
                                            <select id="sub_type" class="form-control">
                                                <option value="default">-Subject Type-</option>
                                                <option value="CT">Compulsory Theory</option>
                                                <option value="CL">Compulsory Lab</option>
                                                <option value="ET">Elective Theory</option>
                                                <option value="EL">Elective Lab</option>
                                            </select>
                                           
                                        </div >
                                         <div class="col-sm-2">
                                            <label for="sel1" style="margin-top:10px;">Credits</label>
                                            <!--input id='sub_type'  type="text" class="form-control" /-->
                                            <select id="credits" class="form-control">
                                                <option value="default">-Credits-</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                            </select>
                                           
                                        </div >
                                        <div class="col-sm-5">
                                            <label for="sel1" style="margin-top:10px;">Category:</label>
                                            <!--input id='category'  type="text" class="form-control" /-->
                                            <select id="category" class="form-control">
                                                <OPTION VALue="default" selected disabled readonly>-Select Category-</OPTION>
                                                <option value="BASIC SCIENCES">BASIC SCIENCES</option>
                                                 <option value="HUMANITIES  &  SOCIAL  SCIENCES">HUMANITIES  &  SOCIAL  SCIENCES</option>
                                                 <option value="ENGINEERING  SCIENCES">ENGINEERING  SCIENCES</option>
                                                 <option value="DISCIPLINE  SPECIFIC  CORE  COURSES">DISCIPLINE  SPECIFIC  CORE  COURSES</option>
                                                 
                                                
                                                         
                                                 
                                                
                                                 
                                                 
                                                 <option value="ENGINEERING SCIENCE ELECTIVE LAB">ENGINEERING SCIENCE ELECTIVE LAB</option>
                                                
                                                
                                            </select>
                                        </div >
							
                                         
                                        <div class="col-sm-4">
                                            <label for="sel1" style="margin-top:10px;">Subject Order in Syllabus Book</label>
                                            <!--input id='order1'  type="text" class="form-control" /-->
                                            <select id="order1" class="form-control">
                                                
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                                <option value="7">7</option>
                                                <option value="8">8</option>
                                                <option value="9">9</option>
                                                <option value="10">10</option>
                                                <option value="11">11</option>
                                                <option value="12">12</option>
                                                <option value="13">13</option>
                                                <option value="14">14</option>
                                                <option value="15">15</option>
                                            </select>
                                        </div >
						
                                        <div class="col-sm-12">
                                            <input type="button" style="margin-top:15px;float:right;" class="btn btn-primary"value="submit" id="submit"/>
										</div>
                                    </div>
                                            <div class="col-sm-12">
                                                <table></table>
                                            </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="container-fluid" id="courseEndSurvey">
                
            </div>
        </div>
        <script src="js/jquery-2.1.4.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>









