<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import = "java.util.Map, java.util.HashMap, java.util.List" %>
<%
   Map<String,Object> mem_info= new HashMap<String,Object>();
   if(session.getAttribute("result")!=null){
      mem_info = (Map<String,Object>)session.getAttribute("result");
   }
   List<Map<String,Object>> orderList = null;
   if(request.getAttribute("orderList")!=null){
	   orderList = (List<Map<String,Object>>)request.getAttribute("orderList");
   }
   
%>   	
<html>
<head>
<title>Reserve Search</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="../css/CartCss/bootstrap.min.css" />
<link rel="stylesheet" href="../css/CartCss/main.css" />
<link rel="stylesheet" href="../css/CartCss/side.css" />
<link rel="stylesheet" href="../css/css/font-awesome.css" />
<link rel="stylesheet" href="../css/css/font-awesome.min.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->


<!-- Scripts -->
<script src="../css/CartCss/js/jquery.min.js"></script>
<script type="text/javascript" src="../css/CartCss/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../css/CartCss/js/bootstrap.js"></script>
<script src="../css/CartCss/js/skel.min.js"></script>
<script src="../css/CartCss/js/util.js"></script>
<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
<script src="../css/CartCss/js/main.js"></script>
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
                           <li><a href="./reserveSearch.jsp">
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

			<!-- ��ٱ��� ���� -->
			<div id="i_air" class="post">
				<header>
					<div class="title" align="center">
						<h2>
							<a href="#"><font size="100">����&���� ��ȸ</font></a>
						</h2>
						<p style="font-size:x-large;">���� �ֹ��� ��ǰ ��� ������</p>
					</div>
					<img src="../images/nice.jpg" alt="" style="box-shadow:10px 10px 20px 5px grey"/>
				</header>
				<!-- -------------------- ȭ�� ���̺� ���� -------------------- -->
				<div class="content-wrapper">
					<div class="post">
						<div class="container-fluid">
							<table>
								<tr>
									<td colspan="4" align="center" style="font-size:x-large;color:blue;">�װ��� ���� ��ȸ</td>
								</tr>
							<%if(orderList == null || orderList.size()==0) {%>
								<tr>
									<td width="50%" align="center" colspan="4">
										�ֹ��� ����� �����ϴ�.
									</td>
								</tr>
							<%} else if(orderList !=null && orderList.size()>0){
								for(int i=0; i<orderList.size(); i++){
							%>
								<tr>
									<td width="50%" align="center" colspan="2">
										<a href="./airOrderOk.kos?air_pno=<%=orderList.get(i).get("AIR_PNO")%>"><%=orderList.get(i).get("AIR_PNAME") %></a>
									</td>
									<td width="25%" align="center">�ֹ���ȣ</td>
									<td width="25%"><input type="text" disabled="disabled" style="text-align:center;" value="<%=orderList.get(i).get("AIR_PNO") %>"></td>
								</tr>
							<%			
										for(int j=0; j<orderList.size(); j++){
										if(i!=j && orderList.get(i).get("AIR_PNO").toString().equals(orderList.get(j).get("AIR_PNO").toString())){
										i=orderList.size();
											}
										}
							}
						}
							%>
							</table>
							<table>
								<tr>
									<td colspan="4" align="center" style="font-size:x-large;color:blue;">��Żī ���� ��ȸ</td>
								</tr>
							<%if(orderList == null || orderList.size()==0) {%>
								<tr>
									<td width="50%" align="center" colspan="4">
										�ֹ��� ����� �����ϴ�.
									</td>
								</tr>
							<%} else if(orderList !=null && orderList.size()>0){ 
									for(int i=0; i<orderList.size(); i++){
							%>
								<tr>
									<td width="50%" align="center" colspan="2">
										<a href="./rentOrderOk.kos?rent_pno=<%=orderList.get(i).get("RENT_PNO")%>"><%=orderList.get(i).get("RENT_KIND") %></a>
									</td>
									<td width="25%" align="center">�ֹ���ȣ</td>
									<td width="25%"><input type="text" disabled="disabled" style="text-align:center;" value="<%=orderList.get(i).get("RENT_PNO") %>"></td>
								</tr>
							<%			
										for(int j=0; j<orderList.size(); j++){
											
										if(i!=j && orderList.get(i).get("RENT_PNO").toString().equals(orderList.get(j).get("RENT_PNO").toString())){
										i=orderList.size();
											}
										}
							}
						}
							%>
							</table>
							<table>
								<tr>
									<td colspan="4" align="center" style="font-size:x-large;color:blue;">���� ���� ��ȸ</td>
								</tr>
							<%if(orderList == null || orderList.size()==0) {%>
								<tr>
									<td width="50%" align="center" colspan="4">
										�ֹ��� ����� �����ϴ�.
									</td>
								</tr>
							<%} else if(orderList !=null && orderList.size()>0){ 
									for(int i=0; i<orderList.size(); i++){
							%>
							<tr>
								<td width="50%" align="center" colspan="2">
									<a href="./hotelOrderOk.kos?hotel_rno=<%=orderList.get(i).get("HOTEL_RNO")%>"><%=orderList.get(i).get("HOTEL_NAME") %></a>
								</td>
								<td width="25%" align="center">�ֹ���ȣ</td>
								<td width="25%"><input type="text" disabled="disabled" style="text-align:center;" value="<%=orderList.get(i).get("HOTEL_RNO") %>"></td>
							</tr>
							<%			
										for(int j=0; j<orderList.size(); j++){
											
										if(i!=j && orderList.get(i).get("HOTEL_RNO").toString().equals(orderList.get(j).get("HOTEL_RNO").toString())){
										i=orderList.size();
											}
										}
							}
						}
							%>
							</table>
							<p align="center">
								<a href="main.jsp"><button class="btn btn-large btn-block" type="button" style="font-size:large;">���� ȭ�� ���ư���</button></a>
							</p>
						</div>
					</div>
				</div>
				<!-- -------------------- ȭ�� ���̺� �� -------------------- -->
				<br>
			</div>
			
			<footer>
				<!-- Footer -->
				<div id="footer" style="text-align:center">
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

			</footer>
		</div>




	</div>




</body>
</html>