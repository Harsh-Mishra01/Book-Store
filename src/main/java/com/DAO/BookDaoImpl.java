package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.book_dtls;

public class BookDaoImpl implements BookDao {

	private Connection conn;

	public BookDaoImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addBook(book_dtls bd) {
		boolean f = false;
		try {
			String sql = "insert into BOOK_DTLS(bookname,author,price,bookcatagory,status,user_email,photo) values(?,?,?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bd.getBookName());
			pstmt.setString(2, bd.getAuthor());
			pstmt.setString(3, bd.getPrice());
			pstmt.setString(4, bd.getBookCatagory());
			pstmt.setString(5, bd.getBookStatus());
			pstmt.setString(6, bd.getEmail());
			pstmt.setString(7, bd.getFis());

			int i = pstmt.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}

	@Override
	public List<book_dtls> allBooks() {

		List<book_dtls> list = new ArrayList<book_dtls>();

		book_dtls b = null;
		try {
			String sql = "select * from book_dtls order by bookid DESC";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				b = new book_dtls();
				b.setBookName(rs.getString(1));
				b.setAuthor(rs.getString(2));
				b.setPrice(rs.getString(3));
				b.setBookCatagory(rs.getString(4));
				b.setBookStatus(rs.getString(5));
				b.setEmail(rs.getString(6));
				b.setBookid(rs.getInt(7));
				b.setFis(rs.getString(8));
				list.add(b);

			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return list;
	}

	@Override
	public book_dtls bookEdit(int id) {
		boolean f = false;
		book_dtls b = null;
		try {
			String sql = "select * from book_dtls where bookid = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				b = new book_dtls();
				b.setBookName(rs.getString(1));
				b.setAuthor(rs.getString(2));
				b.setPrice(rs.getString(3));
				b.setBookCatagory(rs.getString(4));
				b.setBookStatus(rs.getString(5));
				b.setEmail(rs.getString(6));
				b.setBookid(rs.getInt(7));
				b.setFis(rs.getString(8));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return b;
	}

	@Override
	public boolean updateBook(book_dtls bd) {
		boolean f = false;

		try {

			String sql = "update book_dtls set bookname = ?, author = ?, price = ? , status = ? where bookid = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bd.getBookName());
			pstmt.setString(2, bd.getAuthor());
			pstmt.setString(3, bd.getPrice());
			pstmt.setString(4, bd.getBookStatus());
			pstmt.setInt(5, bd.getBookid());

			int r = pstmt.executeUpdate();

			if (r == 1) {
				f = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public boolean deleteBook(int id) {

		boolean f = false;

		try {
			String sql = "Delete from book_dtls where bookid = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			int r = pstmt.executeUpdate();

			if (r == 1) {
				f = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public List<book_dtls> addNewBook() {

		List<book_dtls> list = new ArrayList<book_dtls>();

		book_dtls bd = null;
		try {
			String sql = "select * from book_dtls where bookcatagory=? and status=? order by bookid DESC";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "new");
			pstmt.setString(2, "Active");
			ResultSet rs = pstmt.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				bd = new book_dtls();
				bd.setBookName(rs.getString(1));
				bd.setAuthor(rs.getString(2));
				bd.setPrice(rs.getString(3));
				bd.setBookCatagory(rs.getString(4));
				bd.setBookStatus(rs.getString(5));
				bd.setEmail(rs.getString(6));
				bd.setBookid(rs.getInt(7));
				bd.setFis(rs.getString(8));
				list.add(bd);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<book_dtls> addRecentBook() {

		List<book_dtls> list = new ArrayList<book_dtls>();

		book_dtls bd = null;
		try {
			String sql = "select * from book_dtls where status=? order by bookid DESC";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "Active");
			ResultSet rs = pstmt.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				bd = new book_dtls();
				bd.setBookName(rs.getString(1));
				bd.setAuthor(rs.getString(2));
				bd.setPrice(rs.getString(3));
				bd.setBookCatagory(rs.getString(4));
				bd.setBookStatus(rs.getString(5));
				bd.setEmail(rs.getString(6));
				bd.setBookid(rs.getInt(7));
				bd.setFis(rs.getString(8));
				list.add(bd);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	@Override
	public List<book_dtls> allNewBook() {
		List<book_dtls> list = new ArrayList<book_dtls>();

		book_dtls bd = null;
		try {
			String sql = "select * from book_dtls where bookcatagory = ? and status=?  order by bookid DESC";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "new");
			pstmt.setString(2, "Active");
			ResultSet rs = pstmt.executeQuery();
			int i = 1;
			while (rs.next()) {
				bd = new book_dtls();
				bd.setBookName(rs.getString(1));
				bd.setAuthor(rs.getString(2));
				bd.setPrice(rs.getString(3));
				bd.setBookCatagory(rs.getString(4));
				bd.setBookStatus(rs.getString(5));
				bd.setEmail(rs.getString(6));
				bd.setBookid(rs.getInt(7));
				bd.setFis(rs.getString(8));
				list.add(bd);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<book_dtls> allRecentBook() {
		List<book_dtls> list = new ArrayList<book_dtls>();

		book_dtls bd = null;
		try {
			String sql = "select * from book_dtls where status=? order by bookid DESC";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "Active");
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				bd = new book_dtls();
				bd.setBookName(rs.getString(1));
				bd.setAuthor(rs.getString(2));
				bd.setPrice(rs.getString(3));
				bd.setBookCatagory(rs.getString(4));
				bd.setBookStatus(rs.getString(5));
				bd.setEmail(rs.getString(6));
				bd.setBookid(rs.getInt(7));
				bd.setFis(rs.getString(8));
				list.add(bd);
			
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<book_dtls> addOldBook() {
		List<book_dtls> list = new ArrayList<book_dtls>();

		book_dtls bd = null;
		try {
			String sql = "select * from book_dtls where bookcatagory=? and status=? order by bookid DESC";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "old");
			pstmt.setString(2, "Active");
			ResultSet rs = pstmt.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				bd = new book_dtls();
				bd.setBookName(rs.getString(1));
				bd.setAuthor(rs.getString(2));
				bd.setPrice(rs.getString(3));
				bd.setBookCatagory(rs.getString(4));
				bd.setBookStatus(rs.getString(5));
				bd.setEmail(rs.getString(6));
				bd.setBookid(rs.getInt(7));
				bd.setFis(rs.getString(8));
				list.add(bd);
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<book_dtls> allOldBooks() {
		List<book_dtls> list = new ArrayList<book_dtls>();

		book_dtls bd = null;
		try {
			String sql = "select * from book_dtls where bookcatagory=? and status=? order by bookid DESC";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "old");
			pstmt.setString(2, "Active");
			ResultSet rs = pstmt.executeQuery();
		
			while (rs.next()) {
				bd = new book_dtls();
				bd.setBookName(rs.getString(1));
				bd.setAuthor(rs.getString(2));
				bd.setPrice(rs.getString(3));
				bd.setBookCatagory(rs.getString(4));
				bd.setBookStatus(rs.getString(5));
				bd.setEmail(rs.getString(6));
				bd.setBookid(rs.getInt(7));
				bd.setFis(rs.getString(8));
				list.add(bd);
			
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<book_dtls> oldBookList( String email) {
		
		List<book_dtls> list = new ArrayList<book_dtls>();

		book_dtls bd = null;
		try {
			String sql = "select * from book_dtls where bookcatagory=? and user_email=? order by bookid DESC";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "old");
			pstmt.setString(2, email);
			ResultSet rs = pstmt.executeQuery();
		
			while (rs.next()) {
				bd = new book_dtls();
				bd.setBookName(rs.getString(1));
				bd.setAuthor(rs.getString(2));
				bd.setPrice(rs.getString(3));
				list.add(bd);			
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		
		return list;
	}

}
