<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List, java.util.Map" %>
<%
   String result = request.getParameter("result");
   String check = request.getParameter("check");
   String login = request.getParameter("login");
   String command = request.getParameter("command");
   
   
   String in_nick    = "";
   String in_name    = "";
   String in_mobile  = "";
   String in_address = "";
   String in_gender  = "";
   String in_id="";
   
   Cookie input_info[] = request.getCookies();
   if(input_info != null){
	   for(int i=0; i<input_info.length; i++){
	   	  if("in_nick".equals(input_info[i].getName())){
	   		  in_nick = input_info[i].getValue();
	   	  }
	   	  else if("in_id".equals(input_info[i].getName())){
	   		  in_id = input_info[i].getValue();
	   	  }
	   	  else if("in_name".equals(input_info[i].getName())){
	   		  in_name = input_info[i].getValue();
	   	  }
	   	  else if("in_mobile".equals(input_info[i].getName())){
	   		  in_mobile = input_info[i].getValue();
	   	  }
	   	  else if("in_address".equals(input_info[i].getName())){
	   		  in_address = input_info[i].getValue();
	   	  }
	   	  else if("in_gender".equals(input_info[i].getName())){
	   		  in_gender = input_info[i].getValue();
	   	  }
	   }
   }
%>
    
<html>
    <head>

    <!-- /.javascript files -->
    <script src="../css/loginCss/js/jquery.js"></script>
    <script src="../css/loginCss/js/bootstrap.min.js"></script>
    <script src="../css/loginCss/js/bootstrap.js"></script>
    <script src="../css/loginCss/js/custom.js"></script>
    <script src="../css/loginCss/js/jquery.sticky.js"></script>
    <script src="../css/loginCss/js/wow.min.js"></script>
    <script src="../css/loginCss/js/owl.carousel.min.js"></script>
    
     <!-- ȸ������ CSS -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="../css/loginCss/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../css/loginCss/css/main.css">
    <link rel="stylesheet" href="../css/loginCss/css/font-awesome.min.css">
    <link href='https://fonts.googleapis.com/css?family=Passion+One' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Oxygen' rel='stylesheet' type='text/css'>

    <!-- Ÿ��Ʋ -->
    <title>Final Project</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <!-- CSS ������ -->
    <link href="../css/loginCss/css/mycss.css" rel="stylesheet">
    <link href="../css/loginCss/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="../css/loginCss/css/font-awesome.min.css" rel="stylesheet">
    <link href="../css/loginCss/fonts/icon-7-stroke/css/pe-icon-7-stroke.css" rel="stylesheet">
    <link href="../css/loginCss/css/animate.css" rel="stylesheet" media="screen">
    <link href="../css/loginCss/css/owl.theme.css" rel="stylesheet">
    <link href="../css/loginCss/css/owl.carousel.css" rel="stylesheet">
    <!-- �÷� -->
    <link href="../css/loginCss/css/css-index.css" rel="stylesheet" media="screen">

	<!-- ���� ��Ʈ -->
	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic" />

	    <script type="text/javascript">
	    // alertâ �޽���
	    function openAlert(){
	    	$("#dlg_sign").modal('hide');
	    	$("#l_alert").modal('show');
	    }
	    function openAlert2(){
	    	$("#l_alert2").modal('show');
	    }
	    
	    // ��й�ȣ üũ
        function passwordCheck() {
         var pw1 = $('#pass').val();
         var pw2 = $('#pass1').val();
         
         if(pw1 != pw2) {
            $('#pwcheckmessage').html('��й�ȣ�� ��ġ���� �ʽ��ϴ�');
         } else {
            $('#pwcheckmessage').html('');
         }
      	}  
	    
      function login(){
         $("#f_header").attr("method","post");
         $("#f_header").attr("action","./login.kos");
         $("#f_header").submit();
      }
      function join(){
		 var check='<%=check%>';
		 
		 var j_id = $('#id').val();
		 var j_pass1 = $('#pass').val();
		 var j_pass2 = $('#pass1').val();
		 var j_nick = $('#nick').val();
		 var j_name = $('#name').val();
		 var j_mobile = $('#mobile').val();
		 var j_address = $('#address').val();
		 
		 if(check == 'null' || check=='NO'){
		 	$("#al_msg").val('�ߺ��˻� �ʿ�');
			openAlert();
		}
		 
		 if(j_pass1 != j_pass2){
			$("#al_msg").val('��й�ȣ ����ġ');
			openAlert();
			return;
		 }
		 
		 if(j_id=='' || j_pass1=='' || j_pass2=='' || j_nick=='' || j_name =='' || j_mobile =='' || j_address==''){
			$("#al_msg").val('��� �Է����ּ���.');
			openAlert();
			return;
		 }
		 
		 if(check=='OK' && j_id!='' && j_pass1!='' && j_pass2!='' && j_nick!=''
				 && j_name !='' && j_mobile !='' && j_address!='')
		 { 
		     $("#f_join").attr("method","post");
	         $("#f_join").attr("action","./reg.kos");
	         $("#f_join").submit();
		 }
		 
		 
      }        
      function loginCheck(){
          $("#dlg_check").modal('show');
          $("#id_check").attr("value",$("#id").val());
      }
      function loginCheck2(){
    	 var i_id = $("#id_check").val();
    	 $("#f_join").attr("method","post");
         $("#f_join").attr("action","./checkMember.kos");
         $("#f_join").submit();    	  
      }
      
      function modalOpen(){
         $("#dlg_sign").modal('show'); 
      }
      
      function inputInfo(){
		  var in_id = '<%=in_id%>';
    	  var in_nick = '<%=in_nick%>';
          var in_name = '<%=in_name%>';
          var in_mobile = '<%=in_mobile%>';
          var in_address = '<%=in_address%>';
          var in_gender = '<%=in_gender%>';
          if(in_id != '' && in_id !=null){
	    		$("#id").attr('value',in_id);
          }           
          if(in_nick != ''){
	    		$("#nick").attr('value',in_nick);
          }           
          if(in_name != ''){
	    		$("#name").attr('value',in_name);
          }           
          if(in_mobile != ''){
	    		$("#mobile").attr('value',in_mobile);
          }           
          if(in_address != ''){
	    		$("#address").attr('value',in_address);
          }           
          if(in_gender == '����'){
  			$("#gender").val('����');
          }           
          else if(in_gender == '����'){
  			$("#gender").val('����');
          }	  
      }
      function clearInfo(){
	   	 $('#dlg_sign').on('hidden.bs.modal', function (e) {
	   	    console.log('modal close');
	   	    $(this).find('#f_join')[0].reset()
	   	});
      }
      
    </script>
    </head>

    <body data-spy="scroll" data-target="#navbar-scroll">
	
	<!-- alert â -->
	<div class="modal" id="l_alert" tabindex="-1" role="dialog" style="padding:10% 40%">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-body" align="center">
				<input type="text" id="al_msg" style="border:0; text-align:center;"><br>
				<button type="button" class="btn" data-dismiss="modal" onClick="modalOpen()">Ȯ��</button>
			</div>
		</div>
	</div>
	</div>

	<div class="modal" id="l_alert2" tabindex="-1" role="dialog" style="padding:10% 40%">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-body" align="center">
				<input type="text" id="al_msg2" style="border:0; text-align:center;"><br>
				<button type="button" class="btn" data-dismiss="modal">Ȯ��</button>
			</div>
		</div>
	</div>
	</div>
	<!-- alert â �� -->
   <%
   if("open".equals(command)){
	%>
	   <script type="text/javascript"> 
	   		$(document).ready(function(){
			   modalOpen();   
	   		});
	   </script>
   <%
   }
   if(input_info!=null && input_info.length>0){
	%>
	   <script type="text/javascript"> 
	   		$(document).ready(function(){
			   inputInfo();   
	   		});
	   </script>
   <%
   }
   else{
   %>
	   <script type="text/javascript"> 
	   		$(document).ready(function(){
			   clearInfo();   
	   		});
	   </script>
   
   <%	   
   }
   
         if(result!=null && "1".equals(result)){
            	
   %>
         <script type="text/javascript">
			$("#al_msg2").val('ȸ������ ����!');
			openAlert2();
			clearInfo();   
         </script>
   <%
   		
         }
   %>
         <%
            if(check!=null){
               if("OK".equals(check)){
         %>
         <script type="text/javascript">
			$("#al_msg").val('��� ������ ���̵�');
			openAlert();
	    	$("#dlg_sign").modal('hide');
        </script>
         <%
               }else if("NO".equals(check)){
         %>
         <script type="text/javascript">
			$("#al_msg").val('�ߺ��� ���̵�');
			openAlert();
	    	$("#dlg_sign").modal('hide');
		</script>
		           
         <%          
            }
         }
         if(login!=null){
        	 if("fail".equals(login)){
         %>
		<script type="text/javascript">
			$("#al_msg2").val('�α��� ����');
			openAlert2();
		</script>
		<%
        	}
		}
		%>
        <!-- /.preloader -->
       <div id="preloader"></div>
        <div id="top"></div>

        <!-- /.parallax full screen background image -->
        <div class="fullscreen landing parallax" style="background-image:url('../css/loginCss/images/bg.jpg');" data-img-width="2000" data-img-height="1333" data-diff="100">
            <div class="overlay">
                <div class="container">
                    <div class="row">
                        <div class="col-md-7">
                            <!-- /.logo -->
                            <div class="logo wow fadeInDown" style="margin-top:25%"><a href="./main.jsp"><img src="../css/loginCss/images/logos.gif" alt="logo"></a></div>

                            <!-- ����ȭ�� -->
                            <h1 class="wow fadeInLeft">
                                  <I> <b>Convenience</b> </I>   
                            </h1>

                            <!-- �Ұ��� -->
                            <div class="landing-text wow fadeInUp">
                                <p>Join us & Enjoy!
                                                             
                                </p>
                                   
                            </div>              

                            <!-- ���� -->
                           <!--  <div class="head-btn wow fadeInLeft">
                                <a href="" class="btn-primary">������Ʈ ����</a>
                            </div> -->

                        </div> 

                        <!-- �α����� -->
                        <div class="col-md-5" style="margin-top:5%">
                            <div class="signup-header wow fadeInUp">
                                <h3 class="form-title text-center"><B>�α��� & ȸ������</B></h3>
                                <form class="form-header" role="form" method="POST" id="f_header">
                                    <input type="hidden" name="id" value="ID">
                                    <input type="hidden" name="pw" value="PassWord">
                                    <div class="form-group">
                                        <input class="form-control input-lg" name="u_id" id="u_id" type="text" placeholder="ID" required>
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control input-lg" name="u_pw" id="u_pw" type="password" placeholder="PW" required>
                                    </div>
                                    <div class="form-group last">
                                        <input type="button" onClick="login()" class="btn btn-warning btn-block btn-lg" value="�α���">
                                    </div>
                                    <p class="privacy text-center">
                                    <a class="line" data-toggle="modal" data-target="#dlg-sign" href="#dlg_sign" onClick="modalOpen()">ȸ�������ϱ�</a>
                                    <!-- <a href="pwsearch.jsp">��й�ȣã��</a> -->
                                    </p>
                                </form>
                            </div>            

                        </div>
            </div>   
                    </div>
                </div> 
            </div> 
        
        <!-- ȸ������â -->
      <div id="dlg_sign" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog main-login main-center" role="document">
      <div class="modal-body">
      <div class="row">
      <!-- form ���� -->
      <form id="f_join" class="form-horizontal" method="post">
         <!-- ���̵� -->
            <label for="name" class="cols-sm-2 control-label">���̵�</label>
            <div class="cols-sm-10">
               <div class="input-group">
                  <span class="input-group-addon">
                  <i class="fa fa-user fa" aria-hidden="true"></i></span> 
                  <input style="width:222px" type="text" class="form-control" name="id" id="id" placeholder="���̵�" />
                  <input type="button" class="btn active" value="check" onClick="loginCheck()">
               </div>
            </div>

         <!-- ��й�ȣ -->
            <label for="email" class="cols-sm-2 control-label">��й�ȣ</label>
            <div class="cols-sm-10">
               <div class="input-group">
                  <span class="input-group-addon"><i class="fa fa-key fa" aria-hidden="true"></i></span> 
                  <input onkeyup="passwordCheck();" type="password" class="form-control" name="pass" id="pass" minlength="6" placeholder="��й�ȣ" />
                     
               </div>
            </div>

         <!-- ��й�ȣ Ȯ�� -->
            <label for="email" class="cols-sm-2 control-label">��й�ȣ Ȯ��</label>
            <div class="cols-sm-10">
               <div class="input-group">
                  <span class="input-group-addon"><i class="fa fa-key fa"   aria-hidden="true"></i></span> 
                  <input onkeyup="passwordCheck();" type="password" class="form-control" name="pass1" id="pass1" minlength="6" placeholder="��й�ȣ Ȯ��" />
               </div>
            </div>
            <h5 id="pwcheckmessage" style="color: red;"></h5>
         <!-- �г��� -->
            <label for="nick" class="cols-sm-2 control-label">�г���</label>
            <div class="cols-sm-10">
               <div class="input-group">
                  <span class="input-group-addon"><i class="fa fa-comment fa" aria-hidden="true"></i></span> 
                  <input type="text" class="form-control" name="nick" id="nick" placeholder="�г���" />
               </div>
            </div>
            
         <!-- �̸� -->
            <label for="name" class="cols-sm-2 control-label">�̸�</label>
            <div class="cols-sm-10">
               <div class="input-group">
                  <span class="input-group-addon"><i class="fa fa-child fa" aria-hidden="true"></i></span> 
                  <input type="text" class="form-control" name="name" id="name" placeholder="�̸�" />
               </div>
            </div>

         <!-- �ڵ��� -->
            <label for="mobile" class="cols-sm-2 control-label required">�ڵ���</label>
            <div class="cols-sm-10">
               <div class="input-group">
                  <span class="input-group-addon">
                  <i class="fa fa-phone" aria-hidden="true"></i></span> 
                  <input type="text" class="form-control" name="mobile" id="mobile" placeholder="�ڵ��� ��ȣ" />
               </div>
            </div>
            
         <!-- �ּ� -->
            <label for="nationality" class="cols-sm-2 control-label">�ּ�</label>
            <div class="cols-sm-10">
               <div class="input-group">
                  <span class="input-group-addon">
                  <i class="fa fa-globe fa-lg" aria-hidden="true"></i></span> 
                     <input type="text" class="form-control" name="address" id="address"   placeholder="�ּ�" />
               </div>
            </div>

         <!-- ���� -->
            <label for="country" class="cols-sm-2 control-label">����</label>
            <div class="cols-sm-10">
               <div class="input-group">
                  <span class="input-group-addon">
                  <i class="fa fa-group fa-lg" aria-hidden="true"></i></span> 
                     <select   class="form-control" name="gender" id="gender">
                     <option>-select-</option>
                     <option>����</option>
                     <option>����</option>
                  </select>
               </div>
            </div>
         <div class="form-group ">
            <input type="button" class="btn btn-primary btn-lg btn-block login-button" value="����" onClick="join()">
            <input type="button" data-dismiss="modal" class="btn btn-default btn-lg btn-block" value="���" onClick="clearInfo()">
         </div>
      </form>
      </div>
      </div> 
      </div>
      </div> <!-- ��ó�� div -->
      
      <!-- �ߺ��˻� â -->
      <div id="dlg_check" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog main-login main-center" role="document">
      <div class="modal-body">
      <div class="row">
      <!-- form ���� -->
      <form id="f_check" class="form-horizontal" method="post">
         <!-- ���̵� -->
            <label for="name" class="cols-sm-2 control-label">���̵�</label>
            <div class="cols-sm-10">
               <div class="input-group">
                  <span class="input-group-addon">
                  <i class="fa fa-user fa" aria-hidden="true"></i></span> 
                  <input style="width:222px" type="text" class="form-control" name="id_check" id="id_check" placeholder="���̵�" />
                  <input type="button" class="btn active" value="check" onClick="loginCheck2()">
               </div>
            </div>
         <div class="form-group ">
            <input type="button" data-dismiss="modal" class="btn btn-default btn-lg btn-block cancle-button" value="���">
            <h5 id="pwcheckmessage" style="color: red;"></h5>
         </div>
      </form>
      </div>
      </div> 
      </div>
      </div>
      <!-- �ߺ��˻� â -->
<!-- 
  		<script type="text/javascript">
           	new WOW().init();
		</script>  -->
        
    </body>
</html>