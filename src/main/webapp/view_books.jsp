<%@page import="com.entity.User"%>
<%@page import="com.entity.book_dtls"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.DAO.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Books</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body style="background-color: #f2f0f0;">
	<%@include file="all_component/navbar.jsp"%>
	<%
	User u = (User) session.getAttribute("userob");
	%>

	<%
	int id = Integer.parseInt(request.getParameter("id"));
	BookDaoImpl bdi = new BookDaoImpl(DBconnect.getConn());
	book_dtls b = bdi.bookEdit(id);
	%>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-6 text-center">
				<div class="card m-3 bg-white">
					<div class="card-body">
						<img src="book/<%=b.getFis()%>" width="200px" height="300px">
					</div>
					<div class=" card-footer">
						<h4>
							Author : <span class="text-success"><%=b.getAuthor()%></span>
						</h4>
						<h4>
							Category :<span class="text-success"><%=b.getBookCatagory()%></span>
						</h4>
						<h4>
							Price : <span class="text-success"><%=b.getPrice()%></span>
						</h4>
					</div>
				</div>
			</div>
			<div class="col-md-6 text-center ">

				<h1 class="mt-5 mb-2"><%=b.getBookName()%></h1>
				<div class="mb-5 text-primary">
					<%
					if ("old".equals(b.getBookCatagory())) {
					%>
					<h6>
						Contact to Seller :<br><i class="fa-solid fa-envelope"></i>    <%=b.getEmail() %>
					</h6>
					<%
					}
					%>
				</div>

				<div class="row">
					<div class="col-md-4 text-danger">
						<i class="fa-solid fa-wallet fa-3x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger">
						<i class="fa-solid fa-rotate-left fa-3x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-danger mb-5">
						<i class="fa-solid fa-truck fa-3x"></i>
						<p>Fast Delivery</p>
					</div>


				</div>
				<%
				if ("old".equals(b.getBookCatagory())) {
				%>
				<a href="index.jsp" class="btn btn-success"><i
					class="fa-solid fa-cart-plus"></i> Continue Shopping</a> <a href=""
					class="btn btn-danger"><i class="fa-solid fa-indian-rupee-sign"></i><%=b.getPrice()%></a>

				<%
				} else {
				%>

				<%
				if (u == null) {
				%>
				<a href="login.jsp" class="btn btn-primary  ml-2"><i
					class="fa-solid fa-cart-plus"></i> Add Cart</a>
				<%
				} else {
				%>
				<a href="cart?bid=<%=b.getBookid()%>&&uid=<%=u.getId()%>"
					class="btn btn-primary  ml-2"><i
					class="fa-solid fa-cart-plus"></i> Add Cart</a>
				<%
				}
				%>
				<a href="" class="btn btn-danger"><i
					class="fa-solid fa-indian-rupee-sign"></i>2000</a>

				<%
				}
				%>


			</div>
		</div>

	</div>

</body>
</html>