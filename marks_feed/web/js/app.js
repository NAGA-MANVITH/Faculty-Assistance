var app = angular.module('schemaCreation', []);
var selectedSchema;
var sectionWiseMarks=[];
var rollNumbersGlobal;
var noOfBits;
var questionNames;
var globalCourseOutcomes;
var alphabets = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
function toggleRow(value) {
    var row = document.getElementById('tr'+value);
    var checkedOrNot = $('#'+value).is(":checked");
    if(checkedOrNot == true) {
        alert("hi");
        $("#tr"+value).css('pointer-events', 'none');
        $("#"+value).css('pointer-events', 'all');
        $('#totalMarks'+value).val('0');
        document.getElementById(value).value = 'off';
        var sections = selectedSchema['sections'];
        for(var r = 1; r <= sections; r++){
            var questions = selectedSchema['section'+r]['noq'];
            for(var s = 1; s <= questions; s++){
                var bits = Object.keys(selectedSchema['section'+r]['question'+s]).length;
                for(var t = 0; t < bits; t++){
                    document.getElementById(value+'-'+ r + '.' + s + '.' + alphabets[t]).value = '';
                    console.log(document.getElementById(value+'-'+ r + '.' + s + '.' + alphabets[t]));
                }
            }            
        }           
    }
    else if (checkedOrNot == false) {
        $("#tr"+value).css('pointer-events', 'all');
        $("#"+value).css('pointer-events', 'all');
        document.getElementById(value).value = 'on';
    }
}

function calculateCourseOutcome(obj) {
    console.log(obj);    
    for(var i = 1; i < 6; i++) {
        if(obj['co'+i].attempted != 0) {
            var coPercentage = obj['co'+i].passed / obj['co'+i].attempted;
            obj['co'+i]['co'+i+'Percentage'] = ''+coPercentage;
        }
        else {
            obj['co'+i]['co'+i+'Percentage'] = '';
        }
        obj['co'+i].attempted = ''+obj['co'+i].attempted;
        obj['co'+i].passed = ''+obj['co'+i].passed;
    }
    console.log(obj);
    $.get('Servlet9', {
        coObj: JSON.stringify(obj), 
        acad_year: document.getElementById('academicyear').value, 
        program: document.getElementById('program1').value,
        branch: document.getElementById('branch').value,
        semester: document.getElementById('semester').value,
        subject: document.getElementById('sub_code').value,
        section: document.getElementById('section').value,
        facid: document.getElementById('facid').value,
        assesment_type: document.getElementById('assesmentType').value,
        assesment_number: document.getElementById('assesmentNumber').value
    }, function(response) {
        console.log(response);
    })
}

function generateReport(exam) {
    var exams = {};
    exams.mid1 = "test1";
    exams.mid2 = "test2";
    exams.assesment1 = "assesment1";
    exams.assesment2 = "assesment2";
    exams.assesment3 = "assesment3";
    exams.assesment4 = "assesment4";
    $.get('Servlet12', {
        acad_year: document.getElementById('academicyear').value, 
        program: document.getElementById('program1').value,
        branch: document.getElementById('branch').value,
        semester: document.getElementById('semester').value,
        subject: document.getElementById('sub_code').value,
        section: document.getElementById('section').value,
        facid: document.getElementById('facid').value,
        typeofexam: exams[exam]
    }, function(response) {
        var table = '';
        if(response == "Null") {
            alert("You have not submitted this report yet");
        }
        else {
            var responseArray = response[0].split(";");
            table += '<tr><th>Course Outcome</th><th>Percentage Attained</th></tr>';
            var index = 0;
            while(index < responseArray.length) {
                if(responseArray[index] == '') {
                    responseArray[index] = '-';
                }
                else {
                    responseArray[index] = parseFloat(responseArray[index]).toFixed(2);
                }
                table += '<tr><td>CO-' + (index + 1) + '</td><td>' + (responseArray[index]) + '</td></tr>';
                index += 1;
            }
            document.getElementById('courseOutcomesTable').innerHTML = '<table border=2 class="w3-table w3-striped myTable">' + table + '</table>';
        }
    });
}

function printDiv(divName) {
    var printContents = document.getElementById(divName).innerHTML;
    w = window.open();
    w.document.write(printContents);
    w.print();
    w.close();
}

function calculateDA(s1, s2) {
    var da = ((2 * s1 + s2) / 3) * 0.8;
    console.log(da);
    document.getElementById('DA').innerHTML = 'The total value of Direct Assesment is : ' + da;
}

function calculatePbyA() {
    var s1Aggregate = 0;
    var s2Aggregate = 0;
    for(var i = 1; i < 6; i++) {
        var testAttempted = parseInt(document.getElementById('co'+i+'Test1a').innerHTML) + parseInt(document.getElementById('co'+i+'Test2a').innerHTML);
        var testPassed = parseInt(document.getElementById('co'+i+'Test1p').innerHTML) + parseInt(document.getElementById('co'+i+'Test2p').innerHTML);
        console.log('Test Passed is : ' + testPassed + 'Test Attempted is : '+ testAttempted);
        var testCalculation = '';
        if(testAttempted != 0 ) {
            testCalculation += testPassed / testAttempted;
            parseFloat(testCalculation).toFixed(2);
        }
        document.getElementById('co'+i+'TestPercentage').innerHTML = testCalculation;
        var assesmentAttempted = parseInt(document.getElementById('co'+i+'Assesment1a').innerHTML) + parseInt(document.getElementById('co'+i+'Assesment2a').innerHTML) + parseInt(document.getElementById('co'+i+'Assesment3a').innerHTML) + parseInt(document.getElementById('co'+i+'Assesment4a').innerHTML);
        var assesmentPassed = parseInt(document.getElementById('co'+i+'Assesment1p').innerHTML) + parseInt(document.getElementById('co'+i+'Assesment2p').innerHTML) + parseInt(document.getElementById('co'+i+'Assesment3p').innerHTML) + parseInt(document.getElementById('co'+i+'Assesment4p').innerHTML);
        var assesmentCalculation = '';
        if(assesmentAttempted != 0 ) {
            assesmentCalculation += assesmentPassed / assesmentAttempted;
            parseFloat(assesmentCalculation).toFixed(2);
        }
        document.getElementById('co'+i+'AssesmentPercentage').innerHTML = assesmentCalculation;
        if(document.getElementById('co'+ i +'TestPercentage').innerHTML == '') {
            document.getElementById('co'+i+'s1').innerHTML = '';
        }
        else {
            var score1Calculation = parseFloat(document.getElementById('co'+ i +'w1').innerHTML) * parseFloat(document.getElementById('co'+ i +'TestPercentage').innerHTML);
            document.getElementById('co'+i+'s1').innerHTML = score1Calculation.toFixed(2);
            s1Aggregate += score1Calculation;
        }
        if(document.getElementById('co'+ i +'AssesmentPercentage').innerHTML == '') {
            document.getElementById('co'+i+'s2').innerHTML = '';
        }
        else {
            var score2Calculation = parseFloat(document.getElementById('co'+ i +'w2').innerHTML) * parseFloat(document.getElementById('co'+ i +'AssesmentPercentage').innerHTML);
            document.getElementById('co'+i+'s2').innerHTML = score2Calculation.toFixed(2);
            s2Aggregate += score2Calculation;
        }
    }
    calculateDA(s1Aggregate, s2Aggregate);
}

