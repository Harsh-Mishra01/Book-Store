package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.entity.User;
public class UserDaoImpl implements UserDao{
	private Connection conn;

	public UserDaoImpl(Connection conn) {
		super();
		this.conn = conn;
	}
	 
	public boolean userRegister(User us)
	{
		boolean f = false;
		
		try {
			String sql = "insert into users(name,email,phno,password) values(?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, us.getName());
			pstmt.setString(2, us.getEmail());
			pstmt.setString(3, us.getPhno());
			pstmt.setString(4, us.getPassword());
			
			int i=pstmt.executeUpdate();
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
	
	
	public User userLogin(String email, String password)
	{ 
		User us=null;
		String sql = "select * from users where email =? and password=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			ResultSet rs=pstmt.executeQuery();
			
			if(rs.next())
			{
				us=new User();
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhno(rs.getString(4));
				us.setPassword(rs.getString(5));
				us.setAddress(rs.getString(6));
				us.setLandmark(rs.getString(7));
				us.setState(rs.getString(8));
				us.setPostalcode(rs.getString(9));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return us;
	}
	

}
