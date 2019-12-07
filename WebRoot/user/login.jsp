<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
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
	background-image: url(img/back1.jpg);
}
#main {
	height: 600px;
	width: 800px;
	float: right;
	margin-right: 100px;
	margin-top: 100px;
}
#main #top {
	font-family: "华文楷体";
	font-size: 48px;
	color: #036;
	font-weight: bold;
	margin-top: 30px;
	text-align: center;
}
#main #middle {
	font-family: "华文楷体";
	font-size: 36px;
	color: #FFF;
	font-weight: bold;
	height: 460px;
	width: 450px;
	text-align: center;
	margin-right: auto;
	margin-left: auto;
	background: rgba(0,0,0,0.5);
}
#main #middle table {
	margin-top: 0px;
	margin-right: auto;
	margin-bottom: 0px;
	margin-left: auto;
	text-align: center;
}
#main #middle #form1 table {
	margin-right: auto;
	margin-left: auto;
	font-family: "微软雅黑";
	font-size: 24px;
	font-weight: normal;
	color: #FFF;
	text-align: center;
}
#main #middle #form1 table tr td {
	padding: 5px;
}
#main #middle #form1 table tr td #textfield {
	height: 35px;
	width: 250px;
	border-radius: 10px;
	padding-left: 10px;
	font-family: "微软雅黑";
	font-size: 18px;
	font-weight: bolder;
	color: #666;
}
#main #middle #form1 table tr td #button {
	border-radius: 5px;
	height: 40px;
	width: 250px;
	font-family: "微软雅黑";
	font-size: 18px;
	font-weight: bold;
	background-color: #999;
	color: #FFF;
}
a {
	font-family: "微软雅黑";
	font-size: 18px;
	font-weight: bolder;
	color: #0CC;
}
a:hover {
	color: #099;
}
#tablelogin {
	font-family: "华文楷体";
	font-size: 36px;
	font-weight: bold;
	color: #FFF;
}
#error {
	font-family: "微软雅黑";
	font-size: 16px;
	font-weight: bolder;
	color: #F33;
	text-align: left;
}
</style>
  </head>
  
<body>
<jsp:useBean id="command" class="com.entity.User" scope="request"></jsp:useBean>
<div id="main">
  <div id="top">
    <p>欢迎访问银行账户管理系统  </p>
  </div>
  <div id="middle">
    <table id="tablelogin" width="0" border="0" cellpadding="0">
      <tr>
        <td>请登录 </td>
      </tr>
      <tr>
        <td>————————————</td>
      </tr>
    </table>
    <form:form  id="form1" action="login.do" method="post">
      <table width="0" border="0" cellpadding="0">
        <tr>
          <td><img src="img/User-Login-48.png" width="48" height="48" /></td>
          <td><label for="textfield"></label>
          <form:input id="textfield" path="userno"/><br>
          <form:errors id="error" path="userno"></form:errors></td>
        </tr>
        <tr>
          <td><img src="img/Lock-48.png" width="48" height="48" /></td>
          <td><label for="textfield"></label>
          <form:password id="textfield" path="password"/><br>
          <form:errors id="error" path="password"></form:errors></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td><input type="submit" name="button" id="button" value="登录" /></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>
            <input type="reset" name="button" id="button" value="重置" />
          </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td><a href="/netbank/user/register.jsp">新用户注册</a></td>
        </tr>
      </table>
    </form:form>
    <p>&nbsp;</p>
  </div>
</div>
</body>
</html>
