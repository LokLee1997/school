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
	<%@ include file="../resource/link.html" %>
	<link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.1.1.js"></script>
   <script src="js/bootstrap.min.js"></script>
  </head>
  
  <body>
  
    <div class="container">
	<div class="row row-centered">
		<div class="col-md-8 col-md-offset-2 col-centered">
			<form role="form-horizontal" action="att/addAtt" method="post" id="addAtt">
				<input value="${student.sid}" name="studentid" type="hidden">
				<div class="form-group">
					 <label for="studentid" class="col-md-2 control-label" style="text-align: right;">学号：</label>
					 <label for="studentidlabel" class="control-label">
					 ${student.sid}
					 </label>
				</div>
				<div class="form-group ">
					 <label for="studentname" class="col-md-2 control-label" style="text-align: right;">姓名：</label>
					 <label for="studentnamelabel" class="control-label">
					 ${student.sname}
					 </label>
				</div>
				<div class="form-group">
					 <label for="class" class="col-md-2 control-label" style="text-align: right;">班级：</label>
					 <label for="classnamelabel" class="control-label">
					 ${student.classes.classname}
					 </label>
				</div>
				<div class="form-group">
					 <label for="studentname" class="col-md-2 control-label" style="text-align: right;">缺勤原因：</label>
					 
					 <select name="state">
    					<option value="0">无故缺勤</option>
    					<option value="1">请病假</option>
    				 </select>
    				 
				</div>
				<div class="form-group">
					 <label for="date" class="col-md-2 control-label" style="text-align: right;">日期：</label>
					 <div class="col-md-4 input-group input-group-sm">
					 	<input name="date" type="text" class="form-control"/>
					 </div>
				</div>
				
				<div class="from-group ">
					<div class=" col-md-offset-2 col-md-6">
					<button type="submit" class="btn btn-default">添加</button>
					<button type="submit" class="btn btn-default">重置</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
  </body>
</html>
