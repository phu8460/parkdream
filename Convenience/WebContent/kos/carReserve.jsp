<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import ="java.util.Map, java.util.HashMap, java.util.List, java.util.ArrayList" %>
<%
	List<Map<String,Object>> rentList = new ArrayList<Map<String,Object>>();
	Map<String,Object> rentInfo = new HashMap<String,Object>();
	if(request.getAttribute("rentList")!=null && request.getAttribute("rentInfo")!=null){
		rentList = (List<Map<String,Object>>)request.getAttribute("rentList");	
		rentInfo = (Map<String,Object>)request.getAttribute("rentInfo");	
	}
%>
<html>
<head>
<title>CAR RENTAL ��� ��� �� ����</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="../css/BuyCss/bootstrap.css" />
<link rel="stylesheet" href="../css/BuyCss/bootstrap.min.css" />
<link rel="stylesheet" href="../css/BuyCss/main.css" />
<link rel="stylesheet" href="../css/BuyCss/buy.css" />
<link rel="stylesheet" href="../css/BuyCss/font-awesome/css/font-awesome.css" />
<link rel="stylesheet" href="../css/BuyCss/font-awesome/css/font-awesome.min.css" />

<!-- Scripts -->
<script src="../css/BuyCss/js/jquery.min.js"></script>
<script type="text/javascript" src="../css/BuyCss/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../css/BuyCss/js/bootstrap.js"></script>
<script src="../css/BuyCss/js/skel.min.js"></script>
<script src="../css/BuyCss/js/util.js"></script>
<script src="../css/BuyCss/js/main.js"></script>
<script src="../css/BuyCss/js/buy.js"></script>
<script src="../css/BuyCss/js/comment.js"></script>

<script type="text/javascript">
	function orderIns(){
		var radioCheck = $("input[name='radio1']:checked").val();
		
		if($("#sel").val() == '[ - ���� �ϼ��� - ]' 
			|| $("#rname").val() == '' || $("#req").val() == '' 
			|| $("#tel1").val() == '' || $("#tel2").val() ==''){
			$("#al_msg").val('��� �Է����ּ��� ');
	    	$("#check_alert").modal('show');
			return ;
		}
		
		
		if(radioCheck == "no") {
			$("#al_msg").val('����� ���� ���ּ��� ');
	    	$("#check_alert").modal('show');
			return;
		}
		$("#f_order").attr("method","post");
		$("#f_order").attr("action","./carOrder.kos");
		$("#f_order").submit();
	}
	function tt(){
		$("#age").attr('value',$("#sel").val());
		//alert($("#age").val());
	}
</script>

</head>
<body>
<!-- alert â -->
	<div class="modal" id="check_alert" tabindex="-1" role="dialog" style="padding:10% 40%">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-body" align="center">
				<input type="text" id="al_msg" style="border:0; text-align:center;"><br>
				<button type="button" class="btn" data-dismiss="modal">Ȯ��</button>
			</div>
		</div>
	</div>
	</div>
<!-- alertâ  -->

