<%-- 
    Document   : index
    Created on : Mar 21, 2017, 11:19:37 AM
    Author     : Vasishta
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%@page import="javax.servlet.http.*"%>
<%@page language="java" session="true"%>
<%@page import ="javax.sql.*" %>

<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/marks_attend","root",""); 
    Statement statement = con.createStatement();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/w3-css.css">
	<!--<link rel="stylesheet" href="style.css">-->
        <script src="js/jquery-3.1.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/script_5.js">
            
        </script>
        <script src ="js/script_6.js"></script>
        <link rel="stylesheet" href="./css/style.css">
        <!--<link rel="stylesheet" href="./css/font-awesome.css">-->
        <style type="text/css">
            .nav-tabs>li {
                    width: 26%;
                    margin-left: 5%;
            }    
.panel.with-nav-tabs .panel-heading{
    padding: 5px 5px 0 5px;
}
.panel.with-nav-tabs .nav-tabs{
	border-bottom: none;
}
.panel.with-nav-tabs .nav-justified{
	margin-bottom: -1px;
}
/********************************************************************/
/*** PANEL DEFAULT ***/
.with-nav-tabs.panel-default .nav-tabs > li > a,
.with-nav-tabs.panel-default .nav-tabs > li > a:hover,
.with-nav-tabs.panel-default .nav-tabs > li > a:focus {
    color: #777;
}
.with-nav-tabs.panel-default .nav-tabs > .open > a,
.with-nav-tabs.panel-default .nav-tabs > .open > a:hover,
.with-nav-tabs.panel-default .nav-tabs > .open > a:focus,
.with-nav-tabs.panel-default .nav-tabs > li > a:hover,
.with-nav-tabs.panel-default .nav-tabs > li > a:focus {
    color: #777;
	background-color: #ddd;
	border-color: transparent;
}
.with-nav-tabs.panel-default .nav-tabs > li.active > a,
.with-nav-tabs.panel-default .nav-tabs > li.active > a:hover,
.with-nav-tabs.panel-default .nav-tabs > li.active > a:focus {
	color: #555;
	background-color: #fff;
	border-color: #ddd;
	border-bottom-color: transparent;
}
.with-nav-tabs.panel-default .nav-tabs > li.dropdown .dropdown-menu {
    background-color: #f5f5f5;
    border-color: #ddd;
}
.with-nav-tabs.panel-default .nav-tabs > li.dropdown .dropdown-menu > li > a {
    color: #777;   
}
.with-nav-tabs.panel-default .nav-tabs > li.dropdown .dropdown-menu > li > a:hover,
.with-nav-tabs.panel-default .nav-tabs > li.dropdown .dropdown-menu > li > a:focus {
    background-color: #ddd;
}
.with-nav-tabs.panel-default .nav-tabs > li.dropdown .dropdown-menu > .active > a,
.with-nav-tabs.panel-default .nav-tabs > li.dropdown .dropdown-menu > .active > a:hover,
.with-nav-tabs.panel-default .nav-tabs > li.dropdown .dropdown-menu > .active > a:focus {
    color: #fff;
    background-color: #555;
}
/********************************************************************/
/*** PANEL PRIMARY ***/
.with-nav-tabs.panel-primary .nav-tabs > li > a,
.with-nav-tabs.panel-primary .nav-tabs > li > a:hover,
.with-nav-tabs.panel-primary .nav-tabs > li > a:focus {
    color: #fff;
}
.with-nav-tabs.panel-primary .nav-tabs > .open > a,
.with-nav-tabs.panel-primary .nav-tabs > .open > a:hover,
.with-nav-tabs.panel-primary .nav-tabs > .open > a:focus,
.with-nav-tabs.panel-primary .nav-tabs > li > a:hover,
.with-nav-tabs.panel-primary .nav-tabs > li > a:focus {
	color: #fff;
	background-color: #3071a9;
	border-color: transparent;
}
.with-nav-tabs.panel-primary .nav-tabs > li.active > a,
.with-nav-tabs.panel-primary .nav-tabs > li.active > a:hover,
.with-nav-tabs.panel-primary .nav-tabs > li.active > a:focus {
	color: #428bca;
	background-color: #fff;
	border-color: #428bca;
	border-bottom-color: transparent;
}
.with-nav-tabs.panel-primary .nav-tabs > li.dropdown .dropdown-menu {
    background-color: #428bca;
    border-color: #3071a9;
}
.with-nav-tabs.panel-primary .nav-tabs > li.dropdown .dropdown-menu > li > a {
    color: #fff;   
}
.with-nav-tabs.panel-primary .nav-tabs > li.dropdown .dropdown-menu > li > a:hover,
.with-nav-tabs.panel-primary .nav-tabs > li.dropdown .dropdown-menu > li > a:focus {
    background-color: #3071a9;
}
.with-nav-tabs.panel-primary .nav-tabs > li.dropdown .dropdown-menu > .active > a,
.with-nav-tabs.panel-primary .nav-tabs > li.dropdown .dropdown-menu > .active > a:hover,
.with-nav-tabs.panel-primary .nav-tabs > li.dropdown .dropdown-menu > .active > a:focus {
    background-color: #4a9fe9;
}
/********************************************************************/
/*** PANEL SUCCESS ***/
.with-nav-tabs.panel-success .nav-tabs > li > a,
.with-nav-tabs.panel-success .nav-tabs > li > a:hover,
.with-nav-tabs.panel-success .nav-tabs > li > a:focus {
	color: #3c763d;
}
.with-nav-tabs.panel-success .nav-tabs > .open > a,
.with-nav-tabs.panel-success .nav-tabs > .open > a:hover,
.with-nav-tabs.panel-success .nav-tabs > .open > a:focus,
.with-nav-tabs.panel-success .nav-tabs > li > a:hover,
.with-nav-tabs.panel-success .nav-tabs > li > a:focus {
	color: #3c763d;
	background-color: #d6e9c6;
	border-color: transparent;
}
.with-nav-tabs.panel-success .nav-tabs > li.active > a,
.with-nav-tabs.panel-success .nav-tabs > li.active > a:hover,
.with-nav-tabs.panel-success .nav-tabs > li.active > a:focus {
	color: #3c763d;
	background-color: #fff;
	border-color: #d6e9c6;
	border-bottom-color: transparent;
}
.with-nav-tabs.panel-success .nav-tabs > li.dropdown .dropdown-menu {
    background-color: #dff0d8;
    border-color: #d6e9c6;
}
.with-nav-tabs.panel-success .nav-tabs > li.dropdown .dropdown-menu > li > a {
    color: #3c763d;   
}
.with-nav-tabs.panel-success .nav-tabs > li.dropdown .dropdown-menu > li > a:hover,
.with-nav-tabs.panel-success .nav-tabs > li.dropdown .dropdown-menu > li > a:focus {
    background-color: #d6e9c6;
}
.with-nav-tabs.panel-success .nav-tabs > li.dropdown .dropdown-menu > .active > a,
.with-nav-tabs.panel-success .nav-tabs > li.dropdown .dropdown-menu > .active > a:hover,
.with-nav-tabs.panel-success .nav-tabs > li.dropdown .dropdown-menu > .active > a:focus {
    color: #fff;
    background-color: #3c763d;
}
/********************************************************************/
/*** PANEL INFO ***/
.with-nav-tabs.panel-info .nav-tabs > li > a,
.with-nav-tabs.panel-info .nav-tabs > li > a:hover,
.with-nav-tabs.panel-info .nav-tabs > li > a:focus {
	color: #31708f;
}
.with-nav-tabs.panel-info .nav-tabs > .open > a,
.with-nav-tabs.panel-info .nav-tabs > .open > a:hover,
.with-nav-tabs.panel-info .nav-tabs > .open > a:focus,
.with-nav-tabs.panel-info .nav-tabs > li > a:hover,
.with-nav-tabs.panel-info .nav-tabs > li > a:focus {
	color: #31708f;
	background-color: #bce8f1;
	border-color: transparent;
}
.with-nav-tabs.panel-info .nav-tabs > li.active > a,
.with-nav-tabs.panel-info .nav-tabs > li.active > a:hover,
.with-nav-tabs.panel-info .nav-tabs > li.active > a:focus {
	color: #31708f;
	background-color: #fff;
	border-color: #bce8f1;
	border-bottom-color: transparent;
}
.with-nav-tabs.panel-info .nav-tabs > li.dropdown .dropdown-menu {
    background-color: #d9edf7;
    border-color: #bce8f1;
}
.with-nav-tabs.panel-info .nav-tabs > li.dropdown .dropdown-menu > li > a {
    color: #31708f;   
}
.with-nav-tabs.panel-info .nav-tabs > li.dropdown .dropdown-menu > li > a:hover,
.with-nav-tabs.panel-info .nav-tabs > li.dropdown .dropdown-menu > li > a:focus {
    background-color: #bce8f1;
}
.with-nav-tabs.panel-info .nav-tabs > li.dropdown .dropdown-menu > .active > a,
.with-nav-tabs.panel-info .nav-tabs > li.dropdown .dropdown-menu > .active > a:hover,
.with-nav-tabs.panel-info .nav-tabs > li.dropdown .dropdown-menu > .active > a:focus {
    color: #fff;
    background-color: #31708f;
}
/********************************************************************/
/*** PANEL WARNING ***/
.with-nav-tabs.panel-warning .nav-tabs > li > a,
.with-nav-tabs.panel-warning .nav-tabs > li > a:hover,
.with-nav-tabs.panel-warning .nav-tabs > li > a:focus {
	color: #8a6d3b;
}
.with-nav-tabs.panel-warning .nav-tabs > .open > a,
.with-nav-tabs.panel-warning .nav-tabs > .open > a:hover,
.with-nav-tabs.panel-warning .nav-tabs > .open > a:focus,
.with-nav-tabs.panel-warning .nav-tabs > li > a:hover,
.with-nav-tabs.panel-warning .nav-tabs > li > a:focus {
	color: #8a6d3b;
	background-color: #faebcc;
	border-color: transparent;
}
.with-nav-tabs.panel-warning .nav-tabs > li.active > a,
.with-nav-tabs.panel-warning .nav-tabs > li.active > a:hover,
.with-nav-tabs.panel-warning .nav-tabs > li.active > a:focus {
	color: #8a6d3b;
	background-color: #fff;
	border-color: #faebcc;
	border-bottom-color: transparent;
}
.with-nav-tabs.panel-warning .nav-tabs > li.dropdown .dropdown-menu {
    background-color: #fcf8e3;
    border-color: #faebcc;
}
.with-nav-tabs.panel-warning .nav-tabs > li.dropdown .dropdown-menu > li > a {
    color: #8a6d3b; 
}
.with-nav-tabs.panel-warning .nav-tabs > li.dropdown .dropdown-menu > li > a:hover,
.with-nav-tabs.panel-warning .nav-tabs > li.dropdown .dropdown-menu > li > a:focus {
    background-color: #faebcc;
}
.with-nav-tabs.panel-warning .nav-tabs > li.dropdown .dropdown-menu > .active > a,
.with-nav-tabs.panel-warning .nav-tabs > li.dropdown .dropdown-menu > .active > a:hover,
.with-nav-tabs.panel-warning .nav-tabs > li.dropdown .dropdown-menu > .active > a:focus {
    color: #fff;
    background-color: #8a6d3b;
}
/********************************************************************/
/*** PANEL DANGER ***/
.with-nav-tabs.panel-danger .nav-tabs > li > a,
.with-nav-tabs.panel-danger .nav-tabs > li > a:hover,
.with-nav-tabs.panel-danger .nav-tabs > li > a:focus {
	color: #a94442;
}
.with-nav-tabs.panel-danger .nav-tabs > .open > a,
.with-nav-tabs.panel-danger .nav-tabs > .open > a:hover,
.with-nav-tabs.panel-danger .nav-tabs > .open > a:focus,
.with-nav-tabs.panel-danger .nav-tabs > li > a:hover,
.with-nav-tabs.panel-danger .nav-tabs > li > a:focus {
	color: #a94442;
	background-color: #ebccd1;
	border-color: transparent;
}
.with-nav-tabs.panel-danger .nav-tabs > li.active > a,
.with-nav-tabs.panel-danger .nav-tabs > li.active > a:hover,
.with-nav-tabs.panel-danger .nav-tabs > li.active > a:focus {
	color: #a94442;
	background-color: #fff;
	border-color: #ebccd1;
	border-bottom-color: transparent;
}
.with-nav-tabs.panel-danger .nav-tabs > li.dropdown .dropdown-menu {
    background-color: #f2dede; /* bg color */
    border-color: #ebccd1; /* border color */
}
.with-nav-tabs.panel-danger .nav-tabs > li.dropdown .dropdown-menu > li > a {
    color: #a94442; /* normal text color */  
}
.with-nav-tabs.panel-danger .nav-tabs > li.dropdown .dropdown-menu > li > a:hover,
.with-nav-tabs.panel-danger .nav-tabs > li.dropdown .dropdown-menu > li > a:focus {
    background-color: #ebccd1; /* hover bg color */
}
.with-nav-tabs.panel-danger .nav-tabs > li.dropdown .dropdown-menu > .active > a,
.with-nav-tabs.panel-danger .nav-tabs > li.dropdown .dropdown-menu > .active > a:hover,
.with-nav-tabs.panel-danger .nav-tabs > li.dropdown .dropdown-menu > .active > a:focus {
    color: #fff; /* active text color */
    background-color: #a94442; /* active bg color */
}
    </style>
        <style>
            .nav-tabs>li>a {
                font-weight: 600;
            }
            div.background {
            background: url(klematis.jpg) ;
            border: 1px solid black;
          }

          div.transbox {
            margin: 30px;
            background-color: #ffffff;
            border: 1px solid black;
            opacity: 0.6;
            filter: alpha(opacity=60); /* For IE8 and earlier */
          }

          div.transbox p {
            margin: 5%;
            font-weight: bold;
            color: #000000;
          }

              .container {
                padding: 10px;
                    width:inherit;
              }
                  fieldset, label { margin: 0; padding: 0; }
          body{ margin: 20px; }
          h1 { font-size: 1.5em; margin: 10px; }

          /****** Style Star Rating Widget *****/

          .rating { 
            border: none;
            float: left;
          }
          
          .full {
              padding: 10px !important;
          }

          .rating > input { display: none; } 
          .rating > label:before { 
            margin: 5px;
            font-size: 1.25em;
            font-family: FontAwesome;
            display: inline-block;
            content: "\f005";
          }

          .rating > .half:before { 
            content: "\f089";
            position: absolute;
          }

          .container {
              padding: 0px !important;
          }

          .rating > label { 
            color: #ddd; 
           float: right; 
          }
          p{font-size:18px}
          /***** CSS Magic to Highlight Stars on Hover *****/

          .rating > input:checked ~ label, /* show gold star when clicked */
          .rating:not(:checked) > label:hover, /* hover current star */
          .rating:not(:checked) > label:hover ~ label { color: #FFD700;  } /* hover previous stars in list */
          .yes{color:#0C0}
          .no{color:#C33}
          .rating > input:checked + label:hover, /* hover current star when changing rating */
          .rating > input:checked ~ label:hover,
          .rating > label:hover ~ input:checked ~ label, /* lighten current selection */
          .rating > input:checked ~ label:hover ~ label { color: #FFED85;  } 

          /*Stylings for radio div*/
          .radioDiv {
                  float:right;
                  padding-right:25%;
          }
          .question {
                  font-size: 18px;
                  font-weight: 400;
              line-height: 24px;
              letter-spacing: 0;
              margin: 0 0 16px;
          }
          .box{
                  width:98%;
          }
          
          .yes {
              height : 25px;
          }
          .no {
              height : 25px;
          }
          .yesLabel {
              color: #0C0;
          }
          .noLabel {
              color: #C33;
          }
  </style>
        
        <script>
            $(document).ready(function() {
                
                
                $('#academicyear').change(function() {
                    var select = $('#semester');
                    select.find('option').remove();
                    var acad_year = document.getElementById('academicyear').value;
                    $.get('Servlet23', {
                        acad_year: acad_year, reg_no : '13131A0542'
                    }, function(response) {
                        select.append('<option value=0>Select semester</option>');
                        $.each(response, function(index, value) {
                            $('<option>').val(value).text(value).appendTo(select);
                        });
                    });
                });
                
                $('#feedbackNo').change(function() {
                    var select = $('#semester');
                    select.find('option').remove();
                    var acad_year = document.getElementById('academicyear').value;
                    $.get('Servlet23', {
                        acad_year: acad_year, reg_no : '13131A0542'
                    }, function(response) {
                        select.append('<option value=0>Select semester</option>');
                        $.each(response, function(index, value) {
                            $('<option>').val(value).text(value).appendTo(select);
                        });
                    });
                })
                
                $('#semester').change(function() {
                    var select = $('#subjects');
                    select.find('option').remove();
                    var semester = document.getElementById('semester').value;
                    $.get('Servlet24', {
                        acad_year: document.getElementById('academicyear').value,
                        semester: semester, 
                        reg_no: '13131A0542',
                        feedback_no: document.getElementById('feedbackNo').value
                    }, function(response) {
                        myGlobalVariable = response;
                        $.get('Servlet27', {
                            subjects: JSON.stringify(myGlobalVariable),
                            reg_no: document.getElementById('reg_no').value,
                            semester: document.getElementById('semester').value
                        }, function(response) {
                            subjectsArray = response;
                            document.getElementById('submitButton').style.display = 'block';
                        });
                    });
                    
                    
                });
            });
        </script>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3">
                    <input type="hidden" value="0" id="foo">
                    <input type="hidden" value="13131A0542" id="reg_no">
                    <label for="sel1" style="margin-top:10px;">Academic Year:</label>
                    <select name="academicyear" id="academicyear" class="form-control" >
                        <option value="2015-16" selected>2015-16</option>
                        <option value="2016-17">2016-17</option>
                        <option value="2017-18">2017-18</option>
                        <option value="2018-19">2018-19</option>
                        <option value="2019-20">2019-20</option>
                        <option value="2020-21">2020-21</option>	
                    </select>
                </div>
                <div class="col-md-3">
                    <label for="feedbackNo" style="margin-top: 10px;">Feedback Number</label>
                    <select name="feedbackNo" id="feedbackNo" class="form-control" >
                        <option value="1" selected>1</option>
                        <option value="2">2</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <label for="sem" style="margin-top: 10px;">Semester: </label>
                    <select name="semester" id="semester" class="form-control">
                        
                    </select>
                </div>
                <div class="col-md-3" style="display: none;">
                    <label for="subjects" style="margin-top: 10px;">Subjects: </label>
                    <select name="subjects" id="subjects" class="form-control">
                        
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <button class="btn btn-primary" onclick="generateFeedbackUI();" id="submitButton" style="display: none;">Submit</button>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="panel with-nav-tabs panel-info">
                <div class="panel-heading">
                    <ul class="nav nav-tabs" id="feedbackHead">
                        
                    </ul>
                </div>
                <div class="panel-body">
                    <div class="tab-content" id="feedbackBody" style="display: none;">
                        
                    </div>
                </div>
            </div>
        </div>
        <div class="container" id="feedBackUI" style="display: none;">
            <div class="container" id="facultyDetails" name="facultyDetails">
                
            </div>
            <div class="container">
                <div class="container">
                    <div class="page-header">
                      <h1><center><strong><u>STUDENT FEEDBACK FORM</u></strong></center></h1>      
                    </div>

                </div>
                <div class="container">
                    <div class="panel panel-default box">
                        <div class="panel-body">
                            <span class="question">1. Do you feel the class interesting ?
                                <div class="container-fluid radioDiv">
                                    <label class="yesLabel">
                                        <input type="radio" name="optradio1" class="form-control yes" value="5">EXCELLENT
                                    </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <label class="noLabel">
                                        <input type="radio" name="optradio1" class="form-control no" value="4">VERYGOOD
                                    </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <label class="yesLabel">
                                        <input type="radio" name="optradio1" class="form-control yes" value="3">GOOD
                                    </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <label class="noLabel">
                                        <input type="radio" name="optradio1" class="form-control no" value="2">AVERAGE
                                    </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                                    
                                    <label class="noLabel">
                                        <input type="radio" name="optradio1" class="form-control no" value="1">POOR
                                    </label>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="panel panel-default box">
                    <div class="panel-body">
                        <span class="question">2. Are you well motivated to understand the objective of the course ?
                        <div class="container-fluid radioDiv">
                            <label class="yesLabel">
                                <input type="radio" name="optradio2" class="form-control yes" value="5">EXCELLENT
                            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <label class="noLabel">
                                <input type="radio" name="optradio2" class="form-control no" value="4">VERYGOOD
                            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <label class="yesLabel">
                                <input type="radio" name="optradio2" class="form-control yes" value="3">GOOD
                            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <label class="noLabel">
                                <input type="radio" name="optradio2" class="form-control no" value="2">AVERAGE
                            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                                    
                            <label class="noLabel">
                                <input type="radio" name="optradio2" class="form-control no" value="1">POOR
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
            <div class="panel panel-default box">
              <div class="panel-body">
            <span class="question">3. Are the fundamental concepts presented with clarity ?
          <div class="container-fluid radioDiv">
            <label class="yesLabel">
                <input type="radio" name="optradio3" class="form-control yes" value="5">EXCELLENT
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label class="noLabel">
                <input type="radio" name="optradio3" class="form-control no" value="4">VERYGOOD
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label class="yesLabel">
                <input type="radio" name="optradio3" class="form-control yes" value="3">GOOD
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label class="noLabel">
                <input type="radio" name="optradio3" class="form-control no" value="2">AVERAGE
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                                    
            <label class="noLabel">
                <input type="radio" name="optradio3" class="form-control no" value="1">POOR
            </label>
          </div>
                </div>
                </div>

            </div>
            <div class="container">
            <div class="panel panel-default box">
              <div class="panel-body">
            <span class="question">4. Do you consider the teacher knowledgeable in the subject ?
          <div class="container-fluid radioDiv">
            <label class="yesLabel">
                <input type="radio" name="optradio4" class="form-control yes" value="5">EXCELLENT
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label class="noLabel">
                <input type="radio" name="optradio4" class="form-control no" value="4">VERYGOOD
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label class="yesLabel">
                <input type="radio" name="optradio4" class="form-control yes" value="3">GOOD
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label class="noLabel">
                <input type="radio" name="optradio4" class="form-control no" value="2">AVERAGE
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                                    
            <label class="noLabel">
                <input type="radio" name="optradio4" class="form-control no" value="1">POOR
            </label>
          </div>
                </div>
                </div>


            </div>
            <div class="container">
            <div class="panel panel-default box">
              <div class="panel-body">
            <span class="question">5. Does the teacher come to the class well prepared ?
          <div class="container-fluid radioDiv">
            <label class="yesLabel">
                <input type="radio" name="optradio5" class="form-control yes" value="5">EXCELLENT
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label class="noLabel">
                <input type="radio" name="optradio5" class="form-control no" value="4">VERYGOOD
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label class="yesLabel">
                <input type="radio" name="optradio5" class="form-control yes" value="3">GOOD
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label class="noLabel">
                <input type="radio" name="optradio5" class="form-control no" value="2">AVERAGE
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                                    
            <label class="noLabel">
                <input type="radio" name="optradio5" class="form-control no" value="1">POOR
            </label></div>
                </div>
                </div>

            </div>
            <div class="container">
            <div class="panel panel-default box">
              <div class="panel-body">
            <span class="question">6. Is the teaching too fast ?
          <div class="container-fluid radioDiv">
            <label class="yesLabel">
                <input type="radio" name="optradio6" class="form-control yes" value="5">EXCELLENT
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label class="noLabel">
                <input type="radio" name="optradio6" class="form-control no" value="4">VERYGOOD
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label class="yesLabel">
                <input type="radio" name="optradio6" class="form-control yes" value="3">GOOD
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label class="noLabel">
                <input type="radio" name="optradio6" class="form-control no" value="2">AVERAGE
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                                    
            <label class="noLabel">
                <input type="radio" name="optradio6" class="form-control no" value="1">POOR
            </label></div>
                </div>
                </div>
            </div>
            <div class="container">
            <div class="panel panel-default box">
              <div class="panel-body">
            <span class="question">7. Is the teaching too slow ?
          <div class="container-fluid radioDiv">
            <label class="yesLabel">
                <input type="radio" name="optradio7" class="form-control yes" value="5">EXCELLENT
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label class="noLabel">
                <input type="radio" name="optradio7" class="form-control no" value="4">VERYGOOD
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label class="yesLabel">
                <input type="radio" name="optradio7" class="form-control yes" value="3">GOOD
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label class="noLabel">
                <input type="radio" name="optradio7" class="form-control no" value="2">AVERAGE
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                                    
            <label class="noLabel">
                <input type="radio" name="optradio7" class="form-control no" value="1">POOR
            </label></div></div></div>

            </div>
            <div class="container">
            <div class="panel panel-default box">
              <div class="panel-body">
            <span class="question">8. Is the syllabus properly covered ?
          <div class="container-fluid radioDiv">
            <label class="yesLabel">
                <input type="radio" name="optradio8" class="form-control yes" value="5">EXCELLENT
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label class="noLabel">
                <input type="radio" name="optradio8" class="form-control no" value="4">VERYGOOD
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label class="yesLabel">
                <input type="radio" name="optradio8" class="form-control yes" value="3">GOOD
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label class="noLabel">
                <input type="radio" name="optradio8" class="form-control no" value="2">AVERAGE
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                                    
            <label class="noLabel">
                <input type="radio" name="optradio8" class="form-control no" value="1">POOR
            </label></div>
                </div>
                </div>

            </div>
            <div class="container">
            <div class="panel panel-default box">
              <div class="panel-body">
            <span class="question">9. Are the numerical examples sufficiently worked out ?(If applicable)
            <div class="container-fluid radioDiv">

            <label class="yesLabel">
                <input type="radio" name="optradio9" class="form-control yes" value="5">EXCELLENT
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label class="noLabel">
                <input type="radio" name="optradio9" class="form-control no" value="4">VERYGOOD
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label class="yesLabel">
                <input type="radio" name="optradio9" class="form-control yes" value="3">GOOD
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label class="noLabel">
                <input type="radio" name="optradio9" class="form-control no" value="2">AVERAGE
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                                    
            <label class="noLabel">
                <input type="radio" name="optradio9" class="form-control no" value="1">POOR
            </label></div>
                </div>
                </div>

            </div>
            <div class="container">
            <div class="panel panel-default box">
              <div class="panel-body">
            <span class="question">10. Is the body language of the teacher ok ?
          <div class="container-fluid radioDiv">
            <label class="yesLabel">
                <input type="radio" name="optradio10" class="form-control yes" value="5">EXCELLENT
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label class="noLabel">
                <input type="radio" name="optradio10" class="form-control no" value="4">VERYGOOD
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label class="yesLabel">
                <input type="radio" name="optradio10" class="form-control yes" value="3">GOOD
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label class="noLabel">
                <input type="radio" name="optradio10" class="form-control no" value="2">AVERAGE
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                                    
            <label class="noLabel">
                <input type="radio" name="optradio10" class="form-control no" value="1">POOR
            </label>   
          </div></div></div>

            </div>
            <div class="container">
            <div class="panel panel-default box">
              <div class="panel-body">
            <span class="question">11. Does the teacher teach beyond the text book also ?
          <div class="container-fluid radioDiv">
            <label class="yesLabel">
                <input type="radio" name="optradio11" class="form-control yes" value="5">EXCELLENT
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label class="noLabel">
                <input type="radio" name="optradio11" class="form-control no" value="4">VERYGOOD
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label class="yesLabel">
                <input type="radio" name="optradio11" class="form-control yes" value="3">GOOD
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label class="noLabel">
                <input type="radio" name="optradio11" class="form-control no" value="2">AVERAGE
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                                    
            <label class="noLabel">
                <input type="radio" name="optradio11" class="form-control no" value="1">POOR
            </label></div></div></div>

            </div>
            <div class="container">
            <div class="panel panel-default box">
              <div class="panel-body">
            <span class="question">12. Are the classses regularly and pantually taken ?
          <div class="container-fluid radioDiv">
            <label class="yesLabel">
                <input type="radio" name="optradio12" class="form-control yes" value="5">EXCELLENT
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label class="noLabel">
                <input type="radio" name="optradio12" class="form-control no" value="4">VERYGOOD
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label class="yesLabel">
                <input type="radio" name="optradio12" class="form-control yes" value="3">GOOD
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label class="noLabel">
                <input type="radio" name="optradio12" class="form-control no" value="2">AVERAGE
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                                    
            <label class="noLabel">
                <input type="radio" name="optradio12" class="form-control no" value="1">POOR
            </label></div></div></div>

            </div>
            <div class="container">
            <div class="panel panel-default box">
              <div class="panel-body">
            <span class="question">13. Can the teacher be heard by the back-bench students
          <div class="container-fluid radioDiv">
            <label class="yesLabel">
                <input type="radio" name="optradio13" class="form-control yes" value="5">EXCELLENT
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label class="noLabel">
                <input type="radio" name="optradio13" class="form-control no" value="4">VERYGOOD
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label class="yesLabel">
                <input type="radio" name="optradio13" class="form-control yes" value="3">GOOD
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label class="noLabel">
                <input type="radio" name="optradio13" class="form-control no" value="2">AVERAGE
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                                    
            <label class="noLabel">
                <input type="radio" name="optradio13" class="form-control no" value="1">POOR
            </label></div></div></div>
            </div>
            <div class="container">
            <div class="panel panel-default box">
              <div class="panel-body">
            <span class="question">14. Is the teacher approachable for clarification of doubts ?
          <div class="container-fluid radioDiv">
            <label class="yesLabel">
                <input type="radio" name="optradio14" class="form-control yes" value="5">EXCELLENT
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label class="noLabel">
                <input type="radio" name="optradio14" class="form-control no" value="4">VERYGOOD
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label class="yesLabel">
                <input type="radio" name="optradio14" class="form-control yes" value="3">GOOD
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label class="noLabel">
                <input type="radio" name="optradio14" class="form-control no" value="2">AVERAGE
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                                    
            <label class="noLabel">
                <input type="radio" name="optradio14" class="form-control no" value="1">POOR
            </label></div></div></div>
            </div>
            <div class="container">
            <div class="panel panel-default box">
              <div class="panel-body">

            <span class="question">15. Are you satisfied with your efforts to follow the class ?
          <div class="container-fluid radioDiv">
            <label class="yesLabel">
                <input type="radio" name="optradio15" class="form-control yes" value="5">EXCELLENT
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label class="noLabel">
                <input type="radio" name="optradio15" class="form-control no" value="4">VERYGOOD
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label class="yesLabel">
                <input type="radio" name="optradio15" class="form-control yes" value="3">GOOD
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <label class="noLabel">
                <input type="radio" name="optradio15" class="form-control no" value="2">AVERAGE
            </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                                    
            <label class="noLabel">
                <input type="radio" name="optradio15" class="form-control no" value="1">POOR
            </label> </div></div></div>

      </div>
            






      <div id="id01">
      <div>

      <div class="container" style="font-size:20px">
          <strong>Overall Rating for the faculty:</strong>
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="radio" id="star5" name="rating" value="5" /><label class = "full" for="star5" title="excellent">Excellent</label>
        <input type="radio" id="star4" name="rating" value="4" /><label class = "full" for="star4"  title="very good">VeryGood</label>
        <input type="radio" id="star3" name="rating" value="3" /><label class = "full" for="star3"  title="good">Good</label>
        <input type="radio" id="star2" name="rating" value="2" /><label class = "full" for="star2"  title="average">Average</label>
        <input type="radio" id="star1" name="rating" value="1" /><label class = "full" for="star1" title="poor">Poor</label>
<!--    <div id="star_display" style=" margin-left: 30%; margin-top: -2%;"></div>
    </div>-->
      <div class="container" align="left">
          <div class="col-md-4">
          <div class="mdl-textfield mdl-js-textfield" align="left">
            <label for="comment">Comments:</label>

            <div class="row">
                <textarea class="form-control" rows="5" id="comment"></textarea>

            </div>
           </div>
              </div>
      </div>
      <div class="container">
            <div class="row">
    <div> 
          </div>
        </div>
      </div>

      </div>
      </div>
          <div classs="container" id="courseEndSurvey">
              
          </div>

     <center> <button onclick="valid(globalSubCode)"
    class="btn btn-primary" type="button" id="feedbackSubmit">Submit</button></center>
            </div>
        </div>
    </body>
</html>
