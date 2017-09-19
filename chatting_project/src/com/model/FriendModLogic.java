package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.vo.FriendVO;

public class FriendModLogic {

		Connection con = null;
		PreparedStatement pstmt = null;
		
		public FriendVO insertFriend(FriendVO pvo) {
			System.out.println("FriendAddLogic insert 호출 성공");

			StringBuilder sql = new StringBuilder();
			sql.append("UPDATE p_MEM SET comments= ?");
			sql.append(" WHERE ID = ?");
			
			int result = 0;
			try {
				Class.forName(DBConnectionMgr._DRIVER);
				con = DriverManager.getConnection(DBConnectionMgr._URL
												 ,DBConnectionMgr._USER
												 ,DBConnectionMgr._PW);
				pstmt = con.prepareStatement(sql.toString());
				pstmt.setString(1, pvo.getComments());
				pstmt.setString(2, pvo.getMyId());
				result = pstmt.executeUpdate();
				if(result == 1){
					System.out.println("입력 성공");
				}
			} catch (ClassNotFoundException ce){
				System.out.println("드라이버 클래스를 못찾아요");
			} catch (SQLException se) {
				System.out.println(se.toString());
				System.out.println("[[query]]"+sql.toString());
			} catch(Exception e){
				e.printStackTrace();
			}
			return null;
		}
	}


