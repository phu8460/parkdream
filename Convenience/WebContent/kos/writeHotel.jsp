<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.*" %>
<% 
Map<String,Object> mem_info= new HashMap<String,Object>();
if(session.getAttribute("result")!=null){
	mem_info = (Map<String,Object>)session.getAttribute("result");
}
%>
<html>
<head>
<title>ȣ�� ��� ������</title>
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
<script src="js/write.js"></script>
<script type="text/javascript">
function hotelInsert(){
	$("#f_hotel").attr("method", "post");
	$("#f_hotel").attr("action", "./hotelInsert.kos")
	$("#f_hotel").submit();
}
</script>
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
			<!-- �޴��ٳ� -->
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

				<!-- -------------------- ���ۼ� ���� -------------------- -->
				<table class="table table-striped" style="max-width: 100%; margin: auto">
					<tbody>
						<form id="f_hotel" enctype="multipart/form-data">
						<input type="hidden" id="user_id" name="user_id" value="<%=mem_info.get("USER_ID") %>"/>
							<tr>
								<th style="text-align: center; vertical-align: middle">ȣ�ڸ�</th>
								<td><input type="text" colspan="2" placeholder="ȣ�ڸ� �Է�	." id="hotel_name" name="hotel_name" style="width:150px" class="form-control"></td>
							</tr>
							<tr>
								<th style="text-align: center; vertical-align: middle">���ּ�</th>
								<td><input type="text" placeholder="���ּҸ� �Է��ϼ���. "
									id="hotel_address" name="hotel_address" class="form-control" /></td>
							</tr>
							
							<tr>
								<th style="text-align: center; vertical-align: middle">���� ��¥</th>
								<td>
								<input type="date" placeholder="üũ�γ�¥ �Է�." id="hotel_sdate" name="hotel_sdate" style="width:155px">
								��	~�� 
								<input type="date" placeholder="üũ�ƿ���¥ �Է�." id="hotel_edate" name="hotel_edate" style="width:155px">
								</td>
							</tr>
							<tr>
								<th style="text-align: center; vertical-align: middle">�����ο�</th>
								<td><input type="number" placeholder="�����ο� �Է�" id="hotel_peopleNum" name="hotel_peopleNum" style="width:150px" min="1" max="20"> �ν�</td>
							</tr>
							
							<tr>
								<th style="text-align: center; vertical-align: middle">��ǰ ����</th>
								<td><input type="number" id="hotel_productNum" name="hotel_productNum" style="width:150px" min="1">��</td>
							</tr>
							
							<tr>
								<th style="text-align: center; vertical-align: middle">��ǰ ����</th>
								<td><input type="number" id="hotel_price" name="hotel_price" style="width:150px" min="1">��(1��)</td>
							</tr>
							
							 <tr>
								<th style="text-align: center; vertical-align: middle">���� ��ǰ �̹���</th>
								<td><input type="file" id="hotel_mainImg" name="hotel_mainImg"/></td>
							</tr>
							
							<tr>
								<th style="text-align: center; vertical-align: middle">�� ��ǰ �̹���</th>
								<td>
									<input type="file" id="hotel_subImg1" name="hotel_subImg1"/>
									</br>
									<input type="file" id="hotel_subImg2" name="hotel_subImg2"/>
								</td>
							</tr>
							
							<tr>
								<th style="text-align: center; vertical-align: middle">��ǰ ����</th>
								<td>
									<!-- <input type="file" style="padding-bottom:10" id="product_c_img" name="product_c_img"/> -->
									<textarea cols="10" rows="10" placeholder="��ǰ ������ �Է��ϼ���."
									id="hotel_content" name="hotel_content" class="form-control" style="resize:none;font-size:x-large;"></textarea>
								</td>
							</tr>

						</form>
					</tbody>
				</table>
				<!-- -------------------- ���ۼ� �� -------------------- -->
				
				<footer style="margin: 10 0px 0px 0px; outline: none">
					<a href="#" style="margin-left: auto">
						<input type="button" value="���" class="btn" onclick="hotelInsert()" />
					</a>
					<a href="hotel.jsp">
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