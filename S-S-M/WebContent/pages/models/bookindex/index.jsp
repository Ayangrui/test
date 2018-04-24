<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<!--加入的国际化吧  -->
<html lang="zh-cn">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>首页</title>

    <!-- 加入Bootstrap的Css  -->  
    <link href="../skin/css/book/bootstrap.min.css"  rel="stylesheet">
     
    <style> 
    	.page-header{
			padding-bottom:2px;
			margin:2px 0 0;    	
    	}
    	.navbar{
    		margin-bottom:2px;
    	}
    	.actionF{
          padding-top: 15px;
          padding-bottom: 15px;
        /*   background-color: #e7e7e7; */
    	}
    </style>
  </head>
  <body>
    <%--  <div class="col-sm-8">
			    
			    <!-- 加入的流动的横幅字体 -->
				 <iframe  src="<%=path %>/pages/models/bookindex/welcome.jsp" 
					 <iframe  src="<%=basePath %>pages/models/bookindex/welcome.jsp" 
				 width="100%" name="et"
				height="1000px" frameborder="0"></iframe>
			    </div> --%>
   	<!-- 页头 -->
   	<div class="page-header">   
  			<img src="<%=basePath %>skin/image/holle.jpg"  width="100%" height="300px"/> 
	</div>
	<!-- 导航条 -->
	<nav class="navbar navbar-default" role="navigation">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="#">书籍管理系统</a>
	    </div>
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	        <li class="active"><a href="#">首页</a></li>
	      </ul>
	        
	        <ul class="nav navbar-nav">
	         <li class="actionF" onclick="up()">上传</li>
	        
	        </ul>
	      <ul class="nav navbar-nav navbar-right">
	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown">更多 <span class="caret"></span></a>
	          <ul class="dropdown-menu" role="menu">
	            <li><a href="#">登陆</a></li>
	            <li class="divider"></li>
	            <li><a href="#">注册</a></li>
	          </ul>
	        </li>
	      </ul>`
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	<!-- main -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-4">
				<div class="list-group">
				  <a href="#" class="list-group-item active">
				        书籍管理系统
				  </a>
				  <if test="${addca.name}">
					  <a href="../pages/models/bookindex/addca.jsp"  target="et" class="list-group-item">添加类别</a>
					  <a href="../pages/models/bookindex/addbook.jsp" target="et" class="list-group-item">添加书籍</a>
					  <a href="../pages/models/bookindex/listbook.jsp" target="et" class="list-group-item">书籍列表</a>
				  </if>
				</div>
			    </div>
			    <div class="col-sm-8">
			    <%-- 
			      <!-- 加入的流动的横幅字体 -->
			   <iframe  src="<%=path %>/pages/models/bookindex/welcome.jsp"  --%>
		       
		       <iframe  src="<%=basePath %>pages/models/bookindex/welcome.jsp" 
				 width="100%" name="et"
				height="1000px" frameborder="0">
			  </iframe>
			    
			    </div>
		</div>
	</div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<%=basePath %>skin/css/bookjs/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%=basePath %>skin/css/bookjs/bootstrap.min.js">
    </script>
  </body>
  
  <script>
       /* 上传的控件 */
      function up(){
    	  debugger
    	  window.location.href="<%=basePath %>pages/models/bookindex/uploading.jsp";
      }
      
    
    
    </script>
</html>