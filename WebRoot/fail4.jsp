<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'success.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
body {
	margin: 0px;
	background-image: url(img/back2-4.jpg);
}
#main #navigator {
	font-family: "华文楷体";
	font-size: 50px;
	font-weight: bold;
	color: #FFF;
	background: rgba(26,124,114,0.8);
	height: 120px;
	width: auto;
}
#main #navigator table {
	font-family: "华文楷体";
	font-size: 50px;
	font-weight: bold;
	color: #FFF;
}
#main #left {
	float: left;
	height: 800px;
	width: 180px;
	background: rgba(19,81,99,0.8);
	text-align: center;
}
#main #left table {
	width: 150px;
	margin-right: auto;
	margin-bottom: 0px;
	margin-left: auto;
	text-align: center;
}
#main #left table tr td {
	padding-top: 20px;
	padding-right: 10px;
	padding-bottom: 20px;
	padding-left: 10px;
	text-align: center;
}
#main #text {
	height: 800px;
}
#main #text #content {
	height: 600px;
	width: 800px;
	margin-right: auto;
	margin-bottom: auto;
	margin-left: auto;
	background: rgba(0,0,0,0.6);
	margin-top: auto;
}
#main #navigator #usernow {
	font-family: "华文楷体";
	font-size: 30px;
	font-weight: bold;
	color: #FFF;
	float: right;
}
#main #text #content table {
	font-family: "华文楷体";
	font-size: 55px;
	font-weight: bolder;
	color: #FFF;
	margin-right: auto;
	margin-left: auto;
}
</style>
  </head>
  
  <body>
<jsp:useBean id="command" class="com.entity.User" scope="request"></jsp:useBean>
<c:forEach items="${listLogin }" var="user">

<div id="main">
  <div id="navigator">
    <table width="0" border="0" cellpadding="0">
      <tr>
        <td><img src="img/Bank-48.png" width="48" height="48" /></td>
        <td>银行账户管理系统</td>
      </tr>
    </table>
    
    <table id="usernow" width="0" border="0" cellpadding="0">
      <tr>
        <td><img src="img/Customer-48.png" width="48" height="48" /></td>
        <td>${user.userno }</td>
      </tr>
    </table>
    
  </div>
  <div id="left">
    <table width="0" border="0" cellpadding="0">
      <tr>
        <td><a href="selectLatest.do?id=${user.id }"><img src="img/cunkuan.png" width="150" height="40" /></a></td>
      </tr>
      <tr>
        <td><a href="selectLatest1.do?id=${user.id }"><img src="img/qukuan.png" width="150" height="40" /></a></td>
      </tr>
      <tr>
        <td><a href="selectAccount.do?id=${user.id }"><img src="img/jiaoyi.png" width="150" height="40" /></a></td>
      </tr>
      <tr>
        <td><a href="selectOne.do?id=${user.id }"><img src="img/geren.png" width="150" height="40" /></a></td>
      </tr>
      <tr>
        <td><a href="selectOneForUpdate.do?id=${user.id }"><img src="img/genggai.png" width="150" height="40" /></a></td>
      </tr>
      <tr>
        <td><a href="/netbank/user/login.jsp"><img src="img/exit.png" width="150" height="40" /></a></td>
      </tr>
      <tr>
        <td><a href="logoff.do?id=${user.id }"><img src="img/zhuxiao.png" width="150" height="40" /></a></td>
      </tr>
      <tr>
        <td><a href="selectUserno.do?id=${user.id }"><img src="img/userno.png" width="150" height="40" /></a></td>
      </tr>
      <tr>
        <td><a href="allUserno.do?userid=${user.userid }"><img src="img/account.png" width="150" height="40" /></a></td>
      </tr>
    </table>
  </div>

  <div id="text">
    <div id="content">
    <table width="0" border="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><img src="img/Surprised-128.png" width="128" height="128" /></td>
    <td>当前无可显示信息</td>
  </tr>
</table>
   </div> 
</div>
</div>
</c:forEach>
</body>
</html>
