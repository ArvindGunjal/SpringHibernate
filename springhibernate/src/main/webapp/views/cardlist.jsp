<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
<style>
* {
  box-sizing: border-box;
}

body {

  padding: 20px;
  font-family: Arial;
}

/* Center website */
.main {
  max-width: 1000px;
  margin: auto;
}

h1 {
  font-size: 50px;
  word-break: break-all;
}

.row {
  margin: 10px -16px;
  height: 190px;
  width: 110%;
}

/* Add padding BETWEEN each column */
.row,
.row > .column {
  padding: 8px;
}

/* Create three equal columns that floats next to each other */
.column {
  float: left;
  width: 33.33%;
  display: none; /* Hide all elements by default */
}

/* Clear floats after rows */ 
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Content */
.content {
  background-color: white;
  padding: 10px;
  align-content: center;
  border-style:groove;
   box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  min-height: 150%;
  max-height: 150%;
}

/* The "show" class is added to the filtered elements */
.show {
  display: block;
}

/* Style the buttons */
.btn {
  border: none;
  outline: none;
  padding: 12px 16px;
  background-color: white;
  cursor: pointer;
}

.btn:hover {
  background-color: #ddd;
}

.btn.active {
  background-color: #666;
  color: white;
}
.btn1 {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
  font-size: 18px;

}

</style>

<script>
filterSelection("all")
function filterSelection(c) {
  var x, i;
  x = document.getElementsByClassName("column");
  if (c == "all") c = "";
  for (i = 0; i < x.length; i++) {
    w3RemoveClass(x[i], "show");
    if (x[i].className.indexOf(c) > -1) w3AddClass(x[i], "show");
  }
}

function w3AddClass(element, name) {
  var i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    if (arr1.indexOf(arr2[i]) == -1) {element.className += " " + arr2[i];}
  }
}

function w3RemoveClass(element, name) {
  var i, arr1, arr2;
  arr1 = element.className.split(" ");
  arr2 = name.split(" ");
  for (i = 0; i < arr2.length; i++) {
    while (arr1.indexOf(arr2[i]) > -1) {
      arr1.splice(arr1.indexOf(arr2[i]), 1);     
    }
  }
  element.className = arr1.join(" ");
}


// Add active class to the current button (highlight it)
var btnContainer = document.getElementById("myBtnContainer");
var btns = btnContainer.getElementsByClassName("btn");
for (var i = 0; i < btns.length; i++) {
  btns[i].addEventListener("click", function(){
    var current = document.getElementsByClassName("active");
    current[0].className = current[0].className.replace(" active", "");
    this.className += " active";
  });
}
</script>
</head>

<body>

<div class="main">


<div id="myBtnContainer">
  <button class="btn active" onclick="filterSelection('all')"> Show All</button>
  <button class="btn" onclick="filterSelection('A')"> Section A</button>
  <button class="btn" onclick="filterSelection('B')"> Section B</button>
  <button class="btn" onclick="filterSelection('C')"> Section C</button>
</div>

<!-- Portfolio Gallery Grid -->
<div class="row">
  <div class="column A">
    <div class="content" style="text-align: center;"> 
       <img src="/springhibernate/card_Images/sectionA1" alt="A" style="width:50%">	<!-- Reference Link https://www.w3schools.com/howto/tryit.asp?filename=tryhow_css_cards --> 
     <p><br><br><button class="btn1">Add to Cart</button></p>
    </div>
  </div>
  <div class="column A">
    <div class="content" style="text-align: center;">
    <img src="/springhibernate/card_Images/sectionA2" alt="A" style="width:50%">
       <p><br><br><button class="btn1">Add to Cart</button></p>
    </div>
  </div>
  <div class="column A">
    <div class="content" style="text-align: center;">
    <img src="/springhibernate/card_Images/sectionA3" alt="A" style="width:50%">
      <p><br><br><button class="btn1">Add to Cart</button></p>
    </div>
  </div>
    <div class="column A">
    <div class="content" style="text-align: center;">
    <img src="/springhibernate/card_Images/sectionA4" alt="A" style="width:50%">
      <p><br><br><button class="btn1">Add to Cart</button></p>
    </div>
  </div>
  <div class="column B">
    <div class="content" style="text-align: center;">
      <img src="/springhibernate/card_Images/sectionA1" alt="B" style="width:50%">
      <p><br><br><button class="btn1">Add to Cart</button></p>
    </div>
  </div>
  <div class="column B">
    <div class="content" style="text-align: center;">
    <img src="/springhibernate/card_Images/sectionB2" alt="B" style="width:50%">
      <p><br><br><button class="btn1">Add to Cart</button></p>
    </div>
  </div>
  <div class="column B">
    <div class="content" style="text-align: center;">
    <img src="/springhibernate/card_Images/sectionB3" alt="B" style="width:50%">
      <p><br><br><button class="btn1">Add to Cart</button></p>
    </div>
  </div>

  <div class="column C">
    <div class="content" style="text-align: center;">
      <img src="/springhibernate/card_Images/sectionC1" alt="C" style="width:50%">
       <p><br><br><button class="btn1">Add to Cart</button></p>
    </div>
  </div>
  <div class="column C">
    <div class="content" style="text-align: center;">
    <img src="/springhibernate/card_Images/sectionC2" alt="C" style="width:50%">
      <p><br><br><button class="btn1">Add to Cart</button></p>
    </div>
  </div>
  <div class="column C">
    <div class="content" style="text-align: center;">
    <img src="/springhibernate/card_Images/sectionA1" alt="C" style="width:50%">
       <p><br><br><button class="btn1">Add to Cart</button></p>
    </div>
  </div>
<!-- END GRID -->
</div>

<!-- END MAIN -->
</div>

</body>
</html>