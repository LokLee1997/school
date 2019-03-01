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
    
    <title>更新</title>
    
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
				url:"http://localhost:8080/school/ajax/checkhobby",
				type:'post',
				data:{hobby:$("#hobby").val(),studentid:$("#sid").val()},
				dataType:"text",
				success: function(result){
						if('${hobby.hobby}'==$("#hobby").val()){
							alert("兴趣没有改变，不需要更改");
							return false;
						}else if(result=="true"){
							alert("兴趣重复，请重新输入");
							return false;
						}else{if($("#hobby").val()=='' || $.trim($("#hobby").val())==''){
								alert("请输入兴趣");
								return false;
							}else{
							var add=document.getElementById("updatehobby");
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
					  if('${hobby.hobby}'!=$("#hobby").val()){
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
    <form class="form-horizontal" method="post" action="hobby/updatehobby" name="updatehobby" id="updatehobby" onSubmit="return false;">
  		
  		<input value="${hobby.id}" type="hidden" id="id" name="id">
  		<div class="form-group">
    			<label for="studentid" class="control-label col-md-3">学生学号：</label>
                <div class="col-md-6"> 
                <label for="studentidLabel" class="control-label">${student.sid}
                	<input value="${student.sid}" type="hidden" id="sid" name="sid">
                </label>     
                </div>
                
    	</div>
    	 <div class="form-group">
        		<label for="studentName" class="control-label col-md-3">学生姓名：</label>
                <div class="col-md-6">
        		<label for="studentNameLabel" class="control-label">${student.sname }</label>		        		
                </div>
        </div>
     
        <div class="form-group">
        		<label for="date" class="control-label col-md-3">兴趣：</label>
                <div class="col-md-6">
        			<input class="form-control" type="text" value="${hobby.hobby}" id="hobby" name="hobby"/>
        			<span class="glyphicon form-control-feedback"></span>
                    <span id="hobbySpan"></span>	        		
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