function generateOverAllReport() {
    document.getElementById('printButton').style.display = 'block';
    var table = '';
    var noOfCos;
    var programKey = document.getElementById('program1').value;
    console.log(globalCourseOutcomes);
    var w = 1 / globalCourseOutcomes;
    table += '<tr><th rowspan=2>Course Outcome</th><th colspan=2>Test-1</th><th colspan=2>Test-2</th><th>AL</th><th>W</th><th>Score-1</th><th colspan=2>Assesment-1</th><th colspan=2>Assesment-2</th><th colspan=2>Assesment-3</th><th colspan=2>Assesment-4</th><th>AL</th><th>W</th><th>Score-2</th></tr>';
    table += '<tr><td>A</td><td>P</td><td>A</td><td>P</td><td>P/A</td><td></td><td>AL * W</td><td>A</td><td>P</td><td>A</td><td>P</td><td>A</td><td>P</td><td>A</td><td>P</td><td>P/A</td><td></td><td>AL * W</td></tr>'
    for(var i = 1; i < 6; i++) {
        table += '<tr id=co'+ i +'><td>CO'+ i +'</td><td id=co'+ i +'Test1a></td><td id=co'+ i +'Test1p></td><td id=co'+ i +'Test2a></td><td id=co'+ i +'Test2p></td><td id=co'+ i +'TestPercentage></td><td id=co' + i + 'w1>'+ w +'</td><td id=co'+ i + 's1></td><td id=co'+ i +'Assesment1a></td><td id=co'+ i +'Assesment1p></td><td id=co'+ i +'Assesment2a></td><td id=co'+ i +'Assesment2p></td><td id=co'+ i +'Assesment3a></td><td id=co'+ i +'Assesment3p></td><td id=co'+ i +'Assesment4a></td><td id=co'+ i +'Assesment4p></td><td id=co'+ i +'AssesmentPercentage></td><td id=co' + i + 'w2>'+ w +'</td><td id=co' + i + 's2></td></tr>';
    }
    document.getElementById('overAllReport').innerHTML = '<table border=2 class="w3-table w3-striped myTable">' + table + '</table>';
    $.get('Servlet13', {
        acad_year: document.getElementById('academicyear').value, 
        program: document.getElementById('program1').value,
        branch: document.getElementById('branch').value,
        semester: document.getElementById('semester').value,
        subject: document.getElementById('sub_code').value,
        section: document.getElementById('section').value,
        facid: document.getElementById('facid').value
    }, function(response) {
        console.log(response);
        $.each(response, function(key,value){
            document.getElementById(key).innerHTML = value;
        });
        calculatePbyA();
    });
}

function checkForYesCount(yesCount) {
    if(yesCount == 6) {
        document.getElementById('overAllReportButton').style.display = 'block';
    }
}

function getStatus() {
    
    var programKey = document.getElementById('program1').value;
    $.get('Servlet11', {
        regulation: 'R13', program_key: programKey
        }, function(response) {
            console.log(response);
            globalCourseOutcomes = response;
            console.log(globalCourseOutcomes);
    });
    
    $.get('Servlet10', {
        acad_year: document.getElementById('academicyear').value, 
        program: document.getElementById('program1').value,
        branch: document.getElementById('branch').value,
        semester: document.getElementById('semester').value,
        subject: document.getElementById('sub_code').value,
        section: document.getElementById('section').value,
        facid: document.getElementById('facid').value
    }, function(response) {
        var table = '';
        var yesCount = 0;
        table += '<tr><th>Exam</th><th>Posted</th><th>Report</th></tr>';
        console.log(response);
        if(jQuery.inArray("test;1", response) >= 0) {
            var mid1Status = "Yes";
            yesCount += 1;
        }
        else {
            mid1Status = "No";
        }
        if($.inArray("test;2", response) >= 0) {
            var mid2Status = "Yes";
            yesCount += 1;
        }
        else {
            mid2Status = "No";
        }
        if($.inArray("assesment;1", response) >= 0) {
            var assesment1Status = "Yes";
            yesCount += 1;
        }
        else {
            assesment1Status = "No";
        }
        if($.inArray("assesment;2", response) >= 0) {
            var assesment2Status = "Yes";
            yesCount += 1;
        }
        else {
            assesment2Status = "No";
        }
        if($.inArray("assesment;3", response) >= 0) {
            var assesment3Status = "Yes";
            yesCount += 1;
        }
        else {
            assesment3Status = "No";
        }
        if($.inArray("assesment;4", response) >= 0) {
            var assesment4Status = "Yes";
            yesCount += 1;
        }
        else {
            assesment4Status = "No";
        }
        var dummyString1 = "generateReport('mid1')";
        var dummyString2 = "generateReport('mid2')";
        var dummyString3 = "generateReport('assesment1')";
        var dummyString4 = "generateReport('assesment2')";
        var dummyString5 = "generateReport('assesment3')";
        var dummyString6 = "generateReport('assesment4')";
        table += '<tr><td>Mid - 1</td><td>' + mid1Status + '</td><td><p class="mouseOverEffect" onclick="' + dummyString1 + '">Generate Report</p></td></tr>';
        table += '<tr><td>Mid - 2</td><td>' + mid2Status + '</td><td><p class="mouseOverEffect" onclick="' + dummyString2 + '">Generate Report</p></td></tr>';
        table += '<tr><td>Assesment - 1</td><td>' + assesment1Status + '</td><td><p class="mouseOverEffect" onclick="' + dummyString3 + '">Generate Report</p></td></tr>';
        table += '<tr><td>Assesment - 2</td><td>' + assesment2Status + '</td><td><p class="mouseOverEffect" onclick="' + dummyString4 + '">Generate Report</p></td></tr>';
        table += '<tr><td>Assesment - 3</td><td>' + assesment3Status + '</td><td><p class="mouseOverEffect" onclick="' + dummyString5 + '">Generate Report</p></td></tr>';
        table += '<tr><td>Assesment - 4</td><td>' + assesment4Status + '</td><td><p class="mouseOverEffect" onclick="' + dummyString6 + '">Generate Report</p></td></tr>';
        
        document.getElementById('statusTable').innerHTML = '<table border=2 class="w3-table w3-striped myTable">' + table + '</table><div class="row"><div class="col-md-3"><button style="display: none;" id="overAllReportButton" class="btn btn-primary" onclick="generateOverAllReport()">Generate Overall Report</button></div></div>';
        checkForYesCount(yesCount);
    });
    
}

