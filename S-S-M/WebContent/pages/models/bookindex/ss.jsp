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
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
  	<!-- 查询区域 -->
  	<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
	  <div class="panel panel-default">
	    <div class="panel-heading" role="tab" id="headingOne">
	      <h4 class="panel-title">
	        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
	                  按条件查询
	        </a>
	      </h4>
	    </div>
	    <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
	      <div class="panel-body">
	        <form class="form-horizontal" role="form"
  	 method="POST">
  		
		  <div class="form-group">
		    <label for="name" class="col-sm-2 control-label">书籍名字:</label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control"
		       id="name" name="name" placeholder="输入名字">
		    </div>
		  </div>
		  <!-- 书籍类别 -->
		  <div class="form-group">
		    <label for="categoryid" class="col-sm-2 control-label">书籍名字:</label>
		    <div class="col-sm-10">
		      <select class="form-control"
		      id="categoryid" name="categoryid">
		       </select>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		      <button type="button"
		       class="btn btn-primary"
		       onclick="queryByConditions()">查询</button>
		    </div>
		  </div>
		</form>
	      </div>
	    </div>
	  </div>
	</div>
  	<!-- end -->
  		<table  
  		class="table table-bordered table-striped 
  		table-condensed table-hover">
  			<thead>
  				<tr>
  					<th>全选<input type='checkbox' 
  					id='checkall' /></th>
  					<th>编号</th>
  					<th>名字</th>
  					<th>价格</th>
  					<th>作者</th>
  					<th>出版日期</th>
  					<th>数量</th>
  					<th>状态</th>
  					<th>类别名字</th>
  					<th>操作</th>
  				</tr>
  			</thead>
  			<tbody id="data"></tbody>
  		</table>
  		<div style="text-align:center">
  			<button type='button'
  			 class="btn btn-primary" 
  			id="first">首页</button>
  			<button type='button'
  			 class="btn btn-primary" 
  			id="pre">上一页</button>
  			<button type='button'
  			 class="btn btn-primary" 
  			id="next">下一页</button>
  			<button type='button'
  			 class="btn btn-primary" 
  			id="end">尾页</button>
  		</div>
  	<!-- 模态框 -->
  	<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
		      </div>
		      <div class="modal-body">
		 <form class="form-horizontal" role="form"
			  	 method="POST" 
			  	>
			
					  <div class="form-group">
					    <label for="name" class="col-sm-2 control-label">书籍名字:</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control"
					       id="name1" name="name" placeholder="书籍名字">
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
					    <label for="categoryid" class="col-sm-2 control-label">所属类别:</label>
					    <div class="col-sm-10">
					      <select class="form-control"
					       id="categoryid1" name="categoryid" >
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
					   <div class="form-group">
					   请选择:<input type="file" name="pic" id="pic"/>
					   	<button type="button"
					   	 class="btn btn-primary" 
					   	onclick="addpic()">添加图片</button>
					   	
					    <div class="col-sm-10" id="pics">
					     
					    </div>
					  </div>
					  <div class="form-group">
					    <div class="col-sm-offset-2 col-sm-10">
					      <button type="submit"
					       class="btn btn-primary">添加</button>
					    </div>
					  </div>
					</form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary">Save changes</button>
		      </div>
		    </div>
		  </div>
		</div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/ajaxfileupload.js"></script>
    <script>
    	var bookid="";//
    	function addpic(){
    		//异步上传
    		$.ajaxFileUpload({
    			type:"POST",
    			url:"addpic",
    			fileElementId:"pic",//上传控件的id
    			data:{
    				"bookid":bookid
    			},
    			dataType:"json",
    			success:function(msg){
    				console.log(msg);
    				if(msg.flag=="success"){
    					//重新查询
    					queryById(bookid);
    				}
    			}
    		});
    	}
    	var tj="";//存放条件
    	//条件查询
    /* 	function queryByConditions(){
    		tj="";
    		var name = $("#name").val();
    		var caid = $("#caid").val();
    		if(name!=null&& name!=""){
    			tj+="&name="+name;
    		}
    		if(caid!=null&& caid!="-1"){
    			tj+="&caid="+caid;
    		}
    		alert(tj);
    					//&name=xxx
    		queryData(1,tj);
    	} */
    	var pre,next,pageCount;
    	$(function(){
    		//加载下拉菜单 类别
    		queryAllCas();
    		
    		queryData(1,tj);
    		///
    		$("#first").click(function(){
    			queryData(1,tj);
    		});
    		$("#pre").click(function(){
    			queryData(pre,tj);
    		});
    		$("#next").click(function(){
    			queryData(next,tj);
    		});
    		$("#end").click(function(){
    			queryData(pageCount,tj);
    		});
    		
    		
    	});
    	
    	
    	3333333333333333333333333333333333333333333333333
    	function showdata(msg){//msg---->page{}
    		console.log(msg);
    		pre = msg.pre;
    		next = msg.next;
    		pageCount = msg.pageCount;
    		
    		var trs="";
    		$.each(msg.rows,function(i,book){
    			var pdate = (book.publishdate.year+1900)+
    			"-"+(book.publishdate.month+1)+"-"+
    			(book.publishdate.date);
    			trs+="<tr><td><input type='checkbox'/></td>"+
    			"<td>"+(msg.start+i+1)+"</td><td>"+book.name+"</td>"+
    			"<td>"+book.price+"</td><td>"+book.author+"</td>"+
    		"<td>"+pdate+"</td><td>"+book.bookcount+
    			"</td><td>"+(book.status=="1"?"上架":"下架")
    			+"</td><td>"+book.category.name+"</td><td><button type='button' "+
    			"class='btn btn-primary' "+
    		"onclick=\"queryById('"+book.id+"')\">详情</button></td></tr>";
    		});
    		$("#data").html(trs);
    	}
    <%-- 	function queryById(bid){
    		//给全局的bookid赋值
    		bookid=bid;
    		$.post("book",
    			"method=queryBookById&id="+bid,
    				showinfo,
    				"json");
    	}
    	function showinfo(msg){//msg---->Book
    		console.log(msg);
    		$("#name1").val(msg.name);
    		$("#price").val(msg.price);
    		$("#author").val(msg.author);
    		$("#publishdate").val(msg.publishdate);
    		$("#status").val(msg.status);
    		$("#categoryid1").val(msg.categoryid);
    		$("#bookcount").val(msg.bookcount);
    		var pics="";
    		$.each(msg.bps,function(i,bp){
    			pics+="<div class='row'>"+
    	    	  "<div class='col-sm-6 col-md-4'>"+
    	    	    "<div class='thumbnail'>"+
    	    	      "<img src='<%=path%>"+bp.realpath+"' >"+
    	    	      "<div class='caption'>"+
    	    	      "<button type='button' class='btn btn-primary'>设置为封面</button>"+
    	    	      "<button type='button' class='btn btn-danger'>删除</button>"+
    	    	      "</div>"+
    	    	    "</div>"+
    	    	  "</div>"+
    	    	"</div>";
    		});
    		$("#pics").html(pics);
    		//显示模态框
    		$("#myModal").modal("show");
    	}
     --%>
    	
              2222222222222222222222222222222222222222222222222222222
    	function queryData(cp,conditions){
    		$.post("querySome_book.action",//url  currentPage=1&name=xxxx
    			"currentPage="+cp+conditions,//data
    			showdata,//callback
    				"json");//`dataType
    	}
    	function queryAllCas(){
    		$.ajax({
    			type:"POST",
    			url:"queryAllCas_book.action",
    			data:"",
    			dataType:"json",
    			success:function(msg){//msg---List<Category>
    				//控制台打印
    				console.log(msg);
    				var ops="<option value='-1'>请选择</option>";
    				$.each(msg,function(i,ca){
    							// 历史类 
    					ops+="<option value='"+ca.id
    					+"'>"+ca.name+"</option>";	
    				});
    				$("#categoryid").html(ops);
    				$("#categoryid1").html(ops);
    				
    			}
    			
    		});
    	}
    </script>
  </body>
</html>