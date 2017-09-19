package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.controller.AddressController;
import com.vo.AddressBookVO;

public class AddLogic {
   public static final String _DRIVER = "oracle.jdbc.driver.OracleDriver";
   public static final String _URL = "jdbc:oracle:thin:@127.0.0.1:1521:orcl11";
   public static final String _USER = "scott";
   public static final String _PW = "tiger";
   AddressBookVO dvo = null;
   
   public AddressBookVO insertAddress(AddressBookVO pvo) {
	   AddressController ac = new AddressController();
       Connection con = null;
       PreparedStatement stmt = null;
       int rs = 0;
       StringBuilder sql= new StringBuilder();
       
       try {
           Class.forName(_DRIVER);
           con = DriverManager.getConnection(_URL, _USER, _PW);
               
           dvo = new AddressBookVO();
               
           sql.append("INSERT INTO address_book(seq_no,add_name, add_gender, add_birth, add_contact, add_email, add_address, add_group, add_note)"); 
           sql.append("VALUES(add_sq.nextval, ");
           sql.append("'"+pvo.getAdd_name()+"',");
           sql.append("'"+pvo.getAdd_gender()+"',");
           sql.append("'"+pvo.getAdd_birth()+"',");
           sql.append("'"+pvo.getAdd_contact()+"',");
           sql.append("'"+pvo.getAdd_email()+"',");
           sql.append("'"+pvo.getAdd_address()+"',");
           sql.append("'"+pvo.getAdd_group()+"',");
           sql.append("'"+pvo.getAdd_note()+"')");
             
           System.out.println(sql);
               
           stmt = con.prepareStatement(sql.toString()); // 전령클래스 로딩해주는 문장
               
           rs = stmt.executeUpdate(sql.toString());
           if(rs == 1)
           {
              System.out.println("입력 성공");
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