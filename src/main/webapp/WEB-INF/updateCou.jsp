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
    <script type="text/javascript">
   		$(document).ready(function(){
			$("#update").click(function(){ //点击验证
		 	$.ajax({
				url:"http://localhost:8080/school/ajax/checkCouName",
				type:'post',
				data:{cname:$("#cname").val()},
				dataType:"text",
				success: function(result){
						if('${course.cname}'==$("#cname").val()&&'${course.detail}'==$("#detail").val()){
							alert("课程名字/简介没有改变，不需要更改");
							return false;
						}else if(result=="true"){
							if('${course.detail}'==$("#detail").val()){
							alert("课程已经存在，请重新输入");
							return false;
							}else{
							var add=document.getElementById("updateCou");
							add.submit();
							}
						}else{
							if($("#classname").val()=='' || $.trim($("#classname").val())==''){
								alert("课程不能为空，请重新输入");
								return false;
							}else{
							var add=document.getElementById("updateCou");
							add.submit();
							}
							}
					}
				})
		 });
		 //学号输入框失去焦点验证
			$("#cname").blur(function(){ //学号输入框失去焦点验证
		  	$.ajax({
					url:"http://localhost:8080/school/ajax/checkCouName",
					type:'post',
					data:{cname:$("#cname").val()},
					dataType:"text",
					success: function(result){
						if(result=="false"){
									
							if($("#cname").val()!="" || $.trim($("#cname").val())!=""){
							$("#cname").parents('.form-group').addClass('has-success');
							$("#cname").siblings('.glyphicon').addClass('glyphicon-ok');
							$("#cnameSpan").html("<font color='green'><b>该课程名可以使用</b></font>");
							}
						}
					}
				})
		  }).focus(function(){
			   $("#cname").parents('.form-group').removeClass('has-error has-success');
			   $("#cname").siblings('.glyphicon').removeClass('glyphicon-remove glyphicon-ok');
			   $("#cnameSpan").html("");
			  })
   	});
			
			

   
   </script>
  </head>
  
  <body>
  
   <div class="container jumbotron well" style="background-color: #F0F0F0">
  <div class="row row-centered"> 
  	<div class="col-md-6 col-md-offset-3 col-centered">
    <form class="form-horizontal" method="post" action="cou/updateCou" name="updateCou" id="updateCou" onSubmit="return false;">
  		<h2>更新课程信息</h2>
  		<input type="hidden" value="${course.cno}" name="cno" id="cno"/> 
  		<div class="form-group has-feedback">
    			<label for="courseName" class="control-label col-md-3">课程名字：</label>
                <div class="col-md-6"> 
                	<input class="form-control" type="text" value="${course.cname }" id="cname" name="cname"/> 
                    <span class="glyphicon form-control-feedback"></span>
                    <span id="cnameSpan"></span>     
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
