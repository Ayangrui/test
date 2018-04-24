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
   <!--  <link href="../../../skin/css/book/bootstrap.min.css" rel="stylesheet"> -->
    <link href="<%=basePath%>skin/css/book/bootstrap.min.css" rel="stylesheet">
  </head>
  <body>
  	<!-- 文件上传:
  	页面: <form 
  				第一：method="POST"
  				第二：enctype="multipart/form-data"  >
  	文件上传: 
  		浏览器在请求头发送一个 分隔符：=====adfadfzzcvzvadfadfaf
  		将表单数据以分隔符分割开，以二进制方式发送到服务器
  		 Tomcat 接收请求，构造Request对象，不再解析具体数据
  		 setInputStream,
  		 【所以我们需要通过getInputStream方法获得客户端传递过来的数据
  		 我们自己获得分隔符，分割请求中的每一部分，获得普通参数和文件数据】
  		 我们将以上任务外包给第三方的文件上传的组件如smartupload\common-fileupload等
  		 	 
  	普通的表单提交：
  		浏览器 将表单数据 以key=value&key1=value1形式发送到服务器
  		
  	 -->
  	<form class="form-horizontal"  id="form"
  	action="<%=basePath %>book/addbook.do" method="POST" 
  	enctype="multipart/form-data">

		  <div class="form-group">
		    <label for="name" class="col-sm-2 control-label">书籍名字:</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control"
		       id="name" name="name" placeholder="书籍名字">
		    </div>
		  </div>
		  <!-- 作者 -->
		  <div class="form-group">
		    <label for="author" class="col-sm-2 control-label">书籍作者:</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control"
		       id="author" name="author" placeholder="书籍作者">
		    </div>
		  </div>
		  <!-- 所属类别 -->
		  <div class="form-group">
		    <label for="category" class="col-sm-2 control-label">所属类别:</label>
		    <div class="col-sm-10">
		      <select class="form-control"
		             id="category" name="category" ><!-- <option id="opi" value="55">历史类</option> -->
		      </select> 
		    </div>
		 </div>
		  <!-- 价格 -->
		  <div class="form-group">
		    <label for="price" class="col-sm-2 control-label">价格:</label>
		    <div class="col-sm-10">
		      <input type="number" class="form-control"
		       id="price" name="price" >
		    </div>
		  </div>
		  <!-- 出版日期 -->
		  <div class="form-group">
		    <label for="publishdate" class="col-sm-2 control-label">出版日期:</label>
		    <div class="col-sm-10">
		      <input type="date" class="form-control"
		       id="publishdate" name="publishdate">
		    </div>
		  </div>
		  <!-- 数量 -->
		  <div class="form-group">
		    <label for="bookcount" class="col-sm-2 control-label">书籍数量:</label>
		    <div class="col-sm-10">
		      <input type="number" class="form-control"
		       id="bookcount" name="bookcount" >
		    </div>
		  </div>
		  <!-- 状态 -->
		  <div class="form-group">
		    <label for="status" class="col-sm-2 control-label">状态:</label>
		    <div class="col-sm-10">
		      <select class="form-control"
		         id="status" name="status" >
		      	<option value="1">上架</option>
		      	<option value="0">下架</option> 
		      </select>
		    </div>
		  </div>
		    <!-- 图片 -->
		    <!--  <div class="form-group">
		   	<button type="button"
		   	 class="btn btn-primary" 
		     	onclick="addpic()">添加图片</button>
		    <div class="col-sm-10" id="pics">
		    </div>
		    </div> -->
		  
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		      <button type="submit" onclick="submit1()"
		       class="btn btn-primary">添加</button>
		    </div>
		  </div>
		</form>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="<%=basePath %>skin/css/bookjs/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="<%=basePath %>skin/css/bookjs/bootstrap.min.js"></script>
    
     <script>
    
     
     /* var i=0;
    	function addpic(){
    		var ss="请选择:<input type='file'"+
    	" name='pic'/><br>是否是封面:<input type='radio'"+
    	" name='fm' value='"+i+"'/>";
    		$("#pics").append(ss);
    		i++;
    	} */
   
    	
   //提交form表单	
   function submit1() {
	  $("#form").submit();
  } 	
    	
   /* 当页面第一次加载的时候取加载这个方法 */ 	
        $(function(){
          down();
    	});
    	
   /* 加载书籍类型 */
     function down() {
    	//  debugger
    		$.ajax({
    			type:"POST",
    			url:"<%=basePath %>book/ListAllCa.do",
    			data:"",
    			dataType:"json",
    			success:function(msg){//msg---List<Category>
    		    
    		    var ops="<option value='-1'>请选择</option>";
    		 	$.each(msg,function(i,ca){
    		      ops+="<option value='"+ca.id+"'>"+ca.name+"</option>";
    		    });
    		 	$("#category").html(ops);
    		 	
    		}
    	});
	}
    </script>
  </body>
</html>