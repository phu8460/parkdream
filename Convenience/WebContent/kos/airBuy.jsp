<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import = "java.util.Map, java.util.HashMap, java.util.List" %>
<%
	List<Map<String,Object>> airList = (List<Map<String,Object>>) request.getAttribute("airList");
	Map<String,Object> mem_info= new HashMap<String,Object>();
	if(session.getAttribute("result")!=null){
	   mem_info = (Map<String,Object>)session.getAttribute("result");
	}
	int air_no=0;
	if(request.getAttribute("air_no")!=null){
		air_no=Integer.parseInt(request.getAttribute("air_no").toString());
	}
%>
<html>
<head>
<title>�����ǰ �ֹ�������</title>
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
	function price_calc(){
		var price = '<%=airList.get(0).get("AIR_PRICE") %>';
		var count = $("#product_quantity").val();
		/* var sprice = price.split(",");
		var cprice = sprice[0]+""+sprice[1];
		var result = cprice * count;
		$("#tot").text(result); */
		var sprice = price.replace(',',"");
		var result = sprice * count;
        var fprice = (result+"").replace(/(\d)(?=(?:\d{3})+(?!\d))/g,'$1,'); 
		$("#air_tot").text(fprice);
 	}
	function airReserve(){
		//alert($("#product_quantity").val());
		if($("#product_quantity").val() == 0){
			$("#al_msg2").val('0�Ŵ� ����Ұ� �մϴ�.');
	    	$("#msg_alert").modal('show');
	    	return;
		}
		$("#f_AirInfo").attr("method","post");
		$("#f_AirInfo").attr("action","./airBuy.kos");
		$("#f_AirInfo").submit();
	}

	function delOk(){
		$("#f_delData").attr("method","post");
		$("#f_delData").attr("action","./airDel.kos");
		$("#f_delData").submit(); 
	}
	
	function airDel(){
		$("#al_msg").val('���� �����Ͻǰǰ���? ');
    	$("#check_alert").modal('show');
	}
	
	function loginAlert(){
		$("#al_msg2").val('�α����� �ʿ��մϴ�.');
    	$("#msg_alert").modal('show');
	}
	
</script>
</head>
<body>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#d_delData").hide();
		});
	</script>


	<!-- alert â -->
	<div class="modal" id="check_alert" tabindex="-1" role="dialog" style="padding:10% 40%">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-body" align="center">
				<input type="text" id="al_msg" style="border:0; text-align:center;"><br>
				<button type="button" class="btn" data-dismiss="modal" onClick="delOk()">Ȯ��</button>
				<button type="button" class="btn" data-dismiss="modal">���</button>
			</div>
		</div>
	</div>
	</div>
	<div class="modal" id="msg_alert" tabindex="-1" role="dialog" style="padding:10% 40%">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-body" align="center">
				<input type="text" id="al_msg2" style="border:0; text-align:center;"><br>
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
				<a href="#">Total Cutoff</a>
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
															<%if(!"no".equals(airList.get(0).get("IMG1"))){%>
																<div class="active item" data-slide-number="0" >
																	<img class="media-object" style="width: 500px; height: 400px;""
																     src="../pds/<%=airList.get(0).get("IMG1")%>">
																</div>
															<%}if(!"no".equals(airList.get(0).get("IMG2"))){%>
																<div class="item" data-slide-number="1" >
																	<img class="media-object" style="width: 500px; height: 400px;"
																     src="../pds/<%=airList.get(0).get("IMG2")%>">
																</div>
															<%}if(!"no".equals(airList.get(0).get("IMG3"))){ %>	
																<div class="item" data-slide-number="2">
																	<img class="media-object" style="width: 500px; height: 400px;"
																     src="../pds/<%=airList.get(0).get("IMG3")%>">
																</div>
															<%} %>
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
 
 										<form id="f_AirInfo">
 										<input type="hidden" name="air_no" value="<%=air_no%>">
										<table>
											<tr>
												<td>�Ǹ��� �ڵ�</td>
												<td>
												<input type="text" style="background-color:transparent;border:0 solid black;text-align:left;" name="air_licese"
												value="<%=airList.get(0).get("AIR_LICENSE") %>" readonly="true">
												</td>
											</tr>
											<tr>
												<td>��ǰ �̸�</td>
												<td>
												<input type="text" style="background-color:transparent;border:0 solid black;text-align:left;" name="air_title"
												value="<%=airList.get(0).get("AIR_PNAME")%>" readonly="false"></td>
											</tr>
