$(function(){
	$("#zc-dialog").dialog({
		title:'注册',
		width:550,
		height:470,
		modal:true
	});
	$("#zh").textbox({
		required:true,
		width:180
	});
	$("#sta").combobox({
		textField:'label',
		valueField:'value',
		data:[{
			label: '激活',
			value: '1'
		},{
			label: '冻结',
			value: '0'
		}],
		panelHeight:80
	});
});