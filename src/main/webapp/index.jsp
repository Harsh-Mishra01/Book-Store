<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.DAO.BookDaoImpl"%>
<%@ page import="com.DB.DBconnect"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.book_dtls"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Index</title>
<%@include file="all_component/allcss.jsp"%>
<style type="text/css">
body {
	background-color: #f2f0f0;
}

.back-img {
	background:
		url("book/bookstore2.jpg");
	height: 40vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
	text-align: center;
}

.back-img h1 {
	padding-top: 10vh;
}

.card-hover:hover {
	background-color: #d4d2d2;
}
</style>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
     <% User u = (User)(session.getAttribute("userob")); %>
	
		 <div class="carousel slide" id="topBanner" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active" data-bs-interval="2500">
                        <img src="book/caraousel4.jpg" class="w-100 d-block" height="500px">
                    </div>
                    <div class="carousel-item" data-bs-interval="2500">
                        <img src="book/caraousel1.jpg" class="w-100 d-block" height="500px">
                    </div>
                    <div class="carousel-item" data-bs-interval="2500">
                        <img src="book/caraousel3.jpg" class="w-100 d-block" height="500px">
                    </div>
                </div>
            </div>
	

	<!-- recent book -->

	<div class="container-fluid  text-center p-3">
		<h3 class="text-center p-3 mb-4">
			<u>Recent Books</u>
		</h3>
		<div class="row">

			<%
			BookDaoImpl bdi1 = new BookDaoImpl(DBconnect.getConn());
			List<book_dtls> lbd1 = bdi1.addRecentBook();

			for (book_dtls b : lbd1) {
			%>

			<div class="col-md-3">
				<div class="card card-hover">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getFis()%>" width="200px"
							height="300px" class="img-thumblin">
						<p>
							<b><%=b.getBookName()%></b>
						</p>
						<p><%=b.getAuthor()%></p>
						<p>
							Category :<%=b.getBookCatagory()%></p>
						<%
						if ("new".equals(b.getBookCatagory())) {
						%>
					
							
							<% if(u==null)
								{
								%>
						<a  href="login.jsp" class="btn btn-primary btn-sm ml-2"><i class="fa-solid fa-cart-plus"></i> Add Cart</a>  
						<%}   else { %>
							<a href="cart?bid=<%= b.getBookid() %>&&uid=<%= u.getId() %>" class="btn btn-primary btn-sm ml-2"><i class="fa-solid fa-cart-plus"></i> Add Cart</a>
						<%} %>
						
						 <a href="view_books.jsp?id=<%=b.getBookid()%>"
							class="btn btn-success btn-sm ml-2">Details</a> <a href=""
							class="btn btn-primary btn-sm ml-2"><%=b.getPrice()%>/-</a>
						<%
						} else {
						%>
						<a class="btn btn-success btn-sm ml-2"  href="view_books.jsp?id=<%=b.getBookid()%>" >Details</a>
						 <a	class="btn btn-primary btn-sm ml-2"><i
							class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%>/-</a>
						<%
						}
						%>
					</div>
				</div>
			</div>
			<%
			}
			%>


		</div>
		<a href="allrecentbooks.jsp" class="btn btn-danger mt-3">View
			Details</a>
	</div>

	<!-- recent book -->
	<hr>
	<!--new  book start -->


	<div class="container-fluid  text-center p-3" id="newbook">
		<h3 class="text-center p-3 mb-4">
			<u>New Books</u>
		</h3>

		<div class="row ">
			<%
			BookDaoImpl bdi2 = new BookDaoImpl(DBconnect.getConn());
			List<book_dtls> lbd2 = bdi2.addNewBook();

			for (book_dtls b : lbd2) {
			%>
			<div class="col-md-3">
				<div class="card card-hover">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getFis()%>" width="200px"
							height="300px" class="img-thumblin">
						<p>
							<b><%=b.getBookName()%> </b>
						</p>
						<p><%=b.getAuthor()%></p>
						<p>
							Category :<%=b.getBookCatagory()%></p>
							
							<% if(u==null)
								{
								%>
						<a  href="login.jsp" class="btn btn-primary btn-sm ml-2"><i class="fa-solid fa-cart-plus"></i> Add Cart</a>  
						<%}   else { %>
							<a href="cart?bid=<%= b.getBookid() %>&&uid=<%= u.getId() %>" class="btn btn-primary btn-sm ml-2"><i class="fa-solid fa-cart-plus"></i> Add Cart</a>
						<%} %>
							<a href="view_books.jsp?id=<%=b.getBookid()%>" class="btn btn-success btn-sm ml-2">Details</a> <a href=""
							class="btn btn-primary btn-sm ml-2"><i
							class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%>/-</a>
					</div>
				</div>
			</div>

			<%
			}
			%>


		</div>
		<a href="allnewbooks.jsp" class="btn btn-danger mt-3">View Details</a>
	</div>
	<!-- new book end -->

	<hr>

	<!-- old book start -->

	<div class="container-fluid  text-center p-3">
		<h3 class="text-center p-3 mb-4">
			<u>Old Books</u>
		</h3>
		<div class="row">

			<%
			BookDaoImpl bdi3 = new BookDaoImpl(DBconnect.getConn());
			List<book_dtls> lbd3 = bdi3.addOldBook();

			for (book_dtls b : lbd3) {
			%>

			<div class="col-md-3">
				<div class="card card-hover">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getFis()%>" width="200px"
							height="300px" class="img-thumblin">
						<p>
							<b><%=b.getBookName()%></b>
						</p>
						<p><%=b.getAuthor()%></p>
						<p>
							Category :<%=b.getBookCatagory()%></p>

						<a class="btn btn-success btn-sm ml-2"
							href="view_books.jsp?id=<%=b.getBookid()%>">Details</a> <a
							href="" class="btn btn-primary btn-sm ml-2"><i
							class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%>/-</a>
					</div>
				</div>
			</div>
			<%
			}
			%>






		</div>
		<a href="alloldbooks.jsp" class="btn btn-danger mt-3">View Details</a>
	</div>

	<!-- old book end -->

	<%@include file="all_component/footer.jsp"%>

</body>
</html>