function courseOutcomeCalculation() {
    var courseOutcomeObject = {};
    courseOutcomeObject.co1 = {};
    courseOutcomeObject.co1['attempted'] = 0;
    courseOutcomeObject.co1['passed'] = 0;
    courseOutcomeObject.co2 = {};
    courseOutcomeObject.co2['attempted'] = 0;
    courseOutcomeObject.co2['passed'] = 0;
    courseOutcomeObject.co3 = {};
    courseOutcomeObject.co3['attempted'] = 0;
    courseOutcomeObject.co3['passed'] = 0;
    courseOutcomeObject.co4 = {};
    courseOutcomeObject.co4['attempted'] = 0;
    courseOutcomeObject.co4['passed'] = 0;
    courseOutcomeObject.co5 = {};
    courseOutcomeObject.co5['attempted'] = 0;
    courseOutcomeObject.co5['passed'] = 0;
    var schema = selectedSchema;
    var sections = schema.sections;
    var alphabets = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
    $.each(rollNumbersGlobal, function(index, number) {
        for(var i = 1; i <= sections; i++) {
            var questions = parseInt(schema['section'+i].noq);
            var questionMarks = [];
            questionMarks[0] = -2;
            for(var j = 1; j <= questions; j++) {
                var bits = Object.keys(schema['section'+i]['question'+j]).length;
                for(var k = 0; k < bits; k++) {
                    //var courseOutcome = document.getElementById('co'+i+'.'+j).value;
                    var strTemp = '' + i + '.' + j + '.' + alphabets[k];
                    var bitMarks = document.getElementById(number+'-'+strTemp).value;
                    if(isNaN(bitMarks)) {
                        bitMarks = 0;
                    }
                    if(bitMarks == '') {
                        bitMarks = 0;
                    }
                    if(isNaN(questionMarks[j])) {
                        questionMarks[j] = 0;
                    }
                    questionMarks[j] += parseInt(bitMarks);
                    questionMarks[j] = parseInt(questionMarks[j]);
                }
            }
            var attemptQuestions = parseInt(schema['section'+i].noa);
            var totalMarksTemp = parseInt(schema['section'+i].tom);
            var qMarks = totalMarksTemp/attemptQuestions;
            for(var r = 1; r <= attemptQuestions; r++) {
                var maxX = Math.max.apply(null, questionMarks);
                var index = questionMarks.indexOf(maxX);
                if(maxX > 0) {
                    var bits = Object.keys(schema['section'+i]['question'+index]).length;
                    for(var k = 0; k < bits; k++){
                        var strTemp = '' + i + '.' + index + '.' + alphabets[k];
                        var bit_marks;                                                
                        bit_marks = document.getElementById(number+'-'+strTemp).value;                                                    
                        if(bit_marks == ''){
                            bit_marks = -1;
                        }
                        if(isNaN(bit_marks)){
                            bit_marks = -1;
                        }
                        if(bit_marks >= 0){
                            var courseOutcome = document.getElementById('co'+i+'.'+index+'.'+k).value;
                            courseOutcomeObject['co'+courseOutcome].attempted += 1;
                        }                        
                    }                                        
                }
                questionMarks[index] = 0;
                var bits = Object.keys(schema['section'+i]['question'+index]).length;
                for(var k = 0; k < bits; k++){
                    var courseOutcome = document.getElementById('co'+i+'.'+index+'.'+k).value;
                    var strTemp = '' + i + '.' + index + '.' + alphabets[k];
                    var bit_marks = document.getElementById(number+'-'+strTemp).value;
                    var bit_max = schema['section'+i]['question'+index]['bit'+k];
                    if(bit_marks == ''){
                        bit_marks = -1;
                    }
                    if(isNaN(bit_marks)){
                        bit_marks = -1;
                    }
                    bit_marks = parseInt(bit_marks);
                    if(bit_marks >= 0){
                        if((bit_marks / bit_max) * 100 >= 40) {
                            courseOutcomeObject['co'+courseOutcome].passed += 1;
                        }                        
                    }
                }                
            }
        }
    });
    calculateCourseOutcome(courseOutcomeObject);
}

function askForCo() {
    var schema = selectedSchema;
    var sections = schema.sections;
    var table = '';
    table += '<th>Question</th><th>Course Outcome</th>'
    for(var i = 1; i <= sections; i++) {
        var questions = parseInt(schema['section'+i].noq);
        for(var j = 1; j <= questions; j++) {
            table += '<tr><td>Question ' + i + '.' + j +'</td><td><input type="text" class="form-control co"' + i + '.' + j + ' id="co'+ i + '.' + j +'"></td></tr>';
        }
    }
    table += '</table>';
    document.getElementById('courseOutcomeTable').innerHTML = '<table border=2 class="w3-table w3-striped myTable">' + table + '<div class="row"><div class="col-md-4"><button class="btn btn-primary" id="courseOutcomeSubmit" onclick="courseOutcomeCalculation()">Submit</button></div></div>';
}

