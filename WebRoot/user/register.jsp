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
	background-image: url(img/back1.jpg);
}
#main {
	height: 800px;
	width: 400px;
	color: #FFF;
	margin-top: 100px;
	text-align: center;
	float: none;
	margin-left: 1100px;
}
#main #middle #form1 table {
	margin-top: 0px;
	margin-right: auto;
	margin-bottom: 0px;
	margin-left: auto;
	text-align: center;
	font-family: "微软雅黑";
	font-size: 24px;
	font-weight: normal;
	color: #FFF;
}
#main #middle #form1 table tr td {
	padding: 7px;
}
#main #middle #form1 table tr td #textfield {
	height: 25px;
	width: 250px;
	border-radius: 10px;
	padding-left: 10px;
	font-family: "微软雅黑";
	font-size: 16px;
	font-weight: normal;
	color: #000;
}
#product_code{
	height: 25px;
	width: 250px;
	border-radius: 10px;
	padding-left: 10px;
	font-family: "微软雅黑";
	font-size: 16px;
	font-weight: normal;
	color: #000;
}
#main #middle #form1 table tr td #button {
	height: 30px;
	width: 100px;
	font-family: "微软雅黑";
	font-size: 18px;
	font-weight: bolder;
	color: #FFF;
	background-color: #0CC;
	border-radius:10px;
}
#main #middle {
	font-family: "华文楷体";
	font-size: 36px;
	font-weight: bolder;
	color: #FFF;
	background: rgba(0,0,0,0.5);
	height: 700px;
	width: 650px;
}
#error {
	font-family: "微软雅黑";
	font-size: 16px;
	font-weight: bolder;
	color: #F33;
	text-align: left;
}
a:hover {
	color: #099;
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
<div id="main">
  <div id="middle">欢迎您访问银行账户管理系统，请注册
    <form:form id="form1" action="register.do" method="post">
      <table width="0" border="0" cellpadding="0">
      <form:hidden path="userid" value=""/>
      	<tr>
          <td>账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号</td>
          <td><input type="text" id="product_code" name="userno" style="background-color:#CCC"></td>
          <td><a onclick="hq();" style="cursor:pointer;">获取</a></td> 
          <td><form:errors id="error" path="userno"></form:errors></td>
        </tr>
        <tr>
          <td>用 户 名</td>
          <td><label for="textfield"></label>
          <form:input path="username" id="textfield" style="background-color:#CCC"/><br>
          <form:errors id="error" path="username"></form:errors></td>
        </tr>
        <tr>
          <td>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</td>
          <td><label for="textfield2"></label>
          <form:password path="password" id="textfield" style="background-color:#CCC"/><br>
          <form:errors id="error" path="password"></form:errors></td>
        </tr>
        <tr>
          <td>重复密码</td>
          <td><label for="textfield3"></label>
          <form:password path="password1" id="textfield" style="background-color:#CCC"/><br>
          <form:errors id="error" path="password1"></form:errors></td>
        </tr>
        <tr>
        <form:hidden path="userflag" value="否"/>
          <td>出生日期</td>
          <td><form:select size="1" path="useryear" id="year" onfocus="years('year',new Date().getFullYear()),change_date()" onchange="change_date()">
          	  	<option value="1">2019</option>
          	  </form:select>年
          	  <form:select size="1" path="usermonth" id="month" onfocus="months(),change_date()" onchange="change_date()">
          	  	<option value="1">1</option>
          	  </form:select>月
          	  <form:select size="1" path="userdate" id="date">
          	  	<option value="1">1</option>
          	  </form:select>日
          	  </td>
        </tr>
        <tr>
          <td>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</td>
          <td><form:radiobutton path="sex" value="男" checked="checked"/>男
      	      <form:radiobutton path="sex" value="女"/>女</td>
        </tr>
        <tr>
          <td>身份证号</td>
          <td><label for="textfield5"></label>
          <form:input path="idcard" id="textfield" style="background-color:#CCC"/><br>
          <form:errors id="error" path="idcard"></form:errors></td>
        </tr>
        <tr>
          <td>联系电话</td>
          <td><label for="textfield6"></label>
          <form:input path="tel" id="textfield" style="background-color:#CCC"/><br>
          <form:errors id="error" path="tel"></form:errors></td>
        </tr>
        <tr>
          <td>居住城市</td>
          <td><label for="textfield7"></label>
          <form:input path="city" id="textfield" style="background-color:#CCC"/><br>
          <form:errors id="error" path="city"></form:errors></td>
        </tr>
        <tr>
          <td>详细地址</td>
          <td><label for="textfield8"></label>
          <form:input path="useraddress" id="textfield" style="background-color:#CCC"/><br>
          <form:errors id="error" path="useraddress"></form:errors></td>
        </tr>
        <tr>
          <td><input type="submit" name="button" id="button" value="注册" /></td>
          <td><input type="reset" name="button2" id="button" value="重置" /></td>
        </tr>
      </table>
    </form:form>
  </div>
</div>
</body>
</html>
