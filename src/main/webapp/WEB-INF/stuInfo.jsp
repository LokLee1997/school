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

  </head>
  
  <body>
  <div align="center" >
  	<div><label>学生学号:</label>${student.sid}</div>
    <div><label>学生姓名:</label>${student.sname}</div>
    <div><label>学生性别:</label>${student.ssex}</div>
    <div><label>出生日期:</label>${student.sbirthday}</div>
    <div><label>学生班级:</label>${student.classes.classname}</div>
    <div>
    	<c:forEach items="${cList}" var="c">
    	需缴纳费用:
    		<c:forEach items="${c.charge}" var="ch">
    			缴费项目:${ch.chargeitem}<br>
    			缴费金额:${ch.price }<br>
    			缴费状态:
    			<c:choose>
    				<c:when test="${ch.ispay=='0'}">
    					未缴费
    				</c:when>
    				<c:otherwise>
    					已缴费
    				</c:otherwise>
    			</c:choose>
    		</c:forEach>
    	</c:forEach>
    </div>
    <div>
    	<c:forEach items="${aList}" var="a">
    	缺勤记录：<br>
    	<c:forEach items="${a.attendances}" var="att">
    		<c:choose>
    				<c:when test="${att.state=='0'}">无故缺席</c:when>
    				<c:otherwise>请病假</c:otherwise>
    			</c:choose>
    			${att.date}
    	</c:forEach>
    	</c:forEach>
    </div>
   </div>
  </body>
</html>
