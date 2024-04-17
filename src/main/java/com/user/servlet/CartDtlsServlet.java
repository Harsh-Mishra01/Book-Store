package com.user.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDaoImpl;
import com.DB.DBconnect;
import com.entity.Cart;

@WebServlet("/cartdtls")
public class CartDtlsServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int uid = Integer.parseInt(req.getParameter("uid"));

		CartDaoImpl cdi = new CartDaoImpl(DBconnect.getConn());
		List<Cart> list = cdi.getCartDtls(uid);
		
		/* for(Cart c : list)
		{
			System.out.println("BookNamke :"+c.getBookname());
		}*/

		
		HttpSession hs = req.getSession();
		
		hs.setAttribute("listobj", list);
		
		resp.sendRedirect("cartdtls.jsp");

	}

}
