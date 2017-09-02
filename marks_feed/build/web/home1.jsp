<%-- 
    Document   : home
    Created on : Mar 4, 2017, 3:10:23 PM
    Author     : Vasishta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" href="./css/bootstrap.min.css">
	<link rel="stylesheet" href="./css/style.css">
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-12" style="margin-top: 10px;">
                    <a href="facultyStatus.jsp"><button name="createSchema" class="btn btn-primary">View Status</button></a>
                </div>
                <div class="col-md-12" style="margin-top: 10px">
                    <a href="viewMarks.jsp"><button name="createSchema" class="btn btn-primary">View Marks</button></a>
                </div>
                <div class="col-md-12" style="margin-top: 10px">
                    <a href="feedbackReport.jsp"><button name="createSchema" class="btn btn-primary">Feedback Report</button></a>
                </div>
            </div>
        </div>
    </body>
</html>
