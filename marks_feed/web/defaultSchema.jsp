<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%@page import="javax.servlet.http.*"%>
<%@page language="java" session="true"%>
<%@page import ="javax.sql.*" %>
<%!String facid, facname,faclevel;//!!!! %>

<%
    facid = (String) session.getAttribute("fac_id");
%>
<!DOCTYPE html>
<html>
<head>
	<title>Schema Creation</title>
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	<link rel="stylesheet" href="./css/style.css">
        <script src="./js/jquery-3.1.1.min.js"></script>
        <script src="./js/bootstrap.min.js"></script>
        <script src="./js/angular.min.js"></script>
        <script src="./js/script.js"></script>
</head>
<body>
    
    <div class="container-fluid">
        <h3>Default Schema</h3>
            <div class="container-fluid">
                <input id="facid" type="hidden"value=<%=facid%>>
                <input type="hidden" id="sections" value="3">
                <div class="row">
                    <div class="col-md-3" style="display: none;">
                            <label for="assesmentType">Assesment Type:</label>
                            <select class="form-control"  id="assesmentType">
                            <option value="mid">Mid</option>
<!--                            <option value="ass1">Assignment 1</option>
                            <option value="ass2">Assignment 2</option>
                            <option value="ass3">Assignment 3</option>
                            <option value="quiz">Quiz</option>-->
                            </select>
                    </div>
                    <div class="col-md-3" style="display: none;">
                        <label for="assesmentNumber">Assesment Number:</label>
                        <select class="form-control" id="assesmentNumber">
                                <option value="1" selected>1</option>
                                <option value="2">2</option>
    <!--                            <option value="3">3</option>
                                <option value="4">4</option>-->
                        </select>
                    </div>
                    <div class="col-md-3">
                        <label for="schemaId">Schema Name: </label>
                        <input type="text" class="form-control" id="schemaName" name="schemaName">
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-2 col-md-2 col-sm-3 col-xs-3">
                            <label for="totalMarks">Total Marks:</label>
                            <input type="text" class="form-control" id="totalMarks" disabled="disabled">
                    </div>
                </div>
                <div class="container-fluid">
				<div class="container-fluid aboutSections"><div class="row"> <strong>Section - 1:</strong> </div><div class="row"><div class="col-md-3"><label>Total Questions</label><input type="text" class="form-control"  placeholder="Total Questions" name="section1_totalQuestions" disabled="disabled" id="section1totalQuestions" ><div id="errorTQ1"></div></div><div class="col-md-3"><label>No of questions to be attempted</label><input type="text" class="form-control" placeholder="Questions to be attempted" disabled="disabled" name="section1_attemptQuestions" id="section1attemptQuestions" ><div id="errorAQ1"></div></div><div class="col-md-3"><label>Total marks for this section</label><input type="text" class="form-control" placeholder="Total marks for this section" disabled="disabled" name="section1_totalMarks" id="section1totalMarks" ><div id="errorTM1"></div></div></div><div class="row"> <strong>Section - 2:</strong> </div><div class="row"><div class="col-md-3"><label>Total Questions</label><input type="text" class="form-control" placeholder="Total Questions" disabled="disabled" name="section2_totalQuestions" id="section2totalQuestions" ><div id="errorTQ2"></div></div><div class="col-md-3"><label>No of questions to be attempted</label><input type="text" class="form-control" placeholder="Questions to be attempted" disabled="disabled" name="section2_attemptQuestions" id="section2attemptQuestions" ><div id="errorAQ2"></div></div><div class="col-md-3"><label>Total marks for this section</label><input type="text" class="form-control" placeholder="Total marks for this section" disabled="disabled" name="section2_totalMarks" id="section2totalMarks" ><div id="errorTM2"></div></div></div><div class="row"> <strong>Section - 3:</strong> </div><div class="row"><div class="col-md-3"><label>Total Questions</label><input type="text" class="form-control" placeholder="Total Questions" disabled="disabled" name="section3_totalQuestions" id="section3totalQuestions" ><div id="errorTQ3"></div></div><div class="col-md-3"><label>No of questions to be attempted</label><input type="text" class="form-control" placeholder="Questions to be attempted" disabled="disabled" name="section3_attemptQuestions" id="section3attemptQuestions" ><div id="errorAQ3"></div></div><div class="col-md-3"><label>Total marks for this section</label><input type="text" class="form-control" placeholder="Total marks for this section" disabled="disabled" name="section3_totalMarks" id="section3totalMarks"><div id="errorTM3"></div></div></div></div>
                </div>
                <script>
                    document.getElementById('totalMarks').value = '30';
                    document.getElementById('section1totalQuestions').value = '2';
                    document.getElementById('section2totalQuestions').value = '2';
                    document.getElementById('section3totalQuestions').value = '2';
                    document.getElementById('section1attemptQuestions').value = '1';
                    document.getElementById('section2attemptQuestions').value = '1';
                    document.getElementById('section3attemptQuestions').value = '1';
                    document.getElementById('section1totalMarks').value = '10';
                    document.getElementById('section2totalMarks').value = '10';
                    document.getElementById('section3totalMarks').value = '10';
                </script>
                <div class="container-fluid">
				<div class="container-fluid bitsDiv"><h3>Section : 1 (Total marks for this section is: 10)</h3><div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">Question-1: No of bits for this question:<input type="text" class="form-control" name="question1 1" id="question1 1" ><div id="errorQ1 1" class="errorQ1 1" name="errorQ1 1"></div></div><div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">Question-2: No of bits for this question:<input type="text" class="form-control" name="question1 2" id="question1 2" ><div id="errorQ1 2" class="errorQ1 2" name="errorQ1 2"></div></div><div class="row"></div><h3>Section : 2 (Total marks for this section is: 10)</h3><div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">Question-3: No of bits for this question:<input type="text" class="form-control" name="question2 1" id="question2 1" pmbx_context="4ABB7555-C3DD-40F3-990E-0B7A79B456D7"><div id="errorQ2 1" class="errorQ2 1" name="errorQ2 1"></div></div><div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">Question-4: No of bits for this question:<input type="text" class="form-control" name="question2 2" id="question2 2" pmbx_context="9851FD3D-B75A-4061-8489-EF3C5601B782"><div id="errorQ2 2" class="errorQ2 2" name="errorQ2 2"></div></div><div class="row"></div><h3>Section : 3 (Total marks for this section is: 10)</h3><div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">Question-5: No of bits for this question:<input type="text" class="form-control" name="question3 1" id="question3 1" pmbx_context="240F1423-EFAC-4097-BDEC-B3D87B683372"><div id="errorQ3 1" class="errorQ3 1" name="errorQ3 1"></div></div><div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">Question-6: No of bits for this question:<input type="text" class="form-control" name="question3 2" id="question3 2" ><div id="errorQ3 2" class="errorQ3 2" name="errorQ3 2"></div></div><div class="row"></div></div>
				<div class="row">
					<div class="col-lg-2 col-md-2 col-sm-3 col-xs-3">
						<button class="btn btn-primary" onclick="return validateBitsFields()">Submit</button>
					</div>
				</div>
                </div>
                <div class="container-fluid" id="bitMarksAllocationDiv" style="display: none;">
                    <div class="container-fluid bitMarksAllocationDiv">
                        
                    </div>
                    <div class="row">
                        <div class="col-lg-2 col-md-2 col-sm-3 col-xs-3">
                            <button class="btn btn-primary" onclick="return validateBitsAllocation()">Submit</button>
                        </div>
                    </div>
		</div>
            </div>
    </div>
</body>