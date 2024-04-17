<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell Books</title>
<%@include file="all_component/allcss.jsp" %>
</head>
<body>
<%@include file="all_component/navbar.jsp" %>

<c:if test="${not empty successmsg }">
<div class="alert bg-success text-center"> <p><c:out value="${successmsg}"/></p></div>
<c:remove var="successmsg" scope="session"/>
</c:if>

<% User u =(User)session.getAttribute("userob"); %>

<div  class="continer-fluid">
 <div class="row">
 <div class="col-md-4 offset-md-4">
 <div class="card m-4">
  <div class="card-header text-center"><h1>Sell Book</h1>
  
  </div> 
   
   
  <div class="card-body">
  <form action="sell" method="post" enctype="multipart/form-data">
  <input type="hidden" name="user" value="<%=u.getEmail() %>">
  <div class="form-group">
  
    <label for="exampleInputEmail1">Book Name</label>
    <input type="text"  required="required" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="bname">
  </div>
  
  <div class="form-group">
    <label for="exampleInputEmail1">Author Name</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"  required="required"   name="author">
  </div>
  
  <div class="form-group">
    <label for="exampleInputEmail1">Price</label>
    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"   name="price">
  </div>
 <div class="form-group">
 <label for="choose">Upload Image</label>
 <input id="choose" class="form-cantrol" type="file" name="bimg">
 </div>
 
  <button type="submit" class="btn btn-primary w-100">Sell Book</button>
</form>
  </div>
 </div>
 </div>
 </div>

</div>

<div style="margin-top: 10%;">
		<%@ include file="all_component/footer.jsp"%>
	</div>


</body>
</html>