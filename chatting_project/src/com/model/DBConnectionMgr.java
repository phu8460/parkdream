package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBConnectionMgr {
	public static final String _DRIVER = "oracle.jdbc.driver.OracleDriver";
	// public static final String _URL = "jdbc:oracle:thin:@127.0.0.1:1521:orcl11";
	public static final String _URL = "jdbc:oracle:thin:@127.0.0.1:1521:orcl11";
	public static final String _USER = "scott";
	public static final String _PW = "tiger";
	static DBConnectionMgr instance = null;
	public Connection con			= null;
	public PreparedStatement pstmt  = null;
	public ResultSet rs 			= null;
	
	public static DBConnectionMgr getInstance(){
		if(instance == null){
			synchronized(DBConnectionMgr.class){
				instance = new DBConnectionMgr();
			}
		}
		return instance;
	}
	
	public synchronized Connection getConnection(){
		try {
			Class.forName(_DRIVER);
			con=DriverManager.getConnection
					(_URL,_USER,_PW);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return con;
	}
	
	// 사용한 자원 반납
	// 반납하는 순서는 역순으로 처리
	
	// insert, delete, update문 처리 시 반납
	public void freeConnection(Connection con, PreparedStatement pstmt){
		try {
			if(pstmt != null) pstmt.close();
			if(con !=null) con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// select문 처리 시 반납
	public void freeConnection(Connection con, PreparedStatement pstmt, ResultSet rs){
		try {
			if(rs != null) rs.close();
			if(pstmt != null)con.close();
			if(con!=null)con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
