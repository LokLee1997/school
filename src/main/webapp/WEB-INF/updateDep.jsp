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
    
    <title>更新部门信息</title>
    
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
				url:"http://localhost:8080/school/ajax/checkDepName",
				type:'post',
				data:{dname:$("#dname").val()},
				dataType:"text",
				success: function(result){
						if('${depart.dname}'==$("#dname").val()&&'${depart.detail}'==$("#detail").val()){
							alert("部门名字/简介没有改变，不需要更改");
							return false;
						}else if(result=="true"){
							if('${depart.detail}'==$("#detail").val()){
							alert("该部门已经存在，请重新输入");
							return false;
							}else{
							var add=document.getElementById("updateDep");
							add.submit();
							}
						}else{
							if($("#dname").val()=='' || $.trim($("#dname").val())==''){
								alert("部门名不能为空，请重新输入");
								return false;
							}else{
							var add=document.getElementById("updateDep");
							add.submit();
							}
							}
					}
				})
		 });
		 
			$("#dname").blur(function(){ //部门输入框失去焦点验证
		  	$.ajax({
					url:"http://localhost:8080/school/ajax/checkDepName",
					type:'post',
					data:{dname:$("#dname").val()},
					dataType:"text",
					success: function(result){
						if(result=="false"){								
							if($("#dname").val()!="" || $.trim($("#dname").val())!=""){
							$("#dname").parents('.form-group').addClass('has-success');
							$("#dname").siblings('.glyphicon').addClass('glyphicon-ok');
							$("#dnameSpan").html("<font color='green'><b>该部门名称可以更改</b></font>");
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
    <form class="form-horizontal" method="post" action="dep/updateDep" name="updateDep" id="updateDep" onsubmit="return false;">
  		<h2>更新部门信息</h2>
  		<input value="${depart.did}"  type="hidden" id="did" name="did">
  		<div class="form-group">
    			<label for="studentName" class="control-label col-md-3">部门名称：</label>
                <div class="col-md-6"> 
                	<input class="form-control" type="text" value="${depart.dname}" id="dname" name="dname"/>
                    <span class="glyphicon form-control-feedback"></span>
                    <span id="dnameSpan"></span>     
                </div>
                
    	</div>
         <div class="form-group">
    			<label for="depdetail" class="control-label col-md-3">部门简介：</label>
                <div class="col-md-6"> 
                	<textarea class="form-control" name="detail" id="detail" >${depart.detail}</textarea>	
                   		                
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
