var schema = {};
var alphabets = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
function validateBitsFields() {
    var regexp = /^\S*$/;
    var err = 0;
    if(regexp.test(document.getElementById('schemaName').value)) {
        err = 0;
    }
    else {
        alert('Schema name should not have spaces');
        err = 1;
    }
    schema.sections = "3";
    schema.totalMarks = "30";
    schema.assesmentType = "mid";
    schema.assesmentNumber = "1";
    schema.schemaName = document.getElementById('schemaName').value;
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
    if(err == 0)
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
                var bitTreshold = (aTemp / bTemp) - cTemp + 1;
                document.getElementById('errorB'+i+'.'+j+'.'+k).innerHTML = '';
                var bitValue = parseInt(document.getElementById('bit'+i+'.'+j+'.'+k).value);
                schema['section'+i]['question'+j]['bit'+k] = bitValue;
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
        var schObj = schema;
        schObj.facid = document.getElementById('facid').value;
        console.log(schObj);
        schObj = JSON.stringify(schObj);
        $.get('NewServlet', {
            schemaObject : schObj,
            }, function(responseText) {
                
        });
        alert('Everything went fine. :-)');	
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
        document.getElementById('bitMarksAllocationDiv').style.display = "block";
    }
    bitMarksAllocation();
}