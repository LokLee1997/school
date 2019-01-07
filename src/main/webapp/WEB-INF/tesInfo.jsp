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
    
    <title>My JSP 'tesInfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<%@ include file="../resource/link.html" %>
	<link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.1.1.js"></script>
   <script src="js/bootstrap.min.js"></script>
  </head>
  
  <body>
  
      <div class="container">
	<div class="row clearfix">
		<div class="col-md-8 col-md-offset-2 column">
		<h4>
			<div><label>职工姓名：${teacher.tname}</label></div>
    		<div><label>职工性别：${teacher.tsex}</label></div>
    		<div><label>出生日期：${teacher.tbirthday}</label></div>
    		<div><label>所属部门：${teacher.departs.dname}</label></div>
		</h4>
			<table class="table table-hover">
			<c:forEach items="${classes}" var="c">
				<thead>
					<tr>
						<th>执教班级:</th>
					</tr>
					<tr>
						<th>班级编号</th>		
    					<th>班级名</th>
					</tr>
				</thead>
				<tbody>
    			<c:forEach items="${c.classes}" var="cls">
    				<tr>
    				<td>${cls.id}</td>
    				<td>${cls.classname}</td>
    				</tr>
    			</c:forEach>
    	
				</tbody>
		</c:forEach>
			</table>
		</div>
	</div>
</div>
 
  </body>
</html>
