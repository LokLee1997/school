<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>更新课程信息</title>
    
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
  
   <div class="container jumbotron well" style="background-color: #F0F0F0">
  <div class="row row-centered"> 
  	<div class="col-md-6 col-md-offset-3 col-centered">
    <form class="form-horizontal" method="post" action="cou/updateCou" name="updateCou" id="updateCou">
  		<h2>更新课程信息</h2>
  		<input type="hidden" value="${course.cno}" name="cno" id="cno"/> 
  		<div class="form-group">
    			<label for="courseName" class="control-label col-md-3">课程名字：</label>
                <div class="col-md-6"> 
                	<input class="form-control" type="text" value="${course.cname }" id="cname" name="cname"/>      
                </div>
                
    	</div>
    	<div class="form-group">
        		<label for="courseLabel" class="control-label col-md-3">课程信息：</label>
                <div class="col-md-6">		        			        		
                	<textarea class="form-control" name="detail" id="detail">${course.detail}</textarea>
                </div>
        </div>
        <div class="form-group">
        <div class="col-md-offset-4">
    			<input class="btn btn-info" type="submit" value="更新"/>
    			<input class="btn btn-info" type="reset" value="重置"/>
    	</div>
        </div>
        </form>
  </div>
  </div>
  </div>
  </body>
</html>
