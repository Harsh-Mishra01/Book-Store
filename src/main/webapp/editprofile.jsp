<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<%@include file="all_component/allcss.jsp"  %>

</head>
<body style="background-color: #f2f0f0;">
<%@include file="all_component/navbar.jsp" %>

<div class="contrainer-fluid">
 <div class="row">
 <div class="col-md-4 offset-md-4">
 <div class="card m-4">
  <div class="card-header text-center"><h1>Edit Profile</h1>
  
 
  </div> 
   
   
  <div class="card-body">
  <form action="register" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Full name</label>
    <input type="text"  required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter full name" name="fname">
  </div>
  
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"  required="required"  placeholder="Enter email" name="email">
  </div>
  
  <div class="form-group">
    <label for="exampleInputEmail1">Mobile number</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"   name="phno">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control"  required="required" id="exampleInputPassword1" placeholder="Password"  name="password" >
  </div>
  <div class="text-center">
  <button type="submit" class="btn btn-primary">Submit</button>
  
  </div>
</form>
  </div>
 </div>
 </div>
 </div>
 

 
</div>

</body>
</html>