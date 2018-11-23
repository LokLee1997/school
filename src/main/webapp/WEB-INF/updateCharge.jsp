<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>更新收费信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <div align="center" >
    <form id="updateCharge" action="charge/updateCharge" method="post">
    	<input value="${charge.id}"  type="hidden" id="id" name="id">
    	<label>学生姓名：</label><select name="studentid">
    		<option value="2019001">王丽</option>
    		<option value="2019002">罗拉</option>
    		<option value="2019003">罗兰</option>
    		<option value="2019004">李丽</option>
    		<option value="2019005">罗什</option>
    	</select><br>
    	<label>缴费项目：</label><input id="chargeitem" name="chargeitem" value="${charge.chargeitem}"><br>
    	<label>需缴金额：</label><input id="price" name="price" value="${charge.price }" type="text" onkeypress="return event.keyCode>=48&&event.keyCode<=57" ng-pattern="/[^a-zA-Z]/" >
    	<br>
    	<label>缴费状态：</label>
    	<select name="ispay">
    		<option value="0">未缴费</option>
    		<option value="1">已缴费</option> 
    	</select>
    	<br>
    	<input type="submit" value="修改">
    	<input type="reset" value="重置">
    </form>
   </div>
  </body>
</html>
