<%@ page pageEncoding="utf-8"%>  

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>  
<html>  
<head>  
<meta charset="utf-8">  
<title>上传图片</title>  
</head>  
<body>  
      <form action="<%=basePath %>book/upload.do" method="post" enctype="multipart/form-data">  
      <input type="file" name="file" /> <input type="submit" value="Submit" /></form>  
</body>  
</html>  