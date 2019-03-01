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
   <script type="text/javascript">
   	$(document).ready(function(){
   		$("#add").click(function(){ //点击验证
		 	$.ajax({
				url:"http://localhost:8080/school/ajax/checkhobby",
				type:'post',
				data:{hobby:$("#hobby").val(),studentid:$("#sid").val()},
				dataType:"text",
				success: function(result){
						if(result=="true"){
							alert("兴趣重复，请重新输入");
							return false;
						}else{
							if($("#hobby").val()=='' || $.trim($("#hobby").val())==''){
								alert("请输入兴趣");
								return false;
							}else{
							var add=document.getElementById("addhobby");
							add.submit();
							}
							}
					}
				})
		 })
        //课程名称验证
		 $("#hobby").blur(function(){ 
		  	$.ajax({
					url:"http://localhost:8080/school/ajax/checkhobby",
					type:'post',
					data:{hobby:$("#hobby").val(),studentid:$("#sid").val()},
					dataType:"text",
					success: function(result){
						if(result=="true"){
							$("#hobby").parents('.form-group').addClass('has-error');
							$("#hobby").siblings('.glyphicon').addClass('glyphicon-remove');
							$("#hobbySpan").html("<font color='red'><b>兴趣重复</b></font>");
						}else{
							if($("#hobby").val()!='' || $.trim($("#dname").val())!=''){
							$("#hobby").parents('.form-group').addClass('has-success');
							$("#hobby").siblings('.glyphicon').addClass('glyphicon-ok');
							}
						}
					}
				})
		  }).focus(function(){
			   $("#hobby").parents('.form-group').removeClass('has-error has-success');
			   $("#hobby").siblings('.glyphicon').removeClass('glyphicon-remove glyphicon-ok');
			   $("#hobbySpan").html("");
			  })
	 
    });
   </script>
  </head>
  
  <body> 
  <div class="container jumbotron well" style="background-color: #F0F0F0">
  <div class="row row-centered"> 
  	<div class="col-md-6 col-md-offset-3 col-centered">
    <form class="form-horizontal" method="post" action="hobby/addhobby" name="addhobby" id="addhobby">
  		<div class="form-group has-feedback">
    			<label for="studentid" class="control-label col-md-3">学号：</label>
                <div class="col-md-6"> 
                			${student.sid}<input type="hidden" value="${student.sid}" name="sid" id="sid">                
                </div>
    	</div>
        <div class="form-group">
        		<label for="studentname" class="control-label col-md-3">姓名：</label>
                <div class="col-md-6">
        				${student.sname }		        		
                </div>
        </div>
        <div class="form-group">
        		<label for="studentssex" class="control-label col-md-3">兴趣爱好</label>
                <div class="col-md-6">				        		
                	<input class="form-control" type="text" name="hobby" id="hobby" />
                    <span class="glyphicon form-control-feedback"></span>
                    <span id="hobbySpan"></span>
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
