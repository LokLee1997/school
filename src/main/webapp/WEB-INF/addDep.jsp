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
    
    <title>添加部门</title>
    
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
   	 
   	
   	$("#add").click(function(){ //点击验证
		 	$.ajax({
				url:"http://localhost:8080/school/ajax/checkDepName",
				type:'post',
				data:{dname:$("#dname").val()},
				dataType:"text",
				success: function(result){
						if(result=="true"){
							alert("该部门已经存在，请重新输入");
							return false;
						}else{
							if($("#dname").val()=='' || $.trim($("#dname").val())==''){
								alert("请输入要开设的部门");
								return false;
							}else if($("#detail").val()=='' || $.trim($("#detail").val())==''){
								alert("请输入部门简介");
								return false;
							}else{
							var add=document.getElementById("addDep");
							add.submit();
							}
							}
					}
				})
		 })
        //课程名称验证
		 $("#dname").blur(function(){ 
		  	$.ajax({
					url:"http://localhost:8080/school/ajax/checkDepName",
					type:'post',
					data:{dname:$("#dname").val()},
					dataType:"text",
					success: function(result){
						if(result=="true"){
							$("#dname").parents('.form-group').addClass('has-error');
							$("#dname").siblings('.glyphicon').addClass('glyphicon-remove');
							$("#dnameSpan").html("<font color='red'><b>该部门已存在</b></font>");
						}else{
							if($("#dname").val()!='' || $.trim($("#dname").val())!=''){
							$("#dname").parents('.form-group').addClass('has-success');
							$("#dname").siblings('.glyphicon').addClass('glyphicon-ok');
							$("#dnameSpan").html("<font color='green'><b>该部门可以开设</b></font>");
							}
						}
					}
				})
		  }).focus(function(){
			   $("#dname").parents('.form-group').removeClass('has-error has-success');
			   $("#dname").siblings('.glyphicon').removeClass('glyphicon-remove glyphicon-ok');
			   $("#dnameSpan").html("");
			  })
	 
    });

   </script>
  </head>
  
  <body>
   
    <div class="container jumbotron well" style="background-color: #F0F0F0">
  <div class="row row-centered"> 
  	<div class="col-md-6 col-md-offset-3 col-centered">
    <h2>添加新部门</h2>
    <form class="form-horizontal" method="post" action="dep/addDep" name="addDep" id="addDep" onsubmit="return false;">
  		<div class="form-group has-feedback">
    			<label for="dname" class="control-label col-md-3">部门名字：</label>
                <div class="col-md-6"> 
                	<input class="form-control" type="text" name="dname" id="dname" />
                    <span class="glyphicon form-control-feedback"></span>
                    <span id="dnameSpan"></span>		                
                </div>
    	</div>
        <div class="form-group">
    			<label for="depdetail" class="control-label col-md-3">部门简介：</label>
                <div class="col-md-6"> 
                	<textarea class="form-control" name="detail" id="detail"></textarea>	
                   		                
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
