<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加</title>
    
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
    <div align="center">
    <form action="charge/addCharge" method="post" id="addCharge">
    	<label>收费项目：</label><input id="chargeitem" name="chargeitem"/><br>
    	<label>需缴价格：</label><input id="price" name="price" type="text" onkeypress="return event.keyCode>=48&&event.keyCode<=57" ng-pattern="/[^a-zA-Z]/" >
    	<br>
    	<label>需交费学生：</label><select name="studentid">
    		<option value="2019001">王丽</option>
    		<option value="2019002">罗拉</option>
    		<option value="2019003">罗兰</option>
    		<option value="2019004">李丽</option>
    		<option value="2019005">罗什</option>
    	</select>
    	<input type="submit" value="添加"/>
    	<input type="reset" value="重置"/>
    </form>
    </div>
  </body>
</html>
