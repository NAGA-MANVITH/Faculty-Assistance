function askForCourseEndSurvey() {
    var table = '';
    table += '<tr><th>S.No</th><th>Course Outcome</th><th>Question</th></tr>';
    for(var i = 0; i < 5; i++) {
        table += '<tr><td>' + i + '</td><td>CO-' + i + '</td><td><input type="text" class="form-control" id="co' + i + '"></td></tr>';
    }
    document.getElementById('courseEndSurvey').innerHTML = '<table border=2 class="w3-table w3-striped myTable">' + table + '</table>';
}
function saveQuestions() {
    var questionsArray = {};
    questionsArray.co1 = '';
    questionsArray.co2 = '';
    questionsArray.co3 = '';
    questionsArray.co4 = '';
    questionsArray.co5 = '';
    for(var i = 1; i <= 5; i++) {
        questionsArray['co'+i] = document.getElementById('co'+i).value;
    }
    questionsArray = JSON.stringify(questionsArray);
    $.get('Servlet22',{        
        questionsArray:questionsArray,
        acad_year: document.getElementById('acad_year').value,
        regl_no: document.getElementById('regl_no').value,
        program: document.getElementById('program').value,
        branch: document.getElementById('branch').value,
        year: document.getElementById('year').value,
        semester: document.getElementById('semester1').value,
        sub_code: document.getElementById('sub_code').value,
        
    },function(response){
        console.log(response);
    });
}