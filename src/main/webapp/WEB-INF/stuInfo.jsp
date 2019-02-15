<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'stuInfo.jsp' starting page</title>
    
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
    <div class="container jumbotron well" style="background-color: #F0F0F0">
	<div class="row clearfix">
		<div class="col-md-8 col-md-offset-2 column">
		<div style="text-align: right"><a href="stu/updateStuUI?sid=${student.sid}"><input type="button" class="btn btn-default" value="更新学生信息"></a></div>
		<div style="background:#F0F0F0">
			<h4>
				<div style="width:33%; float: left;"><label>学生学号:${student.sid}</label>
    			<label>学生姓名:${student.sname}</label></div>
    			<div><label>学生性别:${student.ssex}</label><br>
    			<label>出生日期:${student.sbirthday}</label></div>
    			<div><label>学生班级:${student.classes.classname}</label></div>
    		</h4>
		</div>
		</div>
		</div>
		</div>
    	
	<div class="container jumbotron well ">
	<div class="row clearfix ">
    	<div class="col-md-8 col-md-offset-2 ">
			<div class="tabbable" id="tabs-39197">
				<ul class="nav nav-tabs">
					<li class="active">
						 <a href="#panel-575447" data-toggle="tab">缴费列表</a>
					</li>
					<li>
						 <a href="#panel-892090" data-toggle="tab">缺勤列表</a>
					</li>
					
				</ul>
				<div class="tab-content">
				<!-- 第一个 -->
				<div class="tab-pane active" id="panel-575447">
			<c:forEach items="${cList}" var="c">
			<table class="table table-hover">
				<thead>
					
					<tr>
						<th>缴费项目</th>
    					<th>需缴纳金额</th>
    					<th>是否缴纳</th>
    					
					</tr>
				</thead>
				<tbody>
    		<c:forEach items="${c.charge}" var="ch">
    			<tr>
    			<td>${ch.chargeitem}</td>
    			<td>${ch.price }</td>
    			<td>
    			<c:choose>
    				<c:when test="${ch.ispay=='0'}">
    					未缴费
    				</c:when>
    				<c:otherwise>
    					已缴费
    				</c:otherwise>
    			</c:choose>
    			</td>
    			
    		</c:forEach>
    		</tr>
				</tbody>
		</c:forEach>
			</table>
		</div>
					<!-- 第一个结束-->
					<div class="tab-pane" id="panel-892090">
						<!-- 第二个 -->
	
					
		
			<table class="table table-hover">
				<c:forEach items="${aList}" var="a">
				<thead>
					<tr>
						<th colspan="2">
							<a href="att/addAttUI?id=${student.sid}">添加缺勤信息</a>
						</th>
					</tr>
					<tr>
						<th>缺勤原因</th>
    					<th>日期</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${a.attendances}" var="att">
					<tr>
					<td>
    				<c:choose>
    				<c:when test="${att.state=='0'}">无故缺席</c:when>
    				<c:otherwise>请病假</c:otherwise>
    				</c:choose>
    				</td>
    				<td>
    				${att.date}
    				</td>
    				</tr>
    			</c:forEach>
				</tbody>
				</c:forEach>
			</table>
		</div>
	
		
				</div>
			</div>
		</div>
	</div>	

 
  </body>
</html>
