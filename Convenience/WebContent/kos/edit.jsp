<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.Map, java.util.HashMap" %>	
<%
	Map<String,Object> mem_info= new HashMap<String,Object>();
	if(session.getAttribute("result")!=null){
		mem_info = (Map<String,Object>)session.getAttribute("result");
	}
%>	
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>��Ÿ��Ʋ</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="../css/editCss/edit.css" />
<link rel="stylesheet" href="../css/editCss/bootstrap.css" />
<link rel="stylesheet" href="../css/editCss/bootstrap.min.css" />
<link rel="stylesheet" href="../css/editCss/style.css" />
<link rel="stylesheet" href="../css/editCss/main.css" />
<link rel="stylesheet" href="../css/css/font-awesome.min.css" />
<link rel="stylesheet" href="../css/css/font-awesome.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->

<!-- Scripts -->
<script src="../css/editCss/js/jquery.min.js"></script>
<script type="text/javascript" src="../css/editCss/js/bootstrap.min.js"></script>
<script src="../css/editCss/js/skel.min.js"></script>
<script src="../css/editCss/js/util.js"></script>
<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
<script src="../css/editCss/js/main.js"></script>
<script type="text/javascript">
	function memUpdate(){
 		$("#f_info").attr("method","post");
		$("#f_info").attr("action","./memUpdate.kos");
		$("#f_info").submit();
	}
	function pwCheck(){
		if($("#pw").val() == "" || $("#pw1").val()==""){
			$("#pw_check").modal();
		}
		else{
			$("#update_alert").modal();
		}
	}
/* 	$("#update_alert").modal('show').css({
			'margin-top' : function(){
				return ($(this).height()/2);
			},	
			'margin-left' : function(){
				return ($(this).width()/2);
			}
	}); */
</script>
</head>
<body>

<!-- alertâ -->
<div class="modal" id="update_alert" tabindex="-1" role="dialog" style="padding:10% 40%">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-body" align="center">
				<h1>��α����� �ʿ��մϴ�.</h1>&nbsp;
				<button type="button" class="btn" data-dismiss="modal" onCLick="memUpdate()">Ȯ��</button>
			</div>
		</div>
	</div>
</div>
<div class="modal" id="pw_check" tabindex="-1" role="dialog" style="padding:10% 40%">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-body" align="center">
				<h1>��й�ȣ�� �Է����ּ���</h1>&nbsp;
				<button type="button" class="btn" data-dismiss="modal">Ȯ��</button>
			</div>
		</div>
	</div>
</div>
<!-- alertâ -->


<script type="text/javascript">
	$(document).ready(function(){
		var u_id = "<%=mem_info.get("USER_ID")%>";
		var u_name = "<%=mem_info.get("USER_NAME")%>";
		var u_nickname = "<%=mem_info.get("USER_NICK")%>";
		var u_hp = "<%=mem_info.get("USER_HP")%>";
		var u_address = "<%=mem_info.get("USER_ADDRESS")%>";
		var u_gender = "<%=mem_info.get("USER_GENDER")%>";
		
		$("#id").attr('value',u_id);
		$("#name").attr('value',u_name);
		$("#nickname").attr('value',u_nickname);
		$("#hp").attr('value',u_hp);
		$("#address").attr('value',u_address);
		
		if("��" == u_gender){
			$("#gender").val(2);
		}
		else{
			$("#gender").val(3);
		}
		
	});
