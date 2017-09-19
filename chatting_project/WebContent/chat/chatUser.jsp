<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>유저 회원가입</title>
<script type="text/javascript" src="../js/jquery-1.11.1.js"></script>
<script type="text/javascript">
   
   //유저 가입 버튼 이벤트 처리
   //온클릭버튼 이벤트 발생시 지정한 아이디값을 받아서 변수 선언한 아이디값에 담는다.
   //변수 선언한 아이디값은 location.href= 통하여 지정한 페이지에 파라미터값 을 넘김.
   //EX)location.href="./chatUserData.jsp후 ?를 단다.
   //왜? - ?표를 기준으로 왼쪽은 넘어갈 페이지 ?기준으로 오른쪽은 넘겨줄 값.
   function user_send() {
      //핸드폰 번호 담을 변수 설정
      var i = $("#text_user_hp1").val();
      var x = $("#text_user_hp2").val();
      
      //유저 정보 담을 변수 설정
      var user_id = $("#text_user_id").val();
      var user_pw = $("#text_user_pw").val();
      var user_pw2 = $("#text_user_pw_chck").val();
      var user_name = $("#text_user_name").val();
      var user_hp = $("#slt_user_hp option:selected").val()+"-"+
                    $("#text_user_hp1").val()+"-"+
                    $("#text_user_hp2").val();
      
      //성별 선택된 라디오 버튼값 가져오기
      var user_gender = $("input[name='rdo_gender']:checked").val();
      
      var user_address = $("#text_user_addr").val();
      var user_email = $("#text_user_email1").val()+"@"+$("#text_user_email2").val();
      
      //비밀번호 체크를 한다.
      if(user_pw != user_pw2) {
         alert("비밀번호 가 서로 일치 하지 않습니다.");
         $("#text_user_pw").val("");
         $("#text_user_pw_chck").val("");
         return;
      }
      
      //유저 가입시 빈공백 체크 (유효성검사)
      if(user_id==""||user_id=="ID는 15자 제한입니다.") {
         alert("아이디는 꼭 입력해 주세요");
         return;
      }
      if(user_pw=="") {
         alert("비밀번호는 꼭 입력해 주세요");
         return;
      }
      if(user_name==""||user_name=="이름 은 10자 제한입니다.") {
         alert("이름은 꼭 입력해 주세요");
         return;
      }
      if(i==""||x=="") {
         alert("핸드폰 번호는 꼭 입력해 주세요");
         return;
      }
      
      //user_send를 통하여 받은 값을 지정한 페이지에 파라미터 값으로 넘긴다. (get방식)
      /* location.href="./chatUserData.jsp?id="+user_id
                                   +"&pw="+user_pw
                                   +"&name="+user_name
                                   +"&hp="+user_hp
                                   +"&address="+user_address
                                   +"&gender="+user_gender
                                   +"&email="+user_email; */
   }
   
   //유저 취소 버튼 이벤트 처리
   function user_close() {
      window.close();
   }
   
   //마우스 클릭시 아이디&이름 공백설정
   function text_id(type) {
      if(type=="id") {
         $("#text_user_id").val("");
      }
      else if(type=="name") {
         $("#text_user_name").val("");
      }
      
   }
   //아이디&이름 텍스트 박스가 공백이면 문구 출력
   function id_clear(type) {
      if(type=="id"){
         var i = $("#text_user_id").val();
         if(i=="") {
            $("#text_user_id").val("ID는 15자 제한입니다.");
         }
      }
      else if(type=="name") {
         var i = $("#text_user_name").val();
         if(i=="") {
            $("#text_user_name").val("이름 은 10자 제한입니다.");
         }
      }
   }
   
   //유저 아이디 중복 검사 버튼 이벤트 처리
   function btn_user_id_popup() {
      window.open("./chatUserID.jsp","","left=1150,top=400,width=450,height=150");
   }
   
   //비밀번호 타입변환 (숨김처리)
   function pw_chck() {
      $("#text_user_pw").val("");
      $("#text_user_pw").attr("type","password");
   }
   
   //비밀번호 타입변환 (숨김처리) - 비밀번호 확인
   function pw_chck2() {
      $("#text_user_pw_chck").val("");
      $("#text_user_pw_chck").attr("type","password");
   }
   
   //비밀번호 공백체크 & 문구 출력
   function pw_clear() {
      var i = $("#text_user_pw").val();
      if(i=="") {
         $("#text_user_pw").attr("type","text");
         $("#text_user_pw").val("비밀번호 를 입력 하세요.");
      }
   }
   
   //비밀번호 공백체크 & 문구 출력 - 비밀번호 확인
   function pw_clear2() {
      var i = $("#text_user_pw_chck").val();
      if(i=="") {
         $("#text_user_pw_chck").attr("type","text");
         $("#text_user_pw_chck").val("한번더 비밀번호 를 입력 하세요.");
      }
   }
   
   //주소 클릭시 공백 설정
   function address_chck() {
      $("#text_user_addr").val("");
   }
   
   //주소 공백 체크 & 문구 출력
   function address_clear() {
      var i = $("#text_user_addr").val();
      if(i=="") {
         $("#text_user_addr").val("주소 를 입력 하세요.");
      }
   }
   
   //핸드폰에 사용할 번호체크(숫자만 입력가능)
   function hp_chck() {
      var i = $("#text_user_hp1").val();
      var x = $("#text_user_hp2").val();
      if(isNaN(i)==true) {
         alert("숫자만 입력 가능 합니다.");
         $("#text_user_hp1").val("");
      }
      if(isNaN(x)==true) {
         alert("숫자만 입력 가능 합니다.");
         $("#text_user_hp2").val("");
      }
   }
   
   //유저 이메일 선택시 텍스트 박스에 출력
   function email_chck() {
      var i = $("#slt_user_email option:selected").val();
      $("#text_user_email2").val(i);
   }
   
