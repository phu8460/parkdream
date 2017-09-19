<%@page import="com.model.EchoClient"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String name = request.getParameter("id");
	new EchoClient("127.0.0.1",7171,name);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>login2</title>
</head>
<body onLoad="setTimeout('self.close()',0)">
<script type="text/javascript">
</script>
</body>
</html>  