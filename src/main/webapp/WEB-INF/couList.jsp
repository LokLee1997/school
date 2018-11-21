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
    
    <title>课程列表</title>
    
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
    		<th>课程编号</th>
    		<th>课程名称</th>
    		<th>操作</th>
    	</tr>
    	
    <c:forEach items="${list}" var="cou">
    	<tr>
    		<td>${cou.cno}</td>
    		<td><a href="cou/couInfo?cno=${cou.cno}">${cou.cname}</a></td>
    		<td>
    		 	<a href="cou/updateCouUI?cname=${cou.cno}">更新</a>
    			<a href="cou/delCou?cname=${cou.cno}">删除</a>
    		</td>
    	</tr>
    </c:forEach>
    </table>
  </body>
</html>
