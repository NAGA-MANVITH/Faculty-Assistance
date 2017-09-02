var myGlobalVariable;
var globalSubCode;
var arrayTemp = [];
var subjectsArray;
function putSubCode(sub_code) {
    globalSubCode = sub_code;
    //document.getElementById("facultyDetails"+sub_code);
    var divs = document.getElementById(sub_code).getElementsByTagName("div");
    console.log(document.getElementById(sub_code));
    if(divs.length != 0) {
        divs[divs.length - 1].id = sub_code + 'courseEndSurvey';
        var submitButton = document.getElementById(sub_code).getElementsByTagName("button")[0];
        submitButton.id = sub_code + 'submitButton';
    }
    if(feedbackNumber == 1) {
        document.getElementById(sub_code + 'submitButton').style.display = 'block';
        document.getElementById(sub_code + 'courseEndSurvey').style.display = 'none';
    }
    var feedbackNumber = document.getElementById('feedbackNo').value;
    if(feedbackNumber == 2) {
        var submitButton = document.getElementById(sub_code).getElementsByTagName("button")[0];
        submitButton.id = sub_code + 'submitButton';
        document.getElementById(sub_code + 'submitButton').style.display = 'none';
        var table = '';
        $.get('Servlet28', {
            reg_no: document.getElementById('reg_no').value,
            sub_code: sub_code
        }, function(response) {
            console.log(response);
            table += '<h2>Course End Survey</h2>';
            for(var i = 1; i <= 5; i++) {
                table += '<div class="container"><div class="panel panel-default box"><div class="panel-body"><span class="question">' + response['co' + i] + '<div class="container-fluid radioDiv"><label class="yesLabel"><input type="radio" name="' + sub_code + 'co' + i + '" class="form-control yes" value="5">EXCELLENT</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label class="noLabel"><input type="radio" name="' + sub_code + 'co' + i + '" class="form-control no" value="4">VERYGOOD</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label class="yesLabel"><input type="radio" name="' + sub_code + 'co' + i + '" class="form-control yes" value="3">GOOD</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label class="noLabel"><input type="radio" name="' + sub_code + 'co' + i + '" class="form-control no" value="2">AVERAGE</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label class="noLabel"><input type="radio" name="' + sub_code + 'co' + i + '" class="form-control no" value="1">POOR</label></div></div></div></div>';
            }
            table += '<div class="container"><div class="row"><div class="col-md-3"><button class="btn btn-primary" onclick="valid();">Submit</button></div></div></div>';
            document.getElementById(sub_code + 'courseEndSurvey').innerHTML = table;
        });
        
    }
    document.getElementById('feedbackBody').style.display = 'block';
    globalSubCode = sub_code;
    var elm = {};
    var elms = document.getElementById(sub_code).getElementsByTagName("input");
    var j = 0;
    var i;
    console.log(elms.length);
    if($.inArray(sub_code, arrayTemp) >= 0) {
        
    }
    else {
        var d_ = document.getElementById(sub_code).getElementsByTagName("div");
        d_[0].id = "facultyDetails"+sub_code;
        //console.log(d_);
        //document.getElementById("facultyDetails").id = "facultyDetails"+sub_code;
        for (i = 0; i < 75; i+=5, j++) {
            elms[i].name = 'optradio' + j + '' + sub_code;
            elms[i + 1].name = 'optradio' + j + '' + sub_code;
            elms[i + 2].name = 'optradio' + j + '' + sub_code;
            elms[i + 3].name = 'optradio' + j + '' + sub_code;
            elms[i + 4].name = 'optradio' + j + '' + sub_code;
        }
        var ids = ['star5','star4', 'star3', 'star2', 'star1']
        for(var k = i; k < 80; k++)
        {
            elms[k].name = 'rating' + '' + sub_code;
            elms[k].id = ids[k-30] + sub_code; 
        }
        var element = document.getElementById(sub_code).getElementsByTagName("textarea")[0];
        element.id = 'comment'+sub_code;
    }
    $.get('Servlet26', {
        acad_year: document.getElementById('academicyear').value,
        semester: document.getElementById('semester').value,
        sub_code: sub_code,
        reg_no: document.getElementById('reg_no').value
    }, function(response) {
        if(document.getElementById(sub_code).innerHTML != 'Already Submitted') {
            document.getElementById('facultyDetails'+sub_code).innerHTML = '<strong>You are giving feedback for :<p id="nameTemp">' + response +'</p></strong>';
        }
        var dummy = document.getElementById('facultyDetails'+sub_code).getElementsByTagName('p')[0];
        console.log(dummy);
        dummy.id = 'nameTemp' + sub_code;
    });
}

function generateFeedbackUI() {
    var colorsArray = ["#004D1A", "#003366", "#E65C00", "#E65C00", "#004D1A", "#003366", "#003366", "#E65C00", "#004D1A"];
    arrayTemp = [];
    var structureHead = '';
    var structureBody = '';
    var noOfSubjects = Object.keys(myGlobalVariable).length;
    var index_ = 1;
    var idx = 0;
    var temporaryVariable = 0;
    document.getElementById('feedbackBody').style.display = 'none';
    $.each(myGlobalVariable, function(index, value) {
        if(temporaryVariable > 8) {
            temporaryVariable -= 9;
        }
        var colorsArray = ["#004D1A", "#003366", "#E65C00", "#E65C00", "#004D1A", "#003366", "#003366", "#E65C00", "#004D1A"];
        var tempVariable = "putSubCode('" + index + "')";
        structureHead += '<li id="li' + index + '" class="" onclick="' + tempVariable + '"><a href="#' + index + '" style="color: ' + colorsArray[temporaryVariable] + '" data-toggle="tab">' + subjectsArray[index_ - 1] + '(' + index + ')</a></li>';
        structureBody += '<div class="tab-pane fade in active" id="' + index + '" name="feedbackFormPlace"></div>';
        index_ += 1;
        temporaryVariable += 1;
        if(value == 1) {
            arrayTemp[idx] = index;
            idx += 1;
        }
    });
    document.getElementById('feedbackHead').innerHTML = structureHead;
    document.getElementById('feedbackBody').innerHTML = structureBody;
    for(var i = 0; i < noOfSubjects; i++) {
        document.getElementsByName('feedbackFormPlace')[i].innerHTML = document.getElementById('feedBackUI').innerHTML;
    }
    for(var i = 0; i < idx; i++) {
        
        document.getElementById(arrayTemp[i]).innerHTML = 'Already Submitted';
    }
}
