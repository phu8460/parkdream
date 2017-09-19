<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.Map, java.util.HashMap, java.util.List, java.util.ArrayList, kos.util.KoreanConversion, java.text.*" %>
<%
Map<String,Object> mem_info= new HashMap<String,Object>();
if(session.getAttribute("result")!=null){
	mem_info = (Map<String,Object>)session.getAttribute("result");
}
%>
<html>
<head>
<title>ȣ�� ����(����) ������</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="../css/BuyCss/bootstrap.css" />
<link rel="stylesheet" href="../css/BuyCss/bootstrap.min.css" />
<link rel="stylesheet" href="../css/BuyCss/main.css" />
<link rel="stylesheet" href="../css/BuyCss/buy.css" />
<link rel="stylesheet" href="../css/BuyCss/font-awesome/css/font-awesome.css" />
<link rel="stylesheet" href="../css/BuyCss/font-awesome/css/font-awesome.min.css" />

<!-- Scripts -->
<script src="../css/BuyCss/js/jquery.min.js"></script>
<script type="text/javascript" src="../css/BuyCss/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../css/BuyCss/js/bootstrap.js"></script>
<script src="../css/BuyCss/js/skel.min.js"></script>
<script src="../css/BuyCss/js/util.js"></script>
<script src="../css/BuyCss/js/main.js"></script>
<script src="../css/BuyCss/js/buy.js"></script>
<script src="../css/BuyCss/js/comment.js"></script>
<script type="text/javascript">
	function doReservation(){
		var accept = $('input[name=radio1]:checked').val();
		alert(accept);
		if(accept=="ok"){
		var hotel_rname = $("#booker").val();
		var total_price="<%= NumberFormat.getInstance().format(Integer.parseInt(request.getParameter("total_price"))) %>";
		var hp1 = $("#hp1").val();
		var hp2 = $("#hp2").val();
		var hp3 = $("#hp3").val();
		var hp = hp1+"-"+hp2+"-"+hp3;
		var mail1=$("#mail1").val();
		var mail2=$("#mail2").val();
		var mail = mail1+"@"+mail2;
		var phone1 = $("#phone1").val();
		var phone2 = $("#phone2").val();
		var phone3 = $("#phone3").val();
		var ephone = phone1+"-"+phone2+"-"+phone3;
		var user_id = "<%=mem_info.get("USER_ID") %>";
		var hotel_pno = <%=request.getParameter("hotel_pno") %>;
		//alert(hotel_rname+", "+total_price+", "+hp+", "+mail+", "+ephone+", "+user_id+", "+hotel_pno);
		location.href="./reservationIns.kos?hotel_rname="+hotel_rname+"&total_price="+total_price+"&hp="+hp+"&mail="+mail+"&ephone="+ephone+"&user_id="+user_id+"&hotel_pno="+hotel_pno;
		}else{
			alert("����� ���� ���ֽʽÿ�.");
		}
	}
	
	function acceptChoice(){
		
	}
