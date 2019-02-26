<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updateuser.jsp' starting page</title>
    
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
    <script type="text/javascript">
   $(document).ready(function(){
			//点击验证
	 $("#update").click(function(){ 
							if($("#password").val()=='' || $.trim($("#password").val())==''){
								alert("密码不能为空");
								return false;
							}else{
							var add=document.getElementById("updateuser");
							add.submit();
							}	
								
	})
	})
   </script>
  </head>
  
  <body>
    <div class="container jumbotron well" style="background-color: #F0F0F0">
  <div class="row row-centered"> 
  	<div class="col-md-6 col-md-offset-3 col-centered">
    <form class="form-horizontal" method="post" action="user/updateuser" name="updateuser" id="updateuser" onsubmit="return false;">
  		<h2>修改密码</h2>
  		<input value="${user.id}"  type="hidden" id="id" name="id">
  		<div class="form-group">
    			<label for="username" class="control-label col-md-3">用户名：</label>
                <div class="col-md-6"> 
                	<label for="username" class="conrtol-label">${user.username} </label>     
                </div>
                
    	</div>
    	
    	<div class="form-group">
        		<label for="password" class="control-label col-md-3">密码：</label>
                <div class="col-md-6">
        			<input class="form-control" type="password" id="password" name="password"/>				        			        		
                </div>
        </div>
       	
        <div class="form-group">
        <div class="col-md-offset-4">
    			<input class="btn btn-info" type="button" id="update" value="更新" onClick="if(confirm('确认信息是否正确?')==false)return false;"/>
    			<input class="btn btn-info" type="reset" value="重置"/>
    	</div>
        </div>
        </form>
  </div>
  </div>
  </div>
  </body>
</html>