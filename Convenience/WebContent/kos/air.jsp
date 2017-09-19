<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ page import = "java.util.List, java.util.ArrayList, java.util.Map, java.util.HashMap, kos.util.*" %>
<%
int size = 0;
   List<Map<String,Object>> airList = new ArrayList<Map<String,Object>>();
   if(request.getAttribute("airList") != null){
      airList = (List<Map<String,Object>>) request.getAttribute("airList");
      size = airList.size();
   }

   Map<String,Object> mem_info= new HashMap<String,Object>();
   if(session.getAttribute("result")!=null){
      mem_info = (Map<String,Object>)session.getAttribute("result");
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
<title>��Ÿ��Ʋ</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="../css/AirCss/bootstrap.min.css" />
<link rel="stylesheet" href="../css/AirCss/main.css" />
<link rel="stylesheet" href="../css/AirCss/air.css" />
<link rel="stylesheet" href="../css/css/font-awesome.css" />
<link rel="stylesheet" href="../css/css/font-awesome.min.css" />

<!-- Scripts -->
<script src="../css/AirCss/js/jquery.min.js"></script>
<script type="text/javascript" src="../css/AirCss/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../css/AirCss/js/bootstrap.js"></script>
<script src="../css/AirCss/js/skel.min.js"></script>
<script src="../css/AirCss/js/util.js"></script>
<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
<script src="../css/AirCss/js/main.js"></script>
<script src="../css/AirCss/js/air.js"></script>
<script type="text/javascript">
   function airView(val){
      var air_no = val;      
       // alert("air_no +"+val);
      location.href="./getAirList.kos?air_no="+val
   }
   
   function airIns(){
      location.href="./airWrite.jsp"
   }
   function alertLogin(){
      $("#login_alert").modal();
   }
</script>
</head>
<body>
<!-- alertâ -->
   <div class="modal" id="login_alert" tabindex="-1" role="dialog" style="padding:10% 40%">
      <div class="modal-dialog modal-sm">
         <div class="modal-content">
            <div class="modal-body" align="center">
               <h1>�α����� �ʿ��մϴ�.</h1>&nbsp;
               <button type="button" class="btn" data-dismiss="modal" onClick="./getAirList.kos">Ȯ��</button>
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

         <!-- ��ٱ��� ���� -->
         <div id="i_hotel" class="post">
            <header>
               <div class="title">
                  <h2>
                     <a href="#">AIR</a>
                  </h2>
                  <p>�� ���ݿ� ������ ����</p>
                  <p>Have a good shopping.</p>
               </div>
               <img src="../images/main1.jpg" alt="" style="width:50%; box-shadow:10px 10px 20px 5px grey"/>
            </header>
             
            <!-- ���ۼ� -->
            <table class="table table-striped" style="max-width:100%; margin:auto">
               <tbody>
                  <form id="f_air">
                        <thead>
                        <tr>
                           <th style="width: 25%; text-align: center"><label
                              style="margin: auto">����</label></th>
                           <th style="width: 20%; text-align: center"><label
                              style="margin: auto">����</label></th>
                           <th style="width: 10%; text-align: center"><label
                              style="margin: auto">����</label></th>
                           <th style="width: 15%; text-align: center"><label
                              style="margin: auto">�ۼ���</label></th>
                           <th style="width: 15%; text-align: center"><label
                              style="margin: auto">�ۼ���</label></th>
                           <th style="width: 10%; text-align: center"><label
                              style="margin: auto">��ȸ��</label></th>
                        </tr>
                      </thead>
                        <!-- �Խù� -->
                        <!-- <tr>
                           <td>
                              <div class="media">
                                 <a class="thumbnail pull-center" href="#" style="margin:0 auto; border:0"> <img
                                    class="media-object"
                                    src="http://icons.iconarchive.com/icons/custom-icon-design/flatastic-2/72/product-icon.png"
                                    style="width: 150px; height: 150px; ">
                                 </a>
                              </div>
                           </td>
                           <td>
                              <div class="media">
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
                        </tr> -->
                        
                        <!-- �ݺ� �� tr ���� -->
                        <% 
                           if(airList !=null && airList.size()>0){ 
                             for(int i=0; i<airList.size(); i++){
                        %>
<%-- src="D:/dev_kosmo/FinalProject/WebContent/pds/<%=airList.get(i).get("IMG1")%>" --%>
<%-- src="../pds/<%=airList.get(i).get("IMG1")%>" --%>
                         <tr>
                           <td>
                              <div class="media">
                                 <a class="thumbnail pull-center" href="#" style="margin:0 auto; border:0"> <img
                                    class="media-object"
                                    src="../pds/<%=airList.get(i).get("IMG1")%>"
                                    style="width: 150px; height: 150px;"/>
                                 </a>
                              </div>
                           </td>
                              <td>
                              <font size="3"><br><br><br></font> <!--�۾� ������ ���� br ��Ʈ -->
                              <a href="#" style="text-decoration:none" onClick="airView(<%=airList.get(i).get("AIR_NO")%>)">
                                 <b><%=airList.get(i).get("AIR_PNAME")%>
                                 </b>
                              </a>
                           </td>
                           <td style="width:10%; text-align:center; padding-top:75px"><label><%=airList.get(i).get("AIR_PRICE") %></label></td>
                           <td style="width:10% ; text-align:center; padding-top:75px"><label><%=airList.get(i).get("USER_ID") %></label></td>
                           <td style="width:15%; text-align:center; padding-top:75px"><label><%=airList.get(i).get("AIR_WRITEDATE") %></label></td>
                           <td style="width:5%; text-align:center; padding-top:75px"><label><%=airList.get(i).get("AIR_HIT") %></label></td>
                        </tr>
                        <% 
                           }
                        } else{ %>
                        <!-- �ݺ� �� tr �� -->
                         <tr>
                           <td colspan="6">
                              <h1><label align="center">��ϵ� �Խù��� �����ϴ�.</label></h1>   
                           </td>
                        </tr>
                        <%} %>
                        
                        <!-- �Խù��� -->
                        </form>
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
               <% if(session.getAttribute("result") != null){ %>
               <a href="javascript:airIns()" style="margin-left:auto"><input type="button" class="btn" value="���"/></a>
               <% } else{%>
               <a href="javascript:alertLogin()" style="margin-left:auto"><input type="button" class="btn" value="���"/></a>
               <%}%>
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