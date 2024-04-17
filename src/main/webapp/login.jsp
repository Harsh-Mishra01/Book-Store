<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EBook : login</title>
<%@include file="all_component/allcss.jsp"  %>
<style type="text/css">
body {
  margin :0px;
  padding :0px;
  box-sizing : border-box;
        background-color: #f2f0f0;
}
</style>
</head>
<body style="background-color: #f2f0f0;">
<%@include file="all_component/navbar.jsp"  %>
<div class="contrainer-fluid mt-5">
 <div class="row">
 <div class="col-md-4 offset-md-4">
 <div class="card m-4 ">
  <div class="card-header text-center"><h1>Login</h1>
  <c:if test="${not empty notlogin}" >
  <p class="text-danger"><c:out value="${notlogin}" /><p>
  <c:remove var="notlogin" scope="session"/>
  </c:if>
  
   <c:if test="${not empty lgoutmsg}" >
  <p class="text-success"><c:out value="${lgoutmsg}" /><p>
  <c:remove var="lgoutmsg" scope="session"/>
  </c:if>
  
  </div> 
  <div class="card-body">
  <form action="log" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required ="required" name="email">
  </div>
  
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required ="required" name="password">
  </div>
  <div class="text-center ">
  <button type="submit" class="btn btn-primary">Login</button><br>
  <a href = "Register.jsp"> Create a New Account</a>
  </div>
</form>
  </div>
 </div>
 </div>
 </div>
 
</div>
<div style=" margin-top : 10%;">
	<%@ include file="../all_component/footer.jsp" %>
	</div>
</body>
</html>