var schema = {};
var existingStatus;
var alphabets = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
function validateBitsFields() {
    if(document.getElementById('assesmentType').value == 'test') {
        document.getElementById('bitMarksButton').style.display = 'block';
    }
    return tempFunction();
}

function validateBitsAllocation() {
    var sections = schema.sections;
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
                var bitTreshold;
                var noq = parseInt(document.getElementById('section'+i+'totalQuestions').value);
                if(noq == bTemp){
                    bitTreshold = aTemp - noq + 1;
                }
                else{
                    bitTreshold = (aTemp / bTemp) - cTemp + 1;
                }
                document.getElementById('errorB'+i+'.'+j+'.'+k).innerHTML = '';
                var bitValue = parseInt(document.getElementById('bit'+i+'.'+j+'.'+k).value);
                schema['section'+i]['question'+j]['bit'+k] = bitValue;
                if(bitValue <= 0) {
                    document.getElementById('errorB'+i+'.'+j+'.'+k).innerHTML = 'Please enter a proper value';
                }
                if(bitValue > bitTreshold) {
                    alert('hello');
                    document.getElementById('errorB'+i+'.'+j+'.'+k).innerHTML = 'You cannot give this amount of marks for this question';
                    err = 1;
                }
            }
        }
    }
    for(var i = 1; i <= sections; i++) {
        var questionMarks = 0;
        var aTemp = 0;
        var bTemp = 0;
        var noq = 0;
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
            noq = parseInt(document.getElementById('section'+i+'totalQuestions').value);
            if(noq != bTemp){
                if(questionMarks != (aTemp / bTemp)){
                    alert('Marks for Section '+i+' and Question '+j+' are not divided properly');
                    err = 1;
                }
                questionMarks = 0; 
            }                               
        }
        if(noq == bTemp){
            if(questionMarks != aTemp ){
                alert('Marks for Section '+i+' are not divided properly');
                err = 1;
            }
        }
    }
        questionMarks = 0;
    if(err == 1) {
        alert('There is an error in the schema. Please try again.');
    }
    else {
        var schObj = schema;
        schObj.facid = document.getElementById('facid').value;
        console.log(schObj);
        schObj = JSON.stringify(schObj);
        var assesmentMethod;
        if(document.getElementById('assesmentType').value == 'test')
            assesmentMethod = '';
        else
            assesmentMethod = document.getElementById('assesmentMethod').value;
        console.log(document.getElementById('academicyear').value);
        $.get('NewServlet', {
            schemaObject : schObj,
            acad_year: document.getElementById('academicyear').value,
            program: document.getElementById('program1').value,
            branch: document.getElementById('branch').value,
            semester: document.getElementById('semester').value,
            sub_code: document.getElementById('sub_code').value,
            section: document.getElementById('section').value,
            assesment_type: document.getElementById('assesmentType').value,
            assesment_number: document.getElementById('assesmentNumber').value,
            assesment_method: assesmentMethod
            }, function(responseText) {
                
        });
        alert('Everything went fine. :-)');
        document.getElementById('createSchemaDiv').style.display = 'none';
        postMarks();
    }
}


