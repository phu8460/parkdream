<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.Map, java.util.HashMap, java.util.List, java.util.ArrayList, java.text.*" %>
<%
Map<String,Object> mem_info= new HashMap<String,Object>();
if(session.getAttribute("result")!=null){
	mem_info = (Map<String,Object>)session.getAttribute("result");
}

List<Map<String, Object>> hotelList = new ArrayList<Map<String, Object>>();
	Map<String, Object> hotelMap = new HashMap<String, Object>();
	int productNum=0;
	int hotel_price = 0;
if(request.getAttribute("hotelList")!=null){
	hotelList = (List<Map<String, Object>>) request.getAttribute("hotelList");
	hotelMap = hotelList.get(0);
	productNum = Integer.parseInt(hotelMap.get("HOTEL_PRODUCTNUM").toString());
	hotel_price = Integer.parseInt(hotelMap.get("HOTEL_PRICE").toString().replaceAll(",", ""));	
	
}
%>
<html>
<head>
<title>ȣ�� ���� ����Ʈ</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="../css/BuyCss/bootstrap.css" />
<link rel="stylesheet" href="../css/BuyCss/bootstrap.min.css" />
<link rel="stylesheet" href="../css/BuyCss/main.css" />
<link rel="stylesheet" href="../css/BuyCss/buy.css" />
<link rel="stylesheet"
	href="../css/BuyCss/font-awesome/css/font-awesome.css" />
<link rel="stylesheet"
	href="../css/BuyCss/font-awesome/css/font-awesome.min.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->


<!-- Scripts -->
<script src="../css/BuyCss/js/jquery.min.js"></script>
<script type="text/javascript" src="../css/BuyCss/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../css/BuyCss/js/bootstrap.js"></script>
<script src="../css/BuyCss/js/skel.min.js"></script>
<script src="../css/BuyCss/js/util.js"></script>
<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
<script src="../css/BuyCss/js/main.js"></script>
<script src="../css/BuyCss/js/buy.js"></script>
<script src="../css/BuyCss/js/comment.js"></script>
<script type="text/javascript">

