<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加职工</title>
    
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
    <form action="tes/addtes" method="post" id="addtes">
    	<label>职工姓名：</label><input id="tname" name="tname"/><br>
    	<label>性别：</label><input id="tsex" name="tsex"/><br>
    	<label>出生日期：</label><input id="tbirthday" name="tbirthday"/><br>
    	<label>部门：</label><select name="depart">
    		<option value="1">教育</option>
    		<option value="2">后勤</option>
    		<option value="2">行政</option>
    	</select>
    	<input type="submit" value="添加"/>
    	<input type="reset" value="重置"/>
    </form>
    </div>
  </body>
</html>
