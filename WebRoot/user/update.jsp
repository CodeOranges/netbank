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
    
    <title>My JSP 'register.jsp' starting page</title>
    
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
#main #text #content #form1 table {
	margin-right: auto;
	margin-left: auto;
	font-family: "微软雅黑";
	font-size: 18px;
	font-weight: bold;
	color: #FFF;
	text-align: center;
}
#title1 {
	color: #099;
	background-color: #E2E2E2;
	font-size: 24px;
}
#title2 {
	color: #3CC;
}
#main #text #content #form1 table tr td #button {
	height: 30px;
	width: 100px;
	font-family: "微软雅黑";
	font-size: 16px;
	color: #FFF;
	background-color: #066;
	border-radius:10px;
}
#main #navigator #usernow {
	font-family: "华文楷体";
	font-size: 30px;
	font-weight: bold;
	color: #FFF;
	float: right;
}
#main #text #content #form1 table tr td #textfield {
	height: 25px;
	width: 220px;
	font-family: "宋体";
	font-size: 18px;
	font-weight: bolder;
	color: #000;
	padding-left: 10px;
	border-radius:5px;
}
#main #text #content #form1 table tr td {
	padding: 10px;
}
</style>
<script>
function years(obj, Cyear) {
    var len = 114; // select长度,即option数量
    var selObj = document.getElementById(obj);
    var selIndex = len - 1;
    var newOpt; // OPTION对象

    // 循环添加OPION元素到年份select对象中
    for (i = 1; i <= len; i++) {
        if (selObj.options.length != len) { // 如果目标对象下拉框升度不等于设定的长度则执行以下代码
            newOpt = window.document.createElement("OPTION"); // 新建一个OPTION对象
            newOpt.text = Cyear - len + i; // 设置OPTION对象的内容
            newOpt.value = Cyear - len + i; // 设置OPTION对象的值
            selObj.options.add(newOpt, i); // 添加到目标对象中
        }

    }
}

function months(){
    var month = document.getElementById("month");
    month.length = 0; 
    for (i = 1; i < 13; i++) { 
        month.options.add(new Option(i, i)); 
    }
   
}


function change_date(){ 
   // var birthday = document.birthday; 
    var year  = document.getElementById("year"); 
    var month = document.getElementById("month"); 
    var date = document.getElementById("date"); 
    vYear  = parseInt(year.value); 
    vMonth = parseInt(month.value); 
    date.length=0; 
     
    //根据年月获取天数 
    var max = (new Date(vYear,vMonth, 0)).getDate(); 
    for (var i=1; i <= max; i++) { 
        date.options.add(new Option(i, i)); 
    } 
}
</script>
  </head>
  
<body>
<jsp:useBean id="command" class="com.entity.User" scope="request"></jsp:useBean>
<c:forEach items="${listLogin }" var="user">
<c:if test="${user.userflag=='否' }">
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
     <c:forEach items="${listOne}" var="user">
     <form:form id="form1" action="update.do?id=${user.id }" method="post">
        <table width="0" border="0" cellpadding="0">
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2" id="title1">当前账户所属用户</td>
          </tr>
          <tr>
            <td id="title2">用户账户</td>
            <td><label for="textfield"></label>
            <form:input path="userno" value="${user.userno }" id="textfield" style="background-color: #E0E0E0"/></td>
          </tr>
          <tr>
            <td id="title2">用户姓名</td>
            <td><label for="textfield"></label>
            <form:input path="username" value="${user.username }" id="textfield" style="background-color: #E0E0E0"/></td>
          </tr>
          <tr>
            <td id="title2">账户新密码</td>
            <td><label for="textfield"></label>
            <form:input path="password" value="${user.password }" id="textfield" style="background-color: #E0E0E0"/></td>
          </tr>
          <tr>
            <td id="title2">出生日期</td>
            <td><label for="textfield2"></label>
                <form:select size="1" path="useryear" id="year" onfocus="years('year',new Date().getFullYear()),change_date()" onchange="change_date()">
                	<option>${user.useryear }</option>
                </form:select>年
          	    <form:select size="1" path="usermonth" id="month" onfocus="months(),change_date()" onchange="change_date()">
          	    	<option>${user.usermonth }</option>
          	    </form:select>月
          	    <form:select size="1" path="userdate" id="date">
          	    	<option>${user.userdate }</option>
          	    </form:select>日</td>
          </tr>
          <tr>
            <td id="title2">用户性别</td>
            <td><input type="radio" name="sex" value="男" <c:if test="${user.sex=='男' }">checked="checked"</c:if>/>男
		   		<input type="radio" name="sex" value="女" <c:if test="${user.sex=='女' }">checked="checked"</c:if>/>女</td>
          </tr>
          <tr>
            <td id="title2">身份证号</td>
            <td><label for="textfield3"></label>
            <form:input path="idcard" value="${user.idcard }" id="textfield" style="background-color: #E0E0E0"/></td>
          </tr>
          <tr>
            <td id="title2">联系电话</td>
            <td><label for="textfield4"></label>
            <form:input path="tel" value="${user.tel }" id="textfield" style="background-color: #E0E0E0"/></td>
          </tr>
          <tr>
            <td id="title2">居住城市</td>
            <td><label for="textfield5"></label>
            <form:input path="city" value="${user.city }" id="textfield" style="background-color: #E0E0E0"/></td>
          </tr>
          <tr>
            <td id="title2">详细地址</td>
            <td><label for="textfield6"></label>
            <form:input path="useraddress" value="${user.useraddress }" id="textfield" style="background-color: #E0E0E0"/></td>
          </tr>
          <tr>
            <td><input type="submit" name="button" id="button" value="修改" /></td>
            <td><input type="reset" name="button2" id="button" value="重置" /></td>
          </tr>
        </table>
      </form:form>
      </c:forEach>
    </div>
  </div>
