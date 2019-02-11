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
	<%@ include file="../resource/link.html" %>
	<link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.1.1.js"></script>
   <script src="js/bootstrap.min.js"></script>
  </head>
  
  <body>
    <div class="container jumbotron well" style="background-color: #F0F0F0">
	<div class="row clearfix">
		<div class="col-md-8 col-md-offset-2 column">
		<h2>班级表</h2>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>
							编号
						</th>
						<th>
							班级
						</th>
						<th>
							操作
						</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var="cls">
    	<tr>
    		<td>${cls.id}</td>
    		<td><a href="cls/clsInfo?id=${cls.id}">${cls.classname}</a></td>
    		<td>
    		 	<a href="cls/updateClsUI?id=${cls.id}">修改班级名</a>
    			<a href="cls/delCls?id=${cls.id}" onclick="if(confirm('确认删除?')==false)return false;">删除</a>
    		</td>
    	</tr>
    </c:forEach>
				</tbody>
			</table>
			<div class="col-md-8 col-md-offset-2 column">
		<p align="center">当前第${page.pageNum}页/共${page.pages}页/共有${page.total}条记录</p>
		<div align="center">
		<ul class="pagination">
				<li>
					 <a href="cls/clsList?page=${page.firstPage}">第一页</a>
				</li>
				<li>
					 <a href="cls/clsList?page=${page.prePage}">上一页</a>
				</li>
				<li>
					 <a href="cls/clsList?page=${page.nextPage}">下一页</a>
				</li>
				<li>
					<a href="cls/clsList?page=${page.lastPage}">最后页</a>
				</li>
			</ul>
			</div>
			</div>
		</div>
	</div>
</div>
  </body>
</html>
