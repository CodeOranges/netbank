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
    
    <title>My JSP 'newuserno.jsp' starting page</title>
    
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
#error {
	font-family: "微软雅黑";
	font-size: 16px;
	font-weight: bolder;
	color: #F33;
	text-align: left;
}
</style>
<script type="text/javascript">
　　　　　　function hq(){
　　　　　　//声明一个随机数变量，默认为1
　　　　　　var GetRandomn = 1;
　　　　　　//js生成时间戳
　　　　　　var timestamp=new Date().getTime();
　　　　　　//获取随机范围内数值的函数
　　　　　　　　function GetRandom(n){
　　　　　　　　//由随机数+时间戳+1组成
　　　　　　　　GetRandomn=Math.floor(Math.random()*n+timestamp+1);
　　　　　　　　}
　　　　　　//开始调用，获得一个1-100的随机数
　　　　　　GetRandom("30");
　　　　　　//把随机数GetRandomn 赋给 input文本框.根据input的id
　　　　　　document.getElementById('product_code').value = GetRandomn;
　　　　　　//调试输出查看
　　　　　　//alert(GetRandomn);
　　　　　　}
　　　　</script>
  </head>

<body>
<jsp:useBean id="command" class="com.entity.User" scope="request"></jsp:useBean>
<c:forEach items="${listLogin }" var="user">
<c:if test="${user.userflag eq '否' }">
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
   	<c:forEach items="${listUserno }" var="user">
   	   	<form:form id="form1" action="addUserno.do" method="post">
        <table width="0" border="0" cellpadding="0">
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <form:hidden path="userid" value="${user.userid }"/>
          <tr>
            <td id="userno">账户:</td>
            <td><label for="textfield"></label>
            <input type="text" id="product_code" name="userno" style="background-color:#CCC">
            <a onclick="hq();" style="cursor:pointer;">获取</a><br>
            <form:errors id="error" path="userno"></form:errors></td>
          </tr>
          <form:hidden path="username" value="${user.username }"/>
          <tr>
            <td id="userno">密码:</td>
            <td><label for="textfield2"></label>
            <form:password path="password" id="textfield" style="background-color:#CCC"/><br>
            <form:errors id="error" path="password"></form:errors></td>
          </tr>
          <tr>
            <td id="userno">重复密码:</td>
            <td><label for="textfield3"></label>
            <form:password path="password1" id="textfield" style="background-color:#CCC"/><br>
            <form:errors id="error" path="password1"></form:errors></td>
          </tr>
          <form:hidden path="userflag" value="否"/>
          <form:hidden path="useryear" value="${user.useryear }"/>
          <form:hidden path="usermonth" value="${user.usermonth }"/>
          <form:hidden path="userdate" value="${user.userdate }"/>
          <form:hidden path="idcard" value="${user.idcard }"/>
          <form:hidden path="tel" value="${user.tel }"/>
          <form:hidden path="city" value="${user.city }"/>
          <form:hidden path="useraddress" value="${user.useraddress }"/>
          <form:hidden path="sex" value="${user.sex }"/>
          <tr>
            <td><input type="submit" name="button" id="button" value="注册" /></td>
            <td><input type="reset" name="button2" id="button" value="重置" /></td>
          </tr>
        </table>
      </form:form>
   	</c:forEach>
    </div>
  </div>
</div>
</c:if>
<c:if test="${user.userflag eq '是' }">
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
        <td><a href="selectUserno.do?id=${user.id }"><img src="img/userno.png" width="150" height="40" /></a></td>
      </tr>
      <tr>
        <td><a href="allUserno.do?userid=${user.userid }"><img src="img/account.png" width="150" height="40" /></a></td>
      </tr>
    </table>
  </div>
	
  <div id="text">
    <div id="content">
     	<c:forEach items="${listUserno }" var="user">
   	<form:form id="form1" action="addUserno2.do" method="post">
        <table width="0" border="0" cellpadding="0">
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <form:hidden path="userid" value="${user.userid }"/>
          <tr>
            <td id="userno">账户:</td>
            <td><label for="textfield"></label>
            <input type="text" id="product_code" name="userno" style="background-color:#CCC">
            <a onclick="hq();" style="cursor:pointer;">获取</a><br>
            <form:errors id="error" path="userno"></form:errors></td>
          </tr>
          <form:hidden path="username" value="${user.username }"/>
          <tr>
            <td id="userno">密码:</td>
            <td><label for="textfield2"></label>
            <form:password path="password" id="textfield" style="background-color:#CCC"/><br>
            <form:errors id="error" path="password"></form:errors></td>
          </tr>
          <tr>
            <td id="userno">重复密码:</td>
            <td><label for="textfield3"></label>
            <form:password path="password1" id="textfield" style="background-color:#CCC"/><br>
            <form:errors id="error" path="password1"></form:errors></td>
          </tr>
          <form:hidden path="userflag" value="否"/>
          <form:hidden path="useryear" value="${user.useryear }"/>
          <form:hidden path="usermonth" value="${user.usermonth }"/>
          <form:hidden path="userdate" value="${user.userdate }"/>
          <form:hidden path="idcard" value="${user.idcard }"/>
          <form:hidden path="tel" value="${user.tel }"/>
          <form:hidden path="city" value="${user.city }"/>
          <form:hidden path="useraddress" value="${user.useraddress }"/>
          <form:hidden path="sex" value="${user.sex }"/>
          <tr>
            <td><input type="submit" name="button" id="button" value="注册" /></td>
            <td><input type="reset" name="button2" id="button" value="重置" /></td>
          </tr>
        </table>
      </form:form>
   	</c:forEach>
    </div>
  </div>
</div>
</c:if>
</c:forEach>
</body>
</html>