<%-- 											<tr>
												<td>�Ǹ���</td>
												<td><%=airList.get(0).get("AIR_NAME") %></td>
											</tr> --%>
											<tr>
												<td>��ǰ ����</td>
												<td><input type="text" style="background-color:transparent;border:0 solid black;text-align:left;" name="air_price"
												value="<%=airList.get(0).get("AIR_PRICE").toString().trim()%>��" readonly="false"></td>
											</tr>
											<tr>
												<td>��ǰ ����</td>
												<td>&nbsp;&nbsp;&nbsp;&nbsp;<input type="number" onChange="price_calc()" id="product_quantity" name="product_quantity" style="width:80px" min="1" max="20" value="1"> ��</td>
											</tr>
											<tr>
												<td>�װ���</td>
												<td><input type="text" readonly="false" style="background-color:transparent;border:0 solid black;text-align:left;" name="air_name"
												value="<%=airList.get(0).get("AIR_NAME")%>"></td>
											</tr>
											<tr>
												<td>���൵��</td>
												<td><input type="text" readonly="false" style="background-color:transparent;border:0 solid black;text-align:left;" name="air_palce"
												value="<%=airList.get(0).get("AIR_DESTINATION") %>"></td>
											</tr>
											<tr>
												<td>���೯¥</td>
												<td>
													<input type="text" readonly="false" style="background-color:transparent;border:0 solid black;text-align:left;" name="air_date"
												value="<%=airList.get(0).get("START_DATE")%>~<%=airList.get(0).get("END_DATE")%>">
												</td>
											</tr>
											<tr>
												<td>���뱸��</td>
												<td>
													<input type="text" readonly="false" style="background-color:transparent;border:0 solid black;text-align:left;"
												 name="air_point" value="<%=airList.get(0).get("AIR_STARTINGPOINT") %>�� <%=airList.get(0).get("AIR_DESTINATION") %>">
												</td>
											</tr>
											<tr>
												<td>��߽ð�</td>
												<td>
													<input type="text" readonly="false" style="background-color:transparent;border:0 solid black;text-align:left;"
												 name="starting_time" value="<%=airList.get(0).get("START_TIME") %>&nbsp;&nbsp;&nbsp;&nbsp;/&nbsp;&nbsp;&nbsp;&nbsp;<%=airList.get(0).get("END_TIME")%>">
												</td>
											</tr>
											<tr>
												<td>�ҿ�ð�</td>
												<td><input type="text" readonly="false" style="background-color:transparent;border:0 solid black;text-align:left;"
												 name="air_time" value="�� <%=airList.get(0).get("AIR_TIME") %>�ð�"></td>
											</tr>
											<tr>
												<td>&nbsp;</td>
											<td align="center"><font size="5pt">���� �ݾ�  : <span id="air_tot"><%=airList.get(0).get("AIR_PRICE") %></span>��</font></td>
											</tr>
										</table>
		                              	</form>
		                              	<!-- ---------- ���� & ��� ��ư ���� ---------- -->
		                              	<div class="btn-group pull-right" style="flex:1;">
		                              	<%if(session.getAttribute("result") != null &&
		                              	mem_info.get("USER_ID").equals(airList.get(0).get("USER_ID"))){%>
											<a href="javascript:airDel()"><input type="button" class="btn btn-success active" style="width:150;height:80" value="�����ϱ�"></a>
		                              	<% } else if(session.getAttribute("result") != null){%>
											<a href="javascript:airReserve()"><input type="button" class="btn btn-success active" style="width:150;height:80" value="�����ϱ�"></a>
										<%} else{%>
											<a href="javascript:loginAlert()"><input type="button" class="btn btn-success active" style="width:150;height:80" value="�����ϱ�"></a>
										<%} %>
											<a href="./getAirList.kos"><input type="button" class="btn btn-default active" style="width:150;height:80" value="��  ��"></a>
										</div>
										<!-- ---------- ���� & ��� ��ư �� ---------- -->
										
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
											<td>&nbsp;</td>
											<td><textarea cols="10" rows="10" placeholder="������ �Է��ϼ���."
												id="product_contents" name="product_contents" class="form-control" style="resize:none;font-size:x-large;" ><%=airList.get(0).get("AIR_CONTENT")%></textarea>
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
			
			<div id="d_delData">
				<form id="f_delData">
					<input type="hidden" name="dimg_1" value="<%=airList.get(0).get("IMG1")%>">
					<input type="hidden" name="dimg_2" value="<%=airList.get(0).get("IMG2")%>">
					<input type="hidden" name="dimg_3" value="<%=airList.get(0).get("IMG3")%>">
					<input type="hidden" name="dair_no" value="<%=airList.get(0).get("AIR_NO")%>">
				</form>	
			</div>
			
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