<!-- ------------------------------ ��ü ���� �� ���� ------------------------------ -->
<div class="wrapper">
<!-- ---------- ��� �޴� �� ���� ---------- -->
<header id="header">
	<h1><a href="./main.jsp">convenience</a></h1>
	<div class="links dropdown">
		<ul>
			<li><a href="./main.jsp">HOME</a></li>
			<li><a href="./getAirList.kos">AIRPLANE</a></li>
			<li><a href="./getCarList.kos">CAR RENTAL</a></li>
			<li><a href="./getHotelList.kos">HOTEL</a></li>
			<li><a href="./getBoardList.kos">BOARD</a></li>
		</ul>
	</div>
		
	<!-- ---------- ��� �޴� �� ���� (������ �˻� & ȸ������ & �޴�) --------- -->
	<div class="main">
		<ul>
			<li class="search"><a class="fa-search" href="#search">�˻�</a>
				<form id="search" method="get" action="#">
					<input type="text" name="query" placeholder="�˻�" style="margin-top: 10px" />
				</form></li>
			<li class="menu"><a class="fa-bars" href="#menu">�޴�</a></li>
		</ul>
	</div>
	<!-- ---------- ��� �޴� �� �� (������ �˻� & ȸ������ & �޴�) --------- -->
		
	<!-- ---------- (������ �˻� & ȸ������ & �޴�) ���� ---------- -->
	<div id="menu">
		<!-- ---------- ȸ�� �α��� ���� ---------- -->
		<div>
			<ul class="actions vertical">
				<li><a href="login.jsp" class="button big fit">Log In</a></li>
			</ul>
		</div>
		<!-- ---------- ȸ�� �α��� �� ---------- -->
		<!-- ---------- �޴��� ���� ---------- -->
		<div>
			<ul class="links">
				<li>
					<a href="edit.jsp"><h3>ȸ�� ����</h3><p>���� & Ż��</p></a>
				</li>
				<li>
					<a href="#"><h3>��� ��Ȳ</h3><p>������� ��ǰ ����</p></a>
				</li>
				<li>
					<a href="cart.jsp"><h3>��ٱ���</h3><p>���س��� ����</p></a>
				</li>
			</ul>
		</div>
		<!-- ---------- �޴��� �� ---------- -->
	</div>
	<!-- ---------- (������ �˻� & ȸ������ & �޴�) �� ---------- -->
</header>
<!-- ---------- ��� �޴� �� �� ---------- -->

