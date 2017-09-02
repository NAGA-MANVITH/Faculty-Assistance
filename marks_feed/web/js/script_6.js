function courseEndSurvey() {
    var sub_code = globalSubCode;
    var flag = 0;
    for(var i = 1; i<= 5; i++){
        var courseEndValues = document.getElementsByName(sub_code+"co"+i);
        console.log(courseEndValues);
        for(var j = 0; j < 5; j++){
            if(courseEndValues[j].checked){
                flag += 1;
                break;
            }
        }            
    }
    if(flag != 5){
        alert("Please fill all the questios in survey form");
        return "false";
    }        
    else{
        $.get('Servlet29', {
            reg_no: document.getElementById('reg_no').value,
            sub_code: sub_code,
            co1: document.querySelector('input[name="'+sub_code+'co1"]:checked').value,
            co2: document.querySelector('input[name="'+sub_code+'co2"]:checked').value,
            co3: document.querySelector('input[name="'+sub_code+'co3"]:checked').value,
            co4: document.querySelector('input[name="'+sub_code+'co4"]:checked').value,
            co5: document.querySelector('input[name="'+sub_code+'co5"]:checked').value,
            acad_year: document.getElementById('academicyear').value,
            semester: document.getElementById('semester').value,
            faculty: document.getElementById('nameTemp' + sub_code).innerHTML
        }, function(response) {
            console.log(response);
        });
    }
    
    
}

function saveFeedback(rating) {
     var status = courseEndSurvey();
     if(status != "false") {
        var sub_code = globalSubCode;
        var q1 = document.querySelector('input[name="optradio0'+sub_code+'"]:checked').value;
        var q2 = document.querySelector('input[name="optradio1'+sub_code+'"]:checked').value;
        var q3 = document.querySelector('input[name="optradio2'+sub_code+'"]:checked').value;
        var q4 = document.querySelector('input[name="optradio3'+sub_code+'"]:checked').value;
        var q5 = document.querySelector('input[name="optradio4'+sub_code+'"]:checked').value;
        var q6 = document.querySelector('input[name="optradio5'+sub_code+'"]:checked').value;
        var q7 = document.querySelector('input[name="optradio6'+sub_code+'"]:checked').value;
        var q8 = document.querySelector('input[name="optradio7'+sub_code+'"]:checked').value;
        var q9 = document.querySelector('input[name="optradio8'+sub_code+'"]:checked').value;
        var q10 = document.querySelector('input[name="optradio9'+sub_code+'"]:checked').value;
        var q11 = document.querySelector('input[name="optradio10'+sub_code+'"]:checked').value;
        var q12 = document.querySelector('input[name="optradio11'+sub_code+'"]:checked').value;
        var q13 = document.querySelector('input[name="optradio12'+sub_code+'"]:checked').value;
        var q14 = document.querySelector('input[name="optradio13'+sub_code+'"]:checked').value;
        var q15 = document.querySelector('input[name="optradio14'+sub_code+'"]:checked').value;
        var faculty = document.getElementById('nameTemp' + sub_code).innerHTML;
        console.log(faculty);
        var comment = document.getElementById('comment'+sub_code).value;
        var semester = document.getElementById('semester').value;
        var reg_no = document.getElementById('reg_no').value;
        var acad_year = document.getElementById('academicyear').value;
        rating = document.getElementsByName('rating'+sub_code);
        var ratingValue;
        for(var i = 0; i < 5; i++) {
            if(rating[i].checked == true) {
                ratingValue = rating[i].value;
            }
        }
        console.log(ratingValue);
        $.get('Servlet25', {
            acad_year: acad_year,
            semester: semester,
            reg_no: reg_no,
            q1: q1,
            q2: q2,
            q3: q3,
            q4: q4,
            q5: q5,
            q6: q6,
            q7: q7,
            q8: q8,
            q9: q9,
            q10: q10,
            q11: q11,
            q12: q12,
            q13: q13,
            q14: q14,
            q15: q15,
            faculty: faculty,
            rating: ratingValue,
            comment: comment,
            sub_code: globalSubCode,
            feedback_no: document.getElementById('feedbackNo').value
        }, function(response) {
            console.log(response);
            alert('Feedback for '+sub_code+' is submitted. Thank You');
            $('#li'+sub_code).removeClass("active");
            $('#li'+sub_code).addClass("disabled");
            $('#li'+sub_code).attr("disabled", true);
            //document.getElementById(sub_code).style.display = 'none';
            document.getElementById(sub_code).innerHTML = 'Already Submitted';
            console.log(arrayTemp);
            var length = arrayTemp.length;
            arrayTemp[length] = sub_code;
            courseEndSurvey();
        });
     }     
 }
 
 
 function valid()
  {
  	var h=validate();
  	if(h==true)
  		{
                saveFeedback('temp');
  		//document.getElementById('id01').style.display='block';
  		}
  	else
  		{
  		alert("please fill all");
  		return false;
  		} 
  } 
function validate(sub_code1){
    var sub_code = globalSubCode;
    console.log(sub_code);
    if(ratevalid() == true)
    {
        if (checkRadio("optradio0"+sub_code) && checkRadio("optradio1"+sub_code)&& checkRadio("optradio2"+sub_code)&& checkRadio("optradio3"+sub_code)&& checkRadio("optradio4"+sub_code)&& checkRadio("optradio5"+sub_code)&& checkRadio("optradio6"+sub_code)&& checkRadio("optradio7"+sub_code)&& checkRadio("optradio8"+sub_code)&& checkRadio("optradio9"+sub_code)&& checkRadio("optradio10"+sub_code)&& checkRadio("optradio11"+sub_code)&& checkRadio("optradio12"+sub_code)&& checkRadio("optradio13"+sub_code)&& checkRadio("optradio14"+sub_code)){
        return true;
  }
        
    }
  
  else{
     return false;
  } 
}

    function checkRadio(name){
        
      var radio = document.getElementsByName(name);
      for (var i=0;i<5;i++)
      {
        if(radio[i].checked)
        {
          return true;
        }
      }
      return false;
    }
    function ratevalid()
    {
        var i;
        var sub_code = globalSubCode;
        var rate=document.getElementsByName("rating"+''+sub_code);
        for(i = 0; i < 5; i++) {
            console.log(rate[i]);
            if(rate[i].checked==true) {
                return true;
            }
        }
        if(i == 5) {
            alert("fill rating");
            return false;
        }
    }
        function rate(name)
        {
            
            document.getElementById('star_display').innerHTML=name;
        }
        function disable()
        {
            document.getElementById('star_display').innerHTML='';
        }
        /* 
            
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