</script> 
</head>
<body>
<!-- ------------------------------ ��ü ���� �� ���� ------------------------------ -->
<div class="wrapper">
<!-- ---------- ��� �޴� �� ���� ---------- -->
<header id="header">
	<h1><a href="./main.jsp">convenience</a></h1>
	<div class="links dropdown">
		<ul>
			<li><a href="./main.jsp">HOME</a></li>
			<li><a href="./getAirList.kos">AIRPLANE</a></li>
			<li><a href="./getCarList.kos">CAR RENTAL</a></li>
			<li><a href="./getHotelList.kos">HOTEL</a></li>
			<li><a href="./getBoardList.kos">BOARD</a></li>
		</ul>
	</div>
		
	<!-- ---------- ��� �޴� �� ���� (������ �˻� & ȸ������ & �޴�) --------- -->
	<div class="main">
		<ul>
			<li class="search"><a class="fa-search" href="#search">�˻�</a>
				<form id="search" method="get" action="#">
					<input type="text" name="query" placeholder="�˻�" style="margin-top: 10px" />
				</form></li>
			<li class="menu"><a class="fa-bars" href="#menu">�޴�</a></li>
		</ul>
	</div>
	<!-- ---------- ��� �޴� �� �� (������ �˻� & ȸ������ & �޴�) --------- -->
		
	<!-- ---------- (������ �˻� & ȸ������ & �޴�) ���� ---------- -->
	<div id="menu">
		<!-- ---------- ȸ�� �α��� ���� ---------- -->
		<%
      if(session.getAttribute("result")!=null){
      //Map<String,Object> rMap = (Map<String,Object>) session.getAttribute("result");
     %>
                     <div>
                        <ul class="actions vertical">
                           <li><%=mem_info.get("USER_NAME")%>�� ȯ���մϴ�.</li>
                        </ul>
                        <ul class="actions vertical">
                           <li>
                           <a href="./logout.kos"class="button big fit">Log Out</a></li>
                        </ul>
                     </div>
   <% } else{%>
                     <div>
                        <ul class="actions vertical">
                           <li><a href="login.jsp" class="button big fit">Log In</a></li>
                        </ul>
                     </div>
   <% } %>
                  <!-- ȸ���α��γ� -->

                  <!-- Links -->
                     <div>
                        <ul class="links">
                     <%
                        if(session.getAttribute("result")!=null){
                     %>         
                           <li>
                              <a href="edit.jsp">
                                 <h3>ȸ�� ����</h3>
                                 <p>���� & Ż��</p>
                              </a>
                           </li>
                           <li><a href="#">
                                 <h3>�ֹ� ��Ȳ</h3>
                                 <p>�ֹ� ����</p>
                           </a></li>
                           <% } else { %>
                           <li>
                           <a href="login.jsp?command=open">
                                 <h3>ȸ������</h3>
                           </a></li>
                     <% } %>                           
                           <li>
                              <a href="cart.jsp">
                                 <h3>��ٱ���</h3>
                                 <p>���س��� ����</p>
                              </a>
                           </li>
                        </ul>
                     </div>
		<!-- ---------- �޴��� �� ---------- -->
	</div>
	<!-- ---------- (������ �˻� & ȸ������ & �޴�) �� ---------- -->
</header>
<!-- ---------- ��� �޴� �� �� ---------- -->

