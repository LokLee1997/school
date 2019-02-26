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
    
    <title>添加班级</title>
    
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
			$("#add").click(function(){ //点击验证
		 	$.ajax({
				url:"http://localhost:8080/school/ajax/checkClsName",
				type:'post',
				data:{classname:$("#classname").val()},
				dataType:"text",
				success: function(result){
						if(result=="true"){
							alert("该班级已经存在，请重新输入");
							return false;
						}else{
							if($("#classname").val()=='' || $.trim($("#classname").val())==''){
								alert("请输入班级名");
								return false;
							}else{
							var add=document.getElementById("addCls");
							add.submit();
							}
							}
					}
				})
		 });
		 //学号输入框失去焦点验证
			$("#classname").blur(function(){ //学号输入框失去焦点验证
		  	$.ajax({
					url:"http://localhost:8080/school/ajax/checkClsName",
					type:'post',
					data:{classname:$("#classname").val()},
					dataType:"text",
					success: function(result){
						if(result=="true"){
							$("#classname").parents('.form-group').addClass('has-error');
							$("#classname").siblings('.glyphicon').addClass('glyphicon-remove');
							$("#classnameSpan").html("<font color='red'><b>该班级已存在</b></font>");
						}else{								
							if($("#classname").val()!="" || $.trim($("#classname").val())!=""){
							$("#classname").parents('.form-group').addClass('has-success');
							$("#classname").siblings('.glyphicon').addClass('glyphicon-ok');
							$("#classnameSpan").html("<font color='green'><b>该班级可以使用</b></font>");
							}
						}
					}
				})
		  }).focus(function(){
			   $("#classname").parents('.form-group').removeClass('has-error has-success');
			   $("#classname").siblings('.glyphicon').removeClass('glyphicon-remove glyphicon-ok');
			   $("#classnameSpan").html("");
			  })
   	});
			
			

   
   </script>
   
  </head>
  
  <body>
    
    <div class="container jumbotron well" style="background-color: #F0F0F0">
  <div class="row row-centered"> 
  	<div class="col-md-6 col-md-offset-3 col-centered">
    <h2>添加班级</h2>
    <form class="form-horizontal" method="post" action="cls/addCls" name="addCls" id="addCls" onsubmit="return false;">
  		<div class="form-group has-feedback">
    			<label for="classname" class="control-label col-md-3">班级名字：</label>
                <div class="col-md-6"> 
                	<input class="form-control" type="text" name="classname" id="classname" />
                    <span class="glyphicon form-control-feedback"></span>
                    <span id="classnameSpan"></span>		          
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
