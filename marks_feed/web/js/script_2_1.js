var marksObject;
var examsPosted;

function printDiv(divName) {
    var printContents = document.getElementById(divName).innerHTML;
    w = window.open();
    w.document.write(printContents);
    w.print();
    w.close();
}

function getMarks() {
    var acad_year = document.getElementById('academicyear').value;
    var branch = document.getElementById('branch').value;
    var program = document.getElementById('program1').value;
    var semester = document.getElementById('semester').value;
    var subject = document.getElementById('sub_code').value;
    var section = document.getElementById('section').value;
    $.get('Servlet16', {
        acad_year: acad_year,
        program: program,
        branch: branch,
        semester: semester,
        subject: subject,
        section: section,
        fac_id: facultyId
    }, function(response) {
        examsPosted = response;
        console.log(examsPosted);
        $.get('Servlet17', {
            acad_year: acad_year,
            program: program,
            branch: branch,
            semester: semester,
            subject: subject,
            section: section,
            fac_id: facultyId
        }, function(response) {
            marksObject = response;
            var table = '';
            table += '<tr><th>S.No</th><th>Roll No</th><th>Student Name</th>';
            $.each(examsPosted, function(index, value) {
                var examType = value.split(";");
                examType[0] = examType[0].charAt(0).toUpperCase() + examType[0].substr(1, (examType[0]).length - 1);
                var tempString = value.replace(";", "");
                table += '<th>' + examType[0] + '-' + examType[1] + '<p>(Max Marks - <span id="maximumMarks' + tempString + '"></span>)</p></th>';
            });
            var tempArray = Object.keys(marksObject).sort();
            table += '<th>Mid Weighted Average (Max Marks - 20)</th><th>Assesment Average (Max Marks - 10)</th><th>Total Marks (Max Marks - 30)</th>';
            table += '</tr>';
            var sno = 0;
            console.log(marksObject);
            $.each(marksObject, function(index, value) {
                sno += 1;
                var test_marks;
                var assesment_marks;
                var tot_marks = {};               
                tot_marks.test1 = {};
                tot_marks.test2 = {};
                tot_marks.assesment3 = {};
                tot_marks.assesment4 = {};
                tot_marks.assesment1 = {};
                tot_marks.assesment2 = {};
                tot_marks.test1["test1marks"]= 0;
                tot_marks.test1["test1maxmarks"]= 0;
                tot_marks.test1["test1avgmarks"]= 0;
                tot_marks.test2["test2marks"]= 0;
                tot_marks.test2["test2maxmarks"]= 0;
                tot_marks.test2["test2avgmarks"]= 0;
                tot_marks.assesment1["assesment1marks"]= 0;
                tot_marks.assesment1["assesment1maxmarks"]= 0;
                tot_marks.assesment1["assesment1avgmarks"]= 0;
                tot_marks.assesment2["assesment2marks"]= 0;
                tot_marks.assesment2["assesment2maxmarks"]= 0;
                tot_marks.assesment2["assesment2avgmarks"]= 0;
                tot_marks.assesment3["assesment3marks"]= 0;
                tot_marks.assesment3["assesment3maxmarks"]= 0;
                tot_marks.assesment3["assesment3avgmarks"]= 0;
                tot_marks.assesment4["assesment4marks"]= 0;
                tot_marks.assesment4["assesment4maxmarks"]= 0;
                tot_marks.assesment4["assesment4avgmarks"]= 0;
                table += '<tr><td>' + sno + '</td><td>' + tempArray[sno - 1] + '</td><td>' + marksObject[tempArray[sno - 1]]["studentName"] + '</td>';
                for(var i = 0; i < examsPosted.length; i++) {
                    examsPosted[i] = examsPosted[i].replace(";", "");
                    tot_marks[examsPosted[i]][examsPosted[i]+'marks'] = marksObject[tempArray[sno - 1]][examsPosted[i]];
                    tot_marks[examsPosted[i]][examsPosted[i]+'maxmarks'] = marksObject[tempArray[sno - 1]]['maxMarks' + examsPosted[i]];
                    tot_marks[examsPosted[i]][examsPosted[i]+'avgmarks'] = Math.ceil((parseInt(tot_marks[examsPosted[i]][examsPosted[i]+'marks']) * 20) / (parseInt(tot_marks[examsPosted[i]][examsPosted[i]+'maxmarks'])));
                    table += '<td>' + marksObject[tempArray[sno - 1]][examsPosted[i]] + '</td>';
                }
                var midMarks = 0;
                if(tot_marks["test1"]["test1avgmarks"] >= tot_marks["test2"]["test2avgmarks"]) {
                    midMarks = Math.ceil(((parseInt(tot_marks["test1"]["test1avgmarks"]) * 2) + (parseInt(tot_marks["test2"]["test2avgmarks"]))) / 3);
                }
                else {
                    midMarks = Math.ceil(((parseInt(tot_marks["test2"]["test2avgmarks"]) * 2) + (parseInt(tot_marks["test1"]["test1avgmarks"]))) / 3);
                }
                var assesmentsMarks = 0;
                assesmentsMarks = parseInt(tot_marks["assesment1"]["assesment1avgmarks"]) + parseInt(tot_marks["assesment2"]["assesment2avgmarks"]) + parseInt(tot_marks["assesment3"]["assesment3avgmarks"]) + parseInt(tot_marks["assesment4"]["assesment4avgmarks"]);
                assesmentsMarks = Math.ceil(assesmentsMarks / 4);
                table += '<td>' + midMarks + '</td><td>' + assesmentsMarks + '</td>';
                table += '<td>' + (midMarks + assesmentsMarks) + '</td>';
                console.log(tot_marks);
            })
            document.getElementById('marksTable').innerHTML = '<table border=2 class="w3-table w3-striped myTable">' + table + '</table>';
            for(var i = 0; i < examsPosted.length; i++) {
                examsPosted[i] = examsPosted[i].replace(";", "");
                document.getElementById('maximumMarks' + examsPosted[i]).innerHTML = marksObject[tempArray[sno - 1]]["maxMarks"+examsPosted[i]];
            }
            document.getElementById('printButton').style.display = 'block';
        });
    });
}