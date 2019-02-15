<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
    
    <title>My JSP 'link.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <link rel="stylesheet" href="../css/bootstrap.min.css">
 	<script type="text/javascript" src="../js/jquery-3.1.1.js"></script>
    <script type="text/javascript" src="../js/bootstrap.min.js"></script>
  <script type="text/javascript">
  $(document).ready(function(e) {
    $.ajax({
		type:'POST',  //请求类型
		url:'http://localhost:8080/school/ajax/getCls',
		dataType:'json',
		success: function(data){
			console.log(data);
			var data2= eval(data);
			for(var i in data2){
				$("#searchbyclass").append(
				"<li><a href='cls/clsInfo?id="+data2[i].id+"'>"+data2[i].classname+"</a></li>"
				);
			}
			},
		error:function(msg){}
		});
});
  </script>
   <style type="text/css">
        .dropdown-submenu {
            position: relative;
        }
        .dropdown-submenu > .dropdown-menu {
            top: 0;
            left: 100%;
            margin-top: -6px;
            margin-left: -1px;
            -webkit-border-radius: 0 6px 6px 6px;
            -moz-border-radius: 0 6px 6px;
            border-radius: 0 6px 6px 6px;
        }
        .dropdown-submenu:hover > .dropdown-menu {
            display: block;
        }
        .dropdown-submenu > a:after {
            display: block;
            content: " ";
            float: right;
            width: 0;
            height: 0;
            border-color: transparent;
            border-style: solid;
            border-width: 5px 0 5px 5px;
            border-left-color: #ccc;
            margin-top: 5px;
            margin-right: -10px;
        }
        .dropdown-submenu:hover > a:after {
            border-left-color: #fff;
        }
        .dropdown-submenu.pull-left {
            float: none;
        }
        .dropdown-submenu.pull-left > .dropdown-menu {
            left: -100%;
            margin-left: 10px;
            -webkit-border-radius: 6px 0 6px 6px;
            -moz-border-radius: 6px 0 6px 6px;
            border-radius: 6px 0 6px 6px;
        }
    </style>
</head>

<body>
	<div class="container">
	<div class="row clearfix">
		<div class="col-md-12 column">
			<nav class="navbar navbar-default" role="navigation">
            <div class="col-md-12">
             <a class="navbar-brand" href="index.jsp" id="logo">
             <h4>
             	启航幼儿园
             </h4>
                </a>
            </div>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                
					<ul class="nav navbar-nav">
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">学生与班级<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li>
									 <a href="stu/addStuUI">添加学生</a>
								</li>
								<li>
									 <a href="stu/stuList">学生列表</a>
								</li>
								<li class="dropdown-submenu">
                    				 <a tabindex="-1" href="javascript:;">按班级查询</a>
                    					<ul class="dropdown-menu" id="searchbyclass">
                        					<li><a tabindex="-1" href="javascript:;">班级</a></li>
                    					</ul>
                				</li>
								<li>
									 <a href="att/attList">学生缺勤信息</a>
								</li>
								<li class="divider">
								</li>
								<li>
									 <a href="cls/addClsUI">添加班级</a>
								</li>
								<li>
									<a href="cls/clsList">班级列表</a>
								</li>
								<li class="divider">
								</li>
								<li>
									<a href="cou/addCouUI">添加课程</a>
								</li>
								<li>
									 <a href="cou/couList">开设课程列表</a>
								</li>
							</ul>
						</li>
                        <li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">职工和部门<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li>
									 <a href="tes/addtesUI">添加职工</a>
								</li>
								<li>
									 <a href="tes/tesList">职工列表</a>
								</li>
								<li class="dropdown-submenu">
                    				 <a tabindex="-1" href="javascript:;">按部门查询</a>
                    					<ul class="dropdown-menu">
                        					<li><a tabindex="-1" href="javascript:;">部门</a></li>
                    					</ul>
                				</li>
								<li class="divider">
								</li>
								<li>
									<a href="dep/addDepUI">开设部门</a>
								</li>
								<li>
									 <a href="dep/depList">部门列表和部门详细信息</a>
								</li>
								
							</ul>
						</li>
						<li class="dropdown">
							 <a href="#" class="dropdown-toggle" data-toggle="dropdown">后勤与财务管理<strong class="caret"></strong></a>
							<ul class="dropdown-menu">
								<li>
									 <a href="lunch/addLunchUI">添加午餐信息</a>
								</li>
								<li>
									 <a href="lunch/lunchList">午餐详细列表</a>
								</li>
								<li class="divider">
								</li>
								<li>
									<a href="charge/addChargeUI">添加收费</a>
								</li>
								<li>
									<a href="charge/chargeList">收费列表</a>
								</li>
								
							</ul>
						</li>
					</ul>
					
					<ul class="nav navbar-nav navbar-right">
   				<% if(session.getAttribute("username")!=null){%>
                	<%if(session.getAttribute("username").equals("admin")){%>
                		
                		<li>
                		<a><%=session.getAttribute("username")%></a>
                		</li>
                		<li><a href="exit">退出</a></li>
                		<%}else{ %>
                		<li>
                		<a><%=session.getAttribute("username")%></a>
                		</li>
                		<li><a href="exit">退出</a></li>
                		<%} %>  
                 <!-- 显示登录 -->
                 <%}else{%>
                <li>
                	<a href="login.jsp">登录</a>
  				</li>
                <li>
   					<a href="regist.jsp">注册</a>
                <li>
                <%}%>
              </ul>
				</div>
				
			</nav>
		</div>
	</div>
</div>
</body>
</html>