function validateCO(str) {
    var value_ = document.getElementById(str).value;
    if(value_ > globalCourseOutcomes || value_ <= 0) {
        alert('Please enter valid course outcome. Course Outcomes must be less than ' + globalCourseOutcomes);
        document.getElementById(str).focus();
        document.getElementById(str).value = '';
    }
}

function submitData() {
    saveData();
    alert("Do you want to continue");
    var marks = {};
    $.each(rollNumbersGlobal, function(index, value) {
        marks[value] = document.getElementById('totalMarks'+value).value;
    })
    $.get('Servlet6', {
        marks: JSON.stringify(marks), 
        acad_year: document.getElementById('academicyear').value, 
        program: document.getElementById('program1').value,
        branch: document.getElementById('branch').value,
        semester: document.getElementById('semester').value,
        subject: document.getElementById('sub_code').value,
        section: document.getElementById('section').value,
        facid: document.getElementById('facid').value,
        assesment_type: document.getElementById('assesmentType').value,
        assesment_number: document.getElementById('assesmentNumber').value,
        max_marks: selectedSchema["totalMarks"]
    }, function(response) {
        courseOutcomeCalculation();
        window.location = "http://localhost:8084/marks_feed/home.jsp";
    });
}

function saveData() {
    var textBoxes = document.getElementsByClassName("saveElement");
    var string = '';
    for(var i = 0; i < textBoxes.length; i++) {
        string += textBoxes[i].value + ';';
    }
    console.log(string);
    var assesmentMethod;
    if(document.getElementById('assesmentType').value == 'test')
        assesmentMethod = '';
    else
        assesmentMethod = document.getElementById('assesmentMethod').value;
    $.get('Servlet20', {
        acad_year: document.getElementById('academicyear').value,
        program: document.getElementById('program1').value,
        branch: document.getElementById('branch').value,
        semester: document.getElementById('semester').value,
        sub_code: document.getElementById('sub_code').value,
        section: document.getElementById('section').value,
        assesment_type: document.getElementById('assesmentType').value,
        assesment_number: document.getElementById('assesmentNumber').value,
        assesment_method: assesmentMethod,
        fac_id: document.getElementById('facid').value,
        temp_marks: string
    }, function(response) {
        console.log(response);
    });
//    var tempMarks = {};
//    $.each(rollNumbersGlobal, function(index, value) {
//        tempMarks[value] = '';
//        $('#tr'+value).each(function(i, row) {
//            var $row = $(row);
//            var $inputFamily = $row.find('input');
//            $inputFamily.each(function(i, input) {
//                tempMarks[value] += input.value;
//                tempMarks[value] += ';';
//            });
//        });
//    });
    //console.log(tempMarks);
    //tempMarks = JSON.stringify(tempMarks);
    //console.log(tempMarks);
//    $.get('Servlet7', {
//        saveDataMarks : tempMarks,
//        acad_year: document.getElementById('academicyear').value, 
//        program: document.getElementById('program1').value,
//        branch: document.getElementById('branch').value,
//        semester: document.getElementById('semester').value,
//        subject: document.getElementById('sub_code').value,
//        section: document.getElementById('section').value,
//        facid: document.getElementById('facid').value,
//        assesment_type: document.getElementById('assesmentType').value,
//        assesment_number: document.getElementById('assesmentNumber').value
//        
//    }, function(response) {
//        //console.log('response');
//    });
}

function validateMarks(student) {
    
    var count = 0;
    var alphabets = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
    var schema = selectedSchema;
    var sections = selectedSchema.sections;
    var sectionMarks = [];
    
    for(var i = 1; i <= sections; i++) {
        var questions = parseInt(schema['section'+i].noq);
        var questionMarks = [];
        for(var j = 1; j <= questions; j++) {
            var bits = Object.keys(schema['section'+i]['question'+j]).length;
            for(var k = 0; k < bits; k++) {
                var strTemp = '' + i + '.' + j + '.' + alphabets[k];
                //var bitMarks = parseInt(document.getElementById(student+'-'+strTemp).value); sanoop
                var bitMarks = parseFloat(document.getElementById(student+'-'+strTemp).value);
               // alert(bitMarks);
                if(bitMarks > schema['section'+i]['question'+j]['bit'+k]) {
                  //  alert(bitMarks);
                    alert('Question'+i+'.'+j+'.'+alphabets[k] + ' marks shouldnot be greater than schema marks');
                    document.getElementById(student+'-'+strTemp).value = '';
                    document.getElementById(student+'-'+strTemp).focus();
                }
                if(bitMarks < 0) {
                    alert('Question'+i+'.'+j+'.'+alphabets[k] + ' marks shouldnot be negative');
                    document.getElementById(student+'-'+strTemp).value = '';
                    document.getElementById(student+'-'+strTemp).focus();
                }
                if(isNaN(bitMarks)) {
                    bitMarks = 0;
                }
                if(isNaN(questionMarks[j])) {
                    questionMarks[j] = 0;
                }
                questionMarks[j] += bitMarks;
                
                //console.log(bitMarks);
                count += 1;
                noOfBits = count;
            }
         
        }
        
            questionMarks.sort(function(a, b) {
                return a - b;
            });
            questionMarks.reverse();
            var sum = 0;
            var noa = schema['section'+i].noa;
            for(var r = 1; r <= noa; r++) {
                sum += questionMarks[r];
            }
            sectionWiseMarks[i] = sum;
            var totalMarksTemp = sectionWiseMarks.reduce((a, b) => a + b, 0);
          //  document.getElementById('totalMarks'+student).value = totalMarksTemp;   sanoop
            document.getElementById('totalMarks'+student).value = Math.ceil(totalMarksTemp);
    }
}

