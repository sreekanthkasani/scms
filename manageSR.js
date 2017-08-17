/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/*------------Validation Function-----------------*/
var count = 0; // To count blank fields.
function validation(event) {
var radio_check = document.getElementsByName('gender'); // Fetching radio button by name.
var input_field = document.getElementsByClassName('text_field'); // Fetching all inputs with same class name text_field and an html tag textarea.
var text_area = document.getElementsByTagName('textarea');
// Validating radio button.
if (radio_check[0].checked == false && radio_check[1].checked == false) {
var y = 0;
} else {
var y = 1;
}
// For loop to count blank inputs.
for (var i = input_field.length; i > count; i--) {
if (input_field[i - 1].value == '' || text_area.value == '') {
count = count + 1;
} else {
count = 0;
}
}
if (count != 0 || y == 0) {
alert("*All Fields are mandatory*"); // Notifying validation
event.preventDefault();
} else {
return true;
}
}
/*---------------------------------------------------------*/
// Function that executes on click of first next button.
function next_step1() {
document.getElementById("first").style.display = "none";
document.getElementById("second").style.display = "block";
document.getElementById("active2").style.color = "red";
}
// Function that executes on click of first previous button.
function prev_step1() {
document.getElementById("first").style.display = "block";
document.getElementById("second").style.display = "none";
document.getElementById("active1").style.color = "red";
document.getElementById("active2").style.color = "gray";
}
// Function that executes on click of second next button.
function next_step2() {
document.getElementById("second").style.display = "none";
document.getElementById("third").style.display = "block";
document.getElementById("active3").style.color = "red";
}
// Function that executes on click of second previous button.
function prev_step2() {
document.getElementById("third").style.display = "none";
document.getElementById("second").style.display = "block";
document.getElementById("active2").style.color = "red";
document.getElementById("active3").style.color = "gray";
}

function next_step3() {
document.getElementById("third").style.display = "none";
document.getElementById("fourth").style.display = "block";
document.getElementById("active4").style.color = "red";
}

function prev_step3() {
document.getElementById("fourth").style.display = "none";
document.getElementById("third").style.display = "block";
document.getElementById("active3").style.color = "red";
document.getElementById("active4").style.color = "gray";
}

function next_step4() {
document.getElementById("fourth").style.display = "none";
document.getElementById("fifth").style.display = "block";
document.getElementById("active5").style.color = "red";
}

function prev_step4() {
document.getElementById("fifth").style.display = "none";
document.getElementById("fourth").style.display = "block";
document.getElementById("active4").style.color = "red";
document.getElementById("active5").style.color = "gray";
}

function next_step5() {
document.getElementById("fifth").style.display = "none";
document.getElementById("sixth").style.display = "block";
document.getElementById("active6").style.color = "red";
}

function prev_step5() {
document.getElementById("sixth").style.display = "none";
document.getElementById("fifth").style.display = "block";
document.getElementById("active5").style.color = "red";
document.getElementById("active6").style.color = "gray";
}

function next_step6() {
document.getElementById("sixth").style.display = "none";
document.getElementById("seven").style.display = "block";
document.getElementById("active7").style.color = "red";
}

function prev_step6() {
document.getElementById("seven").style.display = "none";
document.getElementById("sixth").style.display = "block";
document.getElementById("active6").style.color = "red";
document.getElementById("active7").style.color = "gray";
}




