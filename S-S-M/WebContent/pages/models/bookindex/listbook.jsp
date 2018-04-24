<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();  //相对路径
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  //绝对路径
%>

<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>首页</title>

    <!-- Bootstrap -->
      <link href="../../../skin/css/book/bootstrap.min.css" rel="stylesheet">
	
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
		    <label for="categoryid" class="col-sm-2 control-label">书籍类别:</label>
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
  	
  			<button class="btn btn-primary"    id="oneid"   style=" height:40px;">
  		              总共<input class="btn btn-primary" id="rows" value="4"  readonly  style="width:30px; color:inherit; left:80px;"/>条/跳转到:
  		        <input id="tool"   type="number" style=" width:80px; left: 141px; " >页
  		        <input  class="btn btn-primary"    type='button' id="listall"  value='提交' />
  			</button>
  			
  			<button type='button'
  			 class="btn btn-primary" 
  			id="first">首页</button>
  			<button type='button'
  			 class="btn btn-primary" 
  			id="pre">上一页</button>
  			<button type='button'
  			 class="btn btn-primary" 
  			id="next" id="user">下一页</button>
  			<button type='button'
  			 class="btn btn-primary" 
  			id="end">尾页</button>
  			<button type='button'
  			 class="btn btn-primary" 
  			 id="all">总记录数</button>
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
			   method="POST"  >
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
    <script src="../../../skin/css/bookjs/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="../../../skin/css/bookjs/bootstrap.min.js"></script>
    <script src="../../../skin/css/bookjs/ajaxfileupload.js"></script>
    <script>
    	var bookid="";// 书籍的id 
    	function addpic(){
    		//异步上传
    		$.ajaxFileUpload({
    			type:"POST",
    			url:"addpic",
    			fileElementId:"pic",//上传控件的id
    			data:{
    				"bookid":bookid,
    				"category":category,
    				"datetime":datetime,
    				"name":name
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
    	
         /*function load(){
           debugger
    		$(window).attr("location","addlogin.jsp");	
    	 */
    	
    	var tj="";//存放条件
    	//条件查询
    	function queryByConditions(){
    		
    	   debugger
    		var name = $("#name").val();
    		var caid = $("#caid").val();
    		if(name!=null&& name!=""){
    			tj+="&name="+name;
    		}
    		if(caid!=null&& caid!="-1"){
    			tj+="&caid="+caid;
    		}
    						//&name=xxx
    		queryData(1,tj);
    	}
    	
	    var rows="";
    	var all="";  
    	//当页面加载的时候去加载的方法  tj就是放要给后台提供的数据去根据该数据去查询的
    	var pre,next,pageCount,total;
    	$(function(){
    		debugger
    				
    	/* 	$("#oneid").attr("color","display:display;"); */
    		//加载下拉菜单 类别
    	    /*queryAllCas(); */
   	 		queryData(1,tj);
    	   
    	    
    	    rows+="<div>" + total + " </div>"; 
    	    $("#rows").html(rows);
    	    
   	 	    all="<div>总记录数 " + total + "条 </div>";  
   	        $("#all").html(all); 
   	        
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
    		
    		/* 分页的搜索框 */
    		$("#listall").click(function(){
    		 debugger	
    		 var user= document.getElementById("tool").value;
    		 if(user>pageCount){ queryData(pageCount,tj);
    		      return;
    		   }
    		 if(user<1){ queryData(1,tj);
    			 return;
    		   }
    		  queryData(user,tj);
    			
    		});
    		
    	});
  
    	
    	
        /* 	
    	$(function(){
    		debugger
    		$("#oneid").attr("color","display:none;");
    		
    	});
    	 */
    	 
    	
    	
    	//获得的数据啊
    	function showdata(msg){//msg---->page{得到的page }
    	debugger
    		pre = msg.pre;
    		next = msg.next;
    		pageCount = msg.pageCount;
    		total=msg.total;
    		var trs="";    
    		$.each(msg.rows,function(i,book){
    		   /* var pdate = (book.publishdate.year+1900)+
    			"-"+(book.publishdate.month+1)+"-"+
    			(book.publishdate.date); */
    			trs+="<tr><td><input type='checkbox'/></td>"+
    			"<td>"+(msg.start+i+1)+"</td><td>"+book.name+"</td>"+
    			"<td>"+book.price+"</td><td>"+book.author+"</td>"+
    		    "<td>"+book.publishdate+"</td><td>"+book.bookcount+
    			"</td><td>"+(book.status=="1"?"上架":"下架")
    			+"</td><td>"+book.category+"</td><td><button type='button' "+
    			"class='btn btn-primary' "+	
    		    "onclick=\"queryById('"+book.id+"')\">删除</button></td></tr>";
    		 });
    		
    		     $("#data").html(trs);
    	   }
    	
    	
 
    	  // 模态框的按钮
    	    function queryById(bid){
             debugger
        	/* 当success:function 当中的参数为没有可以不写，或者去后台获取他的值 然后传值到前台  */	
    	  	 if(confirm("你确定要删除吗？")){ 
    	  		$.ajax({
        			type:"POST",
        			url:"<%=basePath %>book/delete_book.do",
        			data:"id="+bid,
        			dataType:"json",
        	     	async:false,
        			//contentType:'application/json;charset=UTF-8',  
        			 success: function(msg) {
        				 debugger
                        alert(msg.msg);
        			  window.location.reload(true);         				
                     },
                    error: function(){
                     window.location.reload(true);
                     alert("删除失败");
                     } 
                });
    	  	 }else{
    	  		 alert("取消成功!!!");
    	  	 }
		} 
    	
    	 
     	<%-- 
    	
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
    	
    	
    	function queryData(cp,conditions){
    		//url  currentPage=1&name=xxxx
    		$.post("<%=basePath %>book/queryAll_book.do",   
    			"currentPage="+cp+conditions, //data；；      + 就是拼接的字符串啊
    			  showdata,             // callback 是返回的函数时调用的方法function showdata(){}
    				"json");//`dataType
    	}
    	 --%>
   
    	 
    /* 加载数据 
            加载 2:queryData() 3: showdata()-->queryData()  当第一次加载的时候就会得到 total 等数据的 
     
    */
    function queryData(cp,conditions){
      
    		$.ajax({
    			type:"POST",
    			url:"<%=basePath %>book/queryAll_book.do",
    			data:"currentPage="+cp+conditions,
    			dataType:"json",
    	     	async:false,
    			//contentType:'application/json;charset=UTF-8',  
    			 success: function(result) {
    				 debugger
                     showdata(result);
                     
                 },
                 error: function(result){
                     alert("失败");
                 }
            });
       }
    	
    	
    	
    	/* 
    	//查询
    	function queryAllCas(){
    		debugger
    		$.ajax({
    			type:"POST",
    			url:"queryAllCas_book.action",
    			data:"",
    			dataType:"json",
    			success:function(msg){//msg---List<Category>
    				//控制台打印
    					console.log(msg); 
    				//
    				var ops="<option value='-1'>请选择</option>";
    				$.each(msg,function(i,ca){
    				  // 历史类 
    					ops+="<option value='"+ca.id
    					+"'>"+ca.name+"</option>";	
    				});
    				$("#categoryid").html(ops);
    				$("#categoryid1").html(ops);
    				$("#opsObject").html(opsObject);
    				
    			}
    		});
    	} */
    
    	var opsobject;
    	//加载数据
    	function queryAllCas(){
    		debugger
    		$.ajax({
    			type:"POST",
    			url:"queryAllCas_book222.action",
    			data:"",
    			dataType:"json",
    			success:function(msg){//msg---List<Category>
    				//控制台打印
    			/* 	console.log(msg);  */
    				
    				var ops="<option value='-1'>请选择</option>";
    				$.each(msg,function(i,ca){
    				    // 历史类 
    					ops+="<option value='"+ca.id
    						+"'>"+ca.name+"</option>";	
    					
    				 //拼接字符串	
    			     opsobjec+="<option  value='"+lisi+"'>"+age+"</option>";
    					
    				});
    				
    				
    				
    				$("#categoryid").html(ops);
    				$("#categoryid1").html(tj);
    				
    			}
    			
    		});
    	}
    	
    </script>
  </body>
</html>