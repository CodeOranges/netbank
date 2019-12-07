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
    
    <title>My JSP 'moneyout.jsp' starting page</title>
    
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
#main #text #content #form1 table {
	font-family: "华文楷体";
	font-size: 30px;
	font-weight: lighter;
	color: #FFF;
	margin: auto;
	text-align: center;
}
#main #text #content #form1 table tr td #textfield {
	height: 30px;
	width: 200px;
	font-family: "微软雅黑";
	font-size: 18px;
	color: #000;
	padding-left: 10px;
	border-radius: 5px;
}
#main #text #content #form1 table tr td #button {
	height: 30px;
	width: 200px;
	font-family: "微软雅黑";
	font-size: 18px;
	color: #FFF;
	background-color: #0f5c5e;
	border-radius:5px;
}
#main #text #content #form1 table tr td {
	padding: 10px;
}
#main #navigator #usernow {
	font-family: "华文楷体";
	font-size: 30px;
	font-weight: bold;
	color: #FFF;
	float: right;
}
</style>
<script type="text/javascript">
  function disptime(){
	    	var now=new Date();
	    	
	    	var year=now.getFullYear();
	    	var month=now.getMonth()+1;
	    	var date=now.getDate();
	    	var hour=now.getHours();
	    	var minute=now.getMinutes();
	    	var second =now.getSeconds();
	    		document.getElementById("datetime").value=year+"-"+month+"-"+date+" "+hour+":"+minute+":"+second;
	    		//year+"-"+month+"-"+date+" "+hour+":"+minute+":"+second;
	    		setTimeout("disptime()", 1000);
	    	}  
</script>
  </head>
  
<body onload="disptime()">

<div id="main">
  <div id="navigator">
    <table width="0" border="0" cellpadding="0">
      <tr>
        <td><img src="img/Bank-48.png" width="48" height="48" /></td>
        <td>银行账户管理系统</td>
      </tr>
    </table>
    <c:forEach items="${listLogin }" var="user">
    <table id="usernow" width="0" border="0" cellpadding="0">
      <tr>
        <td><img src="img/Customer-48.png" width="48" height="48" /></td>
        <td>${user.userno }</td>
      </tr>
    </table>
      </c:forEach>
  </div>
  <div id="left">
  <c:forEach items="${listLogin }" var="user">
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
    </c:forEach>
  </div>

  <div id="text">
    <div id="content">
    <jsp:useBean id="command" class="com.entity.Trade" scope="request"></jsp:useBean>
     <c:forEach items="${listLogin }" var="user">
      <form:form id="form1" action="add.do" method="post">
		<form:hidden path="userid" value="${user.id }"/><br>
     	<form:hidden path="trade" value="存款"/><br>
     	<form:hidden path="datatime" id="datetime"/><br>
        <table width="0" border="0" cellpadding="0">
          <tr>
            <td>当前余额</td>
            <td><label for="textfield"></label>
            <form:input id="textfield" path="balance" value="0"/></td>
          </tr>
          <tr>
            <td>用户账户</td>
            <td><label for="textfield2"></label>
            <form:input path="userno" id="textfield" value="${user.userno }"/></td>
          </tr>
          <tr>
            <td>请输入存款金额</td>
            <td><label for="textfield3"></label>
            <form:input path="money" id="textfield"/></td>
          </tr>
          <tr>
            <td><input type="submit" name="button" id="button" value="存款" /></td>
            <td><input type="reset" name="button2" id="button" value="重置" /></td>
          </tr>
        </table>
      </form:form>
      </c:forEach>
    </div>
  </div>
</div>
</body>
</html>
