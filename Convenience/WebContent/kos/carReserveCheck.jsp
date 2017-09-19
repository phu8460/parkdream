<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import = "java.util.List, java.util.Map" %>
<%@ page import="java.util.StringTokenizer"%>
<%
	List<Map<String,Object>> carOrderList = null;
	String start_date = "";
	String start_time = "";
	String end_date = "";
	String end_time = "";
	if(request.getAttribute("carOrderList")!=null){
		carOrderList = (List<Map<String,Object>>)request.getAttribute("carOrderList");	
		StringTokenizer st = new StringTokenizer(carOrderList.get(0).get("RENT_TAKE").toString(),"/");
		start_date = st.nextToken();
		start_time = st.nextToken();
		st = new StringTokenizer(carOrderList.get(0).get("RENT_RETURN").toString(),"/");
		end_date = st.nextToken();
		end_time = st.nextToken();
	}
%>
<html>
<head>
<title>CAR RENTAL ���� Ȯ��</title>
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
					<a href="#"><h3>��� ��Ȳ</h3><p>������� ��ǰ ����</p></a>
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
		<!-- ---------- ��Żī Ȯ�� ���� ---------- -->
		<table>
			<tr>
				<td align="center" style="font-size:x-large;color:blue;">�ֹ���ȣ</td>
				<td colspan="3"><input type="text" disabled="disabled" value="<%=carOrderList.get(0).get("RENT_PNO")%>"></td>
			</tr>
			<tr>
			<tr>
				<td align="center" style="font-size:x-large;color:blue;">��Żī ��ü</td>
				<td colspan="3"><input type="text" disabled="disabled" value="<%=carOrderList.get(0).get("RENT_NAME")%>"></td>
			</tr>
			<tr>
				<td align="center" style="font-size:x-large;color:blue;">�� Ż ī</td>
				<td colspan="3"><input type="text" disabled="disabled" value="<%=carOrderList.get(0).get("RENT_KIND")%>"></td>
			</tr>
			<tr>
				<td align="center" style="width:17%;font-size:x-large;color:blue;">�μ� ��¥</td>
				<td style="width:33%"><input type="text" disabled="disabled" value="<%=start_date%>"></td>
				<td align="center" style="width:17%;font-size:x-large;color:blue;">�μ� �ð�</td>
				<td style="width:33%"><input type="text" disabled="disabled" value="<%=start_time%>"></td>
			</tr>
			<tr>
				<td align="center" style="width:17%;font-size:x-large;color:blue;">�ݳ� ��¥</td>
				<td style="width:33%"><input type="text" disabled="disabled" value="<%=end_date%>"></td>
				<td align="center" style="width:17%;font-size:x-large;color:blue;">�ݳ� �ð�</td>
				<td style="width:33%"><input type="text" disabled="disabled" value="<%=end_time%>"></td>
			</tr>
			<tr>
				<td align="center" style="font-size:x-large;color:blue;">��û����</td>
				<td colspan="3"><input type="text" disabled="disabled" value="<%=carOrderList.get(0).get("RENT_REQUEST")%>"></td>
			</tr>
			<tr>
				<td align="center" style="width:17%;font-size:x-large;color:blue;">�� ��</td>
				<td style="width:33%"><input type="text" disabled="disabled" value="<%=carOrderList.get(0).get("RENT_TPRICE").toString().trim()%>"></td>
				<td>��</td>
				<td style="width:33%;font-size:x-large;color:red;">(���� ���� ���� - ���� ����)</td>
			</tr>
		</table>
		<!-- ---------- ��Żī Ȯ�� �� ---------- -->
		<div class="page-header" align="center">
				<label class="text-danger" style="font-size:x-large;">�ع��� ����(�ٹ� �ð��� ���� ��û ����)�� ��� �ݾ��� ������ �ΰ� �˴ϴ�.</label>
		</div>
		<!-- ---------- ������ ���� ---------- -->
<!-- 		<table>
			<tr>
				<td align="center" style="font-size:x-large;color:blue;">������ ��</td>
				<td><input type="text" disabled="disabled"></td>
				<td align="center" style="font-size:x-large;color:blue;">�μ� , �ݳ�</td>
				<td><input type="text" value="��Żī (�繫��)" disabled="disabled"></td>
			</tr>
			<tr>
				<td align="center" style="font-size:x-large;color:blue;">��ȭ ��ȣ 1</td>
				<td><input type="text" disabled="disabled"></td>
				<td align="center" style="font-size:x-large;color:blue;">��ȭ ��ȣ 2</td>
				<td><input type="text" disabled="disabled"></td>
			</tr>
			<tr>
				<td align="center" style="font-size:x-large;color:blue;">��Ÿ ��û</td>
				<td colspan="3"><input type="text" disabled="disabled"></td>
			</tr>
			<tr>
				<td align="center" style="font-size:x-large;color:blue;">������ ����</td>
				<td><input type="text" disabled="disabled"></td>
				<td colspan="2"></td> ����� ó����
			</tr>
		</table> -->
		<!-- ---------- ������ �� ---------- -->
		<div class="page-header" align="center">
			<label class="text-danger" style="font-size:x-large;">�������ɷ�Ʈī�� ����. ��21���̸�, ������� 1������ �뿩�Ұ���.</label>
			<label class="text-danger" style="font-size:x-large;"><< ���� >> �Ϸ� Ȯ��</label>
		</div>
		<!-- ---------- ��ư ó�� ���� ---------- -->
		<p align="center">
			<a href="./main.jsp"><button class="btn btn-large btn-default btn-block" type="button" style="font-size:large;">���� ȭ��</button></a>
		</p>
		<!-- ---------- ��ư ó�� �� ---------- -->
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
