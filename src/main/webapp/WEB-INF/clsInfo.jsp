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
    
    <title>班级信息</title>
    
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
	<div class="col-md-8 col-md-offset-2 ">
	<h2><label>班级名称:</label>
    ${classes.classname}
    <div><label>班级人数:</label>${num}</div>
    </h2>
	</div>
		<div class="col-md-8 col-md-offset-2 column">
			<table class="table table-hover">
				<thead>
					<tr>
						<th colspan="2">班级学生名单:</th>
						<th style="text-align: right"><a href="#">添加学生</a></th>
					</tr>
					<tr style="width: 33%">
						<th>学生学号</th>
    					<th>学生名字</th>
    					<th>操作</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${sList}" var="stu">
    			 <c:forEach var="student" items="${stu.student}">
    			 	<tr>
    			 	<td>${student.sid}</td>
    				<td>${student.sname}</td>
    				<td>
    					<a href="att/addAttUI?id=${student.sid}">添加到缺勤</a>
    					<a href="cls/delClsStu?sid=${student.sid}">从班级中删除</a>
    				</td>
    				</tr>
    			</c:forEach>
    		</c:forEach>
				</tbody>
			</table>
		</div>
	
		<div class="col-md-8 col-md-offset-2 column">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>班级课程:</th>
						<th style="text-align: right"><a href="cls/addClsCouUI?id=${classes.id}">添加课程</a></th>
					</tr>
					<tr >
						<th style="width:63%">课程名称</th>
    					<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${cList}" var="cou">
    			 		<c:forEach var="course" items="${cou.course}">
    			 			<tr>
    			 			<td>${course.cname}</td>
    			 			<td><a href="cls/delClsCou?classid=${classes.id}&courseno=${course.cno}">删除</a></td>
    			            </tr>
    			</c:forEach>
    		</c:forEach>
				</tbody>
			</table>
		</div>

   
		<div class="col-md-8 col-md-offset-2 column">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>班级教师:</th>
						<th colspan="2" style="text-align: right"><a href="cls/addClsTesUI?id=${classes.id}">添加教师</a></th>
					</tr>
					<tr style="width: 33%">
						<th>教师编号</th>
						<th>教师姓名</th>
    					<th>操作</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${tList}" var="tes">
    			 <c:forEach var="tes" items="${tes.teachers}">
    			 	<tr>
    			 	<td>${tes.tno}</td>
    			 	<td>${tes.tname}</td>
    			 	<td><a href="cls/delClsTes?classid=${classes.id}&teachertno=${tes.tno}">删除</a></td>
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
