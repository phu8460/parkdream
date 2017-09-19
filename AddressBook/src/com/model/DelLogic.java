package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.controller.AddressController;
import com.vo.AddressBookVO;

public class DelLogic {
	public static final String _DRIVER = "oracle.jdbc.driver.OracleDriver";
	public static final String _URL = "jdbc:oracle:thin:@127.0.0.1:1521:orcl11";
	public static final String _USER = "scott";
	public static final String _PW = "tiger";
	AddressBookVO dvo = null;
	
	public AddressBookVO deleteAddress(AddressBookVO pvo) {
		AddressController ac = new AddressController();
		Connection con = null;
	    PreparedStatement stmt = null;
	    int rs = 0;
	    StringBuilder sql= new StringBuilder();
	    
	    try {
	    	 Class.forName(_DRIVER);
	         con = DriverManager.getConnection(_URL, _USER, _PW);
	         
	         dvo = new AddressBookVO();
	         
	         sql.append("DELETE FROM address_book");
	         sql.append(" where seq_no=" +pvo.getSeq_no());
	         
	         System.out.println(sql);
	         
	         stmt = con.prepareStatement(sql.toString()); // 전령클래스 로딩해주는 문장
	         
	         rs = stmt.executeUpdate(sql.toString());
	         if(rs == 1)
	         {
	        	 System.out.println("삭제 성공");
	         }
		     pvo=dvo;
	      	   } catch (SQLException se) {
	      		   System.out.println(se.toString());
	      		   System.out.println("[[query]]"+sql.toString());
	      	   } catch(Exception e){
	      		   e.printStackTrace();
        }
	    
		return null;
	}
}