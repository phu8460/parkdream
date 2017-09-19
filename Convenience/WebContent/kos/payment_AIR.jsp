<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import = "java.util.Map" %>
<%
	Map<String,Object> mem_info = (Map<String,Object>)session.getAttribute("result");
    Map<String,Object> air_info = (Map<String,Object>)request.getAttribute("airInfo");
%>
<html>
<head>
<title>�װ� ����(����) ������</title>
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
	function setReq(){
		$("#req").attr('value','');
	}
	function airReserve(){
		if($("#air_gender").val() == '' || $("#air_kname").val() == ''
			|| $("#req").val() == ''	|| $("#air_ename").val() == ''
			|| $("#air_contact").val() == '' || $("#air_mail").val() == ''
			|| $("#air_birth").val() == ''){
			
			alert("��� �Է��� �ּ���");
			return;
		}
		
		$("#f_air").attr("method","post");
		$("#f_air").attr("action","./airOrder.kos");
		$("#f_air").submit();
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
							<input type="text" name="query" placeholder="�˻�"
								style="margin-top: 10px" />
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
			<div class="table-responsive">
			<!-- ---------- �װ� ������ ���� ���� ---------- -->
			<form id="f_air">
			<input type="hidden" name="air_tprice" value="<%=air_info.get("total") %>">
			<input type="hidden" name="air_no" value="<%=air_info.get("air_no")%>">
			<table class="table table-bordered">
				<tr>
					<td align="center" style="width:33%; font-size:large;">���³� �װ� �� : <%=air_info.get("air_name") %></td>
					<td align="center" style="width:33%; font-size:large;">���³� ��¥ : <%=air_info.get("start_date") %></td>
					<td align="center" style="width:33%; font-size:large;"><%=air_info.get("start_point") %> >>>>> <%=air_info.get("end_point") %></td>
				</tr>
				<tr>
					<td align="center" colspan="3"><img src="../images/payment_AIR.jpg" class="img-responsive" alt="Responsive image"></td>
				</tr>
				<tr>
					<td align="center" colspan="3" style="font-size:large;">��� �ð� : <%=air_info.get("start_time") %>&nbsp;&nbsp;&nbsp; �ҿ� �ð� : <%=air_info.get("air_time") %></td>
				</tr>
				<tr>
					<td colspan="3"></td> <!-- �ٹٲ޿� -->
				</tr>
				<tr>
					<td align="center" style="width:33%; font-size:large;">���³� �װ� �� :  <%=air_info.get("air_name") %></td>
					<td align="center" style="width:33%; font-size:large;">���³� ��¥ : <%=air_info.get("end_date") %></td>
					<td align="center" style="width:33%; font-size:large;"><%=air_info.get("end_point") %> >>>>> <%=air_info.get("start_point") %></td>
				</tr>
				<tr>
					<td align="center" colspan="3"><img src="../images/payment_AIR.jpg" class="img-responsive" alt="Responsive image"></td>
				</tr>
				<tr>
					<td align="center" colspan="3" style="font-size:large;">��� �ð� : <%=air_info.get("end_time") %>&nbsp;&nbsp;&nbsp; �ҿ� �ð� : <%=air_info.get("air_time") %></td>
				</tr>
			</table>
			<!-- ---------- �װ� ������ ���� �� ---------- -->
				<tr>
					<td></td> <!-- �ٹٲ޿� -->
				</tr>
			<!-- ---------- �װ� ��� ���� ���� ---------- -->
			<table class="table table-bordered">
				<tr>
					<td align="center" colspan="2" style="font-size:x-large;">- �װ� ��� ���� -</td>
				</tr>
				<tr>
					<td align="center" style="width:33%; font-size:large;">�ο��� : <%=air_info.get("count") %>��</td>
					<td align="center" style="width:33%; font-size:large;">�װ� ��� : <%=air_info.get("old_price")%></td>
				</tr>
				<tr>
					<td></td>
					<td align="center" style="font-size:large;">��� �հ� : <%=air_info.get("total") %>��</td>
				</tr>
			</table>
			<!-- ---------- �װ� ��� ���� �� ---------- -->
				<tr>
					<td></td> <!-- �ٹٲ޿� -->
				</tr>
			<!-- ---------- ������ ���� ���� ---------- -->	
			<table class="table table-bordered">
				<tr>
					<td align="center" colspan="2" style="font-size:x-large;">- ������ ���� -</td>
				</tr>
				<tr>
					<td align="center" style="width:50%; font-size:large;">�� �� / �ѱ� : <input type="search" name="air_kname" value="<%=mem_info.get("USER_NAME")%>"></td>
					<td align="center" style="width:50%; font-size:large;">�� �� / ���� : <input type="search" name="air_ename"></td>
				</tr>
				<tr>
					<td align="center" style="width:50%; font-size:large;">�� �� ó &nbsp;&nbsp;&nbsp;&nbsp;: <input type="search" name="air_contact" value="<%=mem_info.get("USER_HP")%>"></td>
 					<td align="center" style="width:50%; font-size:large;">�� �� �� &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <input type="search" name="air_mail"></td>
				</tr>
				<tr>
					<td align="center" style="width:50%; font-size:large;">�������&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : <input type="date" name="air_birth"></td>
					<td align="center" style="width:50%; font-size:large;">���� : <input type="search" name="air_gender" style="width:10%; height:10%" value="<%=mem_info.get("USER_GENDER") %>"></td>
				</tr>
				<tr>
     				<td colspan="2" align="center" style="width:50%; font-size:large;">�ּ�  : <%=mem_info.get("USER_ADDRESS") %></td>
				</tr>
				<tr>
					<td align="center" colspan="2" style="font-size:large;">��û ����
					<input id="req" name="req" type="text" value="��û���� �Է�" onClick="setReq()"></td>
				</tr>
			</table>
			</form>
			<!-- ---------- ������ ���� �� ---------- -->
				<tr>
					<td></td> <!-- �ٹٲ޿� -->
					<td></td> <!-- �ٹٲ޿� -->
				</tr>
			<!-- ---------- ���� ���� ���� ---------- -->
			<table class="table table-bordered">
				<tr>
					<td align="center" colspan="3"><img src="../images/note.jpg" class="img-responsive" alt="Responsive image"></td>
				</tr>
			</table>
			<!-- ---------- ���� ���� �� ---------- -->
				<tr>
					<td></td> <!-- �ٹٲ޿� -->
				</tr>
			<!-- ---------- ���� & ��� ��ư ���� ---------- -->
			<p align="center">
				<a href="javascript:airReserve()"><button class="btn btn-default btn-lg" type="button">���� �ϱ�</button></a>
				<a href="./getAirList.kos"><button class="btn btn-default btn-lg" type="button">��� �ϱ�</button></a>
			</p>
			<!-- ---------- ���� & ��� ��ư ���� ---------- -->
			</div>
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
