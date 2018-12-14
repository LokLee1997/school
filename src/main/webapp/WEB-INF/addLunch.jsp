<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加部门</title>
    
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
    <form action="lunch/addLunch" method="post" id="addLunch">
    	<label>菜式：</label><input id="caipin" name="caipin"/><br>
    	<label>厨师：</label>
    		<select name="cookerid">
    			<option value="2">张旭</option> 
    		</select>
    		<br>
    	<label>日期：</label><input id="date" name="date"><br>
    	<input type="submit" value="添加"/>
    	<input type="reset" value="重置"/>
    </form>
    </div>
  </body>
</html>
