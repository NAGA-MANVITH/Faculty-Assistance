var globalObject;

function printDiv(divName) {
    var printContents = document.getElementById(divName).innerHTML;
    w = window.open();
    w.document.write(printContents);
    w.print();
    w.close();
}

function generateFacultyFeedbackReport() {
    document.getElementById('ratingDiv').style.display = 'block';
    document.getElementById('printFacultyButton').style.display = 'block';
    document.getElementById('signatureDiv').style.display = 'block';
    document.getElementById('commentsDiv').style.display = 'block';
    var sem = document.getElementById('semester').value;
    var year;
    if(sem == '1' || sem == '2')
        year = 1;
    else if(sem == '3' || sem == '4')
        year = 2;
    else if(sem == '5' || sem == '6')
        year = 3;
    else if(sem == '7' || sem == '8')
        year = 4;
    var program = document.getElementById('program1').value;
    if(program == '1A')
        program = 'B. Tech';
    else if(program == '1D')
        program = 'M. Tech';
    else if(program == '1F')
        program = 'MCA';
    else if(program == '5A')
        program = 'B. Tech_ECET';
    var subjectValue = document.getElementById('sub_code').innerHTML;
    document.getElementById('facultyName').innerHTML = 'Name of the faculty: ' + facultyId;
    document.getElementById('facClass').innerHTML = 'Class: ' + program + ', ' + document.getElementById('branch').value;
    document.getElementById('facYear').innerHTML = 'Year : ' + year;
    document.getElementById('facSemester').innerHTML = 'Semester: ' + document.getElementById('semester').value;
    document.getElementById('facSubject').innerHTML = 'Subject: ' + document.getElementById('sub_code').value;
    document.getElementById('facSection').innerHTML =  'Section: ' + document.getElementById('section').value;;
    var table = '';
    var totalPositiveCount = 0;
    var questionsArray = [
        "Do you feel the class interesting ?",
        "Are you well motivated to understand the objective of the course ?",
        "Are the fundamental concepts presented with clarity ?",
        "Do you consider the teacher knowledgeable in the subject ?",
        "Does the teacher come to the class well prepared ?",
        "Is the teaching too fast ?",
        "Is the teaching too slow ?",
        "Is the syllabus properly covered ?",
        "Are the numerical examples sufficiently worked out ?(If applicable)",
        "Is the body language of the teacher ok ?",
        "Does the teacher teach beyond the text book also ?",
        "Are the classses regularly and pantually taken ?",
        "Can the teacher be heard by the back-bench students ?",
        "Is the teacher approachable for clarification of doubts ?",
        "Are you satisfied with your efforts to follow the class ?"
    ];
    table += '<tr><td>S.No</td><td>Question</td><td>Average</td></tr>';
    for(var i = 1; i <= 15; i++) {
//        if(i == 6 || i == 7)
//            positiveResponse = "No";
//        else
//            positiveResponse = "Yes";
        table += '<tr><td>' + i + '</td><td>' + questionsArray[i - 1] + '</td><td>' + globalObject["q" + i] + '</td></tr>';
        totalPositiveCount += parseInt(globalObject["q" + i]);
    }
 //   table += '<tr><td></td><td>Total Positive Count: <strong>(a)</strong> </td><td colspan=2 style="text-align: center;">' + totalPositiveCount + '</td></tr>';  table += '<tr><td></td><td>Total Points Obtained * 5 grades: <strong>(b = a * 5)</strong> </td><td colspan=2 style="text-align: center;">' + (totalPositiveCount * 5) + '</td></tr>';
 //   table += '<tr><td></td><td>No. of students feedback forms taken * 15 points: <strong>(c)</strong></td><td colspan=2 style="text-align: center;">' + (globalObject["totalNoofFeedbacks"] * 15)  + '</td></tr>';
    var averageValue = (((totalPositiveCount * 5)) / ((globalObject["totalNoofFeedbacks"] * 15)));
    if(globalObject["totalNoofFeedbacks"] == 0)
        averageValue = 0;
   // table += '<tr><td></td><td>Average: <strong>(avg)</strong></td><td colspan=2 style="text-align: center;">' + averageValue.toFixed(2) + '</td></tr>';
    document.getElementById('facultyFeedbackReport').innerHTML = '<table border=2 class="w3-table w3-striped myTable" style="width: 73%;">' + table + '</table> <div class="row"><strong>avg = b / total no of feedbacks taken</strong></div>';
}

