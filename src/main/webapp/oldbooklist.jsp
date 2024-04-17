<%@page import="com.entity.book_dtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBconnect"%>
<%@page import="com.DAO.BookDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Old Book List</title>
<%@include file="all_component/allcss.jsp" %>
</head>
<body>
<%@include file="all_component/navbar.jsp" %>

<div class="container">
<table class="table table-hover">
<thead class="bg-dark text-white">
<tr>
<th>Book  Name</th>
<th>Author</th>
<th>Price</th>
<th>Action</th>
</tr>
</thead>
<tbody>
<%
Object o=session.getAttribute("list");
List<book_dtls> list=(List<book_dtls>)o;
for(book_dtls b : list)
{
%>
<tr>
<td><%=b.getBookName() %></td>
<td><%=b.getAuthor() %></td>
<td><%=b.getPrice() %></td>
<td><a class="btn btn-danger btn-sm">Remove</a></td>
</tr>
<%} %>
</tbody>
</table>
</div>

</body>
</html>