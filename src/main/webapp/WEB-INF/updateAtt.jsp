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
    
    <title>更新收费信息</title>
    
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
	 $("#update").click(function(){ 
							if($("#date").val()=='' || $.trim($("#date").val())==''){
								alert("请输入日期");
								return false;
							}else{
							var add=document.getElementById("updateAtt");
							add.submit();
							}	
	})
   });
   </script>
  </head>
  
  <body>
  
   <div class="container jumbotron well" style="background-color: #F0F0F0">
  <div class="row row-centered"> 
  	<div class="col-md-6 col-md-offset-3 col-centered">
    <form class="form-horizontal" method="post" action="att/updateAtt" name="updateAtt" id="updateAtt" onSubmit="return false;">
  		<h2>更新缺勤信息</h2>
  		<input value="${att.id}"  type="hidden" id="id" name="id">
  		<div class="form-group">
    			<label for="studentid" class="control-label col-md-3">学生学号：</label>
                <div class="col-md-6"> 
                <label for="studentidLabel" class="control-label">${att.student.sid }</label>     
                </div>
                
    	</div>
    	 <div class="form-group">
        		<label for="studentName" class="control-label col-md-3">学生姓名：</label>
                <div class="col-md-6">
        		<label for="studentNameLabel" class="control-label">${att.student.sname }</label>		        		
                </div>
        </div>
       	<div class="form-group">
        		<label for="attLabel" class="control-label col-md-3">缺勤原因：</label>
                <div class="col-md-6">
        			<select name="state" class="form-control">
    					<option value="0">无故缺勤</option>
    					<option value="1">请病假</option>
    				</select>		        		
                </div>
        </div>
        <div class="form-group">
        		<label for="date" class="control-label col-md-3">缺勤日期：</label>
                <div class="col-md-6">
        			<input class="form-control" type="text" value="${att.date}" id="date" name="date" placeholder="日期格式： XXXX-XX-XX"/>	        		
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