app.controller('schemaSelectionController', ['$scope', '$http', function($scope, $http) {
        
        $scope.sendSchemaId = function(givenSchemaId) {
            
            loadJSON(function(response) {
                // Parse JSON string into object
                var actual_JSON = JSON.parse(response);
                
                selectedSchema = actual_JSON[givenSchemaId];
                
                $.get('Servlet8', { 
                    acad_year: document.getElementById('academicyear').value, 
                    program: document.getElementById('program1').value,
                    branch: document.getElementById('branch').value,
                    semester: document.getElementById('semester').value,
                    subject: document.getElementById('sub_code').value,
                    section: document.getElementById('section').value,
                    facid: document.getElementById('facid').value
                }, function(response) {
                    //console.log(response);
                });
                
                $scope.generateUI(selectedSchema);
            });
            
        }
        
        $scope.generateUI = function(schema) {
            questionNames = [];
            var branch = document.getElementById("branch").value;
            var semester = document.getElementById("semester").value;
            var sub_code = document.getElementById("sub_code").value;
            var section = document.getElementById("section").value;
            var table = '';
            var sections = schema.sections;
            var alphabets = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
            //console.log(schema);
            table += '<tr><td colspan=2>Course Outcomes</td>';
            for(var r = 1; r <= sections; r++) {
                var questions = parseInt(schema['section'+r].noq);
                for(var s = 1; s <= questions; s++) {
                    var bits = Object.keys(schema['section'+r]['question'+s]).length;
                    var dummyString = "validateCO('co" + r + "." + s + "')";
                    table += '<td colspan=' + bits + '><input type="textbox" onchange="' + dummyString +'" class="form-control saveElement" id="co' + r + '.' + s + '"></td>';
                }
            }
            table += '</tr>';
            table += '<th>Roll no.</th><th>Absent</th>';
            var count = 0;
            for(var i = 1; i <= sections; i++) {
                var questions = parseInt(schema['section'+i].noq);
                for(var j = 1; j <= questions; j++) {    
                    var bits = Object.keys(schema['section'+i]['question'+j]).length;
                    for(var k = 0; k < bits; k++) {
                        var strTemp = '' + i + '.' + j + '.' + alphabets[k];
                        questionNames[count] = strTemp;
                        count += 1;
                        if(bits > 1) {
                            table += '<th>' + "" + i + "." + j + "." + alphabets[k] + "</th>";
                        }
                        else {
                            table += '<th>' + "" + i + "." + j + "</th>";
                        }
                    }
                }
            }
            table += '<th>Total Marks</th>';
            var tableTemp = '';
            $.get('Servlet5', {
                branch: branch, semester: semester, sub_code: sub_code, section: section, fac_id: facultyId
            }, function(response) {
                
                rollNumbersGlobal = response;
                $.each(response, function(index, value) {
                    
                    var stringTemp = "toggleRow('"+value+"')";
                    tableTemp += '<tr id="tr' + value + '"><td>'+value+'</td><td><input type="checkbox" id="'+value+'" class="form-control saveElement" name="pa" onclick="'+ stringTemp +'"></td>';
                    for(var i = 0; i < count; i++) {
                        tempString = "validateMarks('" + value + "')";
                        tableTemp += '<td><input type="textbox" onchange="' + tempString + '" class="form-control saveElement" id="' + value + '-' + questionNames[i] + '"></td>';
                    }
                    tableTemp += '<td><input type="textbox" class="form-control saveElement" id="totalMarks'+value+'" disabled></td></tr>';
                })
                //console.log(tableTemp);
                
                document.getElementById('tableDivision').innerHTML = '<table border=2 class="w3-table w3-striped myTable">' + table+tableTemp + '</table><div class="row"><div class="col-md-4"><button class="btn btn-primary" id="saveData" onclick="saveData()" type="submit">Save</button></div><div class="col-md-4"><button class="btn btn-primary" id="submitData" onclick="submitData()" type="submit">Submit</button></div></div>';
            });
        }
        
        function loadJSON(callback) {
            var xobj = new XMLHttpRequest();
            xobj.overrideMimeType("application/json");
            xobj.open('GET', './js/test.json', true); // Replace 'my_data' with the path to your file
            xobj.onreadystatechange = function () {
                if (xobj.readyState == 4 && xobj.status == "200") {
                  // Required use of an anonymous callback as .open will NOT return a value but simply returns undefined in asynchronous mode
                  callback(xobj.responseText);
                }
            };
            xobj.send(null);
        }
        
        $scope.callServletForFacSchemas = function() {
            $.get('Servlet1', {
               facId : facultyId
            }, function(response) {
                console.log(response);
                    $.each(response, function(index, value) {
                        var temp = value.split(";");
                        $('select#facSchemas').append('<option value="'+temp[0]+'">'+temp[1]+'</option>');
                    })
                });
        }
        
        $scope.createUIForMarksPost = function() {
            var programKey = document.getElementById('program1').value;
            $.get('Servlet11', {
                regulation: 'R13', program_key: programKey
            }, function(response) {
                globalCourseOutcomes = response;
            })
            var schemaId = document.getElementById("facSchemas").value;
            $scope.sendSchemaId(schemaId);
            $scope.uiSection = 1;
        }
        $scope.callServletForFacSchemas();
}]);

var facultyId;
function callServletForSchemas(facId) {
    facultyId = facId;
}

function showSectionsDiv() {
        var err = 0;
        var assesmentTypeLocal = document.getElementById('assesmentType').value;
        var assesmentNumberLocal = document.getElementById('assesmentNumber').value;
        var totalMarksLocal = document.getElementById('totalMarks').value;
        schema.assesmentType = assesmentTypeLocal;
        schema.assesmentNumber = assesmentNumberLocal;
        if(totalMarksLocal == "") {
            err = 1;
            alert('Please enter total marks');
        }
        var totalMarks = document.getElementById('totalMarks').value;
        schema.totalMarks = document.getElementById('totalMarks').value;
        if(isNaN(totalMarks) || (totalMarks < 0)) {
            if(err == 1)
                document.getElementById('sectionsDiv').style.display = 'none';
        }
        else {
            if(err == 0)
                document.getElementById('sectionsDiv').style.display = 'block';
        }
}

function askAboutSections() {
    var sections = document.getElementById('sections').value;
    schema.sections = sections;
    document.getElementById('aboutSectionsStatus').style.display = 'block';
    $('.aboutSections').html('');
    for(var i = 1; i <= sections; i++) {
        schema['section'+i] = {};
        $('.aboutSections').append('<div class="row"> <strong>Section - ' + i + ':</strong> </div><div class="row"><div class="col-md-3"><label>Total Questions</label><input type="text" class="form-control" placeholder="Total Questions" name="section' + i + '_totalQuestions" id="section' + i + 'totalQuestions"><div id="errorTQ' + i + '"></div></div><div class="col-md-3"><label>No of questions to be attempted</label><input type="text" class="form-control" placeholder="Questions to be attempted" name="section' + i +'_attemptQuestions" id="section' + i + 'attemptQuestions"><div id="errorAQ' + i + '"></div></div><div class="col-md-3"><label>Total marks for this section</label><input type="text" class="form-control" placeholder="Total marks for this section" name="section' + i + '_totalMarks" id="section' + i + 'totalMarks"><div id="errorTM' + i + '"></div></div></div>');
    }
}

