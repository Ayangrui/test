$(function(){
	//登录窗口
	$("#login-dialog").dialog({
		title:'登录',

		buttons:[
		         {
			     	text:'登录',
			        iconCls:'icon-ok',
			        handler:function(){
			        $("#login-form").form('submit',{
			        	url:contextPath+'/login/login.do',
			        	onSubmit:function(param){
			        		return $(this).form('validate');
			        	},
			        	success:function(data){
			        		var json = $.parseJSON(data);
			        		if(json.code==200){
			        			window.location.href=contextPath+"/login/index.do";
			        		}else{
			        			$.messager.alert("错误",json.msg);
			        		}
			        	}
			        });
			       }
			      },
			      {
			    	  text:'取消',
			          iconCls:'icon-cancel',
			          handler:function(){
			          $("#login-form").form('reset');
			       }
			     },
			       {
			        	 text:'注册新账号',
			        	 iconCls:'icon-add',
			        	 handler:function(){
			        		dialog("add-dialog").dialog({
			        			title:'用户注册',
			        			width:450,
			        			height:350,
			        			href:contextPath+'/user/add-update',
			        			buttons:[
			        				      {
			        					text:'提交信息',
			        					iconCls:'icon-ok',
			        					handler:function(){
			        						$("#user-form").form('submit',{
			        							url:contextPath+"/user/add.do",
			        							onSubmit : function(param){
			        								return $(this).form("validate");
			        							},
			        							success : function(data){
			        								var json = $.parseJSON(data);
			        								$.messager.alert("提示","注册成功");
			        									
			        								if(json.code==200){
			        									$("#user-tab").datagrid("reload");
			        									$("#add-dialog").dialog("close");
			        								}
			        							}
			        						});
			        					}
			        				      },
			        				      {
			        						text:'取消',
			        						iconCls:'icon-cancel',
			        						handler:function(){
			        							$("#add-dialog").dialog("close");
			        						}
			        						
			        					  },
			        				  ]
			        		});
			        		 
			        	 }
			         }
		        ]
	});


	$("#login-user").textbox({
		required:true,
		width:180,
		iconCls:'icon-man'
	});
	$("#login-password").textbox({
		required:true,
		width:180,
		iconCls:'icon-lock',
		type:'password'
	});

});

function dialog(id){
	var objId  = $("#"+id);
	if(objId.size()>0){
		return objId;
	}
	var html_ = '<div id="'+id+'" data-options="modal:true,closed:false,cache:false"></div>';
	objId = $(html_).appendTo(document.body);
	return objId;
}