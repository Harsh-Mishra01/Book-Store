<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.DAO.BookDaoImpl"%>
<%@ page import="com.DB.DBconnect"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.entity.book_dtls"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin :all Books</title>
<%@include file="allcss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<c:if test="${empty userobj }">
		<c:redirect url="../login.jsp" />
	</c:if>

	<h1 class="text-center m-4">All Books</h1>
	<c:if test="${not empty successmsg }">
		<h4 class="text-center m-3 text-success">${successmsg}</h4>
		<c:remove var="successmsg" scope="session" />
	</c:if>
	<c:if test="${ not empty failmsg}">
		<h4 class="text-center m-3 text-danger">${failmsg}</h4>
		<c:remove var="failmsg" scope="session" />
	</c:if>

	<c:if test="${not empty successdlt }">
		<h4 class="text-center m-3 text-success">${successdlt}</h4>
		<c:remove var="successdlt" scope="session" />
	</c:if>
	<c:if test="${ not empty faildlt}">
		<h4 class="text-center m-3 text-danger">${faildlt}</h4>
		<c:remove var="faildlt" scope="session" />
	</c:if>

	<div class="container-fluid">
		<table class="table table-striped">
			<thead class="bg-dark text-white">
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Image</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author Name</th>
					<th scope="col">Price</th>
					<th scope="col">Book Catagories</th>
					<th scope="col">Status</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				BookDaoImpl bdi = new BookDaoImpl(DBconnect.getConn());
				List<book_dtls> lbd = bdi.allBooks();
				for (book_dtls b : lbd) {
				%>
				<tr>
					<th scope="row"><%=b.getBookid()%></th>
					<td><img alt="" src="../book/<%=b.getFis()%>" width="50px"
						height="50px"></td>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getBookCatagory()%></td>
					<td><%=b.getBookStatus()%></td>
					<td><a href="bookedit.jsp?id=<%=b.getBookid()%>" type="text"
						class="btn btn-sm btn-warning"><i
							class="fa-solid fa-pen-to-square"></i> Edit</a> <a
						href="../delete?id=<%=b.getBookid()%>" type="text"
						class="btn btn-danger btn-sm"><i class="fa-solid fa-trash-can"></i>
							Delete</a></td>

					<%
					}
					%>
				
			</tbody>
		</table>
	</div>



	<%@include file="footer.jsp"%>

</body>
</html>