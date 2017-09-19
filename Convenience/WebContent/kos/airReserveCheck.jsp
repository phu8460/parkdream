<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import = "java.util.Map, java.util.List, java.util.HashMap, java.util.ArrayList" %>
<%@page import="java.util.StringTokenizer"%>
<%
	List<Map<String,Object>> airOrderList = new ArrayList<Map<String,Object>>();
	if(request.getAttribute("airOrderList")!=null){
		airOrderList=(List<Map<String,Object>>)request.getAttribute("airOrderList");
	}
	StringTokenizer st = new StringTokenizer(airOrderList.get(0).get("AIR_STARTINGPOINT_TIME").toString(), "/");
	String start_date = st.nextToken();
	String start_time = st.nextToken();
	st = new StringTokenizer(airOrderList.get(0).get("AIR_DESTINATION_TIME").toString(), "/");
	String end_date = st.nextToken();
	String end_time = st.nextToken();
%>
<html>
<head>
<title>���� & ���� (��ȸ)</title>
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
		<div>
			<ul class="actions vertical">
				<li><a href="login.jsp" class="button big fit">Log In</a></li>
			</ul>
		</div>
		<!-- ---------- ȸ�� �α��� �� ---------- -->
		<!-- ---------- �޴��� ���� ---------- -->
		<div>
			<ul class="links">
				<li>
					<a href="edit.jsp"><h3>ȸ�� ����</h3><p>���� & Ż��</p></a>
				</li>
				<li>
					<a href="reserve.jsp"><h3>���� & ���� ��Ȳ</h3><p>��ǰ���� ��Ȳ</p></a>
				</li>
				<li>
					<a href="cart.jsp"><h3>��ٱ���</h3><p>���س��� ����</p></a>
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
		<!-- -------------------- �ߴ� ���� ���� �� ���� -------------------- -->
		<div class="table-responsive">
			<!-- ---------- ������ ���� ���� ---------- -->
			<label style="font-size:x-large;">������ ����</label>
			<table class="table table-bordered">
				<tr>
					<td align="center" colspan="2" style="font-size:large;">�ֹ� ��ȣ  <%=airOrderList.get(0).get("AIR_PNO") %></td>
				</tr>
				<tr>
					<td align="center" style="width:50%;font-size:large;">�� �� / �ѱ� : <%=airOrderList.get(0).get("AIR_KNAME") %></td>
					<td align="center" style="width:50%;font-size:large;">�� �� / ���� : <%=airOrderList.get(0).get("AIR_ENAME") %></td>
				</tr>
				<tr>
					<td align="center" style="width:50%;font-size:large;">������� : <%=airOrderList.get(0).get("AIR_BIRTH") %></td>
					<td align="center" style="width:50%;font-size:large;">�� �� ó : <%=airOrderList.get(0).get("AIR_CONTACT") %></td>
				</tr>
				<tr>
					<td align="center" style="width:50%;font-size:large;">�� �� �� : <%=airOrderList.get(0).get("AIR_EMAIL") %></td>
					<td align="center" style="width:50%;font-size:large;">��û ���� : <%=airOrderList.get(0).get("AIR_REQUEST") %></td>
				</tr>
			</table>
			<div class="page-header">
				<label class="text-danger" style="font-size:x-large;">�ذ��� ���ѳ� ���� ���� ������� �ڵ���� �˴ϴ�.</label>
			</div>
			<!-- ---------- ������ ���� �� ---------- -->
			
			<!-- ---------- �װ� ������ ���� ���� ---------- -->
			<label style="font-size:x-large;">�װ� ������ & ���� ����</label>
			<label class="text-info" style="font-size:large;">���� ���� : <%=airOrderList.get(0).get("AIR_STARTINGPOINT") %> >>> <%=airOrderList.get(0).get("AIR_DESTINATION") %></label>
			<table class="table table-bordered">
				<tr>
					<td align="center" style="width:25%;font-size:large;">�װ� ����</td>
					<td align="center" style="width:25%;font-size:large;">�ο���</td>
					<td align="center" style="width:25%;font-size:large;">�������� �ݾ�</td>
					<td align="center" style="width:25%;font-size:large;">���� ����</td>
				</tr>
				<tr>
					<td align="center" style="width:25%;font-size:large;"><%=airOrderList.get(0).get("AIR_NAME") %></td>
					<td align="center" style="width:25%;font-size:large;"><%=airOrderList.get(0).get("AIR_QUANTITY") %>(��)</td>
					<td align="center" style="width:25%;font-size:large;"><%=airOrderList.get(0).get("AIR_PRICE").toString().trim() %> ��</td>
					<td align="center" style="width:25%;font-size:large;">���� �Ϸ�</td>
				</tr>
			</table>
			<div class="page-header">
				<label class="text-success" style="font-size:large;">��� ��¥ : <%=end_date %> / ��� �ð� : <%=end_time %> / �ҿ� �ð� : <%=airOrderList.get(0).get("AIR_TIME") %>�ð�</label>
			</div>
			<!-- --------------------------------------------------------------------------------------------------- -->
			<label class="text-info" style="font-size:large;">���� ���� : <%=airOrderList.get(0).get("AIR_DESTINATION") %> >>> <%=airOrderList.get(0).get("AIR_STARTINGPOINT") %></label>
			<table class="table table-bordered">
				<tr>
					<td align="center" style="width:25%;font-size:large;">�װ� ����</td>
					<td align="center" style="width:25%;font-size:large;">�ο���</td>
					<td align="center" style="width:25%;font-size:large;">�������� �ݾ�</td>
					<td align="center" style="width:25%;font-size:large;">���� ����</td>
				</tr>
				<tr>
					<td align="center" style="width:25%;font-size:large;"><%=airOrderList.get(0).get("AIR_NAME") %></td>
					<td align="center" style="width:25%;font-size:large;"><%=airOrderList.get(0).get("AIR_QUANTITY") %>(��)</td>
					<td align="center" style="width:25%;font-size:large;"><%=airOrderList.get(0).get("AIR_PRICE").toString().trim() %> ��</td>
					<td align="center" style="width:25%;font-size:large;">���� �Ϸ�</td>
				</tr>
			</table>
			<div class="page-header">
				<label class="text-success" style="font-size:large;">��� ��¥ : <%=end_date %> / ��� �ð� : <%=end_time %> / �ҿ� �ð� : <%=airOrderList.get(0).get("AIR_TIME") %>�ð�</label>
			</div>
			<!-- ---------- �װ� ������ ���� �� ---------- -->
			<!-- ---------- ���� ȭ�� ���ư��� ��ư ���� ---------- -->
			<p align="center">
				<a href="main.jsp"><button class="btn btn-large btn-block" type="button" style="font-size:large;">���� ȭ�� ���ư���</button></a>
			</p>
			<!-- ---------- ���� ȭ�� ���ư��� ��ư �� ---------- -->
		</div>
		<!-- -------------------- �ߴ� ���� ���� �� �� -------------------- -->
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
