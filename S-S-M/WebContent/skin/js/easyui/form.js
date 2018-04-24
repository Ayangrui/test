$(function(){
	$("#username").textbox({
		required:true,
		width:100
	});
	$("#password").textbox({
		required:true,
		type:'password',
		width:100
	});
	$("#gender").combobox({
		url:contextPath+'/combobox/getGender.do',
		textField:'label',
		valueField:'value',
		panelHeight:80,
		width:100
	});
	
	$("#birthday").datebox({
		
	});

	$("#pic").filebox({
		buttonText: '选择文件',
		width:100	
	});
	$("#remark").textbox({
		multiline:true,
		width:180,
		heigth:200
	});
	
	

});
function save(){
	$("#form").form('submit',{
		url:contextPath+'/form/form.do',
		onSubmit:function(param){
			param.etoak = 'et1702';
			return $(this).form('validate');
		},
		success:function(data){
			var d = $.parseJSON(data);
			$.messager.alert('哈哈',d.success);
		}
	})
}

function reset(){
	$("#form").form("reset");
}