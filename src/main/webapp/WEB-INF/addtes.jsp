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
    
    <title>添加职工</title>
    
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
	 $("#add").click(function(){ 
							if($("#tname").val()=='' || $.trim($("#tname").val())==''){
								alert("请输入职工姓名");
								return false;
							}else if($("#tbirthday").val()=='' || $.trim($("#tbirthday").val())==''){
								alert("请输入姓名");
								return false;
							}else{
							var add=document.getElementById("addtes");
							add.submit();
							}	
	})	


   $.ajax({
		type:'POST',  //请求类型
		url:'http://localhost:8080/school/ajax/getDep',
		dataType:'json',
		success: function(data){
			console.log(data);
			var data2= eval(data);
			for(var i in data2){
				$("#depart").append(
				"<option value='"+data2[i].did+"'>"+data2[i].dname+"</option>"
				);
			}
			},
		error:function(msg){}
		});
   });
   </script>
  </head>
  
  <body>
  
    <div class="container jumbotron well" style="background-color: #F0F0F0">
  <div class="row row-centered"> 
  	<div class="col-md-6 col-md-offset-3 col-centered">
    <h2>添加教职工</h2>
    <form class="form-horizontal" method="post" action="tes/addtes" name="addtes" id="addtes" onsubmit="return false;">
  		<div class="form-group">
    			<label for="studentid" class="control-label col-md-3">职工姓名：</label>
                <div class="col-md-6"> 
                	<input class="form-control" type="text" name="tname" id="tname" /><span id="idSpan"></span>		                
                </div>
    	</div>
        <div class="form-group">
        		<label for="studentname" class="control-label col-md-3">出生日期：</label>
                <div class="col-md-6">
        			<input class="form-control" type="text" name="tbirthday" id="tbirthday" placeholder="日期格式：XXXX-XX-XX"/><span id="nameSpan"></span>				        		
                </div>
        </div>
        <div class="form-group">
        		<label for="studentname" class="control-label col-md-3">性别：</label>
                <div class="col-md-6">
        			<select name="tsex" class="form-control">
        				<option value="男">男</option>
        				<option value="女">女</option>
        			</select>					        		
                </div>
        </div>
        <div class="form-group">
        		<label for="studentssex" class="control-label col-md-3">部门：</label>
                <div class="col-md-6">
        			<select name="depart" id="depart" class="form-control">
    					
    				</select>				        		
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