function askAboutBits() {
    var sections = document.getElementById('sections').value;
    $('.bitsDiv').html('');
    var temp_ = 0;
    for(var i = 1; i <= sections; i++) {
            var localTemp = 'section' + i + 'totalQuestions';
            var temp = document.getElementById(localTemp).value;
            var dummy = document.getElementById('section'+i+'totalMarks').value;
            $('.bitsDiv').append('<h3>Section : ' + i + ' (Total marks for this section is: ' + dummy + ')</h3>');
            for(var j = 1; j <= temp; j++) {
                    schema['section'+i]['question'+j] = {};
                    temp_ += 1;
                    $('.bitsDiv').append('<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">Question-' + temp_ +': No of bits for this question:<input type="text" class="form-control" name="question' + i + ' ' + j + '" id="question' + i + ' ' + j + '"><div id="errorQ' + i + ' ' + j + '"  class="errorQ' + i + ' ' + j + '" name="errorQ' + i + ' ' + j + '"></div></div>');
            }
            $('.bitsDiv').append('<div class="row">');
    }
}

function validateFields() {
    var err = 0;
    var sections = document.getElementById('sections').value;
    for(var i = 1; i <= sections; i++) {
        var localTotalQuestions = 'section' + i + 'totalQuestions';
        var localAttemptQuestions = 'section' + i + 'attemptQuestions';
        var localTotalMarks = 'section' + i + 'totalMarks';
        var localerrorTQ = 'errorTQ' + i;
        var localerrorAQ = 'errorAQ' + i;
        var localerrorTM = 'errorTM' + i;
        document.getElementById(localerrorTQ).innerHTML = '';
        document.getElementById(localerrorAQ).innerHTML = '';
        document.getElementById(localerrorTM).innerHTML = '';
        var localTotalQuestionsValue = parseInt(document.getElementById(localTotalQuestions).value);
        var localAttemptQuestionsValue = parseInt(document.getElementById(localAttemptQuestions).value);
        var localTotalMarksValue = parseInt(document.getElementById(localTotalMarks).value);
        if(localTotalQuestionsValue <= 0) {
                document.getElementById(localerrorTQ).innerHTML = 'Total questions must be greater than 0';
                err = 1;
        }
        if(isNaN(localTotalQuestionsValue)) {
                document.getElementById(localerrorTQ).innerHTML = 'Please enter a proper value';	
                err = 1;
        }
        if(localAttemptQuestionsValue > localTotalQuestionsValue) {
                document.getElementById(localerrorAQ).innerHTML = 'Attempt questions must be less than total questions';
                err = 1;
        }
        if(isNaN(localAttemptQuestionsValue)) {
                document.getElementById(localerrorAQ).innerHTML = 'Please enter a proper value';
                err = 1;
        }
        if(localAttemptQuestionsValue <= 0) {
                document.getElementById(localerrorAQ).innerHTML = 'Attempt questions must be greater than 0';
                err = 1;
        }
        if(isNaN(localTotalMarksValue)) {
                document.getElementById(localerrorTM).innerHTML = 'Please enter a proper value';
                err = 1;
        }
        if(localTotalMarksValue <= 0) {
                document.getElementById(localerrorTM).innerHTML = 'Total Marks must be greater than 0';	
                err = 1;
        }
        if(localTotalMarksValue > document.getElementById('totalMarks').value) {
                document.getElementById(localerrorTM).innerHTML = 'Total Marks for this section must be less than total marks of the schema';
                err = 1;
        }
        if(localTotalMarksValue%localAttemptQuestionsValue != 0) {
                document.getElementById(localerrorAQ).innerHTML = 'You cannot give this kind of choice';
        }
        schema['section'+i]['noq'] = localTotalQuestionsValue;
        schema['section'+i]['noa'] = localAttemptQuestionsValue;
        schema['section'+i]['tom'] = localTotalMarksValue;
    }
    var schemaMarks = 0;
    for(var i = 1; i <= sections; i++) {
            var temp = 'section' + i + 'totalMarks';
            schemaMarks += parseInt(document.getElementById(temp).value);
    }
    if(schemaMarks != document.getElementById('totalMarks').value) {
            alert('Divided marks for section are not equal to total marks of the schema');
            err = 1;
    }
    if(err == 1) {
            document.getElementById('bitsDivStatus').style.display = 'none';
    }
    else {
            document.getElementById('bitsDivStatus').style.display = 'block';
            askAboutBits();
    }
}

