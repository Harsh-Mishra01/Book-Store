package com.user.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.BookDaoImpl;
import com.DB.DBconnect;
import com.entity.book_dtls;

@WebServlet("/check")
public class CheckServlet extends HttpServlet {

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BookDaoImpl bdi = new BookDaoImpl(DBconnect.getConn());
		List<book_dtls> lbd = bdi.addNewBook();

		for (book_dtls b : lbd) {
			System.out.println(b.getBookName());
		}

		System.out.print("Hello");
	}

}
