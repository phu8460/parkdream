<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import = "java.util.List, java.util.Map, java.util.ArrayList"%>
<%
	List<Map<String,Object>> carList = new ArrayList<Map<String,Object>>();
	carList = (List<Map<String,Object>>)request.getAttribute("carList");
%>
<html>
<head>
<title>CAR RENTAL</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="../css/TicketCss/bootstrap.min.css" />
<link rel="stylesheet" href="../css/TicketCss/main.css" />
<link rel="stylesheet" href="../css/css/font-awesome.css" />
<link rel="stylesheet" href="../css/css/font-awesome.min.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
<!-- Scripts -->
<script src="../css/TicketCss/js/jquery.min.js"></script>
<script type="text/javascript" src="../css/TicketCss/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../css/TicketCss/js/bootstrap.js"></script>
<script src="../css/TicketCss/js/skel.min.js"></script>
<script src="../css/TicketCss/js/util.js"></script>
<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
<script src="../css/TicketCss/js/main.js"></script>
<script type="text/javascript">
	function carBuy(){
		if($("#sel").val() == '-�����ϼ���-')
		{
			$("#al_msg").val('�� ���� �������ּ��� ');
	    	$("#check_alert").modal('show');
			return;
		}
		
		var startDate = $("#start_date").val();
		var endDate = $("#end_date").val();
		
		if(startDate>endDate){
			$("#al_msg").val('�ݳ����� Ȯ���� �ּ��� ');
	    	$("#check_alert").modal('show');
			return;
		}
		
		if($("#start_date").val() == ''||$("#start_time").val() == '' 
			|| $("#end_date").val() == '' || $("#end_time").val() ==''){
			$("#al_msg").val('��� �Է����ּ��� ');
	    	$("#check_alert").modal('show');
			return ;
		}
		
		
		$("#f_rent").attr("method","post");
		$("#f_rent").attr("action","./carBuy.kos");
		$("#f_rent").submit();
	}
	function tt(){
		$("#h_name").attr('value',$("#sel").val());
		//alert($("#h_name").val());
	}
</script>
</head>
<body>
<!-- alert â -->
	<div class="modal" id="check_alert" tabindex="-1" role="dialog" style="padding:10% 40%">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-body" align="center">
				<input type="text" id="al_msg" style="border:0; text-align:center;"><br>
				<button type="button" class="btn" data-dismiss="modal">Ȯ��</button>
			</div>
		</div>
	</div>
	</div>
