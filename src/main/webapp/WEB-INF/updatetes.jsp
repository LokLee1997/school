<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>更新教师信息</title>
    
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
  </head>
  
  <body>
    <div class="container">
  <div class="row row-centered"> 
  	<div class="col-md-6 col-md-offset-3 col-centered">
    <form class="form-horizontal" method="post" action="tes/updatetes" name="updatetes" id="updatetes">
  		<h2>更新教工信息</h2>
  		<input value="${teachers.tno}"  type="hidden" id="tno" name="tno">
  		<div class="form-group">
    			<label for="studentName" class="control-label col-md-3">职工姓名：</label>
                <div class="col-md-6"> 
                	<input class="form-control" type="text" value="${teachers.tname}" id="tname" name="tname"/>      
                </div>
                
    	</div>
    	 <div class="form-group">
        		<label for="itemLabel" class="control-label col-md-3">职工性别：</label>
                <div class="col-md-6">
        			<select name="tsex" class="form-control">
        				<option value="男">男</option>
        				<option value="女">女</option>
        			</select>			        		
                </div>
        </div>
    	<div class="form-group">
        		<label for="priceLabel" class="control-label col-md-3">出生日期：</label>
                <div class="col-md-6">
        			<input class="form-control" type="text"  value="${teachers.tbirthday}" id="tbirthday" name="tbirthday"/>				        			        		
                </div>
        </div>
       	<div class="form-group">
        		<label for="stateLabel" class="control-label col-md-3">所属部门：</label>
                <div class="col-md-6">
        			<select name="depart" class="form-control">
    					<option value="1">教育</option>
						<option value="2">后勤</option>
						<option value="3">行政</option>  
    				</select>		        		
                </div>
        </div>
        <div class="form-group">
        <div class="col-md-offset-4">
    			<input class="btn btn-info" type="submit" value="更新"/>
    			<input class="btn btn-info" type="reset" value="重置"/>
    	</div>
        </div>
        </form>
  </div>
  </div>
  </div>
  </body>
</html>
