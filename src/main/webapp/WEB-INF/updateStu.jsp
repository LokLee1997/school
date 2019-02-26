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
    
    <title>更新学生信息</title>
    
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
			//点击验证
	 $("#update").click(function(){ 
							if($("#sname").val()=='' || $.trim($("#sname").val())==''){
								alert("学生姓名不能为空");
								return false;
							}else if($("#sbirthday").val()=='' || $.trim($("#sbirthday").val())==''){
								alert("出生日期不能为空");
								return false;
							}else{
							var add=document.getElementById("updateStu");
							add.submit();
							}	
	})
	})
   </script>
  </head>
  
  <body>
   <div class="container jumbotron well" style="background-color: #F0F0F0">
  <div class="row row-centered"> 
  	<div class="col-md-6 col-md-offset-3 col-centered">
    <form class="form-horizontal" method="post" action="stu/updateStu" name="updateStu" id="updateStu" onSubmit="return false;">
  		<h2>更新学生信息</h2>
  		<input value="${student.sid}"  type="hidden" id="sid" name="sid">
  		<div class="form-group">
    			<label for="studentName" class="control-label col-md-3">学生姓名：</label>
                <div class="col-md-6"> 
                	<input class="form-control" type="text" value="${student.sname}" id="sname" name="sname"/>      
                </div>
                
    	</div>
    	 <div class="form-group">
        		<label for="itemLabel" class="control-label col-md-3">学生性别：</label>
                <div class="col-md-6">
        			<select name="ssex" class="form-control">
        				<option value="男">男</option>
        				<option value="女">女</option>
        			</select>			        		
                </div>
        </div>
    	<div class="form-group">
        		<label for="priceLabel" class="control-label col-md-3">出生日期：</label>
                <div class="col-md-6">
        			<input class="form-control" type="text" value="${student.sbirthday}" id="sbirthday" name="sbirthday" placeholder="日期格式：XXXX-XX-XX"/>				        			        		
                </div>
        </div>
       	<div class="form-group">
        		<label for="stateLabel" class="control-label col-md-3">班级：</label>
                <div class="col-md-6">
        			<select name="classid" class="form-control" id="classid">
    					
    				</select>		        		
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
