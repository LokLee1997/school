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

  </head>
  
  <body>
   <div align="center" >
    <div>
    <div>
    	<label>班级名称:</label>
    </div>
    ${classes.classname}
   
    <div><label>班级人数:</label>${num}</div>
    <div>
    <div><label>班级学生名单:</label></div>
    <div>
    		<c:forEach items="${sList}" var="stu">
    			 <c:forEach var="student" items="${stu.student}">
    			 	${student.sid}
    				${student.sname}
    				<a href="att/addAttUI?id=${student.sid}">添加到缺勤</a>
    				<br>
    			</c:forEach>
    		</c:forEach>
    	</div>
    	<div>
    	<div>班级课程:</div>
    	<c:forEach items="${cList}" var="cou">
    			 <c:forEach var="course" items="${cou.course}">
    			 	<div>${course.cname}
    			 	<a href="cls/delClsCou?classid=${classes.id}&courseno=${course.cno}">删除</a>
    			 	</div>
    			</c:forEach>
    		</c:forEach>
    		<div><a href="cls/addClsCouUI?id=${classes.id}">添加课程</a></div>
    	<div>班级教师：</div>
    	<c:forEach items="${tList}" var="tes">
    			 <c:forEach var="tes" items="${tes.teachers}">
    			 	<div>
    			 	${tes.tname}
    			 	<a href="cls/delClsTes?classid=${classes.id}&teachertno=${tes.tno}">删除</a>
    				</div>
    			</c:forEach>
    		</c:forEach>
    		<div><a href="cls/addClsTesUI?id=${classes.id}">添加教师</a></div>
    	</div>
    </div>
    </div>
    </div>
  </body>
</html>
