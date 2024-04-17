<%@page import="com.entity.User"%>
<%@page import="com.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.DAO.CartDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart Details</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body style="background-color: #f2f0f0;">

<div class="alert alert-primary" role="alert">
  
</div>
	<%@include file="all_component/navbar.jsp"%>
	<c:if test="${not empty removemsg}">
		<div class="alert alert-success text-center" role="alert"><c:out value="${removemsg}" /></div>
			<c:remove var="removemsg" scope="session" />
	</c:if>
	
	<c:if test="${not empty removefailmsg}">
		<div class="alert alert-danger text-center" role="alert"><c:out value="${removefailmsg}" /></div>
			<c:remove var="removefailmsg" scope="session" />
	</c:if>

	

	<div class="container-fluid mt-5">
		<div class="row ">
			<div class="col-md-6 text-center">
				<div class="card">
					<div class="card-header">
						<h1>Your Selected Items</h1>
					</div>
					<div class="card-body">
						<table class="table table-striped">
							<thead class="bg-info text-white">
								<tr>
									<th scope="col">S.No.</th>
									<th scope="col">Book Name</th>
									<th scope="col">Author Name</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>

								<%
								User u = (User) session.getAttribute("userob");
								CartDaoImpl cdi = new CartDaoImpl(DBconnect.getConn());
								List<Cart> list = cdi.getCartDtls(u.getId());
								double totalprice = 0;
								int sno = 0;
								for (Cart c : list) {
									totalprice = c.getTotal();
									sno = sno + 1;
								%>

								<tr>
									<td scope="col"><%=sno%>.</td>
									<td scope="col"><%=c.getBookname()%></td>
									<td scope="col"><%=c.getAuthor()%></td>
									<td scope="col"><%=c.getPrice()%></td>
									<td scope="col"><a
										href="remove?bid=<%=c.getBid()%>&&uid=<%= c.getUid() %>&&cid=<%= c.getCid() %>"
										class="btn btn-sm btn-danger">Remove</a></td>

								</tr>

								<%
								}
								%>
							</tbody>
						</table>
					</div>
					<div class="card-footer">
						<table class="table ">
							<thead>
								<tr class="d-flex justify-content-between">
									<th scope="col">Total Price :</th>
									<th><%=totalprice%></th>
								</tr>
							</thead>
						</table>
					</div>

				</div>

			</div>
			<div class="col-md-6">
				<div class="card">
					<div class="card-header">
						<h1 class="text-center">Your Details</h1>
					</div>
					<div class="card-body">
						<form>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text"
										class="form-control" id="inputEmail4" name="name" value="<%=u.getName() %>" readonly="readonly">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input type="email"
										class="form-control" id="inputPassword4" name="email"  value="<%=u.getEmail() %>" readonly="readonly">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Mobile No.</label> <input type="phone"
										class="form-control" id="inputEmail4" name="phno"  value="<%=u.getPhno() %>" readonly="readonly">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										class="form-control" id="inputPassword4" name="address" value="<%=u.getAddress() %>" readonly="readonly">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text"
										class="form-control" id="inputEmail4" name="state" value="<%=u.getState() %>" readonly="readonly">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Zip</label> <input type="text"
										class="form-control" id="inputPassword4" name="zip" value="<%= u.getPostalcode() %>" readonly="readonly">
								</div>
							</div>


							<div class="form-group ">
								<label for="inputState">Payment Method</label> <select
									id="inputState" class="form-control">
									<option selected>---select---</option>
									<option>Cash on Delivery</option>
								</select>
							</div>

							<div class="text-center">
								<a href="" class="btn btn-success">Place Order</a> <a href="index.jsp"
									class="btn btn-warning">Continue Shopping</a>
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