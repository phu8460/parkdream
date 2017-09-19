<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.Map, java.util.HashMap" %>
<%
   Map<String,Object> mem_info= new HashMap<String,Object>();
   if(session.getAttribute("result")!=null){
      mem_info = (Map<String,Object>)session.getAttribute("result");
   }
%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <title>��ó�� ����</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
      <link rel="stylesheet" href="../css/css/bootstrap.css" />
      <link rel="stylesheet" href="../css/css/bootstrap.min.css" />
      <link rel="stylesheet" href="../css/css/main.css" />
      <link rel="stylesheet" href="../css/css/font-awesome.min.css" />
      <link rel="stylesheet" href="../css/css/font-awesome.css" />
      
   </head>
   <body>
      <!-- Wrapper -->
         <div id="wrapper">

            <!-- Header -->
               <header id="header">
                  <h1><a href="./main.jsp">convenience</a></h1>
                  <div class="links">
                     <ul>
                        <li><a href="main.jsp">HOME</a></li>
                        <li><a href="#i_air" >AIRPLANE</a></li>
                        <li><a href="#i_ticket">CAR RENTAL</a></li>
                        <li><a href="#i_hotel">HOTEL</a></li>
                        <li><a href="#i_board">BOARD</a></li>
                     </ul>
                  </div>
                  
                  <!-- �˻� -->
                  <div class="main">
                     <ul>
                        <li class="search">
                           <a class="fa-search" href="#search">�˻�</a>
                           <form id="search" method="get" action="#">
                              <input type="text" name="query" placeholder="�˻�" style="margin-top:10px"/>
                           </form>
                        </li>
                        <li class="menu">
                           <a class="fa-bars" href="#menu">�޴�</a>
                        </li>
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
                           <li><a href="./reserveSearch.kos">
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

                  <!-- Actions -->

               </div>

            <!-- Main -->
               <div id="main">

                  <!-- ù��° �Խ��� -->
                     <div id="i_air" class="post">
                        <header> 
                           <div class="title">
                              <h2><a href="#">AirPlane</a></h2>
                              <p>�װ��� ���� Ƽ�� ��ó�� �Խ���</p>
                           </div>
                           <div class="meta">
                              <time class="published" datetime="2015-11-01">������</time>
                              <a href="#" class="author"><span class="name">July 24. 2017</span><img src="../images/avatar.jpg" alt="" /></a>
                           </div>
                        </header>
                        <a href="#" class="image featured"><img src="../images/main1.jpg" alt="" /></a>
                        <footer>
                           <ul class="actions">
                              <li><a href="./getAirList.kos" class="button big">�Խ������� �̵�</a></li>
                           </ul>
                        </footer>
                     </div>
                     
                  <!-- �ι�° �Խ��� -->
                     <div id="i_ticket" class="post">
                        <header>
                           <div class="title">
                              <h2><a href="#">CAR RENTAL</a></h2>
                              <p>�ڵ��� ��Ż (�뿩)</p>
                           </div>
                           <div class="meta">
                              <time class="published" datetime="2015-11-01">������</time>
                              <a href="#" class="author"><span class="name">July 24. 2017</span><img src="../images/avatar.jpg" alt="" /></a>
                           </div>
                        </header>
                        <a href="#" class="image featured"><img src="../images/main2.jpg" alt="" /></a>
                        <footer>
                           <ul class="actions">
                              <li><a href="./getCarList.kos" class="button big">��Ż �������� �̵�</a></li>
                           </ul>
                        </footer>
                     </div>
                     
                  <!-- ����° �Խ��� -->
                     <div id="i_hotel" class="post">
                        <header>
                           <div class="title">
                              <h2><a href="#">HOTEL</a></h2>
                              <p>���� ��ó�� �Խ���</p>
                           </div>
                           <div class="meta">
                              <time class="published" datetime="2015-11-01">������</time>
                              <a href="#" class="author"><span class="name">July 24. 2017</span><img src="../images/avatar.jpg" alt="" /></a>
                           </div>
                        </header>
                        <a href="#" class="image featured"><img src="../images/main3.jpg" alt="" /></a>
                        <footer>
                           <ul class="actions">
                              <li><a href="./getHotelList.kos" class="button big">�Խ������� �̵�</a></li>
                           </ul>
                        </footer>
                     </div>
                  <!-- �׹�° �Խ��� -->
                     <div id="i_board" class="post">
                        <header>
                           <div class="title">
                              <h2><a href="#">Free Board</a></h2>
                              <p>���� & ���� �Խ���</p>
                           </div>
                           <div class="meta">
                              <time class="published" datetime="2015-11-01">������</time>
                              <a href="#" class="author"><span class="name">July 24. 2017</span><img src="../images/avatar.jpg" alt="" /></a>
                           </div>
                        </header>
                        <a href="#" class="image featured"><img src="../images/main4.jpg" alt="" /></a>
                        <footer>
                           <ul class="actions">
                              <li><a href="./getBoardList.kos" class="button big">�Խ������� �̵�</a></li>
                           </ul>
                        </footer>
                     </div>
               </div>

            <!-- ���̵��� �޴� -->
               <div id="sidebar">

                  <!-- ����Ʈ �ΰ� -->
                     <div id="intro">
                        <a href="#" class="logo"><img src="../images/logo.jpg" alt="" /></a>
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

               </div><!-- ���̵�� ���� �� -->

         </div><!-- warpper �� -->
      
      
      <!-- ��ũ��Ʈ -->
         <script src="../css/js/jquery.min.js"></script>
         <script src="../css/js/skel.min.js"></script>
         <script src="../css/js/util.js"></script>
         <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
         <script src="../css/js/main.js"></script>
         <script src="../css/js/smoothscroll.js"></script>

   </body>
</html>
