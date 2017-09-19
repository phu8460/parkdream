<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.Map, java.util.HashMap, java.util.List, java.util.ArrayList, kos.util.KoreanConversion, java.text.*" %>
<%
Map<String,Object> mem_info= new HashMap<String,Object>();
if(session.getAttribute("result")!=null){
	mem_info = (Map<String,Object>)session.getAttribute("result");
}
List<Map<String, Object>> reserveList = new ArrayList<Map<String,Object>>();
Map<String, Object> reserveMap = new HashMap<String, Object>();
if(reserveList != null){
	reserveList = (List<Map<String, Object>>) request.getAttribute("reserveList");
}
if(reserveList.size()>0){
	reserveMap = reserveList.get(0);
}
out.print(reserveList.size());
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
			<!-- ---------- �װ� ������ ���� ���� ---------- -->
			<h1>ȣ�� ���� ����</h1>
			<%if(reserveList.size()>0){ %>
			<table class="table table-bordered">
				<tr>
					<th colspan="2"><b>���� ����</b></th>
				</tr>
				<tr>
					<td style="width:20%;">ȣ�ڸ�</td>
					<td style="width:80%;"><%=reserveMap.get("HOTEL_NAME") %></td>
				</tr>
				<tr>
					<td style="width:20%;">�����Ⱓ</td>
					<td style="width:80%;"><%=reserveMap.get("HOTEL_SDATE") %> ~ <%=reserveMap.get("HOTEL_EDATE") %></td>
				</tr>
				<tr>
					<td style="width:20%;">ȣ�� �ּ�</td>
					<td style="width:80%;"><%=reserveMap.get("HOTEL_ADDRESS") %></td>
				</tr>
			</table>
			<br>
			
			<table class="table table-bordered">
				<tr>
					<td colspan="2"><b>�������</b></td>
				</tr>
				<tr>
					<td style="width:20%;">���� �ݾ�</td>
					<td style="width:80%;"><%=reserveMap.get("TOTAL_PRICE") %></td>
				</tr>
			</table>
			
			<table class="table table-bordered">
				<tr>
					<td colspan="4"><b>������ ����</b></td>
				</tr>
				<tr>
					<td style="width:15%">�����ڸ�</td>
					<td style="width:35%"><%=reserveMap.get("HOTEL_RNAME") %></td>
					<td style="width:15%">�޴�����ȣ</td>
					<td style="width:35%"><%=reserveMap.get("HOTEL_RHP1") %></td>
				</tr>
				<tr>
					<td style="width:15%">�̸���</td>
					<td style="width:35%"><%=reserveMap.get("HOTEL_REMAIL") %></td>
					<td style="width:15%">��󿬶�ó</td>
					<td style="width:35%"><%=reserveMap.get("HOTEL_RHP2") %></td>
				</tr>
			</table>
			<%} %>
			<br>
			
			<table class="table table-bordered">
				<tr>
					<td colspan="2"><b>���� ����</b></td>
				</tr>
				<tr>
					<td style="width:20%;">���� ����</td>
					<!-- ������ -->
					<td style="width:80%;"><font color="blue">���� �Ϸ�</font></td>
				</tr>
			</table>
			<br>
			
			<!-- ---------- ��ư ó�� ���� ---------- -->
			<p align="center">
				<a href="./main.jsp"><button class="btn btn-large btn-default btn-block" type="button" style="font-size:large;">���� ȭ��</button></a>
			</p>
			<!-- ---------- ��ư ó�� �� ---------- -->
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