<!-- -------------------- �ߴ� ���� ���Ժ� ���� -------------------- -->
<div class="main">
<div class="content-wrapper">
	<div class="post">
		<div class="container-fluid">
			<!-- ---------- �װ� ������ ���� ���� ---------- -->
			<h1>ȣ�� ���� ����</h1>
			<table class="table table-bordered">
				<tr>
					<th colspan="2"><b>���� ����</b></th>
				</tr>
				<tr>
					<td style="width:20%;">ȣ�ڸ�</td>
					<td style="width:80%;"><%=request.getParameter("hotel_name") %></td>
				</tr>
				<tr>
					<td style="width:20%;">�������</td>
					<td style="width:80%;">��⿹��</td>
				</tr>
				<tr>
					<td style="width:20%;">�����Ⱓ</td>
					<td style="width:80%;"><%=KoreanConversion.toKor(request.getParameter("hotel_sdate")) %> ~ <%=KoreanConversion.toKor(request.getParameter("hotel_edate")) %></td>
				</tr>
			</table>
			<br>
			
			<table class="table table-bordered">
				<tr>
					<td colspan="2"><b>�������</b></td>
				</tr>
				<tr>
					<td style="width:20%;">���ǿ��</td>
					<td style="width:80%;"><%=KoreanConversion.toKor(request.getParameter("hotel_price")) %>��</td>
				</tr>
				<tr>
					<td style="width:20%;">����հ�</td>
					<td style="width:80%;"><%= NumberFormat.getInstance().format(Integer.parseInt(request.getParameter("total_price"))) %>��</td>
				</tr>
			</table>
			
			<table class="table table-bordered">
				<tr>
					<td colspan="4"><b>������ ����</b></td>
				</tr>
				<tr>
					<td style="width:15%">�����ڸ�</td>
					<td style="width:35%">
						<input type="text" id="booker" name="booker" style="width:200px;height:30px">
					</td>
					<td style="width:15%">�޴�����ȣ</td>
					<td style="width:35%">
						<div class="row">
						  <div class="col-xs-4">
						    <select class="form-control" id="hp1" style="width:80px">
									<option>010</option>
									<option>011</option>
									<option>016</option>
									<option>017</option>
									<option>019</option>
							</select>
						  </div>
						  <div class="col-xs-3">
						    <input type="text" id="hp2" class="form-control">
						  </div>
						  <div class="col-xs-3">
						    <input type="text" id="hp3" class="form-control">
						  </div>
						</div>
					</td>
				</tr>
				<tr>
					<td style="width:15%">�̸���</td>
					<td style="width:35%">
						<div class="row">
						  <div class="col-xs-5">
						    <input type="text" id="mail1" class="form-control">
						  </div>
						  <div class="col-xs-1">
						  	@
						  </div>
						  <div class="col-xs-5">
						    <input type="text" id="mail2" class="form-control">
						  </div>
						</div>
					</td>
					<td style="width:15%">��󿬶�ó</td>
					<td style="width:35%">
						<div class="row">
						  <div class="col-xs-3">
						    <input type="text" id="phone1" class="form-control">
						  </div>
						  <div class="col-xs-3">
						    <input type="text" id="phone2" class="form-control">
						  </div>
						  <div class="col-xs-3">
						    <input type="text" id="phone3" class="form-control">
						  </div>
						</div>
						</div>
					</td>
				</tr>
			</table>
			<!-- ---------- ���� ���� ���� ---------- -->
			<table class="table table-bordered">
				<tr>
					<td><b>�̿��������</b></td>
				</tr>
				<tr>
					<td align="center"><img src="../images/payment_HOTEL.jpg" class="img-responsive" alt="Responsive image"></td>
				</tr>
			</table>
					<div class="checks small" align="center">
						<input type="radio" id="radio1" name="radio1" checked="checked" value="ok">
						<label for="radio1">������</label>
						<input type="radio" id="radio2" name="radio1" value="no">
						<label for="radio2">�������� ����</label>
					</div>
			<!-- ---------- ���� ���� �� ---------- -->
			<br>
			<!-- ---------- ���� & ��� ��ư ���� ---------- -->
			<p align="center">
				<!-- <input type="button" class="btn btn-success active" value="�����ϱ�" onclick="doReservation()"> -->
				<a href="#"><button class="btn btn-default btn-lg" type="button" onclick="doReservation()">���� �ϱ�</button></a>
				<a href="main.jsp"><button class="btn btn-default btn-lg" type="button">��� �ϱ�</button></a>
			</p>
			<!-- ---------- ���� & ��� ��ư ���� ---------- -->
		</div>
	</div>
</div>
</div>
<!-- -------------------- �ߴ� ���� ���Ժ� �� -------------------- -->

<!-- ---------- �ϴ� �޴� ���� ---------- -->
<footer>
	<div id="footer" style="text-align: center">
		<ul class="icons">
			<li>
				<a href="https://twitter.com/" class="fa-twitter" target="_blank"><span class="label">Twitter</span></a>
			</li>
			<li>
				<a href="https://www.facebook.com/" class="fa-facebook" target="_blank"><span class="label">Facebook</span></a>
			</li>
			<li>
				<a href="https://www.instagram.com/" class="fa-instagram" target="_blank"><span class="label">Instagram</span></a>
			</li>
			<li>
				<a href="https://www.google.co.kr/" class="fa-google" target="_blank"><span class="label">Google</span></a>
			</li>
		</ul>
		<p class="copyright">
			&copy; Copyright. <a href="http://www.ikosmo.co.kr/" target="_blank">KOSMO</a>.
		</p>
	</div>
</footer>
<!-- ---------- �ϴ� �޴� �� ---------- -->
</div>
<!-- ------------------------------ ��ü ���� �� �� ------------------------------ -->
</body>
</html>