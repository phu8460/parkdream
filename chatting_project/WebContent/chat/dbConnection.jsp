<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%
   String   db_driver = "oracle.jdbc.driver.OracleDriver"; //오라클 연결 드라이버 설정
   String      db_url = "jdbc:oracle:thin:@127.0.0.1:1521:orcl11"; //연결 주소 설정
   String     db_user = "scott"; //접속 아이디 설정
   String db_password = "tiger"; //접속 비밀번호 설정
   
   Connection con = null;
   Statement  stmt= null;
   ResultSet   rs = null;
   String     sql = null;
   
   try {
      Class.forName(db_driver);
      con = DriverManager.getConnection(db_url, db_user, db_password);
   }
   catch(SQLException se) {
      out.print(se);
   }
%>