$(function(){
	$("#et").tree({
		url:contextPath+'/tree/getNodes.do',
		animate:true,  //定义节点在展开或折叠的时候是否显示动画效果。
		lines:true,  //定义是否显示树控件上的虚线。
		queryParams:{
			etoak:"et1702"
		},
		onClick:function(node){
			alert(node.id+"|"+node.text);
			alert(node.m.url);
		}
		
	});
});