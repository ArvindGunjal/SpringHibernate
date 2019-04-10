<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
  
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <style type="text/css">
.update-button{
	background-color: Transparent;
    background-repeat:no-repeat;
    border: none;
    cursor:pointer;
    overflow: hidden;
    outline:none;
}

  body {
      position: relative; 
  }
</style>
</head>
<body>



<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
   <img width="40" height="40" src="/springhibernate/getSiteLogo"></img>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#section1">Page 1-1</a></li>
          <li><a href="#section2">Page 1-2</a></li>
          <li><a href="#section3">Page 1-3</a></li>
          <li><a href="#section4">Page 1-4</a></li>
          <li><a href="#section5">Page 1-5</a></li>
        </ul>
      </li>
      <li><a href="#">Page 2</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
     <img src="/springhibernate/getProfile_Image" class="img-circle" alt="Cinque Terre" width="40" height="40"> 
      <li><a class="glyphicon glyphicon-user" type="button" data-toggle="dropdown">SuperUser
    <span class="caret"></span></a> <ul class="dropdown-menu">
      <li><a href="/springhibernate/adminloginpage">Admin</a></li>
     
    </ul></li>
      <li><a href="/springhibernate/welcome"><span class="glyphicon glyphicon-log-in"></span> Switch User</a></li>
    </ul>
  </div>
</nav>