function bitMarksAllocation() {
    var sections = schema.sections;
    $('.bitMarksAllocationDiv').html('');
    var temp__ = 0;
    for(var i = 1; i <= sections; i++) {
        $('.bitMarksAllocationDiv').append('<div class="container-fluid"><h3>Section : ' + i + '</h3>');
        var localTemp = 'section' + i + 'totalQuestions';
        var temp = document.getElementById(localTemp).value;
        for(var j = 1; j <= temp; j++) {
            var tempV = document.getElementById('question'+i+' '+j).value;
            console.log(tempV);
            temp__ += 1;
            for(var k = 0; k < tempV; k++) {
                schema['section'+i]['question'+j]['bit'+k] = '';
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
    return false;
}

function tempFunction() {
    var err = 0;
    var sections = schema.sections;
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
    console.log(schema);
    if(err == 1) {
        
    }
    else {
        document.getElementById('bitMarksAllocationStatus').style.display = "block";
    }
    bitMarksAllocation();
}

function defaultSchema() {
    schema.sections = "3";
    schema.totalMarks = "30";
    schema.assesmentType = "mid";
    schema.assesmentNumber = "1";
    schema.section1 = {};
    schema.section2 = {};
    schema.section3 = {};
    schema.section1.noq = "2";
    schema.section1.noa = "1";
    schema.section1.tom = "10";
    schema.section1.question1 = {};
    schema.section1.question2 = {};
    schema.section2.noq = "2";
    schema.section2.noa = "1";
    schema.section2.tom = "10";
    schema.section2.question1 = {};
    schema.section2.question2 = {};
    schema.section3.noq = "2";
    schema.section3.noa = "1";
    schema.section3.tom = "10";
    schema.section3.question1 = {};
    schema.section3.question2 = {};
    var schemaForMid = '';
    schemaForMid += '<h3>Default Schema</h3>';
    //schemaForMid += '<div class="row"><div class="col-md-3"><label for="schemaId">Schema Name: </label><input type="text" class="form-control" id="schemaName" name="schemaName"></div></div>';
    schemaForMid += '<div class="row"><div class="col-lg-2 col-md-2 col-sm-3 col-xs-3"><label for="totalMarks">Total Marks:</label><input type="text" class="form-control" id="totalMarks" disabled="disabled"></div></div><div class="container-fluid"><div class="container-fluid aboutSections"><div class="row"> <strong>Section - 1:</strong> </div><div class="row"><div class="col-md-3"><label>Total Questions</label><input type="text" class="form-control"  placeholder="Total Questions" name="section1_totalQuestions" disabled="disabled" id="section1totalQuestions" ><div id="errorTQ1"></div></div><div class="col-md-3"><label>No of questions to be attempted</label><input type="text" class="form-control" placeholder="Questions to be attempted" disabled="disabled" name="section1_attemptQuestions" id="section1attemptQuestions" ><div id="errorAQ1"></div></div><div class="col-md-3"><label>Total marks for this section</label><input type="text" class="form-control" placeholder="Total marks for this section" disabled="disabled" name="section1_totalMarks" id="section1totalMarks" ><div id="errorTM1"></div></div></div><div class="row"> <strong>Section - 2:</strong> </div><div class="row"><div class="col-md-3"><label>Total Questions</label><input type="text" class="form-control" placeholder="Total Questions" disabled="disabled" name="section2_totalQuestions" id="section2totalQuestions" ><div id="errorTQ2"></div></div><div class="col-md-3"><label>No of questions to be attempted</label><input type="text" class="form-control" placeholder="Questions to be attempted" disabled="disabled" name="section2_attemptQuestions" id="section2attemptQuestions" ><div id="errorAQ2"></div></div><div class="col-md-3"><label>Total marks for this section</label><input type="text" class="form-control" placeholder="Total marks for this section" disabled="disabled" name="section2_totalMarks" id="section2totalMarks" ><div id="errorTM2"></div></div></div><div class="row"> <strong>Section - 3:</strong> </div><div class="row"><div class="col-md-3"><label>Total Questions</label><input type="text" class="form-control" placeholder="Total Questions" disabled="disabled" name="section3_totalQuestions" id="section3totalQuestions" ><div id="errorTQ3"></div></div><div class="col-md-3"><label>No of questions to be attempted</label><input type="text" class="form-control" placeholder="Questions to be attempted" disabled="disabled" name="section3_attemptQuestions" id="section3attemptQuestions" ><div id="errorAQ3"></div></div><div class="col-md-3"><label>Total marks for this section</label><input type="text" class="form-control" placeholder="Total marks for this section" disabled="disabled" name="section3_totalMarks" id="section3totalMarks"><div id="errorTM3"></div></div></div></div></div>';
    schemaForMid += '<div class="container-fluid"><div class="container-fluid bitsDiv"><h3>Section : 1 (Total marks for this section is: 10)</h3><div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">Question-1: No of bits for this question:<input type="text" class="form-control" name="question1 1" id="question1 1" ><div id="errorQ1 1" class="errorQ1 1" name="errorQ1 1"></div></div><div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">Question-2: No of bits for this question:<input type="text" class="form-control" name="question1 2" id="question1 2" ><div id="errorQ1 2" class="errorQ1 2" name="errorQ1 2"></div></div><div class="row"></div><h3>Section : 2 (Total marks for this section is: 10)</h3><div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">Question-3: No of bits for this question:<input type="text" class="form-control" name="question2 1" id="question2 1" pmbx_context="4ABB7555-C3DD-40F3-990E-0B7A79B456D7"><div id="errorQ2 1" class="errorQ2 1" name="errorQ2 1"></div></div><div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">Question-4: No of bits for this question:<input type="text" class="form-control" name="question2 2" id="question2 2" pmbx_context="9851FD3D-B75A-4061-8489-EF3C5601B782"><div id="errorQ2 2" class="errorQ2 2" name="errorQ2 2"></div></div><div class="row"></div><h3>Section : 3 (Total marks for this section is: 10)</h3><div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">Question-5: No of bits for this question:<input type="text" class="form-control" name="question3 1" id="question3 1" pmbx_context="240F1423-EFAC-4097-BDEC-B3D87B683372"><div id="errorQ3 1" class="errorQ3 1" name="errorQ3 1"></div></div><div class="col-lg-3 col-md-3 col-sm-6 col-xs-6">Question-6: No of bits for this question:<input type="text" class="form-control" name="question3 2" id="question3 2" ><div id="errorQ3 2" class="errorQ3 2" name="errorQ3 2"></div></div><div class="row"></div></div><div class="row"><div class="col-lg-2 col-md-2 col-sm-3 col-xs-3"><button class="btn btn-primary" onclick="return validateBitsFields()">Submit</button></div></div></div><div class="container-fluid" id ="bitMarksAllocationStatus"><div class="container-fluid" id="bitMarksAllocationDiv" ><div class="container-fluid bitMarksAllocationDiv"></div><div class="row"><div class="col-lg-2 col-md-2 col-sm-3 col-xs-3"><button class="btn btn-primary" onclick="return validateBitsAllocation()" id ="bitMarksButton" style="display:none;">Submit</button></div></div></div></div>';
    document.getElementById('createSchemaDiv').innerHTML = schemaForMid;
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
}

function genericSchema() {
    var schemaForAssesment = '';
    schemaForAssesment += '<h1>Create Schema</h1><div class="container-fluid"><div class="row"><div class="col-lg-2 col-md-2 col-sm-3 col-xs-3"><label for="totalMarks">Total Marks:</label><input type="text" class="form-control" id="totalMarks"></div></div><div class="row"><div class="col-lg-2 col-md-2 col-sm-3 col-xs-3"><button class="btn btn-primary" onclick="showSectionsDiv()">Submit</button></div></div></div><div id="sectionsDiv" class="container-fluid" style="display: none;"><div class="row"><div class="col-lg-3 col-md-3 col-sm-6 col-xs-6"><label for="sections">Enter the total number of sections:</label><input type="text" id="sections" class="form-control"></div></div><div class="row"><div class="col-lg-2 col-md-2 col-sm-3 col-xs-3"><button class="btn btn-primary" onclick="askAboutSections()">Submit</button></div></div></div><div id="aboutSectionsStatus" class="container-fluid" style="display: none;"><div class="container-fluid aboutSections"></div><div class="row"><div class="col-lg-2 col-md-2 col-sm-3 col-xs-3"><button class="btn btn-primary" onclick="validateFields()">Submit</button></div></div></div><div class="container-fluid" id="bitsDivStatus" style="display: none;"><div class="container-fluid bitsDiv"></div><div class="row"><div class="col-lg-2 col-md-2 col-sm-3 col-xs-3"><button class="btn btn-primary" onclick="validateBitsFields()">Submit</button></div></div></div><div class="container-fluid" id="bitMarksAllocationStatus" style="display: none;"><div class="container-fluid bitMarksAllocationDiv" id="bitMarksAllocationDiv"></div><div class="row"><div class="col-lg-2 col-md-2 col-sm-3 col-xs-3"><button class="btn btn-primary"  onclick="validateBitsAllocation()">Submit</button></div></div></div>';
    document.getElementById('createSchemaDiv').innerHTML = schemaForAssesment;
}

function askForSchema() {
    var assesmentMethod;
    if(document.getElementById('assesmentType').value == 'test')
        assesmentMethod = '';
    else
        assesmentMethod = document.getElementById('assesmentMethod').value;
    var assesmentType = document.getElementById('assesmentType').value;
    $.get('Servlet19', {
        acad_year: document.getElementById('academicyear').value,
        program: document.getElementById('program1').value,
        branch: document.getElementById('branch').value,
        semester: document.getElementById('semester').value,
        sub_code: document.getElementById('sub_code').value,
        section: document.getElementById('section').value,
        assesment_type: document.getElementById('assesmentType').value,
        assesment_number: document.getElementById('assesmentNumber').value,
        assesment_method: assesmentMethod,
        fac_id: document.getElementById('facid').value
    }, function(response) {
        console.log(response);
        existingStatus = response;
        if(response == 'Not Exists') {
            document.getElementById('postMarksDiv').style.display = 'none';
            document.getElementById('createSchemaDiv').style.display = 'block';
            if(assesmentType == 'test')
                defaultSchema();
            else if(assesmentType == 'assesment')
                genericSchema();
        }
        else {
            document.getElementById('postMarksDiv').style.display = 'block';
            document.getElementById('createSchemaDiv').style.display = 'none';
            postMarks();
        }
    });
}

function generateUI(schema) {
    console.log(schema);
    questionNames = [];
    colours = ['#ffb3b3','#99bbff','#ffb3b3','#99bbff','#ffb3b3','#99bbff','#ffb3b3','#99bbff','#ffb3b3','#99bbff','#ffb3b3','#99bbff','#ffb3b3','#99bbff','#ffb3b3','#99bbff','#ffb3b3','#99bbff','#ffb3b3','#99bbff','#ffb3b3','#99bbff','#ffb3b3','#99bbff','#ffb3b3','#99bbff','#ffb3b3','#99bbff','#ffb3b3','#99bbff'];
    bit_colours = [];
    var counter = 0;
    var colour_index = 0;
    var branch = document.getElementById("branch").value;
    var semester = document.getElementById("semester").value;
    var sub_code = document.getElementById("sub_code").value;
    var section = document.getElementById("section").value;
    var facultyId = document.getElementById('facid').value;////added by Sanoop
    var table = '';
    var sections = schema.sections;
    var alphabets = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
    table += '<tr><td colspan=2>Course Outcomes</td>';
    for(var r = 1; r <= sections; r++) {
        var questions = parseInt(schema['section'+r].noq);
        for(var s = 1; s <= questions; s++) {
            var bits = Object.keys(schema['section'+r]['question'+s]).length;            
            for(var t = 0; t < bits; t++){
                console.log(bits);                
                var dummyString = "validateCO('co" + r + "." + s + "." + t + "')";
                table += '<td><input type="textfield" onchange="' + dummyString +'" class="form-control saveElement" id="co' + r + '.' + s + '.' + t + '"></td>';
            }            
        }
    }
    table += '</tr>';
    table += '<th>Roll no.</th><th>Absent</th>';
    var count = 0;
    var temp_ = 1;
    for(var i = 1; i <= sections; i++) {
        var questions = parseInt(schema['section'+i].noq);
        var colour_flag = 0;
        var attemptQuestions = parseInt(schema['section'+i].noa);
        if(questions == attemptQuestions){
            colour_flag = 1;
        }
        else{
            colour_flag = 0;
        }
        for(var j = 1; j <= questions; j++) {
            var colour_assign;
            colour_assign = colours[colour_index];
            if(colour_flag == 1){               
                colour_index += 1;
            }
            var bits = Object.keys(schema['section'+i]['question'+j]).length;            
            for(var k = 0; k < bits; k++) {
                bit_colours[counter] = colour_assign;
                counter += 1;
                var strTemp = '' + i + '.' + j + '.' + alphabets[k];
                var marks = schema['section'+i]['question'+j]['bit'+k];               
                questionNames[count] = strTemp;
                count += 1;
                if(bits > 1) {
                    table += '<th style=background-color:' + colour_assign + ';>' + "" + temp_ + "." + alphabets[k] + "(Max-Marks - " + marks + ")</th>";
                }
                else {
                    table += '<th style=background-color:' + colour_assign + ';>' + "" + temp_ + "</th>";
                }
            }
            temp_ += 1;
        }
        if(colour_flag == 0){
            colour_index += 1;
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
                tableTemp += '<td style=background-color:' + bit_colours[i] + ';><input type="textbox" onchange="' + tempString + '" class="form-control saveElement" id="' + value + '-' + questionNames[i] + '"></td>';
            }
            tableTemp += '<td><input type="textbox" class="form-control saveElement" id="totalMarks'+value+'" disabled></td></tr>';
        })

        document.getElementById('postMarksDiv').innerHTML = '<table border=2 class="w3-table w3-striped myTable">' + table+tableTemp + '</table><div class="row"><div class="col-md-4"><button class="btn btn-primary" id="saveData" onclick="saveData()" type="submit">Save</button></div><div class="col-md-4"><button class="btn btn-primary" id="submitData" onclick="submitData()" type="submit">Submit</button></div></div>';
        if(existingStatus == "Exists") {
            //Code to get existing data
            var assesmentMethod;
            if(document.getElementById('assesmentType').value == 'test')
                assesmentMethod = '';
            else
                assesmentMethod = document.getElementById('assesmentMethod').value;
            $.get('Servlet21', {
                acad_year: document.getElementById('academicyear').value,
                program: document.getElementById('program1').value,
                branch: document.getElementById('branch').value,
                semester: document.getElementById('semester').value,
                sub_code: document.getElementById('sub_code').value,
                section: document.getElementById('section').value,
                assesment_type: document.getElementById('assesmentType').value,
                assesment_number: document.getElementById('assesmentNumber').value,
                assesment_method: assesmentMethod,
                fac_id: document.getElementById('facid').value
            }, function(response) {
                var temp_marks = response.split(';');
                var textBoxes = document.getElementsByClassName("saveElement");
                for(var i = 0; i < textBoxes.length; i++) {
                    textBoxes[i].value = temp_marks[i];
                    if(temp_marks[i] == 'off') {
                        textBoxes[i].checked = true;
                    }
                }
            })
        }
    });
}