function getFacultyReport() {
    document.getElementById('printLayout').style.display = 'block';
    var acad_year = document.getElementById('academicyear').value;
    var branch = document.getElementById('branch').value;
    var semester = document.getElementById('semester').value;
    var subject = document.getElementById('sub_code').value;
    var section = document.getElementById('section').value;
    $.get('Servlet14', {
        acad_year: acad_year,
        branch: branch,
        semester: semester,
        subject: subject,
        section: section,
        fac_id: facultyId,
        feedback_no: document.getElementById('feedbackNo').value
    }, function(response) {
        globalObject = response;
        //console.log("response";)
        console.log(response);
        document.getElementById('totalNoofFeedbacks').innerHTML = '<h3>Total number of feedbacks are : ' + response["totalNoofFeedbacks"] + '</h3>';
        $.get('Servlet15', {
            acad_year: acad_year,
            branch: branch,
            semester: semester,
            subject: subject,
            section: section,
            fac_id: facultyId,
            feedback_no: document.getElementById('feedbackNo').value
        }, function(response) {
            console.log(response.length);
            console.log(response);
            var table = '<tr><th>Roll No</th></tr>';
            $.each(response, function(index, value) {
                table += '<tr><td>' + value + '</td></tr>';
            });
            document.getElementById('noFeedbacks').innerHTML = '<h3>Students who didnot give feedback: </h3><table border=2 class="w3-table w3-striped myTable" style="width: 25%;">' + table + '</table><div class="row"><div class="col-md-3"><button class="btn btn-primary" onclick="generateFacultyFeedbackReport()">Generate Report</button></div></div>';
            var ratingTable = '';
            ratingTable += '<tr><th>Excellent (e)</th><th>Very Good (v)</th><th>Good(g)</th><th>Average (a)</th><th>Poor (p)</th><th>Average Overall Rating (avg_overall)</th></tr>';
            ratingTable += '<tr><td style="text-align: center;">' + globalObject["excellent"] + '</td>';
            ratingTable += '<td style="text-align: center;">' + globalObject["verygood"] + '</td>';
            ratingTable += '<td style="text-align: center;">' + globalObject["good"] + '</td>';
            ratingTable += '<td style="text-align: center;">' + globalObject["average"] + '</td>';
            ratingTable += '<td style="text-align: center;">' + globalObject["poor"] + '</td>';
            averageOverallRating = (parseInt(globalObject["excellent"]) * 5) + (parseInt(globalObject["verygood"]) * 4) + (parseInt(globalObject["good"]) * 3) + (parseInt(globalObject["average"]) * 2) + (parseInt(globalObject["poor"]) * 1);
            averageOverallRating /= parseInt(globalObject["totalNoofFeedbacks"]);
            if(globalObject["totalNoofFeedbacks"] == 0) {
                averageOverallRating = 0;
            }
            ratingTable += '<td style="text-align: center;">' + averageOverallRating + '</td></tr>';
            document.getElementById('ratingDiv').innerHTML = '<table border=2 class="w3-table w3-striped myTable" style="width: 70%;">' + ratingTable + '</table> <div class="row"><strong>avg_overall = ((e*5) + (v*4) + (g*3) + (a*2) + (p*1))/total no of feedback forms taken</strong></div>';
            document.getElementById('commentsDiv').innerHTML = globalObject["comments"];
        });
    });
}