</script>
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
		<!-- �˻��� --> </header>

		<!-- �޴��� -->
		<div id="menu">
	<%
		if(session.getAttribute("result")!=null){
	%>
			<!-- ȸ���α׾ƿ� -->
			<div>
				<ul class="actions vertical">
					<li><a href="./logout.kos" class="button big fit">Log Out</a></li>
				</ul>
			</div>
			<!-- ȸ���α׾ƿ��� -->
	<%
		} else{
	%>
			<!-- ȸ���α׾ƿ� -->
			<div>
				<ul class="actions vertical">
					<li><a href="./login.jsp" class="button big fit">Log In</a></li>
				</ul>
			</div>
			<!-- ȸ���α׾ƿ��� -->
	<%
		}
	%>
	
			<!-- Links -->
			<div>
				<ul class="links">
					<li><a href="edit.jsp">
							<h3>ȸ�� ����</h3>
							<p>���� & Ż��</p>
					</a></li>
	<%
		if(session.getAttribute("result")!=null){
	%>			
					<li><a href="#">
							<h3>�ֹ� ��Ȳ</h3>
							<p>�ֹ� ����</p>
					</a></li>
	<% } else { %>
					<li><a href="#">
							<h3>ȸ������</h3>
					</a></li>
	<% } %>
					<li><a href="cart.jsp">
							<h3>��ٱ���</h3>
							<p>���س��� ����</p>
					</a></li>
				</ul>
			</div>

			<!-- Actions -->


		</div>

		<!-- Main -->
		<div id="main">
			<div id="i_edit" class="post">
				<header>
				<div class="title">
					<h2>
						<a href="#">ȸ������</a>
					</h2>
					<p>ȸ�������� ���� ����</p>
				</div>
				</header>

				<!-- ȸ������ �������� -->
				<footer>
				<form class="form-horizontal" id="f_info" name="f_info">
					<fieldset>
						<!-- ���̵� -->
						<input type="hidden" id="id" name="n_id">

						<!-- �̸�-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="id">�̸�</label>
							<div class="col-md-4">
								<div class="input-group">
									<span class="input-group-addon"> <i
										class="fa fa-user fa" aria-hidden="true"></i></span> <input id="name"
										name="n_name" type="text" placeholder="�̸�" class="form-control"
										required="">
								</div>
							</div>
						</div>
						<!-- ��й�ȣ -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="pw">��й�ȣ</label>
							<div class="col-md-4">
								<div class="input-group">
									<span class="input-group-addon"> <i class="fa fa-key fa"
										aria-hidden="true"></i></span> <input id="pw" name="n_pw"
										type="password" placeholder="��й�ȣ" class="form-control"
										required>
								</div>
							</div>
						</div>
						<!-- ��й�ȣ Ȯ��-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="pw1">��й�ȣ Ȯ��</label>
							<div class="col-md-4">
								<div class="input-group">
									<span class="input-group-addon"> <i class="fa fa-key fa"
										aria-hidden="true"></i></span> <input id="pw1" name="pw1"
										type="password" placeholder="��й�ȣ Ȯ��" class="form-control"
										required>
								</div>
							</div>
						</div>
						<!-- �г���-->
						<div class="form-group">
							<label class="col-md-4 control-label" for="nickname">�г���</label>
							<div class="col-md-4">
								<div class="input-group">
									<span class="input-group-addon"> <i
										class="fa fa-comment fa" aria-hidden="true"></i></span> <input
										id="nickname" name="n_nickname" type="text" placeholder="�г���"
										class="form-control" required="">
								</div>
							</div>
						</div>
						<!-- �ڵ��� -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="hp">�ڵ���</label>
							<div class="col-md-4">
								<div class="input-group">
									<span class="input-group-addon"> <i
										class="fa fa-phone fa" aria-hidden="true"></i></span> <input id="hp"
										name="n_hp" type="text" placeholder="�ڵ���" class="form-control"
										required="">
								</div>
							</div>
						</div>
						<!-- ���� -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="gender">����</label>
							<div class="col-md-2"  style="width:20%">
								<div class="input-group">
									<span class="input-group-addon"> <i
										class="fa fa-group fa-lg" aria-hidden="true"></i></span> <select
										id="gender" name="n_gender" class="form-control">
										<option value="1">- ���� -</option>
										<option value="2">����</option>
										<option value="3">����</option>
									</select>
								</div>
							</div>
						</div>
						<!-- �ּ� -->
						<div class="form-group">
							<label class="col-md-4 control-label" for="address">�ּ�</label>
							<div class="col-md-4">
								<div class="input-group">
									<span class="input-group-addon"> <i
										class="fa fa-home fa" aria-hidden="true"></i></span> <input
										id="address" name="n_address" type="text" placeholder="�ּ�"
										class="form-control" required="">
								</div>
							</div>
						</div>
						<!-- ��ư -->
						<div class="form-group">
							<label class="col-md-4"></label>
							<div class="col-md-6">
							<a href="#" data-toggle="modal" onClick="pwCheck()">
								<input type="button" class="btn btn-primary" value="����">
							</a>
								 <a href="main.jsp"><input type="button"
									class="btn btn-danger" value="���"></a>
							</div>
						</div>
						<!-- ��ư�� -->

					</fieldset>
				</form>
				</footer>
			</div>


		</div>

		<!-- ���̵��� �޴� -->
		<div id="sidebar">
			<!-- Intro -->
			<div id="intro">
				<a href="main.jsp" class="logo"><img src="../images/logo.jpg"
					alt="" /></a>
				<header>
				 <h2>convenience</h2>
                 <p>��ó�� ����Ʈ</p>
				</header>
			</div>

			<!-- Mini Posts -->
			<div>
				<div class="mini-posts">

					<!-- Mini Post -->
					<article class="mini-post"> <a
						href="https://samsungcreativesquare.com/Apply/apply_main/"
						class="image"><img src="../images/poster1.jpg" alt="" /></a> </article>
				</div>
			</div>


			<!-- About -->
			<div class="blurb">
				<h2>Final Project</h2>
				 <p> ������, ������ </p>
                 <p> ������, ������</p>
                 <p> �ڼ���, ������</p>
			</div>

			<!-- Footer -->
			<div id="footer">
				<ul class="icons">
					<li><a href="https://twitter.com/" class="fa-twitter"
						target="_blank"><span class="label">Twitter</span></a></li>
					<li><a href="https://www.facebook.com/" class="fa-facebook"
						target="_blank"><span class="label">Facebook</span></a></li>
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
		</div>
	</div>

</body>
</html>