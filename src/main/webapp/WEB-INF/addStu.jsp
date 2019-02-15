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
   <script type="text/javascript">
   	$(document).ready(function(){
   	 $.ajax({		  //拉去班级列表
		type:'POST',  //请求类型
		url:'http://localhost:8080/school/ajax/getCls',
		dataType:'json',
		success: function(data){
			console.log(data);
			var data2= eval(data);
			for(var i in data2){
				$("#classid").append(
				"<option value='"+data2[i].id+"'>"+data2[i].classname+"</option>"
				);
			}
			},
		error:function(msg){}
		});
   	 $("#add").click(function(){ //点击验证
		 	$.ajax({
				url:"http://localhost:8080/school/ajax/checksid",
				type:'post',
				data:{sid:$("#sid").val()},
				dataType:"text",
				success: function(result){
						if(result=="false"){
							alert("该学号已经存在，请重新输入");
							return false;
						}else{
							if($("#sid").val()=='' || $.trim($("#sid").val())==''){
								alert("请输入学号");
								return false;
							}else if($("#sname").val()=='' || $.trim($("#sname").val())==''){
								alert("请输入姓名");
								return false;
							}else if($("#sbirthday").val()=='' || $.trim($("#sbirthday").val())==''){
								alert("请输入出生日期");
								return false;
							}else{
							var add=document.getElementById("addStu");
							add.submit();
							}
							}
					}
				})
		 })
	  $("#sid").blur(function(){ //学号输入框失去焦点验证
		  	$.ajax({
					url:"http://localhost:8080/school/ajax/checksid",
					type:'post',
					data:{sid:$("#sid").val()},
					dataType:"text",
					success: function(result){
						if(result=="false"){
							$("#sid").parents('.form-group').addClass('has-error');
							$("#sid").siblings('.glyphicon').addClass('glyphicon-remove');
							$("#idSpan").html("<font color='red'><b>该学号已存在</b></font>");
						}else{
							if($("#sid").val()!=null && $("#sid").val()!=""){
							$("#sid").parents('.form-group').addClass('has-success');
							$("#sid").siblings('.glyphicon').addClass('glyphicon-ok');
							}
						}
					}
				})
		  }).focus(function(){
			   $("#sid").parents('.form-group').removeClass('has-error has-success');
			   $("#sid").siblings('.glyphicon').removeClass('glyphicon-remove glyphicon-ok');
			   $("#idSpan").html("");
			  })
   	});
   </script>
  </head>
  
  <body> 
  <div class="container jumbotron well" style="background-color: #F0F0F0">
  <div class="row row-centered"> 
  	<div class="col-md-6 col-md-offset-3 col-centered">
    <h2>添加学生</h2>
    <form class="form-horizontal" method="post" action="stu/addStu" name="addStu" id="addStu">
  		<div class="form-group has-feedback">
    			<label for="studentid" class="control-label col-md-3">学号：</label>
                <div class="col-md-6"> 
                	<input class="form-control" type="text" name="sid" id="sid" />
                    <span class="glyphicon form-control-feedback"></span>
                    <span id="idSpan"></span>		                
                </div>
    	</div>
        <div class="form-group">
        		<label for="studentname" class="control-label col-md-3">姓名：</label>
                <div class="col-md-6">
        			<input class="form-control" type="text" name="sname" id="sname"/>				        		
                </div>
        </div>
        <div class="form-group">
        		<label for="studentssex" class="control-label col-md-3">性别：</label>
                <div class="col-md-6">				        		
                	<select name="ssex" class="form-control">
        				<option value="男">男</option>
        				<option value="女">女</option>
        			</select>	
                </div>
        </div>
        <div class="form-group">
        		<label for="studentsbirthday" class="control-label col-md-3">出生日期：</label>
                <div class="col-md-6">
        			<input class="form-control" type="text" name="sbirthday" id="sbirthday"/>			        		
                </div>
        </div>
        <div class="form-group">
        		<label for="studentname" class="control-label col-md-3">班级：</label>
                <div class="col-md-6">
        			<select id="classid" name="classid" class="form-control">
    					
    				</select>				        		
                </div>
        </div>
        <div class="form-group">
        <div class="col-md-offset-4">
    			<input class="btn btn-info" type="button" id="add" value="添加"/>
    			<input class="btn btn-info" type="reset" value="重置"/>
    	</div>
        </div>
        </form>
  </div>
  </div>
  </div>
  </body>
</html>
