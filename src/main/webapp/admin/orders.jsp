<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin :order</title>
<%@include file="allcss.jsp" %>
</head>
<body>
<%@ include file="navbar.jsp" %>

<c:if test="${empty userobj }">
	<c:redirect url="../login.jsp"/>
	</c:if>

<h1 class="text-center m-4">Orders</h1>

<div class="container-fluid">
		<table class="table table-bordered">
			<thead class="bg-dark text-white">
				<tr>
					<th scope="col">Order ID</th>
					<th scope="col">Name</th>
					<th scope="col">Email</th>
					<th scope="col">Address</th>
					<th scope="col">Phone No</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td>Mark</td>
					<td>Otto</td>
					<td>@mdo</td>
					<td>Mark</td>
					<td>Otto</td>
					<td>@mdo</td>
					<td>Mark</td>
					<td>Otto</td>
					

				</tr>
				<tr>
					<th scope="row">2</th>
					<td>Jacob</td>
					<td>Thornton</td>
					<td>@fat</td>
					<td>Jacob</td>
					<td>Thornton</td>
					<td>@mdo</td>
					<td>Mark</td>
					<td>Otto</td>


				</tr>
				<tr>
					<th scope="row">3</th>
					<td>Larry</td>
					<td>the Bird</td>
					<td>@twitter</td>
					<td>Jacob</td>
					<td>Thornton</td>
					<td>@mdo</td>
					<td>Mark</td>
					<td>Otto</td>

				</tr>
			</tbody>
		</table>
	</div>
	

</body>
</html>