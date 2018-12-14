<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加学生</title>
    
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
    <form action="stu/addStu" method="post" id="addStu">
    	<label>学号：</label><input id="sid" name="sid"/><br>
    	<label>姓名：</label><input id="sname" name="sname"/><br>
    	<label>性别：</label><input id="ssex" name="ssex"/><br>
    	<label>出生日期：</label><input id="sbirthday" name="sbirthday"/><br>
    	<label>班级：</label>
    	<select name="classid">
    		<option value="1">小班一班</option>
    		<option value="2">小班二班</option>
    		<option value="3">中班一班</option>
    		<option value="4">中班二班</option>
    	</select>
    	<input type="submit" value="添加"/>
    	<input type="reset" value="重置"/>
    </form></div>
  </body>
</html>
