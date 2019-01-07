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
    
    <title>My JSP 'depInfo.jsp' starting page</title>
    
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
		<h2>
		<div><label>部门名称:${depart.dname}</label></div>
   		<div><label>部门人数:${num}</label></div>
   		</h2>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>部门人员:</th>
					</tr>
					<tr>
						<th>职工编号</th>
    					<th>职工姓名</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${tList}" var="t">
   			<c:forEach items="${t.teachers}" var="teacher">
   				<tr>
   				<td>${teacher.tno}</td>
   				<td>${teacher.tname }</td>
   				</tr>
   			</c:forEach>
   		</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
 
  </body>
</html>
