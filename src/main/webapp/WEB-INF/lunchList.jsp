<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>部门列表</title>
    
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
    <table style="text-align: center;width: 50%;" align="center">
    	<tr>
    		<th>午餐编号</th>
    		<th>午餐菜式</th>
    		<th>厨师</th>
    		<th>日期</th>
    		<th>操作</th>
    	</tr>
    	
    <c:forEach items="${list}" var="lunch">
    	<tr>
    		<td>${lunch.id}</td>
    		<td>${lunch.caipin}</td>
    		<td>${lunch.cooker.tname}</td>
    		<td>${lunch.date }</td>
    		<td>
    		 	<a href="lunch/updateLunchUI?id=${lunch.id}">更新</a>
    			<a href="lunch/delLunch?id=${lunch.id}">删除</a>
    		</td>
    	</tr>
    </c:forEach>
    </table>
  </body>
</html>
