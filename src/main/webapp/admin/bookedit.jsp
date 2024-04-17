<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : edit books</title>
<%@include file="allcss.jsp"%>
<%@ page import="com.DAO.BookDaoImpl"%>
<%@ page import="com.DB.DBconnect"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.entity.book_dtls"%>
<%@ page import = "javax.servlet.http.HttpServletRequest" %>
</head>
<body style="background-color: #f2f0f0;">
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj }">
	<c:redirect  url="../login.jsp"></c:redirect>
	</c:if>
	
	<% 
	int i=Integer.parseInt(request.getParameter("id"));
	BookDaoImpl bdi = new BookDaoImpl(DBconnect.getConn());
	book_dtls bd=bdi.bookEdit(i);

	%>

	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-4 mb-4 ">
					<div class="card-header">
						<h1 class="text-center">Edit Books</h1>
						
						</div>
						<div class="card-body p-4">
						
							<form action="../update" method="post">
							<input type="hidden" name="id" value="<%= bd.getBookid() %>">
								<div class="form-group pb-2">
									<label for="exampleInputEmail1">Book Name</label> <input
										type="text" required="required" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										placeholder="Book Name" name="bookname" value="<%= bd.getBookName() %>">
								</div>

								<div class="form-group pb-2">
									<label for="exampleInputEmail1">Author Name</label> <input
										type="text" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" required="required"
										placeholder="Author name" name="author" value="<%= bd.getAuthor() %>">
								</div>

								<div class="form-group pb-2">
									<label for="exampleInputEmail1">Price</label> <input
										type="text" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" name="price"   value="<%= bd.getPrice() %>" >
								</div>
		
								<div class="form-group pb-2">
									<label for="bookstatus">Book Status</label> <select
										id="bookstatus" class="form-control" name="bstatus">
										<%
										if("Active".equals(bd.getBookStatus()))
										{%>
										<option value="Active">Active</option>
										<option value="Inactive">Inactive</option>
									   <%
										}else{
											%>
									    <option value="Inactive">Inactive</option>
										<option value="Active">Active</option>
											<% 
										}
										%>									
									</select>
								</div>
								
								<button type="submit" class="btn btn-primary">Submit</button>
							</form>

						</div>

					</div>

				</div>
			</div>
		</div>
	</div>


</body>
</html>



