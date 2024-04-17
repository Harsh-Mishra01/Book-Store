 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page isELIgnored="false" %>
<div class="containre-fluid top"></div>
<div class="container-fluid p-3">
	<div class="row">
		<div class="col-md-4 logo">
			<h1><i class="fa-solid fa-book"></i> Bookify</h1>
		</div>
		<div class="col-md-5">
			<form class="d-flex mx-2" role="search">
				<input class="form-control me-2-sm w-50"  type="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-success" type="submit">Search</button>
			</form>
		</div>
		<div class="col-md-3 me-2 ">
		
		
		<c:if test="${ empty userob }">
		
			<a class="btn btn-primary " href="login.jsp"><i class="fa-solid fa-right-to-bracket"></i> login</a>
			<a class="btn btn-success " href="Register.jsp"><i class="fa-solid fa-user-plus"></i>  Register</a>
		</c:if>
		<c:if test="${not empty userob }">
		<a class="btn btn-primary " href="login.jsp"><i class="fa-solid fa-user"></i>   ${ userob.name}</a>
		<a class="btn btn-success " href="cartdtls?uid=${userob.id }"><i class="fa-solid fa-cart-plus"></i> Cart</a>
		<a class="btn btn-danger " href="logout"><i class="fa-solid fa-right-from-bracket "></i> Logout</a>
		</c:if>	
		
		
			
		</div>
	</div>
</div>



<nav class="navbar navbar-expand-lg bg-custom text-dark">
	<div class="container-fluid">
		<div class="collapse navbar-collapse justify-content-between" id="navbarSupportedContent">
			<ul class="navbar-nav mb-3 mb-lg-0">
				<li class="nav-item"><a class="nav-link active text-light me-3"
					aria-current="page" href="index.jsp"><i class="fa-solid fa-house"></i>
						Home</a></li>
				<li class="nav-item mx-3"><a class="nav-link  active text-light"
					href="allrecentbooks.jsp"><i class="fa-solid fa-book-open"></i> Recent Book</a></li>
				<li class="nav-item mx-3"><a class="nav-link  active text-light"
					href="allnewbooks.jsp"><i class="fa-solid fa-book-open"></i> New Book</a></li>
				<li class="nav-item"><a class="nav-link  active text-light"
					href="alloldbooks.jsp"><i class="fa-solid fa-book"></i> Old Book</a></li>
			</ul>
		<div class =" me-2">
			<a href="setting.jsp"class="btn btn-outline-warning"><i class="fa-solid fa-gears"></i> Setting</a>
			<a class="btn btn-outline-warning"><i class="fa-regular fa-address-card"></i>  Contact Us</a>
		</div>
		</div>
	</div>
</nav>

