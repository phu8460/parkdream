<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.Map, java.util.HashMap" %>
<%
   Map<String,Object> mem_info= new HashMap<String,Object>();
   if(session.getAttribute("result")!=null){
      mem_info = (Map<String,Object>)session.getAttribute("result");
   }
 %>
<html>
<head>
<title>�װ��� Ƽ�� ��� ������</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="../css/WriteCss/bootstrap.css" />
<link rel="stylesheet" href="../css/WriteCss/bootstrap.min.css" />
<link rel="stylesheet" href="../css/WriteCss/write.css" />
<link rel="stylesheet" href="../css/WriteCss/main.css" />
<link rel="stylesheet" href="../css/WriteCss/font-awesome.css" />

<!-- Scripts -->
<script src="../css/WriteCss/js/jquery.min.js"></script>
<script type="text/javascript" src="../css/WriteCss/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../css/WriteCss/js/bootstrap.js"></script>
<script src="../css/WriteCss/js/skel.min.js"></script>
<script src="../css/WriteCss/js/util.js"></script>
<script src="../css/WriteCss/js/main.js"></script>
<script src="../css/WriteCss/js/write.js"></script>
<script type="text/javascript">
	function air_Ins(){
		$("#airIns").attr("method","post");
		$("#airIns").attr("action","./airIns.kos");
		$("#airIns").submit();
	}
    function openAlert(){
    	$("#check_alert").modal('show');
    }
	function check(){
		 var air_name = $('#air_name').val();
		 var product_name = $('#product_name').val();
		 var product_quantity = $('#product_quantity').val();
		 var product_price = $('#product_price').val();
		 var air_accountholder = $('#air_accountholder').val();
		 var img_s_0 = $('#img_s_0').val();
		 var img_s_1 = $('#img_s_1').val();
		 var img_s_2 = $('#img_s_2').val();
		 var product_content = $('#product_content').val();
		 var air_city = $('#air_city').val();
		 var start_date = $('#start_date').val();
		 var end_date = $('#end_date').val();
		 var product_delay = $('#product_delay').val();
		 var start_point = $('#start_point').val();
		 var end_point = $('#end_point').val();
		 var air_time = $('#air_time').val();
		 var start_time = $('#start_time').val();
		 var end_time = $('#end_time').val();
		 
		 if(air_name=='-�����ϼ���-' ||  product_name =='' 
	     || product_quantity =='' || product_price=='' || product_delay ==''
		 || img_s_0 =='' || img_s_1 =='' || img_s_2==''
		 || product_content =='' || air_city =='' || start_date==''
		 || end_date =='' || start_point=='' || end_point ==''
		 || air_time =='' || start_time=='' || end_time==''){
			$("#al_msg").val('��� �Է����ּ���.');
			openAlert();
			return;
		 }
		 else{
			 air_Ins();
		 }
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

	<!-- ����Ʈ��Ʈ�� -->

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
		  <%
		     if(session.getAttribute("result")!=null){
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
		</div>

		<!-- ����ȭ����� -->
		<div id="main">

			<!-- ù��° �Խ��� -->
			<div id="i_air" class="post">
				<header>
					<div class="title">
						<h2>
							<a href="#">�� �� ��</a>
						</h2>
					</div>
				</header>
	<!---------------------- ���ۼ� ���� -------------------- -->		
	 		<table class="table table-striped" style="max-width: 100%; margin: auto">
				<tbody>
					<form role="form" id="airIns" method="post" enctype="multipart/form-data" >
							<tr>
								<th style="text-align: center; vertical-align: middle">�װ���</th>
								<td>
							    <select id="air_name" name="air_name" class="form-control" style="font-size:large;width:300;height:50">
									<option>-�����ϼ���-</option>
									<option>���ڹ�</option>
									<option>�ڽ���</option>
									<option>�ڹ�</option>
									<option>����Ŭ</option>
									<option>�Ϳ�</option>
								</select>
								</td>
							</tr>
							<tr>
								<th style="text-align: center; vertical-align: middle">��ǰ �̸�</th>
								<td>
								<input type="text" placeholder="��ǰ �̸� �� �Է��ϼ���."
									id="product_name" name="product_name" /></td>
							</tr>
							<tr>
								<th style="text-align: center; vertical-align: middle">��ǰ ����</th>
								<td><input type="number" id="product_quantity" name="product_quantity" style="width:150px" min="1">��</td>
							</tr>
							<tr>
								<th style="text-align: center; vertical-align: middle">��ǰ ����</th>
								<td><input type="number" id="product_price" name="product_price" style="width:150px" min="1" >��(1��)</td>
							</tr>
							<tr>
								<th style="text-align: center; vertical-align: middle">���� ��ǰ �̹���</th>
								<td><input type="file" id="img_s_0" name="img_s_0"  ></td>
							</tr>
							<tr>
								<th style="text-align: center; vertical-align: middle">�� ��ǰ �̹���</th>
								<td>
									<input type="file" id="img_s_1" name="img_s_1" />
									<br>
									<input type="file" id="img_s_2" name="img_s_2" />
								</td>
							</tr>
							<tr>
								<th style="text-align: center; vertical-align: middle">��ǰ ����</th>
								<td>
									<textarea cols="10" rows="10" placeholder="��ǰ ������ �Է��ϼ���."
									id="product_content" name="product_content" style="resize:none;font-size:x-large;"></textarea>
								</td>
							</tr>
						 	<tr>
								<th style="text-align: center; vertical-align: middle">���� ����</th>
								<td><input type="text" placeholder="���ø� �Է�." id="air_city" name="air_city" style="width:150px" ></td>
							</tr>
						 	<tr>
								<th style="text-align: center; vertical-align: middle">���� ��¥</th>
								<td>
								<input type="date" placeholder="���۳�¥1" id="start_date" name="start_date" style="width:140px" >
								��	~�� 
								<input type="date" placeholder="���۳�¥2" id="end_date" name="end_date" style="width:140px"  >
								</td>
							</tr>
							<tr>
								<th style="text-align: center; vertical-align: middle">���� �Ⱓ</th>
								<td><input type="number" placeholder="����Ⱓ �Է�"id="product_delay" name="product_delay" style="width:150px" min="1" max="20"  > ��</td>
							</tr>
							<tr>
								<th style="text-align: center; vertical-align: middle">���� ����</th>
								<td>
								<input type="text" placeholder="�����." id="start_point" name="start_point" style="width:140px" >
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;~
								<input type="text" placeholder="������." id="end_point" name="end_point" style="width:140px" >
								</td>
							</tr>
							<tr>
								<th style="text-align: center; vertical-align: middle">����1 :��� / ���� 2 : ��� �ð�</th>
								<td>
								<input type="time" placeholder="��߽ð� �Է�" id="start_time" name="start_time" style="width:150px" >
								��~��
								<input type="time" placeholder="�����ð� �Է�" id="end_time" name="end_time" style="width:150px"  >
								</td>
							</tr>
							<tr>
								<th style="text-align: center; vertical-align: middle">�ҿ� �ð�</th>
							<td>
								<input type="number" placeholder="�ҿ�ð� �Է�" id="air_time" name="air_time" style="width:150px" >
							</td>
							</tr>
						</form>
					</tbody>
				</table>
				<!-- -------------------- ���ۼ� �� -------------------- -->
				<footer style="margin: 10 0px 0px 0px; outline: none">
					<a href="javascript:check()" style="margin-left: auto">
						<input type="button" value="���" class="btn" />
					</a>
					<a href="air.jsp">
						<input type="button" value="��� " class="btn" style="margin-left: 5px" />
					</a>
				</footer>
			</div>			
			<br>
		</div>
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
					<li><a href="https://twitter.com/" class="fa-twitter"
						target="_blank"><span class="label">Twitter</span></a></li>
					<li><a href="https://www.facebook.com/" class="fa-facebook"
						tar+="_blank"><span class="label">Facebook</span></a></li>
					<li><a href="https://www.instagram.com/" class="fa-instagram"
						target="_blank"><span class="label">Instagram</span></a></li>
					<li><a href="https://www.google.co.kr/" class="fa-google"
						target="_blank"><span class="label">Google</span></a></li>
				</ul>
				<p class="copyright">
					&copy; Copyright. <a href="http://www.ikosmo.co.kr/"
						target="_blank">KOSMO</a>.
				</p>
			</div>
			<!-- Ǫ�Ͷ��� �� -->
		</div>
	</div>
</body>
</html>