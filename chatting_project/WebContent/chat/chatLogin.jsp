<%@ include file="./dbConnection.jsp"%> <!--dbConnection 파일을 불러오는 부분-->
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ page import="com.util.*" %>    
    
<%
   request.setCharacterEncoding("EUC-KR");

   //아이디 & 비밀번호 에 로우 카운트수를 담을 변수
   int i = -1;
   
   //아이디 & 비밀번호 담을 변수
   String st_user_id = request.getParameter("user_id");
   String st_user_pw = request.getParameter("user_pw");
   
   //아이디 & 비밀번호 가 값이 있을때 만 아이디 중복 검사 설정
   if(st_user_id != "" && st_user_id != null && st_user_pw != "" && st_user_pw != null) {
      i = 0;
      sql  = "SELECT id FROM p_mem";
      sql += " WHERE id = '"+st_user_id+"'";
      sql += " AND pw = '"+st_user_pw+"'";
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
<title>- KOSMO TALK -</title>
<script type="text/javascript" src="../js/jquery-1.11.1.js"></script>
<script type="text/javascript">

    //마우스 클릭시 아이디 공백설정
   function text_id() {
      $("#user_id").val("");
   }
    
   //아이디 공백 체크 & 문구 출력
    function id_clear() {
      var i = $("#user_id").val();
      if(i=="") {
         $("#user_id").val("아이디 를 입력 하세요.");
      }
   } 
   
   //로그인 시 아이디 비밀번호 체크 확인
   /* function id_onclick() {
      var id = $("#user_id").val();
      var pw = $("#user_pw").val();
      if(id==""||id=="아이디 를 입력 하세요.") {
         alert("아이디 를 입력 하세요.");
         return;
      }
      if(pw==""||pw=="비밀번호 를 입력 하세요.") {
         alert("비밀번호 를 입력 하세요.");
         return;
      }
      document.submit();
   } */
   
   //마우스 클릭시 비밀번호 공백설정 & 타입변경(숨김처리)
   function text_pw() {
      $("#user_pw").val("");
      $("#user_pw").attr("type","password");
   }
   
   //비밀번호 공백 체크 & 문구 출력
   function pw_clear() {
      var i = $("#user_pw").val();
      if(i=="") {
         $("#user_pw").attr("type","text");
         $("#user_pw").val("비밀번호 를 입력 하세요.");
      }
   }
   
   //유저 회원가입 이벤트 처리 (팝업창 부르기)
   function btn_crate_popup() {
      window.open("./chatUser.jsp","","left=700,top=400,width=440,height=255");
   }
   
   //로그인 처리 이벤트
   function user_id_pw_chck() {
      var x = <%=i%>
      if(x==0) {
         alert("아이디 또는 비밀번호 를 다시 확인하여 주세요.");
      }
      else if(x==1) {
    	  //  alert("성공");
    	  window.open('./login2.jsp?'+'id='+'<%=st_user_id%>'
 				 ,'new'
 				 ,'width=500 height=400');
      }
   }
   
</script>
</head>
<body onload="user_id_pw_chck()">
<form method="post" action="./chatLogin.jsp">
<!--      메인 영역 설정         -->
   <table border="0" width="100%" height="930px">      
      <tr> 
         <td align="center">
            <table border="0" width="1100px" height="550px"> <!--배경 화면 넣을 영역 사이즈-->
<!--      타이틀 영역      -->
               <tr height="50px">
                  <td><img src="../images/kosmokail.png"/></td>
               </tr>
<!--      배경 화면 영역         -->
               <tr height="350px">
                  <td>
                     <table border="0" background="../images/20170618.gif" style="background-repeat:no-repeat; background-size:1100px" width="1100px" height="550px">
                        <tr>
                           <td>
                           </td>
                        </tr>
                     </table>
                  </td>
               </tr>
<!--      로그인 박스 영역         -->
               <tr height="100px">
                  <td align="right" width="800px" >
                     <table border="0" width="300px" height="50px" aling="center">
                        <tr>
                           <td align="right" width="50px">
                              <img src="../images/ID.png"/>
                           </td>
<!--         아이디         -->
                           <td width="100px">
                              <input type="text" id="user_id" name="user_id" value="아이디 를 입력 하세요." onclick="text_id()" onblur="id_clear()"/>
                           </td>
<!--         로그인         -->
                           <td rowspan="2">
                              <input type="submit" value="로그인" onclick="id_onclick()" style="width:100%; height:100%">
                           </td>
                        </tr>
<!--         비밀번호         -->
                        <tr>
                           <td align="right" width="50px">
                              <img src="../images/PW.png"/>
                           </td>
                           <td>
                              <input type="text" id="user_pw" name="user_pw" value="비밀번호 를 입력 하세요." onclick="text_pw()" onblur="pw_clear()"/>
                           </td>                        
                        </tr>
<!--      회원가입 , 아이디 찾기 , 비밀번호 찾기      -->
                        <tr height="25px">
                           <td colspan="3" align="right" width="300px">
                              <input type="button" id="btn_user_crate" value="회원가입" style="width:30%; height:100%" onclick="btn_crate_popup()">
                              <input type="button" value="ID 찾기" style="width:30%; height:100%">
                              <input type="button" value="PW 찾기" style="width:30%; height:100%">
                           </td>
                        </tr>
                     </table>
                  </td>
               </tr>            
            </table>
         </td>
      </tr>      
   </table>
</form>
</body>
</html>