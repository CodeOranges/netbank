<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'logoff.jsp' starting page</title>
    
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
	width: 900px;
	background: rgba(0,0,0,0.6);
	margin: auto;
}
#main #text #content table {
	font-family: "微软雅黑";
	font-size: 24px;
	font-weight: bolder;
	color: #FFF;
	margin-right: auto;
	margin-left: auto;
}
#balance {
	color: #3CC;
}
#main #text #content #form1 #button {
	height: 35px;
	width: 300px;
	font-family: "微软雅黑";
	font-size: 18px;
	font-weight: bolder;
	color: #FFF;
	background-color: #099;
	border-radius:5px;
}
#main #text #content #form1 {
	text-align: center;
}
#main #navigator #usernow {
	font-family: "华文楷体";
	font-size: 30px;
	font-weight: bold;
	color: #FFF;
	float: right;
}
p {
	font-family: "微软雅黑";
	font-size: 18px;
	font-weight: bolder;
	color: #FC9;
	text-align: center;
}
a {
	text-decoration: none;
	color: #6CC;
}
a:hover {
	color: #069;
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
        </tr>
        <tr>
          <td>要注销账户，您需要注意</td>
        </tr>
        <tr>
          <td>1.帐户余额必须为零；</td>
        </tr>
        <tr>
          <td> 2.帐户注销以后可以登录查看交易信息和个人信息；</td>
        </tr>
        <tr>
          <td>3.帐户注销以后不可以使用本系统的存款、款功能；</td>
        </tr>
         
        <tr>
          <td id="balance">您的当前余额为：0</td>
        </tr>
        
      </table>
      <p>&nbsp;</p>
      <p>当前余额为零，可直接注销</p>
      <form:form id="form1" action="offUpdate.do?id=${user.id }" method="post">
        <form:hidden path="userflag" value="是"/>
        <input type="submit" name="button" id="button" value="注销" />
      </form:form>
    </div>
  </div>
</div>
</c:forEach>
</body>
</html>
