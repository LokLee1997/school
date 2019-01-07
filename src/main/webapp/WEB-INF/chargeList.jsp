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
    
    <title>收费列表</title>
    
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
	<div class="row clearfix">
		<div class="col-md-8 col-md-offset-2 column">
		<h2>收费表</h2>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>学生学号</th>
    		<th>学生名字</th>
    		<th>收费项目</th>
    		<th>收费金额</th>
    		<th>收费状态</th>
    		<th>操作</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var="charge">
    	<tr>
    		<td>${charge.student.sid }</td>
    		<td><a href="stu/stuInfo?sid=${charge.student.sid}"">${charge.student.sname}</a></td>
    		<td>${charge.chargeitem}</td>
    		<td>${charge.price}</td>
    		<td>
    				<c:choose>
    				<c:when test="${charge.ispay=='0'}">
    					未缴费
    				</c:when>
    				<c:otherwise>
    					已缴费
    				</c:otherwise>
    			</c:choose>
    				
    		
    		</td>
    		<td>
    		<c:if test="${charge.ispay=='0'}">
    			<a href="charge/updateChargeState?id=${charge.id}">确认缴费</a>
    		 </c:if>	
    		 	<a href="charge/updateChargeUI?id=${charge.id}">更新</a>
    			<a href="charge/deleteCharge?id=${charge.id}">删除</a>
    		</td>
    	</tr>
    </c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
  </body>
</html>