function sendSchemaId(givenSchemaId) {
    console.log(givenSchemaId);
    //location.reload(true);
    setTimeout(function() {
        loadJSON(function(response) {
            var actual_JSON = response;
            console.log(actual_JSON);
            selectedSchema = actual_JSON[givenSchemaId];
            console.log("before selected schema");
            console.log(selectedSchema);
            generateUI(actual_JSON[givenSchemaId]);
        });
    }, 2000);
}

function loadJSON(callback) {
//        var xobj = new XMLHttpRequest();
//        xobj.setRequestHeader("Content-type", "application/json");
//        xobj.overrideMimeType("application/json");
//        xobj.onreadystatechange = function () {
//            if (xobj.readyState === 4 && xobj.status === 200) {
//                console.log(xobj.responseText);
//              callback(xobj.responseText);
//            }
//        };
//        setTimeout(function() {
//            xobj.open('GET', './js/test.json', false);
//            xobj.send(null);
//        }, 5000)
        $.get('Servlet30',{
            
        }, function(response) {
            console.log(response);
            callback(response);
        });
}
var schemaId;
function postMarks() {
    
    var programKey = document.getElementById('program1').value;
    $.get('Servlet11', {
        regulation: 'R13', program_key: programKey
    }, function(response) {
        globalCourseOutcomes = response;
    });
    var assesmentMethod;
    if(document.getElementById('assesmentType').value == 'test')
        assesmentMethod = '';
    else
        assesmentMethod = document.getElementById('assesmentMethod').value;
    $.get('Servlet18', {
        acad_year: document.getElementById('academicyear').value,
        program: document.getElementById('program1').value,
        branch: document.getElementById('branch').value,
        semester: document.getElementById('semester').value,
        sub_code: document.getElementById('sub_code').value,
        section: document.getElementById('section').value,
        assesment_type: document.getElementById('assesmentType').value,
        assesment_number: document.getElementById('assesmentNumber').value,
        assesment_method: assesmentMethod,
        fac_id: document.getElementById('facid').value
    }, function(response) {
        console.log(response);
        schemaId = response;
        sendSchemaId(schemaId);
    });
    
}