<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin :home</title>
<%@ include file="allcss.jsp"%>
<style type="text/css">
body{
background-color: #f2f0f0;
}
a {
	text-decoration: none;
	color: black;
}

a:hover{
	text-decoration: none;
	color: black;
}
.card-hover:hover{
	background-color: #d4d2d2;

}
</style >
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
	<c:redirect url="../login.jsp"/>
	</c:if>
	<div class="container-fluid">
		<h1 class="mt-3 text-center">Hello, Admin</h1>
		
		<div class="row p-3 mt-lg-5">
			<div class="col-md-3 ">
				<a href="add_books.jsp">
				<div class="card ">
					<div class="card-body text-center card-hover">
						<i class="fa-solid fa-square-plus fa-3x text-primary pb-4"></i>
						<h2>Add Books</h2>
						-----------
					</div>
				</div>
				</a>
			</div>

			<div class="col-md-3">
			
				<a href="all_books.jsp">
					<div class="card">
						<div class="card-body text-center card-hover">
							<i class="fa-solid fa-book-open  fa-3x text-danger pb-4"></i></i>
							<h2>All Books</h2>
							-----------
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3 ad">
				<a href="orders.jsp">
					<div class="card">
						<div class="card-body text-center card-hover">
							<i class="fa-solid fa-box-open  fa-3x text-warning pb-4"></i></i>
							<h2>Order</h2>
							-----------
						</div>
					</div>
				</a>
			</div>

			<div class="col-md-3 ad">
				<a href="logout" data-toggle="modal"
					data-target="#exampleModalCenter">
					<div class="card">
						<div class="card-body text-center card-hover">
							<i class="fa-solid fa-right-from-bracket  fa-3x text-primary pb-4"></i>
							<h2>Logout</h2>
							-----------
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
	
	<!-- modal -->
	
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
			<div class ="text-center"><h4>Do you want to log out?</h4>
			<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<a class="btn btn-danger " href="../logout" type="button">Logout
			</a></div>
			</div>
			<div class="modal-footer">
				
				
			</div>
		</div>
	</div>
</div>
	
	<!-- modal -->

	<div style=" margin-top : 10%;">
	<%@ include file="../all_component/footer.jsp" %>
	</div>
</body>
</html>