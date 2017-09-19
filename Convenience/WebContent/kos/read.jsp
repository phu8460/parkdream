<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import = "java.util.Map, java.util.List, java.util.ArrayList, java.util.HashMap" %>
<%
	List<Map<String,Object>> boardList = new ArrayList<Map<String,Object>>();
	if(request.getAttribute("boardList")!=null){
	boardList = (List<Map<String,Object>>)request.getAttribute("boardList");
	}
	Map<String,Object> mem_info= new HashMap<String,Object>();
	if(session.getAttribute("result")!=null){
		mem_info = (Map<String,Object>)session.getAttribute("result");
	}
	Cookie cookies[] = request.getCookies();
	String cValue = null;
	if(cookies != null){
        
        for(int i=0; i < cookies.length; i++){
            Cookie c = cookies[i] ;
             
            // ����� ��Ű �̸��� �����´�
            String cName = c.getName();
             
            if("board_no".equals(cName)){
            	
            // ��Ű���� �����´�
             cValue = c.getValue() ;
             
             
            }
        }
    }


	//out.print("boardList.size() : "+boardList.size());
%>		
	
	
<html>
<head>
<title>��Ÿ��Ʋ</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="../css/ReadCss/bootstrap.min.css" />
<link rel="stylesheet" href="../css/ReadCss/main.css" />
<link rel="stylesheet" href="../css/ReadCss/font-awesome.css" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css"
	rel='stylesheet' type='text/css'>
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->


