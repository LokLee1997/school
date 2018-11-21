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
    
    <title>班级列表</title>
    
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
    <table style="text-align: center;width: 50%" align="center">
    	<tr>
    		<th>班级编号</th>
    		<th>班级名</th>
    		<th>操作</th>
    	</tr>
    	
    <c:forEach items="${list}" var="cls">
    	<tr>
    		<td>${cls.id}</td>
    		<td><a href="cls/clsInfo?id=${cls.id}">${cls.classname}</a></td>
    		<td>
    		 	<a href="cls/updateClsUI?id=${cls.id}">更新</a>
    			<a href="cls/delCls?id=${cls.id}">删除</a>
    		</td>
    	</tr>
    </c:forEach>
    </table>
  </body>
</html>
