<%@ include file="./dbConnection.jsp"%> <!--dbConnection 파일을 불러오는 부분-->
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("EUC-KR");
   //아이디에 로우 카운트수를 담을 변수
   int i = -1;
   
   //아이디 담을 변수
   String st_user_id = request.getParameter("text_id_chck");
   
   //아이디가 값이 있을때 만 아이디 중복 검사 설정
   if(st_user_id != "" && st_user_id != null) {
      i = 0;
      sql  = "SELECT id FROM p_mem";
      sql += " WHERE id='"+st_user_id+"'";
      stmt=con.createStatement();
      rs=stmt.executeQuery(sql);
      while(rs.next()) {
         i++;
      }
      if(rs != null)rs.close(); //값이 들어있으면 연결을 끊는다.
      if(stmt != null)stmt.close(); //값이 들어있으면 연결을 끊는다.
      if(con != null)con.close(); //값이 들어있으면 연결을 끊는다
   }
   
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>아이디 중복 검사</title>
<script type="text/javascript" src="../js/jquery-1.11.1.js"></script>
<script type="text/javascript">

    //i에 담긴 로우의 값을 x변수에 담아 아이디 중복여부를 확인
   function user_id_chck() {
      var x = <%=i%>;
      if(x==-1) {
         document.getElementById("sp_id_chxk").innerHTML="아이디 중복 검사를 하시기 바랍니다."
      }
      else if(x==0) {
         document.getElementById("sp_id_chxk").innerHTML="사용가능한 아이디 입니다. ^_^v";
      }
      else if(x>=1) {
         document.getElementById("sp_id_chxk").innerHTML="사용중인 아이디 입니다. X_X;;";
      }
   }
    
    //중복검사 클릭이 아이디 텍스트 박스가 공백이면 문구 출력
    function sb_user_id() {
       var i = $("#text_id_chck").val();
       if(i=="") {
          alert("아이디 입력 을 하시기 바랍니다.");
       }
    }
    
    //중복 검사된 아이디 값 넘기기(회원가입 창으로)
    function id_chck_ok() {
       var x = <%=i%>;
       if(x==0) {
         opener.document.getElementById("text_user_id").value = $("#hid_Searchtxt").val();
         window.close();
      }
       else {
          alert("중복 검사를 다시 하시기 바랍니다..");
          return;
       }
    }
    
</script>
</head>
<body onload="user_id_chck()">
<form method="post" action="./chatUserID.jsp">
   <table border="0" style="width:430px; height:133px" bgcolor="#FFEBFE">
      <tr>
         <td align="center">
            <input type="text" id="text_id_chck" name="text_id_chck">
            <input type="submit" id="sb_id_chck" value="중복 검사" onclick="sb_user_id()" style="width:30%">
         </td>
      </tr>
      <tr>
         <td align="center"><span id="sp_id_chxk"></span></td>
      </tr>
      <tr>
         <td>
            <input type="button" value="아이디를 사용 하시겠 습니까?" style="width:100%; height:100%" onclick="id_chck_ok()">
            <input type="hidden" id="hid_Searchtxt" value="<%= st_user_id %>">
         </td>
      </tr>
   </table> 
</form>
<!--중복검사된 ID값을 불러서 ID텍스트 박스에 출력-->
<script type="text/javascript">
if($("#hid_Searchtxt").val() != "null"){
   $("#text_id_chck").val($("#hid_Searchtxt").val());   
}
</script>
</body>
</html>