<!-- Scripts -->
<script src="../css/ReadCss/js/jquery.min.js"></script>
<script type="text/javascript" src="../css/ReadCss/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../css/ReadCss/js/bootstrap.js"></script>
<script src="../css/ReadCss/js/skel.min.js"></script>
<script src="../css/ReadCss/js/util.js"></script>
<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
<script src="../css/ReadCss/js/main.js"></script>
<script type="text/javascript">
function commentSend(){
	var board_comments = $("#comments").val();
	var board_title = '<%=boardList.get(0).get("BOARD_TITLE") %>';
	var user_id = '<%=mem_info.get("USER_ID")%>';
	var b_step = '<%=boardList.get(0).get("B_STEP")%>';
	var b_group = '<%=boardList.get(0).get("B_GROUP")%>';
	var b_no = <%=request.getParameter("b_no")%>;
	//alert(board_comments+", "+board_title+", "+user_id);
	location.href="./commentIns.kos?subject="+board_title+"&content="+board_comments+"&user_id="+user_id+"&b_group="+b_group+"&b_step="+b_step+"&board_pw=0&b_no="+b_no;
	
}
function commentDelete(b_no){
	var board_no = '<%=request.getParameter("b_no") %>';
	//alert("b_no : "+b_no+"board_no : "+board_no);
	location.href="./commentDelete.kos?b_no="+b_no+"&board_no="+board_no;
}
function boardDel(){
	var board_no = '<%=request.getParameter("b_no") %>';
	//alert("board_no : "+board_no);
	location.href="./boardDelete.kos?board_no="+board_no;
}
function boardUpdate(){
	var board_no = '<%=request.getParameter("b_no") %>';
	var board_title = '<%=boardList.get(0).get("BOARD_TITLE") %>';
	var board_contents = '<%=boardList.get(0).get("BOARD_CONTENTS") %>';
	var board_pw = '<%=boardList.get(0).get("BOARD_PW") %>';
	location.href="./write.jsp?command=update&board_no="+board_no+"&board_title="+board_title+"&board_contents="+board_contents;
}
</script> 
</head>
<body>
<script type="text/javascript">
$(document).ready(function(){
	var b_group = '<%=boardList.get(0).get("B_GROUP")%>';
	$.ajax({
		type:"GET",
		url:"getCommentList.kos?b_group="+b_group,
		dataType:"html",//"json|xml|text|html",
		success:function(data){
			//responseText�� ����ؼ� ���������� ������ ���� �ִ� ���� data
			//alert(data);
			$("#ajax_view").html(data);
		}
	});		        	
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
			<!-- �˻��� -->

		</header>

		<!-- �޴��� -->
		<!-- �޴��� -->
		<div id="menu">
	<%
		if(session.getAttribute("result")!=null){
	%>
			<!-- ȸ���α׾ƿ� -->
			<div>
				<ul class="actions vertical">
                   <li><%=mem_info.get("USER_NAME")%>�� ȯ���մϴ�.</li>
                </ul>
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
			

		<!-- ����ȭ����� -->

		<div id="main">
			<!-- ù��° �Խ��� -->
			<div id="i_air" class="post">
				<header> </header>
				<!-- �Խñ�  ��¶���  -->
				<div class="row">
					<div class="col-md-3 col-sm-3">
					
					<% if(boardList.size()>0) {%>
					
						<figure class="thumbnail">
							<img class="img-responsive"
								src="http://www.keita-gaming.com/assets/profile/default-avatar-c5d8ec086224cb6fc4e395f4ba3018c2.jpg" />
							<div class="text-center" style="padding: 5px">
								<label><%=boardList.get(0).get("USER_ID") %></label>
							</div>
						</figure>
					</div>
					<div class="col-md-8 col-sm-8">
						<div class="panel-default arrow left">
							<div class="panel-body">
								<header>
									<div class="comment-user">
										<div id="b_title"><%=boardList.get(0).get("BOARD_TITLE") %></div>
									</div>
									<time class="comment-date" datetime="16-12-2014 01:05">
										<i class="fa fa-clock-o"></i> Dec 16, 2014
									</time>
								</header>
								<hr>
								<div class="comment-post">
									<p><%=boardList.get(0).get("BOARD_CONTENTS") %></p>
								</div>
								<hr>
								<div class="pull-right">
									<input type="button" value="����" class="btn"
										style="background-color: green" onclick="boardUpdate()" /> 										
										<input type="button"
										value="����" class="btn" style="background-color: grey" onclick="boardDel()" />
										<a href="./getBoardList.kos"><input type="button"
										value="���" class="btn" style="background-color: white" /></a>
								</div>
						<%} %>
							</div>
						</div>
					</div>
					<!-- �Խñ� ��� �κ� ��-->
					<!-- ��� �Է� â -->
					<div class="col-md-11">
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="col-md-10">
									<div class="icerik-bilgi">
										<textarea id=comments class="form-control" rows="4"
											placeholder="��� �Է��ϼ���." style="resize: none"></textarea>
									</div>
								</div>
								<input type="button"
									class="btn btn-primary active" value="�Է�" onclick="commentSend()"
									style="width: 110px; height: 95px">
							</div>
						</div>
						<!-- ��� �Է�  �� -->
						<!-- ��� �ڸ�Ʈ -->
				   <!--  	 <div class="col-md-2">
							<div class="thumbnail">
								<img class="img-responsive user-photo"
									src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
							</div>
							������ 192x 192�� ����
							/thumbnail
						</div>   -->
						<!-- /col-sm-1 -->
<!--ajax -->
		<div id="ajax_view">
		
		</div>
		
<!-- 		<div class="col-sm-10">
			<div class="panel panel-default">
				<div class="panel-heading">
					<strong><i class="fa fa-user">�ۼ���</i></strong> 
					<span class=" pull-right"><i class="fa fa-clock-o">�ۼ���</i></span>
				</div>
				<div class="panel-body">����</div>
			</div> 
		</div> -->
<!-- ajax -->
						<!-- /col-sm-5 -->
						<!-- ��� �ڸ�Ʈ �� -->
					</div>
					<!-- �ۼ� �� -->
				</div>

				<!-- �ڸ�Ʈ ��¶��� �� -->
			</div>
			<!-- ���� �� -->
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
		<!-- ���̵峡 -->
	</div>
	<!-- wrapper �� -->
</body>
</html>