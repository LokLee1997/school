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
		
			<table class="table table-hover">
				<thead>
					<tr>
						<th><h2>考勤表</h2></th>
						<th colspan="5">
							<form class="bs-example bs-example-form" role="form" action="search/attList" method="get">
							<div class="row">
								<div align="right">
									<div class="input-group">
									<input type="text" class="form-control" name="keyword" placeholder="请输入关键词">
									<span class="input-group-btn">
									<button class="btn btn-default" type="submit">
										搜索
									</button>
									</span>
									</div>
								</div>
							</div>
						</form>
						</th>
					</tr>
					<tr>
						<th>学号</th>
    					<th>学生姓名</th>
    					<th>班级</th>
    					<th>状态</th>
    					<th>日期</th>
    					<th>操作</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${atts}" var="att">
    	<tr>
    		<td>${att.student.sid}</td>
    		<td>${att.student.sname}</td> 
    		<td>${att.classes.classname}</td>
    		<td>
    		<c:choose>
    			<c:when test="${att.state=='0' }">无故缺勤</c:when>
    			<c:otherwise>请病假</c:otherwise>
    		</c:choose>
    		</td>
    		<td>${att.date}</td>
    		<td>
    		 	<a href="att/updateAttUI?id=${att.id}">更新</a>
    			<a href="att/delAtt?id=${att.id}">删除</a>
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
					 <a href="att/attList?page=${page.firstPage}">第一页</a>
				</li>
				<li>
					 <a href="att/attList?page=${page.prePage}">上一页</a>
				</li>
				<li>
					 <a href="att/attList?page=${page.nextPage}">下一页</a>
				</li>
				<li>
					<a href="att/attList?page=${page.lastPage}">最后页</a>
				</li>
			</ul>
			</div>
			</div>
		</div>
	</div>
</div>
  </body>
</html>
