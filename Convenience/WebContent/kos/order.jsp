<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<title>��Ÿ��Ʋ</title>
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
</head>
<body>

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
			<div>
				<ul class="actions vertical">
					<li><a href="login.jsp" class="button big fit">Log In</a></li>
				</ul>
			</div>
			<!-- ȸ���α��γ� -->

			<!-- �޴��� ������ -->
			<div>
				<ul class="links">
					<li><a href="edit.jsp">
							<h3>ȸ�� ����</h3>
							<p>���� & Ż��</p>
					</a></li>
					<li><a href="#">
							<h3>��� ��Ȳ</h3>
							<p>������� ��ǰ ����</p>
					</a></li>
					<li><a href="cart.jsp">
							<h3>��ٱ���</h3>
							<p>���س��� ����</p>
					</a></li>
				</ul>
			</div>
			<!-- �޴��ٳ� -->
		</div>

		<!-- ����ȭ����� -->
		<div id="main">

			<!-- ù��° �Խ��� -->
			<div id="i_air" class="post">
				<header>
					<div class="title">
						<h2>
							<a href="#">�ֹ� �ϱ�</a>
						</h2>
					</div>

				</header>

				<!-- ���ۼ� -->
				<table class="table table-striped"
					style="max-width: 100%; margin: auto">
					<tbody>
						<form method="post" encType="multiplart/form-data">
							<tr>
								<th style="text-align: center; vertical-align: middle">�Ǹ� ��ǰ</th>
								<td>
									<div class="row">
										<div class="col-md-2">
											<select id="product_select" name="product_select" class="form-control">
												<option value="value1">--����--</option>
												<option value="value2">�װ�</option>
												<option value="value3">����</option>
												<option value="value4">��Ʈ</option>
												<option value="value5">����</option>
												<option value="value6">��Ű��</option>
											</select>
										</div>
									</div>
								</td>
							</tr>
							
							<tr>
								<th style="text-align: center; vertical-align: middle">��ǰ �̸�</th>
								<td><input type="text" placeholder="��ǰ �̸� �� �Է��ϼ���. "
									id="product_name" name="product_name" class="form-control" /></td>
							</tr>
							
							<tr>
								<th style="text-align: center; vertical-align: middle">��ǰ ����</th>
								<td><input type="number" id="product_quantity" name="product_quantity" style="width:150px">��</td>
							</tr>
							
							<tr>
								<th style="text-align: center; vertical-align: middle">��ǰ ����</th>
								<td><input type="number" id="product_price" name="product_price" style="width:150px">��(1��)</td>
							</tr>
							
						<!-- <tr>
								<th style="text-align: center; vertical-align: middle">���� �̹���</th>
								<td><input type="file" id="product_image" name="product_image"/></td>
							</tr> -->
							<tr>
								<th style="text-align: center; vertical-align: middle">�̹���</th>
								<td>
<!-- 									<div class="btn-toolbar">
									</div>
 -->									 <a class="logo"><img src="../images/main1.jpg" alt="" style="width:300px;height:200px"/></a>
								</td>
							</tr>
							
							<tr>
								<th style="text-align: center; vertical-align: middle">��ǰ ����</th>
								<td>
									<textarea cols="10" rows="10" placeholder="������ �Է��ϼ���. "
									id="product_contents" name="product_contents" class="form-control" style="resize:none;font-size:x-large;"></textarea>
								</td>
							</tr>
							</form>
						</tbody>
				</table>

			
				<!-- ���ۼ� �� -->
				<footer style="margin: 10 0px 0px 0px; outline: none">
					<a href="buy.jsp" style="margin-left: auto">
						<input type="button" value="�ֹ�" class="btn" />
					</a>
					<a href="board.jsp">
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
						<a href="https://samsungcreativesquare.com/Apply/apply_main/"
							class="image"><img src="../images/poster1.jpg" alt="" /></a>
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
			<!-- Ǫ�Ͷ��� �� -->

		</div>

	</div>






</body>
</html>