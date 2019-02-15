<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加课程</title>
    
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
		//点击验证
		$("#add").click(function(){ //点击验证
		 	$.ajax({
				url:"http://localhost:8080/school/ajax/checkCouName",
				type:'post',
				data:{cname:$("#cname").val()},
				dataType:"text",
				success: function(result){
						if(result=="true"){
							alert("该课程已经存在，请重新输入");
							return false;
						}else{
							if($("#cname").val()=='' || $.trim($("#cname").val())==''){
								alert("请输入要开设的课程");
								return false;
							}else if($("#detail").val()=='' || $.trim($("#detail").val())==''){
								alert("请输入课程简介");
								return false;
							}else{
							var add=document.getElementById("addCou");
							add.submit();
							}
							}
					}
				})
		 })
        //课程名称验证
		 $("#cname").blur(function(){ 
		  	$.ajax({
					url:"http://localhost:8080/school/ajax/checkCouName",
					type:'post',
					data:{cname:$("#cname").val()},
					dataType:"text",
					success: function(result){
						if(result=="true"){
							$("#cname").parents('.form-group').addClass('has-error');
							$("#cname").siblings('.glyphicon').addClass('glyphicon-remove');
							$("#cnameSpan").html("<font color='red'><b>该课程已存在</b></font>");
						}else{
							if($("#cname").val()!='' || $.trim($("#cname").val())!=''){
							$("#cname").parents('.form-group').addClass('has-success');
							$("#cname").siblings('.glyphicon').addClass('glyphicon-ok');
							$("#cnameSpan").html("<font color='red'><b>该课程可以开设</b></font>");
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
    <h2>添加课程</h2>
    <form class="form-horizontal" method="post" action="cou/addCou" name="addCou" id="addCou">
  		<div class="form-group has-feedback">
    			<label for="studentid" class="control-label col-md-3">课程名称：</label>
                <div class="col-md-6"> 
                	<input class="form-control" type="text" name="cname" id="cname" />
                    <span class="glyphicon form-control-feedback"></span>
                    <span id="cnameSpan"></span>		                
                </div>
    	</div>
        <div class="form-group">
        		<label for="coursedetail" class="control-label col-md-3">课程信息：</label>
                <div class="col-md-6">
        			<textarea class="form-control" name="detail" id="detail"></textarea>			        		
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
