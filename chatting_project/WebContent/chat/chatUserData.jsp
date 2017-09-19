<%@ include file="./dbConnection.jsp"%> <!--dbConnection 파일을 불러오는 부분-->
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("EUC-KR");
   int i = 0;
   //아이디 담을 변수
   String st_user_id = request.getParameter("text_user_id");
   //비밀번호 담을 변수
   String st_user_pw = request.getParameter("text_user_pw");
   //이름 담을 변수
   String st_user_name = request.getParameter("text_user_name");
   //전화번호 담을 변수
   String st_user_hp1 = request.getParameter("slt_user_hp");
   String st_user_hp2 = request.getParameter("text_user_hp1");
   String st_user_hp3 = request.getParameter("text_user_hp2");
   String st_user_hp = st_user_hp1+"-"+st_user_hp2+"-"+st_user_hp3;
   //주소 담을 변수   
   String st_user_address = request.getParameter("text_user_addr");
   //성별 담을 변수
   String st_user_gender = request.getParameter("rdo_gender");
   //이메일 담을 변수
   String st_user_email1 = request.getParameter("text_user_email1");
   String st_user_email2 = request.getParameter("text_user_email2");
   String st_user_email = st_user_email1+"@"+st_user_email2;
   //비고 담을 변수 (공백 설정)
   String st_user_comments = "";
   
   try {
   sql = "INSERT INTO p_mem VALUES(";
   sql += " '"+st_user_id+"'";
   sql += ",'"+st_user_pw+"'";
   sql += ",'"+st_user_name+"'";
   sql += ",'"+st_user_hp+"'";
   sql += ",'"+st_user_address+"'";
   sql += ",'"+st_user_gender+"'";
   sql += ",'"+st_user_email+"'";
   sql += ",'"+st_user_comments+"')";
   
   stmt=con.createStatement();
   
   i = stmt.executeUpdate(sql);
   }
    catch (Exception e) {
       i = 0;
    }

   if(stmt != null)stmt.close(); //값이 들어있으면 연결을 끊는다.
   if(con != null)con.close(); //값이 들어있으면 연결을 끊는다
   
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>유저 회원가입 데이터 DB 연동</title>
<script type="text/javascript" src="../js/jquery-1.11.1.js"></script>
<script type="text/javascript">
   function user_createCheck() {
      var chck = <%=i%>;
      if(chck > 0) {
         alert("회원가입 을 축하 드립니다. ^^v~");
         window.close();
      }
      else {
         alert("회원가입 중 오류가 발생했습니다.. X_X;;");
         location.href="./chatUser.jsp";
      }
   }
</script>
</head>
<body onload="user_createCheck()">

</body>
</html>