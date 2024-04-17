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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name= request.getParameter("fname");
		String email= request.getParameter("email");
		String phno= request.getParameter("phno");
		String password= request.getParameter("password");
		String check= request.getParameter("check");
		

		User us = new User();
		us.setName(name);
		us.setEmail(email);
		us.setPhno(phno);
		us.setPassword(password);
		  
		HttpSession hs = request.getSession();
		if(check!=null) {
		
			UserDaoImpl udi = new UserDaoImpl(DBconnect.getConn());
			boolean f=udi.userRegister(us);
			if(f)
			{
				//System.out.println("Data Stored Successfully..");
				hs.setAttribute("success", "Registerd Successfully...");
				response.sendRedirect("Register.jsp");
				
			}else 
			{
				//System.out.println("Data not stored..");
				hs.setAttribute("failed", "Registration failed");
				response.sendRedirect("Register.jsp");
			}
		}else {
			//System.out.println("Please accept the terms and conditions...");
			hs.setAttribute("uncheck", "Please Accept all the terms & conditions.");
			response.sendRedirect("Register.jsp");
		}
		
		
		
		}


}
