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
import com.entity.book_dtls;
@WebServlet("/update")
public class BookUpdateServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		String bookName = request.getParameter("bookname");
		String author = request.getParameter("author");
		String price = request.getParameter("price");
		String bookStatus = request.getParameter("bstatus");
		
		
		book_dtls bd= new book_dtls();
		bd.setBookid(id);
		bd.setBookName(bookName);
		bd.setAuthor(author);
		bd.setPrice(price);
		bd.setBookStatus(bookStatus);
		
		
		BookDaoImpl bdi = new BookDaoImpl(DBconnect.getConn());
		boolean r=bdi.updateBook(bd);
		HttpSession hs = request.getSession();
		if(r)
		{
			//System.out.println(" Book Updated Successfully...");
			hs.setAttribute("successmsg", "Book Updated Successfully..");
			response.sendRedirect("admin/all_books.jsp");
		}
		else {
			//System.out.println(" Update failed...");
			hs.setAttribute("failmsg", "Something went wrong on server..");
			response.sendRedirect("admin/all_books.jsp");
		}
		
	}

}
