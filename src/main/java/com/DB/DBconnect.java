package com.DB;

import java.sql.*;


public class DBconnect {
	private static Connection con;
	
	public static Connection getConn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "HARSH", "ORACLE");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
		
	}

}
