<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page isELIgnored="false" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBook : Register</title>
<%@include file="all_component/allcss.jsp"  %>
<style type="text/css">
body {
        background-color: #f2f0f0;
}
</style>
</head>
<body style="background-color: #f2f0f0;">
<%@include file="all_component/navbar.jsp"  %>
<div class="contrainer-fluid">
 <div class="row">
 <div class="col-md-4 offset-md-4">
 <div class="card m-4">
  <div class="card-header text-center"><h1>Register</h1>
  
   <c:if test="${not empty success}"/>
     <p class="text-center text-success"><c:out value="${success}"/></p>
     <c:remove var="success" scope="session"/>
   
    <c:if test="${not empty failed}"/>
   <p class="text-center text-danger"><c:out value="${failed}"/></p>
        <c:remove var="failed" scope="session"/>
   
   
    <c:if test="${not empty uncheck}"/>
   <p class="text-center text-danger"><c:out value="${uncheck}"/></p>
        <c:remove var="uncheck" scope="session"/>
   
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
  <div class="form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1"  name="check">
    <label class="form-check-label" for="exampleCheck1">Accept Terms and Conditions</label>
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
  </div>
 </div>
 </div>
 </div>
 

 
</div>
</body>
</html>