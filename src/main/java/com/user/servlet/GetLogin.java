package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDaoImpl;
import com.DB.DBconnect;
import com.entity.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/log")
public class GetLogin extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email= request.getParameter("email");
		String password = request.getParameter("password");
		
		HttpSession hs = request.getSession();
		UserDaoImpl udi = new UserDaoImpl(DBconnect.getConn());
		if("mishraharsh9569@gmail.com".equals(email) && "harsh1234".equals(password)) {
			User us = new User();
			us.setName("Admin");
			hs.setAttribute("userobj", us);
			response.sendRedirect("admin/home.jsp");
			
		}else {
			
			
			User us = udi.userLogin(email, password);
			if(us != null)
			{
				//System.out.println("Success");
				hs.setAttribute("userob", us);
				response.sendRedirect("index.jsp");
			}else {
				//System.out.println("Failed....");
				hs.setAttribute("notlogin", "Please enter valid emailid/password");
				response.sendRedirect("login.jsp");
			}
			
		}
		
	
	}

}
