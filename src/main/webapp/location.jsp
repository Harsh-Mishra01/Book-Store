<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Location</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>

	<%
	User u = (User) session.getAttribute("userob");
	%>

	<div class="container-fluid text-center my-5">
		<div class="row">
			<div class="col-md-6 offset-md-3 ">

				<div class="card">
					<div class="card-header bg-info">
						<h1 class="text-center">Your Address Details</h1>
					</div>
					<div class="card-body">
						<form>
							<div class="form-row">

								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										class="form-control" id="inputPassword4" placeholder="Enter your address" name="address"
										 >
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4">LandMark</label> <input type="text"
										class="form-control" id="inputEmail4" placeholder="Landmark" name="landmark"
										 >
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-4">
									<label for="inputEmail4">City</label> <input type="text"
										class="form-control" id="inputEmail4" placeholder="Enter your city" name="city"
										 >
								</div>
								<div class="form-group col-md-4">
									<label for="inputEmail4">State</label> <input type="text"
										class="form-control" id="inputEmail4" placeholder="Enter your state" name="state"
										 >
								</div>

								<div class="form-group col-md-4">
									<label for="inputPassword4">Zip</label> <input type="text"
										class="form-control" id="inputPassword4" placeholder="Enter your Postal code" name="zip"
										 >
								</div>
							</div>
							<div class="text-center">
								<a href="location?uid=<%= u.getId() %>" class="btn btn-success w-50">Submit</a> 
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div style="margin-top: 10%;">
		<%@ include file="all_component/footer.jsp"%>
	</div>

</body>
</html>