<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加班级课程</title>
    
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
    <div align="center">
    <form action="cls/addClsTes" method="post" id="addClsTes">
    	<input type="hidden" value="${classes.id}" id="classid" name="classid">
    	<label>班级名字：</label>${classes.classname}<br>
    	<label>教师：</label>
    	<select name="teachertno">
    		<option value="1">李成才</option>
    		<option value="3">王萍</option>
    		<option value="4">刘斌</option>
    	</select>
    	<input type="submit" value="添加"/>
    	<input type="reset" value="重置"/>
    </form>
    </div>
  </body>
</html>
