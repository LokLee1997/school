<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加</title>
    
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
    <form action="att/addAtt" method="post" id="addAtt">
    	<label>学号：</label><input value="${student.sid}" name="studentid" readonly="readonly" style="border: 0px;"><br>
    	<label>姓名：</label>${student.sname}
    	<br>
    	<label>班级:</label>${student.classes.classname}<br>
    	<label>缺勤原因：</label><select name="state">
    		<option value="0">无故缺勤</option>
    		<option value="1">请病假</option>
    	</select><br>
    	日期：<input name="date"><br>
    	<input type="submit" value="添加"/>
    	<input type="reset" value="重置"/>
    </form>
    </div>
  </body>
</html>
