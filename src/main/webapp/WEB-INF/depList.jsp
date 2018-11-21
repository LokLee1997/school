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
    		<th>部门编号</th>
    		<th>部门名称</th>
    		<th>操作</th>
    	</tr>
    	
    <c:forEach items="${list}" var="dep">
    	<tr>
    		<td>${dep.did}</td>
    		<td><a href="dep/depInfo?did=${dep.did}">${dep.dname}</a></td>
    		<td>
    		 	<a href="dep/updateDepUI?did=${dep.did}">更新</a>
    			<a href="dep/delDep?did=${dep.did}">删除</a>
    		</td>
    	</tr>
    </c:forEach>
    </table>
  </body>
</html>
