package com.admin.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BookDaoImpl;
import com.DB.DBconnect;
import com.entity.book_dtls;

@MultipartConfig
@WebServlet("/addbook")
public class GetAddBooks extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String bookName = request.getParameter("bookname");
			String author = request.getParameter("author");
			String price = request.getParameter("price");
			String bookCatagory = request.getParameter("bcata");
			String bookStatus = request.getParameter("bstatus");
			Part part = request.getPart("bimg");
            String fis = getSubmittedFileName(part);
            
			
			HttpSession hs = request.getSession();
			book_dtls bd = new book_dtls();
			bd.setBookName(bookName);
			bd.setAuthor(author);
			bd.setPrice(price);
			bd.setBookCatagory(bookCatagory);
			bd.setBookStatus(bookStatus);
			bd.setFis(fis);
			
		     BookDaoImpl bdi = new BookDaoImpl(DBconnect.getConn());

		    
		     
		     
		     boolean r =bdi.addBook(bd);
		     
		     if(r) {	     
		    	 String path=request.getServletContext().getRealPath("")+"book";
			     File f = new File(path);
			     part.write(path + File.separator +fis);
			     
			     
		    	 hs.setAttribute("successmsg", "Book Added Successfully");
		    	 response.sendRedirect("admin/add_books.jsp");
		     }
		     else {
		    	 hs.setAttribute("failmsg", "Something went Wrong");
		    	 response.sendRedirect("admin/add_books.jsp");
		    	 
		     }
		     
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
    
    private String getSubmittedFileName(Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
	

}
