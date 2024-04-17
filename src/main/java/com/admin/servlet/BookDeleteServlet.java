package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDaoImpl;
import com.DB.DBconnect;

@WebServlet("/delete")
public class BookDeleteServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		BookDaoImpl bdi = new BookDaoImpl(DBconnect.getConn());
		boolean r =bdi.deleteBook(id);
		   
		HttpSession hs = request.getSession();
		if(r)
		{
			//System.out.println("Data deleted successfully..");
			hs.setAttribute("successdlt", "Data deleted Successfully..");
			response.sendRedirect("admin/all_books.jsp");
		}else
		{
			//System.out.println("Something went wrong..");
			hs.setAttribute("faildlt", "Something Went Wrong on Server...");
			response.sendRedirect("admin/all_books.jsp");
		}
		
		
		
		
	}

}
