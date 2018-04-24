$(function(){
	$("#et").datagrid({
		url:contextPath+'/tree/getAllPage.do',
		striped:true,  //是否显示斑马线效果。
		loadMsg:'玩命加载中，稍等....',
		/*singleSelect:true,*/
		toolbar:"#tools",
		pagination:true, //是否使用分页
		rownumbers:true, //是否显示行号
		pageNumber:1, //当前页
		pageSize:5, //每页记录数
		fitColumns:true,
		pageList:[5,10,15,20], //可修改每页记录数
		columns:[[
		       {field:'id',title:'主键ID',width:100,align:'center',checkbox:true},
		       {field:'pid',title:'父ID',width:100,align:'center'},
		       {field:'name',title:'权限名称',width:100,align:'center'},
		       {field:'status',title:'是否冻结',width:100,align:'center',
		    	   formatter:function(value,row,index){
		    		  /* return value+"|"+row.id+"|"+index;*/
		    	/*	  if(value=="0"){
		    			  return "冻结";
		    		  }else if(value=="1"){
		    			  return "激活";
		    		  }*/
		    		  return value=="0"?"冻结":"激活";
		    	   }},
		       {field:'remark',title:'备注',width:100,align:'center'},
		       {field:'createTime',title:'最后修改时间',width:100,align:'center'}
		       ]]
	
	});
});
function addEt(){
	
}
function editEt(){
	
}
function removeEt(){
	var array = $("#et").datagrid("getSelections");
	if(array.length==0){
		$.messager.alert("警告","当前未选中任何信息");
	}
	var ids="";
	$.each(array,function(i,etoak){
		ids+=etoak.id+",";
	});
	if(array.length>0){
		$.messager.confirm("警告","你确定要删除所选员工信息么",function(r){
			if(r){
				$.post(contextPath+'/etoak/deleteEt.do',{ids:ids},function(data){
					if(data){
						$.messager.alert("提示","删除成功");
						$("#et").datagrid("reload");
					}else{
						$.messager.alert("提示","删除失败");
					}
				}
						
				);
			}
		},"json");
	}
}
