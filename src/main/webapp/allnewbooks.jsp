<%@page import="com.entity.User"%>
<%@page import="com.entity.book_dtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.DAO.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: All New Book</title>
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

/* toast */
#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<%
	User u = (User) session.getAttribute("userob");
	%>

	<!--new  book start -->


	<div class="container-fluid  text-center p-3" id="newbook">
		<h3 class="text-center p-3 mb-4">
			<u>New Books</u>

			<c:if test="${not empty cartsuccs }">
			<div id="toast">${cartsuccs }</div>

			<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>
</c:if>

<c:remove var="cartsuccs" scope="session"/>

		</h3>

		<div class="row ">
			<%
			BookDaoImpl bdi = new BookDaoImpl(DBconnect.getConn());
			List<book_dtls> lbd = bdi.allNewBook();

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


						<%
						if (u == null) {
						%>
						<a href="login.jsp" class="btn btn-primary btn-sm ml-2"><i
							class="fa-solid fa-cart-plus"></i> Add Cart</a>
						<%
						} else {
						%>
						<a href="cart?bid=<%=b.getBookid()%>&&uid=<%=u.getId()%>"
							class="btn btn-primary btn-sm ml-2"><i
							class="fa-solid fa-cart-plus"></i> Add Cart</a>
						<%
						}
						%>
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
		</div>

	</div>
	
	<div style="margin-top: 10%;">
		<%@ include file="all_component/footer.jsp"%>
	</div>

</body>
</html>