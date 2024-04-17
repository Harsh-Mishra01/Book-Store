<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Setting page</title>
<%@include file="all_component/allcss.jsp" %>

<style type="text/css">
a{
text-decoration :none;
color : black;
}
a:hover {
text-decoration :none;
}

</style>

</head>
<body style="background-color: #f2f0f0;">
<c:if test="${empty userob }">
<c:redirect url="login.jsp"></c:redirect>

</c:if>
<%@include file="all_component/navbar.jsp" %>
<div class="container-fluid ">
<h1 class="text-center ">Hello, ${userob.name} </h1>

<div class="row px-5 mt-5">
<div class="col-md-4">
<a href="selbooks.jsp">
<div class=" card">
<div class="card-body text-center">
<i class="fa-solid fa-book-open fa-4x text-primary"></i>
<h3>Sell Books</h3>
</div>
</div>
</a>
</div>

<div class="col-md-4">
<a href="oldbooklist?uemail=${userob.email}">
<div class=" card">
<div class="card-body text-center">
<i class="fa-solid fa-book fa-4x text-primary"></i>
<h3>Old Books</h3>
</div>
</div>
</a>
</div>

<div class="col-md-4 " >
<a href="#">
<div class=" card">
<div class="card-body text-center">
<i class="fa-regular fa-id-card fa-4x text-info"></i>
<h3>Login & Security(Edit Profile)</h3>
</div>
</div>
</a>
</div>
</div>


<div class="row px-5 pt-4">
<div class="col-md-4 ">
<a href="location.jsp">
<div class="card">
<div class="card-body  text-center">
<i class="fa-solid fa-location-dot fa-4x text-danger "></i>
<h2>Address</h2>
<p>Edit Address</p>
</div>
</div>
</a>
</div>

<div class="col-md-4 ">
<a href="myorder.jsp">
<div class="card  text-center">
<div class="card-body">
<i class="fa-solid fa-box-open fa-4x text-warning"></i>
<h2>My Orders</h2>
<p>Track Your Orders</p>
</div>
</div>
</a>
</div>

<div class="col-md-4 ">
<a href="help.jsp">
<div class="card">
<div class="card-body  text-center">
<i class="fa-solid fa-user fa-4x text-primary"></i>
<h2>Help</h2>
<p>24X7 Available</p>
</div>
</div>
</a>
</div>

</div>
</div>

<div style="margin-top: 10%;">
		<%@ include file="all_component/footer.jsp"%>
	</div>
</body>
</html>