</div>
</c:if>
<c:if test="${user.userflag=='是' }">
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
     <c:forEach items="${listOne}" var="user">
     <form:form id="form1" action="updateOff.do?id=${user.id }" method="post">
        <table width="0" border="0" cellpadding="0">
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="2" id="title1">当前账户所属用户</td>
          </tr>
          <tr>
            <td id="title2">用户账户</td>
            <td><label for="textfield"></label>
            <form:input path="userno" value="${user.userno }" id="textfield" style="background-color: #E0E0E0"/></td>
          </tr>
          <tr>
            <td id="title2">用户姓名</td>
            <td><label for="textfield"></label>
            <form:input path="username" value="${user.username }" id="textfield" style="background-color: #E0E0E0"/></td>
          </tr>
          <tr>
            <td id="title2">账户新密码</td>
            <td><label for="textfield"></label>
            <form:input path="password" value="${user.password }" id="textfield" style="background-color: #E0E0E0"/></td>
          </tr>
          <tr>
           <td id="title2">出生日期</td>
            <td><label for="textfield2"></label>
                <form:select size="1" path="useryear" id="year" onfocus="years('year',new Date().getFullYear()),change_date()" onchange="change_date()">
                	<option>${user.useryear }</option>
                </form:select>年
          	    <form:select size="1" path="usermonth" id="month" onfocus="months(),change_date()" onchange="change_date()">
          	    	<option>${user.usermonth }</option>
          	    </form:select>月
          	    <form:select size="1" path="userdate" id="date">
          	    	<option>${user.userdate }</option>
          	    </form:select>日</td>
          </tr>
          <tr>
            <td id="title2">用户性别</td>
            <td><input type="radio" name="sex" value="男" <c:if test="${user.sex eq '男' }">checked="checked"</c:if>/>男
		   		<input type="radio" name="sex" value="女" <c:if test="${user.sex eq '女' }">checked="checked"</c:if>/>女</td>
          </tr>
          <tr>
            <td id="title2">身份证号</td>
            <td><label for="textfield3"></label>
            <form:input path="idcard" value="${user.idcard }" id="textfield" style="background-color: #E0E0E0"/></td>
          </tr>
          <tr>
            <td id="title2">联系电话</td>
            <td><label for="textfield4"></label>
            <form:input path="tel" value="${user.tel }" id="textfield" style="background-color: #E0E0E0"/></td>
          </tr>
          <tr>
            <td id="title2">居住城市</td>
            <td><label for="textfield5"></label>
            <form:input path="city" value="${user.city }" id="textfield" style="background-color: #E0E0E0"/></td>
          </tr>
          <tr>
            <td id="title2">详细地址</td>
            <td><label for="textfield6"></label>
            <form:input path="useraddress" value="${user.useraddress }" id="textfield" style="background-color: #E0E0E0"/></td>
          </tr>
          <tr>
            <td><input type="submit" name="button" id="button" value="修改" /></td>
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
