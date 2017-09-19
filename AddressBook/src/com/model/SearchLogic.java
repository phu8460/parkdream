package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

import com.controller.AddressController;
import com.vo.AddressBookVO;

public class SearchLogic {
	public static final String _DRIVER = "oracle.jdbc.driver.OracleDriver";
	public static final String _URL = "jdbc:oracle:thin:@127.0.0.1:1521:orcl11";
	public static final String _USER = "scott";
	public static final String _PW = "tiger";
	public String where = ""; // ����
	public String column = "";
	AddressController ac = new AddressController();
	
	public AddressBookVO selectAddress(AddressBookVO pvo) {
		  Connection con = null;
	      Statement stmt = null;
	      ResultSet rs = null;
	      StringBuilder sql= new StringBuilder();;
			
	      try {
	    	 Class.forName(_DRIVER);
	         con = DriverManager.getConnection(_URL, _USER, _PW);
	         
	         AddressBookVO dvo = null;
	         AddressBookVO dvos[] = null;

	         dvo = new AddressBookVO();
	         
	         
	         
	         switch(pvo.getCombo()){
	         case 0: column="add_name";    break;
	         case 1: column="add_gender";  break;
	         case 2: column="add_birth";   break;
	         case 3: column="add_contact"; break;
	         case 4: column="add_email";   break;
	         case 5: column="add_address"; break;
	         case 6: column="add_group";   break;
	         case 7: column="add_note";    break;
	         }
         

	         
	         if("".equals(pvo.getWhere()))
	         {
	        	 where="";
	         }
	         else{
	        	 where=" like '%"+pvo.getWhere()+"%'";
	         }
	         
	         String nul=null;
	         
	         if(pvo.getWhere()!=null)
	         {
	        	 sql.append("SELECT seq_no, add_name, add_gender, add_birth, add_contact, add_email, add_address, add_group, add_note FROM address_book");
	        	 sql.append(" where ");
	        	 sql.append(column);
	        	 sql.append(where);
	        	 sql.append(" order by add_name");
	         }
	         else{
	        	 sql.append("SELECT seq_no, add_name, add_gender, add_birth, add_contact, add_email, add_address, add_group, add_note FROM address_book order by add_name");
	         }
	         
	         System.out.println(sql);
	         
	         stmt = con.createStatement(); // ����Ŭ���� �ε����ִ� ����
	         rs = stmt.executeQuery(sql.toString());
	         Vector<AddressBookVO> v = new Vector<AddressBookVO>(); // �ڷᱸ�� - �����ֱ�, �߰����
	         while(rs.next()){ // Ŀ���� ���ϰ��� ���̴�? �� : ��ȸ����� �����մϴ�. �ƴϿ� : ��ȸ��� ����.
	            //System.out.println(rs.getString(1)); // ���� 1�� ù��°��
	            dvo = new AddressBookVO();
	            dvo.setAdd_name(rs.getString("add_name"));
	            dvo.setAdd_gender(rs.getString("add_gender"));
	            dvo.setAdd_birth(rs.getString("add_birth"));
	            dvo.setAdd_contact(rs.getString("add_contact"));
	            dvo.setAdd_email(rs.getString("add_email"));
	            dvo.setAdd_address(rs.getString("add_address"));
	            dvo.setAdd_group(rs.getString("add_group"));
	            dvo.setAdd_note(rs.getString("add_note"));
	            dvo.setSeq_no(rs.getInt("seq_no"));
	            // AddressBookVO �ȿ� ��������� ���� ��� �ڵ� ����
	            // �Ʒ� �ڵ�� ��ȸ�� �ο��� ������ŭ Vector �ڷᱸ���� ��� �ڵ�
	            v.add(dvo);
	            
	         }
	         dvos =  new AddressBookVO[v.size()];
	         // Vector�ȿ� ����ִ� dvo�� �ּҹ����� AddressBookVO[] �ȿ� �������ִ� �޼ҵ��Դϴ�.
	         v.copyInto(dvos);
	         dvo.setSelect(dvos);
		     pvo=dvo;
	      } catch (Exception e) {
	         System.out.println("�����߻� : " + e.toString());
	      }
	  
		return pvo;
	}

}
