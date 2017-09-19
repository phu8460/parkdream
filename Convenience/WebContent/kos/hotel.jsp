<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ page import="java.util.Map, java.util.HashMap, java.util.List, java.util.ArrayList" %>
<%@ page import="java.io.*,java.net.*, kos.util.KoreanConversion, kos.util.*" %>
<%
int size = 0;

Map<String,Object> mem_info= new HashMap<String,Object>();
if(session.getAttribute("result")!=null){
   mem_info = (Map<String,Object>)session.getAttribute("result");
}

List<Map<String, Object>> hotelList = new ArrayList<Map<String, Object>>();
if(request.getAttribute("hotelList")!=null){
hotelList = (List<Map<String, Object>>) request.getAttribute("hotelList");
size = hotelList.size();
}
int pagecount = 0;//�� ������ ��
int pagesize = 2;//���������� �ѷ��� �� ����
int mypage = 0;//���� �ٶ󺸰� �ִ� ������

if(request.getParameter("page") != null){
   mypage = Integer.parseInt(request.getParameter("page"));
}
String imagePath = "../images/";

%>
<html>
<head>
<title>ȣ�� ����Ʈ</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="../css/HotelCss/bootstrap.min.css" />
<link rel="stylesheet" href="../css/HotelCss/main.css" />
<link rel="stylesheet" href="../css/HotelCss/air.css" />
<link rel="stylesheet" href="../css/css/font-awesome.css" />
<link rel="stylesheet" href="../css/css/font-awesome.min.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->


<!-- Scripts -->
<script src="../css/HotelCss/js/jquery.min.js"></script>
<script type="text/javascript" src="../css/HotelCss/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../css/HotelCss/js/bootstrap.js"></script>
<script src="../css/HotelCss/js/skel.min.js"></script>
<script src="../css/HotelCss/js/util.js"></script>
<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
<script src="../css/HotelCss/js/main.js"></script>
<script src="../css/HotelCss/js/air.js"></script>
<script type="text/javascript">
   function buyHotel(hotel_no){
      location.href="getHotelList.kos?cmd=buy&hotel_no="+hotel_no;
   }
   function hotelIDCheck(){
      var id="<%=mem_info.get("USER_ID") %>";      
      location.href="./hotelIDCheck.kos?user_id="+id;
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
         <div id="i_hotel" class="post">
            <header>
               <div class="title">
                  <h2>
                     <a href="#">HOTEL</a>
                  </h2>
                  <p>������ ������ ���Ͽ�</p>
                  <p>Have a good shopping.</p>
               </div>
               <img src="../images/main3.jpg" alt="" style="width:50%; box-shadow:10px 10px 20px 5px grey"/>
            </header>
            
            <!-- ���ۼ� -->
            <table class="table table-striped" style="max-width:100%; margin:auto">
                     <tbody>
                        
                        <%
                        if(hotelList.size()>0){
                           for(int i=mypage*pagesize;i<(mypage*pagesize)+pagesize;i++){
                              if(i == size) break;
                           Map<String, Object> hotelMap = new HashMap<String, Object>();
                           hotelMap = hotelList.get(i);                           
                        %>
                        
                        <!-- �Խù� -->
                        <tr>
                           <td>
                              <div class="media">
                                 <a class="thumbnail pull-left" href="#" onclick="buyHotel(<%=hotelMap.get("HOTEL_PNO") %>)" style="margin:0 auto; border:0"> <img
                                    class="media-object"
                                    src="../pds/<%=hotelMap.get("IMG1") %>"
                                    style="width: 180px; height: 180px; ">
                                 </a>
                                 <div class="media-body" style="text-align:left; vertical-align:middle">
                                 <table class="table table-condensed">
                                    <tr height="20px">
                                       <td width="150px">ȣ�ڸ�</td>
                                       <td><a href="#" onclick="buyHotel(<%=hotelMap.get("HOTEL_PNO") %>)" style="text-decoration:none"><%=hotelMap.get("HOTEL_NAME") %></a></td>
                                    </tr>
                                    <tr>
                                       <td width="150px">����</td>
                                       <td><%=hotelMap.get("HOTEL_PRICE") %>��</td>
                                    </tr>
                                    <tr>
                                       <td width="150px">�Ǹ���</td>
                                       <td><%=hotelMap.get("USER_ID") %></td>
                                    </tr>
                                    <tr>
                                       <td width="150px">����</td>
                                       <td><%=hotelMap.get("HOTEL_ADDRESS") %></td>
                                    </tr>
                                    <tr>
                                       <td width="150px">��ȸ��</td>
                                       <td><%=hotelMap.get("HOTEL_HIT") %></td>
                                    </tr>
                                 </table>

                                 </div>
                              </div>
                           </td>
                        </tr>
                        
                        <!-- �Խù��� -->
                        <%
                           }
                        }else{ %>
                        <tr>
                           <td>
                              <div class="media">
                                 <div class="media-body" style="text-align:left; vertical-align:middle">
                                 <table class="table table-condensed">
                                    <tr height="20px">
                                       <td align="center" width="150px"><h1>��ϵ� �� �� �����ϴ�</h1></td>
                                    </tr>
                                 </table>
                                 </div>
                                 </div>
                                 
                     <%} %>
                     </tbody>
                  </table>
            <!-- ���ۼ� �� -->
                        <!----------------------------- ����¡ ---------------------------->
      <table width=700 BGCOLOR=000000 border=0 cellpadding=0 cellspacing=0 align="center">
      <tr  bgcolor="#7baad6" height=5>
          <td colspan=5 align="center" valign="bottom">
            <img src="<%=imagePath%>j_b04.gif" border="0" align="left" hspace="0" vspace="0">
            <img src="<%=imagePath%>j_b05.gif" border="0" align="right" hspace="0" vspace="0">         
          </td>
      </tr>
      <tr BGCOLOR=FFFFFF>
         <td width=180 height=30 valign=middle align=right>
           <a href="#"><img src="<%=imagePath%>m_bt10.gif" border=0 align=absmiddle></a>
         </td>
         <td width=520  align=center valign=middle height=30>
            <%
            String pagePath = "./getHotelList.kos";
            PageBar pg = new PageBar(pagesize, size, mypage, pagePath);
            out.print(pg.getPageBar());
            %>   
         </td>
         <td align="right">
                  <%if(session.getAttribute("result")!=null){ %>
               <a href="#" style="margin-left:auto"><input type="button" onclick="hotelIDCheck()" class="btn" value="���"/></a>
                  <%} %>
         </td>
      </tr>
      </table>
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

      </div><!-- ���̵峡 -->

</div><!-- wrapper �� -->
</body>
</html>