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
    
    <title>学生列表</title>
    
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
    <table style="text-align: center;width:50%;" align="center">
    	<tr>
    		<th>学号</th>
    		<th>姓名</th>
    		<th>性别</th>
    		<th>出生日期</th>
    		<th>班级</th>
    		<th>操作</th>
    	</tr>
    	
    <c:forEach items="${list}" var="stu">
    	<tr>
    		<td>${stu.sid}</td>
    		<td><a href="stu/stuInfo?sid=${stu.sid}">${stu.sname}</a></td>
    		<td>${stu.ssex}</td>
    		<td>${stu.sbirthday}</td>
			<td>${stu.classes.classname}</td>
    		<td>
    		 	<a href="stu/updateStuUI?sid=${stu.sid}">更新</a>
    			<a href="stu/delStu?sid=${stu.sid}">删除</a>
    		</td>
    	</tr>
    </c:forEach>
    </table>
  </body>
</html>
