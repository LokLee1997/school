<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>更新学生信息</title>
    
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
    <form id="updateStu" action="stu/updateStu" method="post">
    	<input value="${student.sid}"  type="hidden" id="sid" name="sid">
    	<label>姓名：</label><input value="${student.sname}" id="sname" name="sname"><br>
    	<label>性别：</label><input value="${student.ssex}" id="ssex" name="ssex"><br>
    	<label>出生日期：</label><input value="${student.sbirthday}" id="sbirthday" name="sbirthday"><br>
    	<label>班级：</label><input value="${student.classid}" id="classid" name="classid"><br>
    	<input type="submit" value="修改">
    	<input type="reset" value="重置">
    </form>
    </div>
  </body>
</html>
