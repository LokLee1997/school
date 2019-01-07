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
	<%@ include file="../resource/link.html" %>
	<link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.1.1.js"></script>
   <script src="js/bootstrap.min.js"></script>
  </head>
  
  <body> 
  <div class="container">
  <div class="row row-centered"> 
  	<div class="col-md-6 col-md-offset-3 col-centered">
    <h2>添加学生</h2>
    <form class="form-horizontal" method="post" action="stu/addStu" name="addStu" id="addStu">
  		<div class="form-group">
    			<label for="studentid" class="control-label col-md-3">学号：</label>
                <div class="col-md-6"> 
                	<input class="form-control" type="text" name="sid" id="sid" /><span id="idSpan"></span>		                
                </div>
    	</div>
        <div class="form-group">
        		<label for="studentname" class="control-label col-md-3">姓名：</label>
                <div class="col-md-6">
        			<input class="form-control" type="text" name="sname" id="sname"/><span id="nameSpan"></span>				        		
                </div>
        </div>
        <div class="form-group">
        		<label for="studentssex" class="control-label col-md-3">性别：</label>
                <div class="col-md-6">
        			<input class="form-control" type="text" name="ssex" id="ssex"/><span id="sexSpan"></span>				        		
                </div>
        </div>
        <div class="form-group">
        		<label for="studentsbirthday" class="control-label col-md-3">出生日期：</label>
                <div class="col-md-6">
        			<input class="form-control" type="text" name="sbirthday" id="sbirthday"/><span id="sbirthdaySpan"></span>				        		
                </div>
        </div>
        <div class="form-group">
        		<label for="studentname" class="control-label col-md-3">班级：</label>
                <div class="col-md-6">
        			<select name="classid" class="form-control">
    					<option value="1">小班一班</option>
    					<option value="2">小班二班</option>
    					<option value="3">中班一班</option>
    					<option value="4">中班二班</option>
    				</select>				        		
                </div>
        </div>
        <div class="form-group">
        <div class="col-md-offset-4">
    			<input class="btn btn-info" type="submit" value="添加"/>
    			<input class="btn btn-info" type="reset" value="重置"/>
    	</div>
        </div>
        </form>
  </div>
  </div>
  </div>
  </body>
</html>
