<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>更新教师信息</title>
    
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
   <form id="updatetes" action="tes/updatetes" method="post">
    	<input value="${teachers.tno}"  type="hidden" id="tno" name="tno">
    	<label>姓名：</label><input value="${teachers.tname}" id="tname" name="tname"><br>
    	<label>性别：</label><input value="${teachers.tsex}" id="tsex" name="tsex"><br>
    	<label>出生日期：</label><input value="${teachers.tbirthday}" id="tbirthday" name="tbirthday"><br>
    	<label>部门：</label>
    	<select name="depart">
    		<option value="1">教育</option>
			<option value="2">后勤</option>
			<option value="3">行政</option>    	
    	</select>
    	<input type="submit" value="修改">
    	<input type="reset" value="重置">
    </form>
    </div>
  </body>
</html>