<!-- -------------------- �ߴ� ���� ���Ժ� ���� -------------------- -->
<div class="main">
<div class="content-wrapper">
	<div class="post">
		<div class="container-fluid">
		<!-- -------------------- �ߴ� ���� ���� �� ���� -------------------- -->
		<!-- ---------- ��Żī Ȯ�� ���� ---------- -->
		<form id="f_order">
		<table>
			<tr>
				<td align="center" style="font-size:x-large;color:blue;">��Żī ��ü</td>
				<td colspan="3"><input type="text" disabled="disabled" value="<%=rentList.get(0).get("RENT_NAME")%>"></td>
			</tr>
			<tr>
				<td align="center" style="font-size:x-large;color:blue;">����� ��ȣ</td>
				<td colspan="3"><input type="text" disabled="disabled" value="<%=rentList.get(0).get("RENT_LICENSE")%>"></td>
			</tr>
			<tr>
				<td align="center" style="font-size:x-large;color:blue;">��Żī</td>
				<td colspan="3"><input type="text" name="rent_kind" value="<%=rentInfo.get("rent_kind")%>"></td>
			</tr>
			<tr>
				<td align="center" style="width:17%;font-size:x-large;color:blue;">�μ� ��¥</td>
				<td style="width:33%"><input type="text" name="start_date" value="<%=rentInfo.get("start_date")%>"></td>
				<td align="center" style="width:17%;font-size:x-large;color:blue;">�μ� �ð�</td>
				<td style="width:33%"><input type="text" name="start_time" value="<%=rentInfo.get("start_time")%>"></td>
			</tr>
			<tr>
				<td align="center" style="width:17%;font-size:x-large;color:blue;">�ݳ� ��¥</td>
				<td style="width:33%"><input type="text" name="end_date" value="<%=rentInfo.get("end_date")%>"></td>
				<td align="center" style="width:17%;font-size:x-large;color:blue;">�ݳ� �ð�</td>
				<td style="width:33%"><input type="text" name="end_time" value="<%=rentInfo.get("end_time")%>"></td>
			</tr>
			<tr>
				<td align="center" style="width:17%;font-size:x-large;color:blue;">�� ��</td>
				<td style="width:33%"><input type="text" name="tprice" value="<%=rentInfo.get("price")%>" ></td>
				<td>��</td>
				<td style="width:33%;font-size:x-large;color:red;">(���� ���� ���� - ���� ����)</td>
			</tr>
		</table>
		<!-- ---------- ��Żī Ȯ�� �� ---------- -->
		<div class="page-header">
				<label class="text-danger" style="font-size:x-large;">�ع��� ����(�ٹ� �ð��� ���� ��û ����)�� ��� �ݾ��� ������ �ΰ� �˴ϴ�.</label>
		</div>
		<input type="hidden" id="age" name="age">
		<input type="hidden" name="rent_no" value="<%=rentList.get(0).get("RENT_NO")%>">
		<!-- ---------- ������ ���� ---------- -->
		<table>
			<tr>
				<td align="center" style="font-size:x-large;color:blue;">������ ��</td>
				<td><input type="text" id="rname" name="rname"></td>
				<td align="center" style="font-size:x-large;color:blue;">�μ� , �ݳ�</td>
				<td><input type="text" disabled="disabled" value="��Żī (�繫��)"></td>
			</tr>
			<tr>
				<td align="center" style="font-size:x-large;color:blue;">��ȭ ��ȣ 1</td>
				<td><input type="text" id="tel1" name="tel1" ></td>
				<td align="center" style="font-size:x-large;color:blue;">��ȭ ��ȣ 2</td>
				<td><input type="text" id="tel2" name="tel2" ></td>
			</tr>
			<tr>
				<td align="center" style="font-size:x-large;color:blue;">��Ÿ ��û</td>
				<td colspan="3"><input type="text" id="req" name="request" ></td>
			</tr>
			<tr>
				<td align="center" style="font-size:x-large;color:blue;">������ ����</td>
				<td>
					<select class="form-control" id="sel" onChange="tt()">
									<option>[ - ���� �ϼ��� - ]</option>
									<option>[��] 21 ~ 22 ��</option>
									<option>[��] 23 ~ 25 ��</option>
									<option>[��] 26 �� �̻�</option>
								</select>
				</td>
				<td colspan="2"></td> <!-- ����� ó���� -->
			</tr>
		</table>
		</form>
		<!-- ---------- ������ �� ---------- -->
		<div class="page-header">
			<label class="text-danger" style="font-size:x-large;">�������ɷ�Ʈī�� ����. ��21���̸�, ������� 1������ �뿩�Ұ���.</label>
			<label class="text-danger" style="font-size:x-large;">�ؼ��������� ���� �ʿ��� �ּ����� ���������� ���Ǹ� ���ּž� �̿��Ͻ� �� �ֽ��ϴ�.</label>
		</div>
		<!-- ---------- �������� ���Ǽ� ���� ---------- -->
		<label style="font-size:x-large;">�����ϴ� �������� �׸�</label>
		<table class="table table-bordered">
			<tr align="center">
				<td style="width:33%;font-size:large;">�����ϴ� �������� �׸�</td>
				<td style="width:33%;font-size:large;">���� �� �̿����</td>
				<td style="width:33%;font-size:large;">���� �� �̿�Ⱓ</td>
			</tr>
			<tr align="center">
				<td style="width:33%;font-size:large;">
					�̸�, ���̵�, ��й�ȣ,
					<br>
					�������, �޴�����ȣ
				</td>
				<td style="width:33%;font-size:large;">
					ȸ�����Լ�������,
					<br>
					��������� ���� ����,
					<br>
					�ο� �� ����ó��
				</td>
				<td style="width:33%;font-size:large;">
					<br>
					ȸ��Ż�� �� 5�ϱ���
				</td>
			</tr>
		</table>
		<label style="font-size:large;">ȸ��� ȸ������, ���, ���� ��û ����� ���� �Ʒ��� ���� ���������� �����ϰ� �ֽ��ϴ�.</label>
		<label style="font-size:x-large;">- ���� �׸�</label>
		<label style="font-size:large;">�̸�, ��й�ȣ, ��ȭ��ȣ, �̸���, ���� �α�, ���� IP ����, �������</label>
		<label style="font-size:x-large;">- �������� ���� ���</label>
		<label style="font-size:large;">Ȩ������(ȸ������, ���Խ���, ����), ��ȭ�� ���� ȸ������ ���������� ���� �� �̿����</label>
		<label style="font-size:large;">ȸ��� ������ ���������� ������ ������ ���� Ȱ���մϴ�.</label>
		<label style="font-size:x-large;">- ���� ������ ���� ��� ���� �� ���� ������ ���� �������</label>
		<label style="font-size:large;">������ ����, ���� �� ��� ����</label>
		<label style="font-size:x-large;">- ȸ�� ����</label>
		<label style="font-size:large;">ȸ���� ���� �̿뿡 ���� ����Ȯ��, ���� �ĺ�, �ҷ�ȸ���� ���� �̿� ������</label>
		<label style="font-size:large;">���ΰ� ��� ����, ���� �ǻ� Ȯ��, �Ҹ�ó�� �� �ο�ó��, �������� ����</label>
		<label style="font-size:x-large;">- �׿� ���� ������� �ʽ��ϴ�</label>
		<label style="font-size:large;">���������� ���� �� �̿�Ⱓ</label>
		<label style="font-size:large;">��Ģ������, �������� ���� �� �̿������ �޼��� �Ŀ��� �ش� ������ ��ü ���� �ı��մϴ�.</label>
		<label style="font-size:large;">��, ��������� ������ ���� ������ �ʿ䰡 �ִ� ��� ȸ��� �Ʒ��� ���� ������ɿ���</label>
		<label style="font-size:large;">���� ������ �Ⱓ ���� ȸ�������� �����մϴ�.</label>
		<label style="font-size:x-large;">- ���� �׸� : �������</label>
		<label style="font-size:x-large;">- ���� �ٰ� : ���ڻ�ŷ� ����� �Һ��ں�ȣ�� ���� ����</label>
		<label style="font-size:x-large;">- ���� �Ⱓ : 5��</label>
		<label style="font-size:large;">��� �Ǵ� û��öȸ � ���� ��� : 5�� (���ڻ�ŷ� ����� �Һ��ں�ȣ�� ���� ����)</label>
		<label style="font-size:large;">��ݰ��� �� ��ȭ ���� ���޿� ���� ��� : 5�� (���ڻ�ŷ� ����� �Һ��ں�ȣ�� ���� ����)</label>
		<label style="font-size:x-large;color:red;">�ڰ��������� ���� �� �̿뿡 ���� ���׿� �����Ͻʴϱ�?</label>
		<div class="checks small">
			<input type="radio" id="radio1" name="radio1" value="ok">
			<label for="radio1">������</label>
			<input type="radio" id="radio2" name="radio1" value="no" checked="checked">
			<label for="radio2">�������� ����</label>
		<!-- ---------- �������� ���Ǽ� �� ---------- -->
		<!-- ---------- ���� ���� & ��ư ó�� ���� ---------- -->
		<label class="text-danger" style="font-size:x-large;">�ؽǽð� ����Ʈ�� �ƴϹǷ� < ���� > ���� �� ���ɿ��� �ȳ��帳�ϴ�. (�������� ��ȭ��ȣ)</label>
		<p align="center">
			<a href="javascript:orderIns()"><button class="btn btn-large btn-default" type="button" style="width:45%;font-size:large;">���� Ȯ��</button></a>
			<a href="./getCarList.kos"><button class="btn btn-large btn-default" type="button" style="width:45%;font-size:large;">�� ��</button></a>
		</p>
		<!-- ---------- ���� ���� & ��ư ó�� �� ---------- -->
		<!-- -------------------- �ߴ� ���� ���� �� �� -------------------- -->
		</div>
	</div>
</div>
</div>
<!-- -------------------- �ߴ� ���� ���Ժ� �� -------------------- -->

<!-- ---------- �ϴ� �޴� ���� ---------- -->
<footer>
	<div id="footer" style="text-align: center">
		<ul class="icons">
			<li>
				<a href="https://twitter.com/" class="fa-twitter" target="_blank"><span class="label">Twitter</span></a>
			</li>
			<li>
				<a href="https://www.facebook.com/" class="fa-facebook" target="_blank"><span class="label">Facebook</span></a>
			</li>
			<li>
				<a href="https://www.instagram.com/" class="fa-instagram" target="_blank"><span class="label">Instagram</span></a>
			</li>
			<li>
				<a href="https://www.google.co.kr/" class="fa-google" target="_blank"><span class="label">Google</span></a>
			</li>
		</ul>
		<p class="copyright">
			&copy; Copyright. <a href="http://www.ikosmo.co.kr/" target="_blank">KOSMO</a>.
		</p>
	</div>
</footer>
<!-- ---------- �ϴ� �޴� �� ---------- -->
</div>
<!-- ------------------------------ ��ü ���� �� �� ------------------------------ -->
</div>
</body>
</html>
