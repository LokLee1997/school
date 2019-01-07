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
	<%@ include file="../resource/link.html" %>
	<link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.1.1.js"></script>
   <script src="js/bootstrap.min.js"></script>
  </head>
  
  <body>
    
    
      <div class="container">
	<div class="row clearfix">
		<div class="col-md-8 col-md-offset-2 column">
		<h2>课程列表</h2>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>课程编号</th>
    					<th>课程名称</th>
    					<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="cou">
    	<tr>
    		<td>${cou.cno}</td>
    		<td><a href="cou/couInfo?cno=${cou.cno}">${cou.cname}</a></td>
    		<td>
    		 	<a href="cou/updateCouUI?cno=${cou.cno}">更新</a>
    			<a href="cou/delCou?cno=${cou.cno}">删除</a>
    		</td>
    	</tr>
    </c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
  </body>
</html>
