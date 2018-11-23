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
    
    <title>收费列表</title>
    
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
    		<th>学生学号</th>
    		<th>学生名字</th>
    		<th>收费项目</th>
    		<th>收费金额</th>
    		<th>收费状态</th>
    		<th>操作</th>
    	</tr>
    	
    <c:forEach items="${list}" var="charge">
    	<tr>
    		<td>${charge.student.sid }</td>
    		<td><a href="stu/stuInfo?sid=${charge.student.sid}"">${charge.student.sname}</a></td>
    		<td>${charge.chargeitem}</td>
    		<td>${charge.price}</td>
    		<td>${charge.ispay}</td>
    		<td>
    			<a href="charge/updateChargeState?id=${charge.id}">确认缴费</a>
    		 	<a href="charge/updateChargeUI?id=${charge.id}">更新</a>
    			<a href="charge/deleteCharge?id=${charge.id}">删除</a>
    		</td>
    	</tr>
    </c:forEach>
    </table>
  </body>
</html>
