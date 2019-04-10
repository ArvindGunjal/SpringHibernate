<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
   margin: auto;
    border:1px solid black;
    border-radius: 10px;
    padding: 2%;
    text-align: center;
    max-width: 50%;
    margin-top: 5%;
}

* {
  box-sizing: border-box;
}

/* Add padding to containers */
.container {
  padding: 16px;
  background-color: white;
}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}

/* Overwrite default styles of hr */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

/* Set a style for the submit button */
.loginbtn {
  background-color: #e56616;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.loginbtn:hover {
  opacity: 1;
}

/* Add a blue text color to links */
a {
  color: dodgerblue;
}

/* Set a grey background color and center the text of the "sign in" section */
.signin {
  background-color: #f1f1f1;
  text-align: center;
}
</style>
<script>
function validate()
{
	  
	  if(document.myform.email.value == "" || document.myform.password.value == ""){
		  
	
		  alert("Email and Password Must Have some Value");
	  }
	  
	  if(document.myform.email.value != "")
		  {
		  var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
		  if(reg.test(document.myform.email.value)==false)
			  {
			  alert("Please Enter Email In valid Form");
			  }
		  
		  
		  }

}

</script>

</head>
<body>

<h2><center>Login Form</center></h2>
<form action="/springhibernate/userloginform" method="POST" onsubmit="validate()" name="myform">
  <div class="container">
    
    <hr>

    <label for="email"><b>Email</b></label>
    <input type="text" placeholder="Enter Email" name="email" required>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="password" required>

   
    <hr>
   

    <button type="submit" class="loginbtn">Login</button>
 
    <a href="/springhibernate/registrationpage">Not Registered? </a>
   <strong>${message}</strong>
   
 
  </div>
  

</form>

</body>
</html>