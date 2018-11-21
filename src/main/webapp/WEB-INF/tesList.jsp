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
    
    <title>教师列表</title>
    
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
    <table style="text-align: center;width:50%" align="center">
    	<tr>
    		<th>编号</th>
    		<th>职工姓名</th>
    		<th>部门</th>
    		<th>操作</th>
    	</tr>
    	
    <c:forEach items="${list}" var="tes">
    	<tr>
    		<td>${tes.tno}</td>
    		<td><a href="tes/tesInfo?tno=${tes.tno}">${tes.tname}</a></td>
    		<td>${tes.departs.dname}</td>
    		<td>
    		 	<a href="tes/updatetesUI?tno=${tes.tno}">更新</a>
    			<a href="tes/deltes?tno=${tes.tno}">删除</a>
    		</td>
    	</tr>
    </c:forEach>
    </table>
  </body>
</html>