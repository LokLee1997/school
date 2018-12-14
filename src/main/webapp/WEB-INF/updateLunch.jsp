<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>更新部门信息</title>
    
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
    <form id="updateLunch" action="lunch/updateLunch" method="post">
    	<input value="${lunch.id}"  type="hidden" id="id" name="id">
    	<label>菜式：</label><input value="${lunch.caipin}" id="caipin" name="caipin"><br>
    	<label>厨师：</label>
    		<select name="cookerid">
    			<option value="2">张旭</option> 
    		</select>
    		<br>
    	<label>日期：</label><input value="${lunch.date}" id="date" name="date"><br>
    	<input type="submit" value="修改">
    	<input type="reset" value="重置">
    </form>
    </div>
  </body>
</html>
