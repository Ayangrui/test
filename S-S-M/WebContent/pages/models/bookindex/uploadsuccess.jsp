<%@ page pageEncoding="utf-8"%>  
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>  
<html>  
<head>  
<meta charset="utf-8">  
<title>上传结果</title>  
</head>  
 <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<%=basePath %>skin/css/bookjs/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%=basePath %>skin/css/bookjs/bootstrap.min.js"></script>
<h3>fdfdfdffd</h3>
<body>  
 <img alt="" src="${fileUrl }" />  
</body>  
</html>  