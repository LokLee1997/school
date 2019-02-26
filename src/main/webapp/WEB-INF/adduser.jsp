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
    
    <title>My JSP 'adduser.jsp' starting page</title>
    
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
   $(document).ready(function(e) {
	   //提交按钮验证
	   $("#add").click(function(){
		   $.ajax({
				url:"http://localhost:8080/school/ajax/checkusername",
				type:'post',
				data:{username:$("#username").val()},
				dataType:"text",
				success: function(result){
						if(result=="false"){
							alert("该管理员账号已经存在");
							return false;
						}else{
							if($("#username").val()=='' || $.trim($("#username").val())==''){
								alert("请输入账号");
								return false;
							}else if($("#password").val()=='' || $.trim($("#password").val())==''){
								alert("请输入密码");
								return false;
							}else{
							var add=document.getElementById("adduser");
							add.submit();
							}
							}
					}
				})
		 })
		   
	   //失去焦点验证
	   $("#username").blur(function(){
		   $.ajax({
			type:'post',
			url:"http://localhost:8080/school/ajax/checkusername",
			data:{username:$("#username").val()},
			dataType:"text",
			success: function(result){
				console.log(result);
				if(result=="false"){
							$("#username").parents('.form-group').addClass('has-error');
							$("#username").siblings('.glyphicon').addClass('glyphicon-remove');
							$("#usernameSpan").html("<font color='red'><b>该管理员账号已存在</b></font>");
						}else{
							if($("#username").val()!=null && $("#username").val()!=""){
							$("#username").parents('.form-group').addClass('has-success');
							$("#username").siblings('.glyphicon').addClass('glyphicon-ok');
							}
						}
					
			 	 }
			})
		   }).focus(function(){
			     $("#username").parents('.form-group').removeClass('has-error has-success');
			   $("#username").siblings('.glyphicon').removeClass('glyphicon-remove glyphicon-ok');
			   $("#usernameSpan").html("");
			   })
    	
});
   </script>
  </head>
  
  <body> 
  <div class="container jumbotron well" style="background-color: #F0F0F0">
  <div class="row row-centered"> 
  	<div class="col-md-6 col-md-offset-3 col-centered">
    <h2>添加管理员</h2>
    <form class="form-horizontal" method="post" action="user/adduser" name="adduser" id="adduser" onsubmit="return false;" >
        <div class="form-group has-feedback">
        		<label for="username" class="control-label col-md-3">用户名：</label>
                <div class="col-md-6">
        			<input class="form-control" type="text" name="username" id="username"/>
        			<span class="glyphicon form-control-feedback"></span>
                    <span id="usernameSpan"></span>				        		
                </div>
        </div>
        <div class="form-group">
        		<label for="password" class="control-label col-md-3">密码：</label>
                <div class="col-md-6">				        		
                	<input class="form-control" type="password" name="password" id="password"/>
                </div>
        </div>
        
        <div class="form-group">
        <div class="col-md-offset-4">
    			<input class="btn btn-info" type="button" id="add" value="添加" onClick="if(confirm('确认信息是否正确?')==false)return false;"/>
    			<input class="btn btn-info" type="reset" value="重置"/>
    	</div>
        </div>
        </form>
  </div>
  </div>
  </div>
  </body>
</html>