app.controller('schemaController', ['$scope', '$http', function($scope, $http) {
	
	$scope.sectionsDiv = 0;
	$scope.schema = {};
	$scope.showSectionsDiv = function() {
                var regexp = /^\S*$/;
                var err = 0;
                if(regexp.test(document.getElementById('schemaName').value)) {
                    err = 0;
                }
                else {
                    alert('Schema name should not have spaces');
                    err = 1;
                }
                var assesmentTypeLocal = document.getElementById('assesmentType').value;
                var assesmentNumberLocal = document.getElementById('assesmentNumber').value;
                var schemaName = document.getElementById('schemaName').value;
                var totalMarksLocal = document.getElementById('totalMarks').value;
                //console.log(totalMarksLocal);
                $scope.schema.assesmentType = assesmentTypeLocal;
                $scope.schema.assesmentNumber = assesmentNumberLocal;
                $scope.schema.schemaName = schemaName;
                if(schemaName == "") {
                    alert('Please enter schema name');
                }
                else if(totalMarksLocal == "") {
                    alert('Please enter total marks');
                }
		$scope.schema.totalMarks = $scope.totalMarks;
//                if(assesmentTypeLocal ==)
		if(isNaN($scope.totalMarks) || ($scope.totalMarks < 0)) {
                    if(err == 1)
			$scope.sectionsDiv = 0;
		}
		else {
                    if(err == 0)
			$scope.sectionsDiv = 1;
		}
	}

	$scope.askAboutSections = function() {
		$scope.schema.sections = $scope.sections;
		$scope.aboutSectionsStatus = 1;
		var sections = $scope.sections;
		$('.aboutSections').html('');
		for(var i = 1; i <= sections; i++) {
			$scope.schema['section'+i] = {};
			$('.aboutSections').append('<div class="row"> <strong>Section - ' + i + ':</strong> </div><div class="row"><div class="col-md-3"><label>Total Questions</label><input type="text" class="form-control" placeholder="Total Questions" name="section' + i + '_totalQuestions" id="section' + i + 'totalQuestions"><div id="errorTQ' + i + '"></div></div><div class="col-md-3"><label>No of questions to be attempted</label><input type="text" class="form-control" placeholder="Questions to be attempted" name="section' + i +'_attemptQuestions" id="section' + i + 'attemptQuestions"><div id="errorAQ' + i + '"></div></div><div class="col-md-3"><label>Total marks for this section</label><input type="text" class="form-control" placeholder="Total marks for this section" name="section' + i + '_totalMarks" id="section' + i + 'totalMarks"><div id="errorTM' + i + '"></div></div></div>');
		}
	}

	$scope.validateFields = function() {
		var err = 0;
		var sections = $scope.sections;
		for(var i = 1; i <= sections; i++) {
			var localTotalQuestions = 'section' + i + 'totalQuestions';
			var localAttemptQuestions = 'section' + i + 'attemptQuestions';
			var localTotalMarks = 'section' + i + 'totalMarks';
			var localerrorTQ = 'errorTQ' + i;
			var localerrorAQ = 'errorAQ' + i;
			var localerrorTM = 'errorTM' + i;
			document.getElementById(localerrorTQ).innerHTML = '';
			document.getElementById(localerrorAQ).innerHTML = '';
			document.getElementById(localerrorTM).innerHTML = '';
			var localTotalQuestionsValue = parseInt(document.getElementById(localTotalQuestions).value);
			var localAttemptQuestionsValue = parseInt(document.getElementById(localAttemptQuestions).value);
			var localTotalMarksValue = parseInt(document.getElementById(localTotalMarks).value);
			if(localTotalQuestionsValue <= 0) {
				document.getElementById(localerrorTQ).innerHTML = 'Total questions must be greater than 0';
				err = 1;
			}
			if(isNaN(localTotalQuestionsValue)) {
				document.getElementById(localerrorTQ).innerHTML = 'Please enter a proper value';	
				err = 1;
			}
			if(localAttemptQuestionsValue > localTotalQuestionsValue) {
				document.getElementById(localerrorAQ).innerHTML = 'Attempt questions must be less than total questions';
				err = 1;
			}
			if(isNaN(localAttemptQuestionsValue)) {
				document.getElementById(localerrorAQ).innerHTML = 'Please enter a proper value';
				err = 1;
			}
			if(localAttemptQuestionsValue <= 0) {
				document.getElementById(localerrorAQ).innerHTML = 'Attempt questions must be greater than 0';
				err = 1;
			}
			if(isNaN(localTotalMarksValue)) {
				document.getElementById(localerrorTM).innerHTML = 'Please enter a proper value';
				err = 1;
			}
			if(localTotalMarksValue <= 0) {
				document.getElementById(localerrorTM).innerHTML = 'Total Marks must be greater than 0';	
				err = 1;
			}
			if(localTotalMarksValue > $scope.totalMarks) {
				document.getElementById(localerrorTM).innerHTML = 'Total Marks for this section must be less than total marks of the schema';
				err = 1;
			}
			if(localTotalMarksValue%localAttemptQuestionsValue != 0) {
				document.getElementById(localerrorAQ).innerHTML = 'You cannot give this kind of choice';
			}
			$scope.schema['section'+i]['noq'] = localTotalQuestionsValue;
			$scope.schema['section'+i]['noa'] = localAttemptQuestionsValue;
			$scope.schema['section'+i]['tom'] = localTotalMarksValue;
		}
		var schemaMarks = 0;
		for(var i = 1; i <= sections; i++) {
			var temp = 'section' + i + 'totalMarks';
			schemaMarks += parseInt(document.getElementById(temp).value);
		}
		if(schemaMarks != $scope.totalMarks) {
			alert('Divided marks for section are not equal to total marks of the schema');
			err = 1;
		}
		if(err == 1) {
			$scope.bitsDivStatus = 0;
		}
		else {
			$scope.bitsDivStatus = 1;
			$scope.askAboutBits();
		}
	}

	$scope.askAboutBits = function () {
		var sections = $scope.sections;
		$('.bitsDiv').html('');
                var temp_ = 0;
		for(var i = 1; i <= sections; i++) {
			var localTemp = 'section' + i + 'totalQuestions';
			var temp = document.getElementById(localTemp).value;
                        var dummy = document.getElementById('section'+i+'totalMarks').value;
			$('.bitsDiv').append('<h3>Section : ' + i + ' (Total marks for this section is: ' + dummy + ')</h3>');
			for(var j = 1; j <= temp; j++) {
				$scope.schema['section'+i]['question'+j] = {};
                                temp_ += 1;
				$('.bitsDiv').append('<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">Question-' + temp_ +': No of bits for this question:<input type="text" class="form-control" name="question' + i + ' ' + j + '" id="question' + i + ' ' + j + '"><div id="errorQ' + i + ' ' + j + '"  class="errorQ' + i + ' ' + j + '" name="errorQ' + i + ' ' + j + '"></div></div>');
			}
                        $('.bitsDiv').append('<div class="row">');
		}
	}

	$scope.validateBitsFields = function() {
		var err = 0;
		var sections = $scope.sections;
                console.log($scope.schema);
		for(var i = 1; i <= sections; i++) {
			var localTemp = 'section' + i + 'totalQuestions';
			var temp = document.getElementById(localTemp).value;
			for(var j = 1; j <= temp; j++) {
				document.getElementById('errorQ'+i+' '+j).innerHTML = '';
				var question = 'question' + i + ' ' + j;
				var questionValue = document.getElementById(question).value;
                                if(questionValue == '' && err != 1) {
                                    alert('Please fill all the bits values');
                                    err = 1;
                                }
				var sectionTreshold = parseInt(document.getElementById('section'+i+'totalMarks').value)/parseInt(document.getElementById('section'+i+'attemptQuestions').value);
				if(questionValue > sectionTreshold) {
					document.getElementById('errorQ'+i+' '+j).innerHTML = 'You cannot give these many bits for this question';
					err = 1;
				}
			}
		}
		if(err == 1) {
			$scope.bitMarksAllocationStatus = 0;
		}
		else {
			$scope.bitMarksAllocationStatus = 1;
			$scope.bitMarksAllocation();
		}
	}

	$scope.bitMarksAllocation = function() {
		var sections = $scope.sections;
                console.log(sections);
		$('.bitMarksAllocationDiv').html('');
                var temp__ = 0;
		for(var i = 1; i <= sections; i++) {
			$('.bitMarksAllocationDiv').append('<div class="container-fluid"><h3>Section : ' + i + '</h3>');
			var localTemp = 'section' + i + 'totalQuestions';
			var temp = document.getElementById(localTemp).value;
			for(var j = 1; j <= temp; j++) {
				var tempV = document.getElementById('question'+i+' '+j).value;
                                temp__ += 1;
				for(var k = 0; k < tempV; k++) {
					$scope.schema['section'+i]['question'+j]['bit'+k] = '';
                                        if(tempV <= 1) {
                                            $('.bitMarksAllocationDiv').append('<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6"><strong>' + temp__ +'</strong> Enter maximum marks for this bit:<input type="text" class="form-control" name="bit' + i + '.' + j + '.' + k + '" id="bit' + i + '.' + j + '.' + k + '"><div class="errorB' + i + '.' + j + '.' + k + '" name="errorB' + i + '.' + j + '.' + k + '" id="errorB' + i + '.' + j + '.' + k + '"></div></div></div>');
                                        }
					else {
                                            $('.bitMarksAllocationDiv').append('<div class="col-lg-3 col-md-3 col-sm-6 col-xs-6"><strong>' + temp__ + '.' + alphabets[k] +'</strong> Enter maximum marks for this bit:<input type="text" class="form-control" name="bit' + i + '.' + j + '.' + k + '" id="bit' + i + '.' + j + '.' + k + '"><div class="errorB' + i + '.' + j + '.' + k + '" name="errorB' + i + '.' + j + '.' + k + '" id="errorB' + i + '.' + j + '.' + k + '"></div></div></div>');
                                        }
				}
                                $('.bitMarksAllocationDiv').append('<div class="row">');
			}
		}
	}

	$scope.validateBitsAllocation = function() {
		var sections = $scope.sections;
		var err = 0;
		for(var i = 1; i <= sections; i++) {
			var localTemp = 'section' + i + 'totalQuestions';
			var temp = document.getElementById(localTemp).value;
			for(var j = 1; j <= temp; j++) {
				var tempV = parseInt(document.getElementById('question'+i+' '+j).value);
				for(var k = 0; k < tempV; k++) {
					var aTemp = parseInt(document.getElementById('section'+i+'totalMarks').value);
					var bTemp = parseInt(document.getElementById('section'+i+'attemptQuestions').value);
					var cTemp = parseInt(document.getElementById('question'+i+' '+j).value);
					var bitTreshold = (aTemp / bTemp) - cTemp + 1;
					document.getElementById('errorB'+i+'.'+j+'.'+k).innerHTML = '';
					var bitValue = parseInt(document.getElementById('bit'+i+'.'+j+'.'+k).value);
					$scope.schema['section'+i]['question'+j]['bit'+k] = bitValue;
					if(bitValue <= 0) {
						document.getElementById('errorB'+i+'.'+j+'.'+k).innerHTML = 'Please enter a proper value';
					}
					if(bitValue > bitTreshold) {
						document.getElementById('errorB'+i+'.'+j+'.'+k).innerHTML = 'You cannot give this amount of marks for this question';
						err = 1;
					}
				}
			}
		}
		//console.log($scope.schema);
		for(var i = 1; i <= sections; i++) {
			var questionMarks = 0;
			var aTemp = 0;
			var bTemp = 0;
			var localTemp = 'section' + i + 'totalQuestions';
			var temp = document.getElementById(localTemp).value;
			for(var j = 1; j <= temp; j++) {
				var tempV = parseInt(document.getElementById('question'+i+' '+j).value);
				for(var k = 0; k < tempV; k++) {
					aTemp = parseInt(document.getElementById('section'+i+'totalMarks').value);
					bTemp = parseInt(document.getElementById('section'+i+'attemptQuestions').value);
					var bitValue = parseInt(document.getElementById('bit'+i+'.'+j+'.'+k).value);
					questionMarks += bitValue;
				}
				if(questionMarks != (aTemp / bTemp)) {
					alert('Marks for Section '+i+' and Question '+j+' are not divided properly');
					err = 1;
				}
				questionMarks = 0;
			}
		}
		if(err == 1) {
			alert('There is an error in the schema. Please try again.');
		}
		else {
			var schObj = $scope.schema;
                        schObj.facid = document.getElementById('facid').value;
                        //console.log(schObj);
                        console.log(schObj);
                        schObj = JSON.stringify(schObj);
                        $.get('NewServlet', {
                                    schemaObject : schObj,
                                }, function(responseText) {
                                        //console.log('Got data');
                                });
                        
			alert('Everything went fine. :-)');	
		}
	}
        
        $scope.sendSchemaId = function(givenSchemaId) {
            
            loadJSON(function(response) {
                // Parse JSON string into object
                var actual_JSON = JSON.parse(response);
                //console.log(actual_JSON.givenSchemaId);
            });
            
        }
        
        function loadJSON(callback) {
            var xobj = new XMLHttpRequest();
            xobj.overrideMimeType("application/json");
            xobj.open('GET', './js/test.json', true); // Replace 'my_data' with the path to your file
            xobj.onreadystatechange = function () {
                if (xobj.readyState == 4 && xobj.status == "200") {
                  // Required use of an anonymous callback as .open will NOT return a value but simply returns undefined in asynchronous mode
                  callback(xobj.responseText);
                }
            };
            xobj.send(null);
        }

}]);