</script>
</head>
<body>
<form method="post" action="./chatUserData.jsp">
<table border="0" width="423px" bgcolor="#FFEBFE">
<!--      아 이 디         -->
   <tr>
      <td><font color="red">*&nbsp;</font>아이디</td>
      <td>
      <input type="text" id="text_user_id" name="text_user_id" maxlength="15" onclick="text_id('id')" value="ID는 15자 제한입니다." onblur="id_clear('id')">
      <input type="button" id="btn_user_id" value="중복 검사" onclick="btn_user_id_popup()">
      </td>
   </tr>
<!--      비 밀 번 호         -->
   <tr>
      <td><font color="red">*&nbsp;</font>비밀번호</td>
      <td><input type="text" size="25px" id="text_user_pw" name="text_user_pw" value="비밀번호 를 입력 하세요." onclick="pw_chck()" onblur="pw_clear()"></td>
   </tr>
<!--      비 밀 번 호   확 인         -->
   <tr>
      <td><font color="red">*&nbsp;</font>비밀번호 확인</td>
      <td><input type="text" size="25px" id="text_user_pw_chck" value="한번더 비밀번호 를 입력 하세요." onclick="pw_chck2()" onblur="pw_clear2()"></td>
   </tr>
<!--      이 름       -->
   <tr>
      <td><font color="red">*&nbsp;</font>이름</td>
      <td><input type="text" id="text_user_name" name="text_user_name" maxlength="10" onclick="text_id('name')" value="이름 은 10자 제한입니다." onblur="id_clear('name')"></td>
   </tr>
<!--      주 소       -->
   <tr>
      <td>주소</td>
      <td><input type="text" size="37px" id="text_user_addr" name="text_user_addr" onclick="address_chck()" value="주소 를 입력 하세요." onblur="address_clear()"></td>
   </tr>
<!--      핸 드 폰 번 호          -->
   <tr>
      <td><font color="red">*&nbsp;</font>핸드폰 번호</td>
      <td>
      <select id="slt_user_hp" name="slt_user_hp">
         <option value="010">010</option>
         <option value="011">011</option>
         <option value="016">016</option>
         <option value="019">019</option>
      </select>
      -
      <input type="text" id="text_user_hp1" name="text_user_hp1" size="5px" maxlength="4" onkeyup="hp_chck()">
      -
      <input type="text" id="text_user_hp2" name="text_user_hp2" size="5px" maxlength="4" onkeyup="hp_chck()">
      </td>
   </tr>
<!--      이 메 일           -->
   <tr>
      <td>이메일</td>
      <td>
      <input type="text" id="text_user_email1" name="text_user_email1" size="8px">
      @
      <input type="text" id="text_user_email2" name="text_user_email2" size="8px">
      <select id="slt_user_email" onchange="email_chck()">
         <option value="">직접입력</option>
         <option value="naver.com">네이버</option>
         <option value="daum.net">다음</option>
         <option value="hanmail.net">한메일</option>
         <option value="nate.com">네이트</option>
         <option value="gmail.com">지메일</option>
      </select>
      </td>
   </tr>
<!--      성 별        -->
   <tr>
      <td>성별</td>
      <td>
      <input type="radio" id="text_user_gd1" name="rdo_gender" value="M" >남성
      <input type="radio" id="text_user_gd2" name="rdo_gender" value="Y">여성
      <input type="radio" id="text_user_gd3" name="rdo_gender" value="X" checked="checked">선택안함
      </td>
   </tr>
   <tr>
      <td colspan="2" align="center">
      <input type="submit" id="btn_send" value="가입" onclick="user_send()" style="width:49%; height:100%">
      <input type="button" id="btn_colse" value="취소" onclick="user_close()" style="width:49%; height:100%">
      </td>
   </tr>
</table>
</form>
</body>
</html>