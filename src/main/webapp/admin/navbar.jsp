<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.entity.User"%>

<div class="containre-fluid top"></div>
<div class="container-fluid p-3">
	<div class="row">
		<div class="col-md-4 logo">
			<h1>
				<i class="fa-solid fa-book"></i> EBook
			</h1>
		</div>
		<div class="col-md-5">
			
		</div>
		<div class="col-md-3 mt-2 ">
			<c:if test="${not empty userobj }">
				<a class="btn btn-primary " href="home.jsp"><i
					class="fa-solid fa-user"></i> ${userobj.name}</a>
				<button type="button" class="btn btn-danger" data-toggle="modal"
					data-target="#exampleModalCenter">
					<i class="fa-solid fa-right-from-bracket "></i>Logout
				</button>
				</a>
			</c:if>

			<c:if test="${empty userobj }">
				<a class="btn btn-primary " href="../login.jsp"><i
					class="fa-solid fa-right-to-bracket"></i>login</a>
				<a class="btn btn-success " href="../Register.jsp"><i
					class="fa-solid fa-user-plus"></i> Register</a>
			</c:if>


		</div>
	</div>
</div>
<!-- logout modal -->

<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
			<div class ="text-center"><h4>Do you want to log out?</h4>
			<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<a class="btn btn-danger " href="../logout" type="button">Logout
			</a></div>
			</div>
			<div class="modal-footer">
				
				
			</div>
		</div>
	</div>
</div>

<!-- logout modal -->


<nav class="navbar navbar-expand-lg bg-custom text-dark">
	<div class="container-fluid">
		<div class="collapse navbar-collapse justify-content-between"
			id="navbarSupportedContent">
			<ul class="navbar-nav mb-3 mb-lg-0">
				<li class="nav-item"><a class="nav-link active text-light me-3"
					aria-current="page" href="../index.jsp"><i
						class="fa-solid fa-house"></i> Home</a></li>

			</ul>
			<div class=" me-2">
				<button class="btn btn-outline-warning">
					<i class="fa-solid fa-gears"></i> Setting
				</button>
				<button class="btn btn-outline-warning">
					<i class="fa-regular fa-address-card"></i> Contact Us
				</button>
			</div>
		</div>
	</div>
</nav>

