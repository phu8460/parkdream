<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<title>��Ÿ��Ʋ</title>
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
</head>
<body>



	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<h1>
				<a href="./main.jsp">convenience</a>
			</h1>
			<div class="links dropdown">
				<ul>
					<li><a href="main.jsp">HOME</a></li>
					<li><a href="air.jsp">AIRPLANE</a></li>
					<li><a href="ticket.jsp">E-TICKET</a></li>
					<li><a href="hotel.jsp">HOTEL</a></li>
					<li><a href="board.jsp">BOARD</a></li>
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
			<div id="i_ticket" class="post">
				<header>
					<div class="title">
						<h2>
							<a href="#">TICKET</a>
						</h2>
						<p>���� ���� & ��ȭ ���� Ƽ���� �Ѵ���</p>
						<p>Have a good shopping.</p>
					</div>
					<img src="../images/main2.jpg" alt="" style="width:50%; box-shadow:10px 10px 20px 5px grey"/>
				</header>
				
				
				<!-- ���ۼ� -->
				<table class="table table-striped" style="max-width:100%; margin:auto">
							<tbody>
								
								<!-- �Խù� -->
								<tr>
									<td>
										<div class="media">
											<a class="thumbnail pull-left" href="#" style="margin:0 auto; border:0"> <img
												class="media-object"
												src="http://icons.iconarchive.com/icons/custom-icon-design/flatastic-2/72/product-icon.png"
												style="width: 150px; height: 150px; ">
											</a>
											<div class="media-body" style="text-align:center; vertical-align:middle">
												<br><br><br>
												<a href="buy.jsp" style="text-decoration:none">��ǰ ���� �� ����</a>
											</div>
										</div>
									</td>
									<td style="width:10%; text-align:center; padding-top:75px"><label>69,000��</label></td>
									<td style="width:10% ; text-align:center; padding-top:75px"><label>�ۼ���</label></td>
									<td style="width:15%; text-align:center; padding-top:75px"><label>2017-06-08</label></td>
									<td style="width:5%; text-align:center; padding-top:75px"><label>10</label></td>
								</tr>
								<!-- �Խù��� -->
							</tbody>
						</table>
				<!-- ���ۼ� �� -->
						<footer style="margin:10 0px 0px 0px">
							<ul class="pagination pagination-large" style="">
							<li><a href="#" rel="prev">&laquo;</a></li>
							<li class="active"><span>1</span></li>
							<li><a href="#">2</a></li>
							<li><a href="#" rel="next">&raquo;</a></li>
						</ul>
					<a href="write.jsp" style="margin-left:auto"><input type="button" class="btn" value="�۾���"/></a>
						</footer>
				<br>
			</div>
			</div><!-- ���� �� -->

	
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
											<a href="https://samsungcreativesquare.com/Apply/apply_main/" class="image"><img src="../images/poster1.jpg" alt=""/></a>
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