<!-- alertâ  -->
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<h1>
				<a href="./main.jsp">convenience</a>
			</h1>
			<div class="links dropdown">
				<ul>
					<li><a href="./main.jsp">HOME</a></li>
					<li><a href="./getAirList.kos">AIRPLANE</a></li>
					<li><a href="./getCarList.kos">CAR RENTAL</a></li>
					<li><a href="./getHotelList.kos">HOTEL</a></li>
					<li><a href="./getBoardList.kos">BOARD</a></li>
				</ul>
			</div>

			<!-- �˻� -->
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
			<!-- �˻��� -->

		</header>

		<!-- �޴��� -->
		<div id="menu">

			<!-- ȸ���α��� -->
			<div>
				<ul class="actions vertical">
					<li><a href="login.jsp" class="button big fit">Log In</a></li>
				</ul>
			</div>
			<!-- ȸ���α��γ� -->

			<!-- �޴��� ������ -->
			<div>
				<ul class="links">
					<li><a href="edit.jsp"><h3>ȸ�� ����</h3><p>���� & Ż��</p></a></li>
					<li><a href="reserve.jsp"><h3>���� & ���� ��Ȳ</h3><p>��ǰ���� ��Ȳ</p></a></li>
					<li><a href="cart.jsp"><h3>��ٱ���</h3><p>���س��� ����</p></a></li>
				</ul>
			</div>
			<!-- �޴��ٳ� -->

		</div>

		<!-- ---------- ��Ż ȭ�� ���� ---------- -->
		<div id="main">
			<div id="i_ticket" class="post">
				<header>
					<div class="title">
						<h2>
							<a href="#">CAR RENTAL</a>
						</h2>
						<p>�ڵ��� ��Ż (�뿩)</p>
						<p>�������� �� �Ͻø� �ູ�� ����� �þ� ���ϴ�.</p>
					</div>
					<img src="../images/main2.jpg" alt="" style="width:50%; box-shadow:10px 10px 20px 5px grey"/>
				</header>
				<!-- ---------- ��Ż ��� & ���� ȭ�� ���� ---------- -->
				<label class="text-info" style="font-size:x-large;">��Ż ��� ��� �� ����</label>
				<div class="row-fluid">
					<!-- ---------- ��Żī ���� ���� ---------- -->
					<form id="f_rent">
					<table>
						<tr>
							<td align="center"><a class="btn btn-danger disabled" style="font-size:large;width:100;">�� Ż ī</a></td>
							<td style="width:780;">
							<input id="h_name" name="h_name" type="hidden">
							<input id="h_price" name="h_price" type="hidden">
								<select class="form-control" id="sel" onChange="tt()">
									<option>-�����ϼ���-</option>
								<%
									if(carList !=null){
										for(int i=0; i<carList.size(); i++){
									%>
									<option><%=carList.get(i).get("RENT_KIND") %></option>
								<%	
										}
									}
								%>
								</select>
							</td>
						</tr>
						</form>
					</table>
					<!-- ---------- ��Żī ���� �� ---------- -->
					<!-- ---------- �μ��ð� ���� ���� ---------- -->
					<table>
						<tr>
							<td align="center"><a class="btn btn-danger disabled" style="font-size:large;">�μ� ��¥</a></td>
							<td style="width:110;">
								<input id="start_date" name="start_date" type="date" style="width:300px" placeholder="�μ� ��¥ ����">
							</td>
							<td align="center"><a class="btn btn-danger disabled" style="font-size:large;">�μ� �ð�</a></td>
							<td>
								<input id="start_time" name="start_time" type="time" style="width:300px" placeholder="�μ� �ð� �Է�">
							</td>
						</tr>
					</table>
					<!-- ---------- �μ��ð� ���� �� ---------- -->
					
					<!-- ---------- �ݳ��ð� ���� ���� ---------- -->
					<table>
						<tr>
							<td align="center"><a class="btn btn-danger disabled" style="font-size:large;">�ݳ� ��¥</a></td>
							<td style="width:110;">
								<input id="end_date" name="end_date" type="date" style="width:300px" placeholder="�ݳ� ��¥ ����">
							</td>
							<td align="center"><a class="btn btn-danger disabled" style="font-size:large;">�ݳ� �ð�</a></td>
							<td>
								<input id="end_time" name="end_time" type="time" style="width:300px" placeholder="�ݳ� �ð� �Է�">
							</td>
						</tr>
					</table>
					<!-- ---------- �ݳ��ð� ���� �� ---------- -->
					
					<!-- ---------- ��ݰ�� ��ư ���� ---------- -->
					<p align="right">
						<a href="javascript:carBuy()"><button class="btn btn-large btn-success" type="button" style="font-size:large;">��� ���</button></a>
					</p>
					<!-- ---------- ��ݰ�� ��ư �� ---------- -->
				</div>
				<!-- ---------- ��Ż ���  & ���� ȭ�� �� ---------- -->
			</div>
		</div>
		<!-- ---------- ��Ż ȭ�� �� ---------- -->

	
					<!-- ���̵��� �޴� -->
					<div id="sidebar">

						<!-- ����Ʈ �ΰ� -->
							<div id="intro">
								<a href="main.jsp" class="logo"><img src="../images/logo.jpg" alt="" /></a>
								<header>
									<h2>convenience</h2>
                           			<p>��ó�� ����Ʈ</p>
								</header>
							</div>
						<!-- ����Ʈ �ΰ� �� -->

						<!-- ����â -->
							<div>
								<div class="mini-posts">

									<!-- Mini Post -->
										<article class="mini-post">
							 <a href="javascript:window.open('http://www.naver.com')" class="image"><img src="../images/poster2.jpg" alt=""/></a>

										</article>
								</div>
							</div>
						<!-- ����â �� -->

						<!-- �����Ұ� -->
							<div class="blurb">
								<h2>Final Project</h2>
								 <p> ������, ������ </p>
                        		 <p> ������, ������</p>
                        		 <p> �ڼ���, ������</p>
							</div>
						<!-- �����Ұ� �� -->

						<!-- Ǫ�Ͷ��� -->
							<div id="footer">
								<ul class="icons">
									<li><a href="https://twitter.com/" class="fa-twitter" target="_blank"><span class="label">Twitter</span></a></li>
									<li><a href="https://www.facebook.com/" class="fa-facebook" target="_blank"><span class="label">Facebook</span></a></li>
									<li><a href="https://www.instagram.com/" class="fa-instagram" target="_blank"><span class="label">Instagram</span></a></li>
									<li><a href="https://www.google.co.kr/" class="fa-google" target="_blank"><span class="label">Google</span></a></li>
								</ul>
								<p class="copyright">&copy; Copyright.  <a href="http://www.ikosmo.co.kr/" target="_blank">KOSMO</a>.</p>
							</div>
						<!-- Ǫ�Ͷ��� �� -->

		</div><!-- ���̵峡 -->

</div><!-- wrapper �� -->



</body>
</html>