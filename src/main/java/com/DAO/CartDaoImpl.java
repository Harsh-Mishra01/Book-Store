package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Cart;

public class CartDaoImpl implements CartDao {
	
	Connection con;
	
	public CartDaoImpl(Connection con)
	{
		this.con= con;
	}
	

	@Override
	public boolean addCart(Cart c) {
		
		boolean f = false;
		
		try {
			String sql = "Insert into cart(bid,uids,bookname,author,price,totalprice) values(?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, c.getBid());
			pstmt.setInt(2, c.getUid());
			pstmt.setString(3, c.getBookname());
			pstmt.setString(4, c.getAuthor());
			pstmt.setDouble(5, c.getPrice());
			pstmt.setDouble(6, c.getTotal() );
			
			int i = pstmt.executeUpdate();
			
			if(i==1)
			{
				f=true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return f;
	}


	@Override
	public List<Cart> getCartDtls(int uid) {
		
		Cart c=null;
		List<Cart> list = new ArrayList<Cart>();
		double totalprice=0;
		try {
			String sql = "select * from cart where uids=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, uid);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next())
			{
				c = new Cart();
				c.setCid(rs.getInt(1));
				c.setBid(rs.getInt(2));
				c.setUid(rs.getInt(3));
				c.setBookname(rs.getString(4));
				c.setAuthor(rs.getString(5));
				c.setPrice(rs.getDouble(6));
				totalprice = totalprice+rs.getDouble(7);
				c.setTotal(totalprice);
				
				list.add(c);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}


	@Override
	public boolean removeBook(int bid, int uid, int cid) {
		
		boolean f = false;
		
		try {
			String sql = "Delete from cart where bid =? and uids = ? and cid =?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bid);
			pstmt.setInt(2, uid);
			pstmt.setInt(3, cid);
			int i = pstmt.executeUpdate();
			
			if(i==1)
			{
				f=true;
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return f;
	}

}
