<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加</title>
    
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
							if($("#chargeitem").val()=='' || $.trim($("#chargeitem").val())==''){
								alert("请输入收费的项目");
								return false;
							}else if($("#price").val()=='' || $.trim($("#price").val())==''){
								alert("请输入需要交纳的金额");
								return false;
							}else{
							var add=document.getElementById("addCharge");
							add.submit();
							}	
	})
	//获取学生列表
	$.ajax({		  
		type:'POST',  //请求类型
		url:'http://localhost:8080/school/ajax/getStu',
		dataType:'json',
		success: function(data){
			console.log(data);
			var data2= eval(data);
			for(var i in data2){
				$("#studentid").append(
				"<option value='"+data2[i].sid+"'>"+data2[i].sid+"-"+data2[i].sname+"</option>"
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
    <form class="form-horizontal" method="post" action="charge/addCharge" name="addCharge" id="addCharge">
  		<div class="form-group">
    			<label for="lunchName" class="control-label col-md-3">收费项目：</label>
                <div class="col-md-6"> 
                	<input class="form-control" type="text" name="chargeitem" id="chargeitem" /><span id="idSpan"></span>		                
                </div>
    	</div>
    	 <div class="form-group">
        		<label for="dateLabel" class="control-label col-md-3">需缴价格：</label>
                <div class="col-md-6">
        			<input class="form-control" type="text" name="price" id="price" onKeyPress="return event.keyCode>=48&&event.keyCode<=57" ng-pattern="/[^a-zA-Z]/" />				        		
                </div>
        </div>
    	<div class="form-group">
        		<label for="studentname" class="control-label col-md-3">需交费学生：</label>
                <div class="col-md-6">
        			<select name="studentid" id="studentid" class="form-control">
    					
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
