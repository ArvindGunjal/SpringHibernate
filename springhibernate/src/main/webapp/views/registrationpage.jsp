<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
.registerbtn {
  background-color: #e56616;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

.registerbtn:hover {
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
function validate(){
	if(document.myform.email.value == "" || document.myform.password.value == "" || document.myform.password-repeat.value ==""){
		  
		
		  alert("Email, Password, Repeat Password Must Have some Value");
	  }
	  
	  if(document.myform.password.value != "" || document.myform.password-repeat.value != "")
		  {
		  var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
		  if(reg.test(document.myform.email.value)==false || reg.test(document.myform.password-repeat.value)== false)
			  {
			  alert("Please Enter Email In valid Form");
			  }		  
		  }
	  
	  if(document.myform.password.value != document.myform.password-repeat.value)
		  {
		  alert("Repeated Password Not matched");
		  }
}

</script>

</head>
<body>

<form action="/springhibernate/registration" method="POST" onsubmit="validate()" name="myform" enctype="multipart/form-data">
  <div class="container">
    <h1>Register</h1>
    <p>Please fill in this form to create an account.</p>
    <hr>

    <label for="email"><b>Email</b></label>
    <input type="text" placeholder="Enter Email" name="email" required>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="password" required>

    <label for="psw-repeat"><b>Repeat Password</b></label>
    <input type="password" placeholder="Repeat Password" name="password-repeat" required>
    <hr>
   
   
 <div class="file-field">
    <div class="btn btn-primary btn-sm float-left">
      <span>Select Your Profile Image:</span>
     <input type="file" name="fileToUpload" id="fileToUpload">
    </div>	

  </div>

    <button type="submit" class="registerbtn">Register</button>
  </div>
  
  <div class="container signin">
    <p>Already have an account? <a href="/springhibernate/welcome">Sign in</a>.</p>
  </div>
</form>

</body>
</html>