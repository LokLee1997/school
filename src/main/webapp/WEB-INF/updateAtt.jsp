<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>更新收费信息</title>
    
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
    <form id="updateAtt" action="att/updateAtt" method="post">
    	<input value="${att.id}"  type="hidden" id="id" name="id">
    	<label>学号：</label>${att.student.sid }<br>
    	<label>学生姓名：</label>${att.student.sname }<br>
    	<select name="state">
    		<option value="0">无故缺勤</option>
    		<option value="1">请病假</option> 
    	</select>
    	<br>
    	<input type="submit" value="修改">
    	<input type="reset" value="重置">
    </form>
   </div>
  </body>
</html>