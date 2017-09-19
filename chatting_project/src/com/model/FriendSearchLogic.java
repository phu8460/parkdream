package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.vo.FriendVO;

public class FriendSearchLogic {
	Connection        con       = null;
	PreparedStatement pstmt     = null;
	ResultSet         rs        = null;
	
	public FriendVO[] FriendSerach(FriendVO pvo) {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT id, pw, name, hp, address, gender, email, comments ");
		sql.append("  FROM P_MEM");
		sql.append(" ORDER BY id");
		FriendVO avos[] = null;
		
		try {
			Class.forName(DBConnectionMgr._DRIVER);
			con = DriverManager.getConnection(DBConnectionMgr._URL
											 ,DBConnectionMgr._USER
											 ,DBConnectionMgr._PW);
			pstmt = con.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			FriendVO avo = null;
			Vector v = new Vector();
			while(rs.next()){
				String gender=null;
				avo = new FriendVO();
				avo.setMyId(rs.getString("id"));
				avo.setPw(rs.getString("pw"));
				avo.setName(rs.getString("name"));
				avo.setHp(rs.getString("hp"));
				avo.setPw(rs.getString("pw"));
				avo.setAddress(rs.getString("address"));
				
				switch(rs.getString("gender")){
				case "M":
					gender="남성";
					break;
				case "Y":
					gender="여성";
					break;
				case "X":
					gender="선택안함";
					break;
				}
				avo.setGender(gender);
				
				avo.setEmail(rs.getString("email"));
				avo.setComments(rs.getString("comments"));
				v.add(avo);
			}
			avos = new FriendVO[v.size()];
			v.copyInto(avos);
			System.out.println("벡터크기:"+v.size());
		} catch (SQLException se) {
			System.out.println("[[query]]"+sql.toString());
		} catch (Exception e) {
			System.out.println(e.toString());
			e.printStackTrace();
		}
		return avos;
	}
}
