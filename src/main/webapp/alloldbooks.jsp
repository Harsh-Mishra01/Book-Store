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
<title>Ebook : Recent Books</title>
<%@include file="all_component/allcss.jsp"%>
<style type="text/css">
body {
	background-color: #f2f0f0;
}

.back-img {
	background:
		url("https://images.pexels.com/photos/159866/books-book-pages-read-literature-159866.jpeg?cs=srgb&dl=pexels-pixabay-159866.jpg&fm=jpg");
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


	<!--new  book start -->


	<div class="container-fluid  text-center p-3" id="newbook">
		<h3 class="text-center p-3 mb-4">
			<u>Old Books</u>
		</h3>

		<div class="row ">
			<%
			BookDaoImpl bdi = new BookDaoImpl(DBconnect.getConn());
			List<book_dtls> lbd = bdi.addOldBook();

			for (book_dtls b : lbd) {
			%>
			<div class="col-md-3 mt-3">
				<div class="card card-hover">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getFis()%>" width="200px"
							height="300px" class="img-thumblin mb-2">
						<p>
							<b><%=b.getBookName()%> </b>
						</p>
						<p><%=b.getAuthor()%></p>
						<p>
							Category :<%=b.getBookCatagory()%></p>
						<a  href="view_books.jsp?id=<%= b.getBookid() %>"  class="btn btn-success btn-sm ml-2">Details</a> <a
							href="" class="btn btn-primary btn-sm ml-2"><i
							class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%>/-</a>
					</div>
				</div>
			</div>

			<%
			}
			%>

			<!-- new book end -->



			<%@include file="all_component/footer.jsp"%>
</body>
</html>