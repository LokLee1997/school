<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>首页</title>
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
    <a href="stu/addStuUI">添加学生</a><br>
    <a href="stu/stuList">学生列表</a><br>
    <a>--------------------------------</a><br>
    <a href="cls/addClsUI">添加班级</a><br>
    <a href="cls/clsList">班级列表</a><br>
    <a>--------------------------------</a><br>
    <a href="tes/addtesUI">添加职工</a><br>
    <a href="tes/tesList">职工列表</a><br>
    <a>--------------------------------</a><br>
    <a href="dep/addDepUI">添加部门</a><br>
    <a href="dep/depList">部门列表</a><br>
     <a>--------------------------------</a><br>
    <a href="cou/addCouUI">添加课程</a><br>
    <a href="cou/couList">课程列表</a><br>
     <a>--------------------------------</a><br>
    <a href="charge/addChargeUI">添加收费</a><br>
    <a href="charge/chargeList">收费目录</a><br>
  </body>
</html>
