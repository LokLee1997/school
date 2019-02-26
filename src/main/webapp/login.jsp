<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	
	<link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="js/jquery-3.1.1.js"></script>
   <script src="js/bootstrap.min.js"></script>
   <script type="text/javascript">
   $(document).ready(function(e) {
    alert("系统会自动拦截未登录用户，请登录后再使用");
});
   </script>
   <!--登录验证-->
<script type="text/javascript">
	$(document).ready(function() {
		$(function(){
			 document.onkeydown = function(e){
				 var ev = document.all?window.event:e;
				 if(ev.keyCode==13){
					 $("#login").click();
					 }
				 }
			});
        $("#denglu").click(function(){
			if($("#username").val()=='' || $.trim($("#username").val())==''){
					alert("用户名不能为空");
					return false;
				}else if($("#password").val()=='' || $.trim($("#password").val())==''){
					alert("密码不能为空");
					return false;
				}else{	
			 $.ajax({   
                url:"http://localhost:8080/school/ajax/checkLoginUser", 
                type:"POST", 
                data:{username:$("#username").val(),password:$("#password").val()},
                dataType:"text",  
                success: function(result)   
                        { 
						console.log(result);
						if(result=="true"){
							var login = document.getElementById('login');	
							login.submit();
						}else{
							alert("账号或者密码错误");
							return false;
							}
                        }  
              
               });   
				}
				
			}); 
    });
  </script>
	<style type="text/css">
	body{
		height: 100%;
		width: 100%;
		background-repeat: no-repeat;
		background-size:cover;
		overflow:hidden;
	}
	</style>
  </head>
  
  <body background="resource/bg2.jpg">
   <div class="container ">
	<div class="row row-centered" style="margin-top: 300">
		<div class="col-md-8 col-md-offset-3 col-centered">
    <h1>欢迎使用启航幼儿园信息管理系统</h1>
    <HR style="border:1;dashed;#987cb9" color="#987cb9" size="2">
    <form class="form-horizontal" method="post" action="user/login" name="login" id="login" onsubmit="return false;">
  		<div class="form-group">
    			<label for="username" class="control-label col-md-2">用户名</label>
                <div class="col-md-6"> 
                	<input class="form-control" type="text" name="username" id="username" />	                
                </div>
    	</div>
        <div class="form-group">
        		<label for="password" class="control-label col-md-2">密码</label>
                <div class="col-md-6">
        			<input class="form-control" type="password" name="password" id="password"/>				        		
                </div>
        </div>
        <div class="form-group">
        		<div class="col-md-offset-2">
    				<input class="btn btn-info col-md-3" type="button" value="登录" id="denglu"/>
                    <input class="btn btn-info col-md-3 col-md-offset-1" type="reset" value="重置"/>
        		</div>
        </div>
        </form>
  </div>
  </div>
  </div>
  </body>
</html>
