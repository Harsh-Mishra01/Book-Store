package com.user.servlet;

import java.io.File;
import java.io.IOException;

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
@WebServlet("/sell")
@MultipartConfig
public class SellBookServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		try {
		String bookName = req.getParameter("bname");
		String author = req.getParameter("author");
		String price = req.getParameter("price");
		Part part = req.getPart("bimg");
        String fis = getSubmittedFileName(part);
		String username = req.getParameter("user");

        
        
		
		HttpSession hs = req.getSession();
		book_dtls bd = new book_dtls();
		bd.setBookName(bookName);
		bd.setAuthor(author);
		bd.setBookCatagory("old");
		bd.setBookStatus("Active");
		bd.setPrice(price);
		bd.setFis(fis);
		bd.setEmail(username);
		
	     BookDaoImpl bdi = new BookDaoImpl(DBconnect.getConn());
	     boolean r =bdi.addBook(bd);
	     
	     if(r) {	     
	    	 String path=req.getServletContext().getRealPath("")+"book";
	    	 System.out.println("Path : "+path);
		     File f = new File(path);
		     part.write(path + File.separator +fis);
		     
		     
	    	 hs.setAttribute("successmsg", "Book Added Successfully");
	    	 resp.sendRedirect("selbooks.jsp");
	     }
	     else {
	    	 hs.setAttribute("failmsg", "Something went Wrong");
	    	 resp.sendRedirect("selbooks.jsp");
	    	 
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
