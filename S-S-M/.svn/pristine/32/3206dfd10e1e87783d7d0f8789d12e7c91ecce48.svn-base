$(function(){
	$("#et").textbox({
		windth:180,
		height:50,
		prompt:'请输入信息',
		value:'et1702',
		iconCls:'icon-man',
		multiline:true,
		onChange : function(newValue,oldValue){
			console.log(newValue+" | "+oldValue);
		}
	});
	$("#et").textbox('setValue','易途');
});

//赋值
function set1(){
	$("#et").textbox('setValue','etoak');
}
//获取文本信息
function get1(){
	var v = $("#et").textbox('getValue');
	console.log(v);
}
//重置
function reset1(){
	$("#et").textbox('reset');
}
//设置只读
function readonly1(){
	$("#et").textbox('readonly');
}