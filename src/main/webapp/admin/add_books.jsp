<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin : add books</title>
<%@include file="allcss.jsp"%>
</head>
<body style="background-color: #f2f0f0;">
	<%@include file="navbar.jsp"%>
	
	<c:if test="${empty userobj }">
	<c:redirect url="../login.jsp"/>
	</c:if>

	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-4 mb-4 ">
					<div class="card-header">
						<h1 class="text-center">Add Books</h1>
						<c:if test="${not empty successmsg }">
						<p class="text-success mt-2 text-center">${successmsg}</p>
						<c:remove var="successmsg" scope="session"/>
						</c:if>
						<c:if test="${not empty failmsg }">
						<p class="text-danger mt-2 text-center">${failmsg}</p>
						<c:remove var="failmsg" scope="session"/>
						</c:if>
						</div>
						<div class="card-body p-4">
						
							<form action="../addbook" method="post" enctype="multipart/form-data">
								<div class="form-group pb-2">
									<label for="exampleInputEmail1">Book Name</label> <input
										type="text" required="required" class="form-control"
										id="exampleInputEmail1" aria-describedby="emailHelp"
										placeholder="Book Name" name="bookname">
								</div>

								<div class="form-group pb-2">
									<label for="exampleInputEmail1">Author Name</label> <input
										type="text" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" required="required"
										placeholder="Author name" name="author">
								</div>

								<div class="form-group pb-2">
									<label for="exampleInputEmail1">Price</label> <input
										type="text" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" name="price">
								</div>
								<div class="form-group pb-3">
									<label for="bookcata">Book Catagory</label> <select
										id="bookcata" class="form-control" name="bcata">
										<option selected>---Select Catagory---</option>
										<option value="new">New Book</option>

									</select>
								</div>
								<div class="form-group pb-2">
									<label for="bookstatus">Book Status</label> <select
										id="bookstatus" class="form-control" name="bstatus">
										<option selected>---Select Status---</option>
										<option value="Active">Active</option>
										<option value="Inactive">Inactive</option>
									</select>
								</div>
								 <div class="form-group">
                                        
                                            <label for="choose" class="pb=2">Upload Image</lable>
                                              <input  class="form-control-file" type="file" id="choose" name="bimg">
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