function Calc(){
	var option = $("#select").val();
	alert($("#select").val());
	var price = <%=hotel_price %>;
	var sumPrice = option*price;
	var realPrice = numberWithCommas(sumPrice);
	$("#price").text(realPrice);
}
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
function reservation(){
	var option = $("#select").val(); 
	var hotel_pno = "<%=hotelMap.get("HOTEL_PNO") %>";
	var hotel_name = "<%=hotelMap.get("HOTEL_NAME") %>";
	var hotel_sdate = "<%=hotelMap.get("HOTEL_SDATE") %>";
	var hotel_edate = "<%=hotelMap.get("HOTEL_EDATE") %>";
	var hotel_price = "<%=hotelMap.get("HOTEL_PRICE") %>";
	var total_price = <%=hotel_price%>*option;
	
 	location.href="./payment_HOTEL.jsp?hotel_name="+hotel_name+"&hotel_sdate="+hotel_sdate+"&hotel_edate="+hotel_edate
					+"&hotel_price="+hotel_price+"&total_price="+total_price+"&hotel_pno="+hotel_pno; 
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

			<!-- �Խ��Ǳ� ���� -->
			<div id="i_air" class="post">
				<div class="container-fluid">
					<div class="content-wrapper">
						<div class="item-container">
							<div class="container">
								<div id="main_area">
									<!-- Slider -->
									<div class="row">

										<!-- ū���� -->
										<div class="col-sm-6">
											<div class="col-xs-12" id="slider">
												<!-- Top part of the slider -->
												<div class="row">
													<div class="col-sm-12" id="carousel-bounding-box">
														<div class="carousel slide" id="myCarousel">
															<!-- Carousel items -->
															<div class="carousel-inner">
																<div class="active item" data-slide-number="0">
																	<img class="media-object"
																	src="../pds/<%=hotelMap.get("IMG1") %>"
																	style="width: 500px; height: 500px; ">
																</div>

																<div class="item" data-slide-number="1">
																	<img class="media-object"
																	src="../pds/<%=hotelMap.get("IMG2") %>"
																	style="width: 500px; height: 500px; ">
																</div>

																<div class="item" data-slide-number="2">
																	<img class="media-object"
																	src="../pds/<%=hotelMap.get("IMG3") %>"
																	style="width: 500px; height: 500px; ">
																</div>

															</div>
															<!-- �¿��ư(����) -->
															<!-- <a class="left carousel-control" href="#myCarousel"
																role="button" data-slide="prev"> <span
																class="glyphicon glyphicon-chevron-left"></span>
															</a> <a class="right carousel-control" href="#myCarousel"
																role="button" data-slide="next"> <span
																class="glyphicon glyphicon-chevron-right"></span>
															</a> -->
															<!-- �¿��ư(����) -->
														</div>
													</div>
												</div>
											</div>
										</div>

										<!-- -------------------- ������ �޴� ���� -------------------- -->
										<div class="col-sm-6">
										<form id="f_reservation">
										<table class="table table-bordered">
 											<tr>
												<td>ȣ�ڸ�</td>
												<td><span id="hotel_name" name="hotel_name"><%=hotelMap.get("HOTEL_NAME") %></span></td>
											</tr>
											<tr>
												<td>�Ǹ���</td>
												<td><%=hotelMap.get("USER_ID") %></td>
											</tr>
											<tr>
												<td>�ּ�</td>
												<td><%=hotelMap.get("HOTEL_ADDRESS") %></td>
											</tr>
											<tr>
												<td>���ڳ�¥</td>
							
							
							
												<td><%=hotelMap.get("HOTEL_SDATE") %> ~ <%=hotelMap.get("HOTEL_EDATE") %></td>
											</tr>
											<!-- <tr>
												<td>���ڱⰣ</td>
												<td><input type="number" id="product_quantity" name="product_quantity" style="width:80px" min="1" max="20"> ��</td>
											</tr> -->
											<tr>
												<td>�����ο�</td>
												<td><%=hotelMap.get("HOTEL_PEOPLENUM") %></td>
											</tr>
											<tr>
												<td>���Ǽ�</td>
												<td>
												<select class="form-control" style="width:80px" onChange="Calc()" id="select">
												<% for(int i=1;i<productNum+1;i++){ %>
												  <option><%=i %></option>
												<%} %>
												</select>
												</td>
											</tr>
											<tr>
												<td>��ǰ ����</td>
												<td>
													<%= NumberFormat.getInstance().format(hotel_price) %>
												</td>
											</tr>
										</table>
										<table>
											<tr>
												<td>&nbsp</td>
												<td align="center"><font size="5pt">���� �ݾ�  : 
												<span id="price"><%= NumberFormat.getInstance().format(hotel_price) %></span>��</font></td>
											</tr>
										</table>
		                              	
		                              	<!-- ---------- ����, ��ٱ��� ��ư ---------- -->
		                              	<div class="btn-group pull-right" style="flex: 1">
											<input type="button" class="btn btn-success active" value="�����ϱ�" onclick="reservation()">
										</div>
										<!-- ---------- ����, ��ٱ��� ��ư ---------- -->
										</form>
										
										</div>
										<!-- -------------------- ������ �޴� �� -------------------- -->
									</div>

								</div>

							</div>
						</div>
						
						<div class="container-fluid">
							<div class="col-md-12 product-info">
								<ul id="myTab" class="nav nav-tabs nav_tabs">
									<li class="active"><a href="#service-one" data-toggle="tab">��ǰ ����</a></li>
									<li><a href="#service-two" data-toggle="tab">��ǰ ����</a></li>
								</ul>
								
								<!-- -------------------- ��ǰ���� ���� -------------------- -->
								<div id="myTabContent" class="tab-content">
								
									<!-- -------------------- ��ǰ �� ���� ���� ���� -------------------- -->
									<div class="tab-pane fade in active" id="service-one">
									
										<!-- -------------------- ��ǰ���� ���� -------------------- -->
										<tr>
											<td><textarea cols="10" rows="10" align="right" readonly
												id="product_contents" name="product_contents" class="form-control" 
												style="resize:none;font-size:x-large;"><%=hotelMap.get("HOTEL_CONTENT") %>
												</textarea>
											</td>
										</tr>
										<!-- -------------------- ��ǰ���� �� -------------------- -->
										
									</div>
									<!-- -------------------- ��ǰ �� ���� ���� �� -------------------- -->
									
									<!-- �ڸ�Ʈ ���� -->
									<div class="tab-pane fade" id="service-two">
										<div class="container">
											<div class="row">
												<br>
												<!-- �ۼ� �κ� -->
												<div class="col-md-12">
													<div class="panel panel-default">
														<div class="panel-body">
															<div class="col-md-12">
																<div class="icerik-bilgi">
																	<textarea class="form-control" rows="5"
																		placeholder="�ڸ�Ʈ�� �Է��ϼ���." style="resize:none;font-size:x-large;"></textarea>
																	<hr>
																	<a href="#">
																		<input type="button" class="btn btn-primary active pull-right" value="COMMENT">
																	</a>
																</div>
															</div>
														</div>
													</div>
												</div>
												<!-- �ۼ� �� -->


												<!-- �ڸ�Ʈ ��¶���  -->
												<div class="col-md-12">
														<!-- First Comment -->
														<article class="row">
															<div class="col-md-2 col-sm-2 hidden-xs">
																<figure class="thumbnail">
																	<img class="img-responsive"
																		src="http://www.keita-gaming.com/assets/profile/default-avatar-c5d8ec086224cb6fc4e395f4ba3018c2.jpg" />
																	<div class="text-center" style="padding: 5px">����</div>
																</figure>
															</div>
															<div class="col-md-10 col-sm-10">
																<div class="panel panel-default arrow left">
																	<div class="panel-body">
																		<header class="text-left">
																			<div class="comment-user">
																				<i class="fa fa-user">�ۼ���</i>
																			</div>
																			<time class="comment-date"
																				datetime="16-12-2014 01:05">
																				<i class="fa fa-clock-o"></i> Dec 16, 2014
																			</time>
																		</header>
																		<hr>
																		<div class="comment-post">
																			<p>����</p>

																		<div class="post-footer">
																			<div class="input-group">
																				<input class="form-control" placeholder="��� �Է�"
																					type="text"> <span
																					class="input-group-addon"> <a href="#"><i
																						class="fa fa-edit"></i></a>
																				</span>
																			</div>
																		</div>
																	</div>
																		
																		<!-- ��� ���� -->
																			<div class="col-lg-1">
																				<div class="thumbnail">
																					<img class="img-responsive user-photo"
																						src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
																				</div>
																				<!-- ������ 192x 192�� ���� -->
																				<!-- /thumbnail -->
																			</div>
																			<!-- /col-sm-1 -->

																			<div class="col-md-11">
																				<div class="panel panel-default">
																					<div class="panel-heading">
																						<strong><i class="fa fa-user">�ۼ���</i></strong> <span class=" pull-right"><i class="fa fa-clock-o">5�ð���</i></span>
																					</div>
																					<div class="panel-body">��۾˹�</div>
																					<!-- /panel-body -->
																				</div>
																				<!-- /panel panel-default -->
																			</div>
																			<!-- /col-sm-5 -->
																		<!-- ��� ���� �� -->
																	</div>
																</div>
																</div>
														</article>
													<!-- �ڸ�Ʈ ��¶��� �� -->

												</div>
											</div>

										</div>
									</div>
								</div>
								<!-- -------------------- ��ǰ���� �� -------------------- -->
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- �Խ��Ǳ� �� -->



			<!-- Footer -->
			<footer>
				<div id="footer" style="text-align: center">
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