$(function(){
	$("#user-tab").datagrid({
		url:contextPath+'/user/list.do',
		striped:true,
		loadMsg:'玩命加载中，请稍等....',
		pagination:true,
		rownumbers:true,
		pageNumber:1,
		pageSize:5,
		fitColumns:true,
		pageList:[5,10,15,20],
		toolbar:'#user-toolbar',
		columns:[[
		       {field:'id',title:'编号',width:100,align:'center',checkbox:true},
		       {field:'username',title:'用户名',width:100,align:'center'},
		       {field:'nickname',title:'昵称',width:100,align:'center'},
		       {field:'email',title:'邮箱',width:100,align:'center'},
		       {field:'tel',title:'电话',width:100,align:'center'},
		       {field:'status',title:'当前状态',width:100,align:'center',
		    	   formatter:function(value,row,index){
			    		  return value=="0"?"冻结":"激活";
			    }},
		       {field:'createTime',title:'创建时间',width:100,align:'center'}
		       ]]
	
	});
});



var obj = {
		query : function(){
				$("#user-tab").datagrid("load",{
					username:$("#queryByName").textbox("getValue")
				});
		},
	add : function(){
		dialog("add-dialog").dialog({
			title:'添加用户',
			width:450,
			height:350,
			href:contextPath+'/user/add-update',
			buttons:[
			       {
					text:'确认添加',
					iconCls:'icon-ok',
					handler:function(){
						$("#user-form").form('submit',{
							url:contextPath+"/user/add.do",
							onSubmit : function(param){
								return $(this).form("validate");
							},
							success : function(data){
								var json = $.parseJSON(data);
								$.messager.alert("提示",json.msg);
								
								if(json.code==200){
									$("#user-tab").datagrid("reload");
									$("#add-dialog").dialog("close");
									$("#add-dialog").dialog("clear");
								}
							}
						});
					}
			       },
			       {
						text:'重置',
						iconCls:'icon-cancel',
						handler:function(){
							$("#user-form").form('reset');
						}
					
				   },
			   ]
		});
	},
	update : function(){
		var rows = $("#user-tab").datagrid("getSelections");
		if(rows.length == 0){
			$.messager.alert("错误","当前未选中任何信息",'error');
			return;
		}
		if(rows.length>1){
			$.messager.alert("提示","只可对一条信息进行修改",'error');
			return;
		}
		var row = rows[0];
		
		dialog("update-dialog").dialog({
			title:'修改信息',
			width:450,
			height:350,
			href:contextPath+'/user/add-update?userId='+row.id,
			buttons:[
			       {
					text:'修改',
					iconCls:'icon-ok',
					handler:function(){
						/*this.doAdd();*/
						$("#user-form").form('submit',{
							url:contextPath+"/user/update.do",
							onSubmit : function(param){
								return $(this).form("validate");
							},
							success : function(data){
								var json = $.parseJSON(data);
								
								$.messager.alert("提示",json.msg);
								
								if(json.code==200){
									$("#user-tab").datagrid("reload");
									$("#update-dialog").dialog("close");
									$("#update-dialog").dialog("clear");
								}
							}
						});
					}
			       },
			       {
						text:'重置',
						iconCls:'icon-cancel',
						handler:function(){
							$("#user-form").form('clear');
						}
					
				   },
			   ]
		});
	},
	del : function(){
		var rows = $("#user-tab").datagrid("getSelections");
		if(rows.length == 0){
			$.messager.alert("错误","当前未选中任何信息",'error');
			return;
		}
		
		$.messager.confirm('提示', '确定删除这些信息？', function(r){
			if (r){
				var ids="";
				for(var i = 0;i<rows.length;i++){
					var row = rows[i];
					ids+=row.id+",";
				}
				//JSON.stringify(ids);  //JSON格式
				//ids.join(",");        //字符串格式
				$.ajax({
					url:contextPath+"/user/del.do",
					/*contentType:"application/json;charset=UTF-8",*/
					data:{ids:ids},
					type:"POST",
					/*dataType:"json",*/
					success:function(data){
						
						$.messager.alert("提示",data.msg);
						
						if(data.code==200){
							$("#user-tab").datagrid("reload");
						}
					}
				});
			}
		});
	},
	
	allotRole :function(){
		var rows = $("#user-tab").datagrid("getSelections");
		if(rows.length == 0){
			$.messager.alert("错误","当前未选中任何信息",'error');
			return;
		}
		if(rows.length>1){
			$.messager.alert("提示","只可对一个用户进行分配角色",'error');
			return;
		}
		var row = rows[0];
		
		dialog().dialog({
			title:"对"+row.username+"进行角色分配",
			width:450,
			height:300,
			href:contextPath+"/user/getRole?userId="+row.id,
			buttons : [
			           	{
			           		text:'分配角色',
			           		iconCls:'icon-ok',
			           		handler:function(){
			           			//获取选中的角色
			           			var trees = $("#userRoleTree").tree("getChecked");
			           			//*****拿取选中节点的id 将一个数组中的元素转换到另一个数组中
			           			var data = $.map(trees,function(tree){
			           				return tree.id;
			           			});
			           			//发送请求
			           			$.ajax({
			           				url : contextPath+"/user/allotRole/"+row.id,
			           				contentType : "application/json;charset=UTF-8",
			           				data : JSON.stringify(data),
			           				type : "POST",
			           				dataType : "json",
			           				success : function(data){
			           					$.messager.alert("提示",data.msg);
			           					
			           					if(data.code == 200){
			           						$("#allotRole").dialog("close");
			           					}
			           					
			           				}
			           			});
			           			
			           		}
			           	}
			          ]
		
		});
		
		
		
		
		
		
		
		
		
		
		
		
	}
	
	
	
	
	
	
	
	
};

function dialog(id){
	var objId  = $("#"+id);
	if(objId.size()>0){
		return objId;
	}
	var html_ = '<div id="'+id+'" data-options="modal:true,closed:false,cache:false"></div>';
	objId = $(html_).appendTo(document.body);
	return objId;
}
