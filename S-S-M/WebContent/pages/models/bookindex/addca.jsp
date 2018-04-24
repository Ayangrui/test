<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>首页</title>

    <!-- Bootstrap -->
    <link href="<%=basePath %>skin/css/book/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
  	<form id="form" class="form-horizontal" 
  	          action="<%=basePath %>book/addCa_book.do" method="POST">
  		
		  <div class="form-group">
		    <label for="name" class="col-sm-2 control-label">类别名字:</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control"
		       id="name" name="name" placeholder="输入名字">
		      </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		      <button type="submit"  onclick="up()"
		       class="btn btn-primary">添加类别</button>
		    </div>
		  </div>
		  
		</form>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<%=basePath %>skin/css/bookjs/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%=basePath %>skin/css/bookjs/bootstrap.min.js"></script>
    <script type="text/javascript">

    /*
          添加类的controller层 
    */
    function up() {
    	 $("#form").submit();	
	   }
    </script>
  </body>
  
</html>