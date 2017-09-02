<%-- 
    Document   : schemaSelection
    Created on : Mar 4, 2017, 2:56:36 PM
    Author     : Vasishta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%@page import="javax.servlet.http.*"%>
<%@page language="java" session="true"%>
<%@page import ="javax.sql.*" %>
<%!String facid, facname,faclevel;//!!!! %>

<%
    Class.forName("com.mysql.jdbc.Driver");
            String connectionURL = "jdbc:mysql://localhost:3306/marks_attend?zeroDateTimeBehavior=convertToNull";
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
%>
<!DOCTYPE html>
<html ng-app="schemaCreation">
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./css/bootstrap.min.css">
        <link rel="stylesheet" href="./css/w3-css.css">
	<link rel="stylesheet" href="./css/style.css">
        <script src="./js/jquery-3.1.1.min.js"></script>
        <script src="./js/bootstrap.min.js"></script>
        <script src="./js/angular.min.js"></script>
        <script src="./js/app.js"></script>
        <script>
            var facid = '<%= session.getAttribute("fac_id")%>';
            callServletForSchemas(facid);
        </script>
        <script>
            $(document).ready(function() {

                var facid = $("#facid").val();  //accessing faculty ID
                $("#test1").empty();   //these are 4 div tags in which sudents are entered here dynamically after selecting credentials
                $("#test2").empty();  //these are called empty beacuse new entries will be shown upon refresh of page
                $("#test3").empty();
                $("#test4").empty();

                $('#branch').change(function(event) {
                    $("#test1").empty();   //these are called empty beacuse new entries will be shown upon changing of values
                    $("#test2").empty();
                    $("#test3").empty();
                    $("#test4").empty();
                    var acad_year = $("#academicyear").val();
                    var branch = $("select#branch").val(); //getting values of branch select box
                    /// alert(branch);
                    ///alert(facid);
                    var program = $("#program1").val();
                    $.get('JsonServlet1', {
                        branchName: branch, fac_id: facultyId, acad_year: acad_year, program: program  //calling servlet1 and sending branch , facid in it
                    }, function(response) { //response from that page will be caught here
                        console.log(response);
                        var select = $('#semester');
                        select.find('option').remove();
                        select.append('<option value=0>Select semester</option>'); //appending static option to select box of semester
                        $.each(response, function(index, value) {
                            $('<option>').val(value).text(value).appendTo(select); //this is for each reponse the values is obtained and appended to select
                        });
                        var select1 = $('#sub_code');
                        select1.find('option').remove(); //removing deafult one and selecting desired one on next step
                        select1.append('<option value=0>Select subject_code</option>');

                        var select2 = $('#section');
                        select2.find('option').remove(); //removing deafult one and selecting desired one on next step
                        select2.append('<option value=0>Select section</option>');

                    });

                });
            $('#semester').change(function(event) {
                    $("#test1").empty();  //these are called empty beacuse new entries will be shown upon changing of values
                    $("#test2").empty();
                    $("#test3").empty();
                    $("#test4").empty();
                    var acad_year=$("#academicyear").val();
                    var program = $("#program1").val();
                    var branch1 = $("select#branch").val();
                    var semesters1 = $("select#semester").val();// getting values of semester select box
                    $.get('Servlet2', {
                        branchName1: branch1, semestersName1: semesters1, fac_id: facid,acad_year:acad_year,program:program //calling servlet2 and sending credentials to that page
                    }, function(response) {
                                //alert(response);
                        //response from that page will be caught here
                        var select = $('#sub_code');
                        select.find('option').remove();
                        select.append('<option value=1>Select subject code</option>'); //appending static option to select box of subject code
                        $.each(response, function(index, value) { //this is for each reponse the values is obtained and appended to select
                            //alert(value);
                            var a1=value.split(";");
                            $('<option>').val(a1[0]).text(a1[1]+"-"+a1[0]).appendTo(select);
                        });
                        var select1 = $('#section');
                        select1.find('option').remove(); //removing deafult one and selecting desired one on next step
                        select1.append('<option value=1>Select section</option>');
                    });
                });
                var ele_info;
                $('#sub_code').change(function(event) {
                    $("#test1").empty(); //these are called empty beacuse new entries will be shown upon changing of values
                    $("#test2").empty();
                    $("#test3").empty();
                    $("#test4").empty();
                    var acad_year=$("#academicyear").val();
                    var program = $("#program1").val();
                    
                    var branch = $("select#branch").val();
                    var semesters = $("select#semester").val();
                    var sub_code = $("select#sub_code").val();
                    
                    var ele_name="Section";
                    
                     $.get('Servlet3', {
                        branchName: branch, semestersName: semesters, sub_code: sub_code,acad_year:acad_year,program:program
                    }, function(response) {
                        //alert(response);
                        ele_info=response[0];
                        //alert(ele_info);
                        if(ele_info==="ET"||ele_info==="EL")
                        {
                            $('#secname').text("Elective Batch");
                            ele_name="Elective Batch";
                            //$('#section option[value="selection] ').text("Elective Batch");
                        }
                        else if(ele_info==="CT"||ele_name==="CL")
                        {
                            $('#secname').text("Section");
                            ele_name="Section";
                        }
                        
                         $.get('Servlet4', {
                        branchName: branch, semestersName: semesters, sub_code: sub_code, fac_id: facid,acad_year:acad_year,program:program
                    }, function(response) {
                        //alert(ele_name);
                        var select = $('#section');
                        select.find('option').remove();
                        select.append('  <option value="selection" selected disabled>-'+ele_name+'-</option>	');
                        $.each(response, function(index, value) {
                            $('<option>').val(value).text(value).appendTo(select);
                        });
                    });
                    });
                });
                $('#assesmentType').change(function() {
                   var type = document.getElementById('assesmentType').value;
                   if(type == 'test') {
                       document.getElementById('othersBox').style.display = 'none';
                       $('#assesmentNumber').empty();
                       $('#assesmentNumber').append('<option value=1>1</option><option value=2>2</option>');
                   }
                   else if(type == 'assesment') {
                       document.getElementById('othersBox').style.display = 'none';
                       $('#assesmentNumber').empty();
                       $('#assesmentNumber').append('<option value=1>1</option><option value=2>2</option><option value=3>3</option><option value=4>4</option>');
                   }
                   else if(type == 'others') {
                       $('#assesmentNumber').empty();
                       $('#assesmentNumber').append('<option value=1>1</option><option value=2>2</option><option value=3>3</option><option value=4>4</option>');
                       document.getElementById('othersBox').style.display = 'block';
                   }
                });
            });
        </script>
    </head>
    <body ng-controller="schemaSelectionController">
        <input id="facid" type="hidden"value=<%=facid%>>
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <label for="sel1" style="margin-top:10px;">Academic Year:</label>
                    <select name="academicyear" id="academicyear" class="form-control" >
                        <option value="2015-16">2015-16</option>
                        <option value="2016-17" selected>2016-17</option>
                        <option value="2017-18">2017-18</option>
                        <option value="2018-19">2018-19</option>
                        <option value="2019-20">2019-20</option>
                        <option value="2020-21">2020-21</option>	
                    </select>
                </div>
                <div class="col-md-3">
                    <label for="sel1" style="margin-top:10px;">Program:</label>
                    <select  name="program1" id="program1" class="form-control">
                    <option selected disabled name="start">-Program-</option>
                    <%
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
                    %>
                    <option value =<%out.println(branch1);%>> <%=k%></option>    
                    <% }
                            }
                        }
                    %>


                    </select> 
                </div>
                <div  class="col-md-3">
                    <label for="sel1" style="margin-top:10px;">Branch:</label>
                    <select  name="branch" id="branch" class="form-control">
                      <option selected disabled name="start">-Branch-</option>
                        <%
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
                        %>
                        <option value =<%out.println(branch);%>> <%=k%></option>    
                        <% }
                                }
                            }
                        %>



                    </select>
                </div>

                <div class="col-md-3">
                    <label for="sel1" style="margin-top:10px;">Semester:</label>
                    <select name="semester"  id="semester" class="form-control">
                        <option>  -SEMESTER- </option>>
                    </select>
                </div>
                
            </div>
            <div class="row">
                <div class="col-md-5">
                    <label for="sel1" style="margin-top:10px;">Subject:</label>
                    <select  name="sub_code" id="sub_code" class="form-control">
                        <option>-SUBJECT-</option>						                                            
                    </select> 
                </div>
                <div class="col-md-3">
                    <label for="sel1" style="margin-top:10px;" id="secname">Section:</label>
                    <select name="section1" id="section" class="form-control">
                        <option value="selection" selected disabled>-SECTION-</option>					
                    </select> 
                </div>
                <div class="col-md-3">
                    <label for="schema" style="margin-top:10px;">Schema:</label>
                    <select id="facSchemas" class="form-control"></select>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <label for="assesmentType" style="margin-top: 10px;">Assessment Type</label>
                    <select id="assesmentType" class="form-control">
                        <option value="selection" selected disabled>-Assessment Type-</option>
                        <option value="test">Test</option>
                        <option value="assesment">Assessment</option>
                        <option value="others">Others</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <label for="assesmentNumber" style="margin-top: 10px;">Assessment Number</label>
                    <select id="assesmentNumber" class="form-control">
                        <option value="selection" selected disabled>-Assessment Number-</option>
                    </select>
                </div>
                <div class="col-md-3" id="othersBox" style="display: none">
                    <label for="others" style="margin-top: 10px;">Others</label>
                    <input type="text" id="others" class="form-control">
                </div>
            </div>
        </div>
        
        <div class="container">
            <form method="POST">
            <div class="row">
                <div class="col-md-4">
                    
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <button class="btn btn-primary" type="submit" ng-click="createUIForMarksPost()">Submit</button>
                </div>
            </div>
            </form>
        </div>
        <div class="container" id="tableDivision" ng-show="uiSection === 1">
            
        </div>
    </body>
</html>

