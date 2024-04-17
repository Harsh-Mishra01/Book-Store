package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDaoImpl;
import com.DB.DBconnect;

@WebServlet("/remove")
public class RemoveBookServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
        int bid =Integer.parseInt(req.getParameter("bid"));
        int uid =Integer.parseInt(req.getParameter("uid"));
        int cid =Integer.parseInt(req.getParameter("cid"));


        
        CartDaoImpl cdi = new CartDaoImpl(DBconnect.getConn());
        boolean res =cdi.removeBook(bid,uid,cid);
        
        HttpSession hs = req.getSession();
        if(res)
        {
        	hs.setAttribute("removemsg", "Book Removed Succeccfully..");
        	resp.sendRedirect("cartdtls.jsp");
        	
        }else {
        	hs.setAttribute("removefailmsg", "Failed tO remove book");
        	resp.sendRedirect("cartdtls.jsp");
        	

        }
	}
	
	

}
