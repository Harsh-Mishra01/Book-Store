package com.user.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDaoImpl;
import com.DB.DBconnect;
import com.entity.book_dtls;

@WebServlet("/oldbooklist")
public class OldBookList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uemail =req.getParameter("uemail");
		
		BookDaoImpl bdi = new BookDaoImpl(DBconnect.getConn());
		List<book_dtls> list=bdi.oldBookList(uemail);
		
		HttpSession hs = req.getSession();
		
		hs.setAttribute("list", list);
		
		resp.sendRedirect("oldbooklist.jsp");
		
	}
	
	

}
