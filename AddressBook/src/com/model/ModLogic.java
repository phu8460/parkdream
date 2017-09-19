package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;
import java.util.concurrent.SynchronousQueue;

import com.controller.AddressController;
import com.vo.AddressBookVO;

public class ModLogic {
	public static final String _DRIVER = "oracle.jdbc.driver.OracleDriver";
	public static final String _URL = "jdbc:oracle:thin:@127.0.0.1:1521:orcl11";
	public static final String _USER = "scott";
	public static final String _PW = "tiger";
	public String where = ""; 
	public String column = "";
	
	public AddressBookVO updateAddress(AddressBookVO pvo) {
		AddressController ac = new AddressController();
		Connection con = null;
	    PreparedStatement stmt = null;
	    int rs = 0;
	    StringBuilder sql= new StringBuilder();
	    
	    try {
	    	 Class.forName(_DRIVER);
	         con = DriverManager.getConnection(_URL, _USER, _PW);
	         
	         AddressBookVO dvo = null;
	         AddressBookVO dvos[] = null;
	         dvo = new AddressBookVO();
	         
	         sql.append("UPDATE address_book");
	         sql.append(" set add_name="+"'"+pvo.getAdd_name()   +"'");
	         sql.append(",add_gender="  +"'"+pvo.getAdd_gender() +"'");
	         sql.append(",add_birth="   +"'"+pvo.getAdd_birth()  +"'");
	         sql.append(",add_contact=" +"'"+pvo.getAdd_contact()+"'");
	         sql.append(",add_email="   +"'"+pvo.getAdd_email()  +"'");
	         sql.append(",add_address=" +"'"+pvo.getAdd_address()+"'");
	         sql.append(",add_group="   +"'"+pvo.getAdd_group()  +"'");
	         sql.append(",add_note="    +"'"+pvo.getAdd_note()   +"'");
	         sql.append(" where seq_no=" +pvo.getSeq_no());
	         
	         System.out.println(sql);
	         
	         stmt = con.prepareStatement(sql.toString()); // 전령클래스 로딩해주는 문장
	         
	         rs = stmt.executeUpdate(sql.toString());
	         if(rs == 1)
	         {
	        	 System.out.println("수정성공");
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
