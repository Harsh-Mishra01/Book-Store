package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDaoImpl;
import com.DAO.CartDaoImpl;
import com.DB.DBconnect;
import com.entity.Cart;
import com.entity.book_dtls;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bid = Integer.parseInt(request.getParameter("bid"));
		int uid = Integer.parseInt(request.getParameter("uid"));
		
		
		BookDaoImpl bdi = new BookDaoImpl(DBconnect.getConn());
		book_dtls bd=bdi.bookEdit(bid);
		
		Cart c =new Cart();
		
		c.setBid(bid);
		c.setUid(uid);
		c.setBookname(bd.getBookName());
		c.setAuthor(bd.getAuthor());
		c.setPrice(Double.parseDouble(bd.getPrice()));
		c.setTotal(Double.parseDouble(bd.getPrice()));
		
		HttpSession hs = request.getSession();
		CartDaoImpl cdi = new CartDaoImpl(DBconnect.getConn());
		boolean result = cdi.addCart(c);
		
		if(result)
		{
			//System.out.println("Success....");
			hs.setAttribute("cartsuccs", "Book Added to the Cart Successfully");
			response.sendRedirect("allnewbooks.jsp");
			
		}else {
			//System.out.println("Failed....");
			hs.setAttribute("cartfail", "Something went Wrong");
			response.sendRedirect("allnewbooks.jsp");
		}

	}

}
