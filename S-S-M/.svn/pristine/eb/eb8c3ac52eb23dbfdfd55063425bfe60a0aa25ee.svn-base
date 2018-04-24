$(function(){
	$.extend($.fn.validatebox.defaults.rules, {    
	    etoak: {    
	        validator: function(value, param){    
	            return value.length >= param[0];    
	        },    
	        message: '长度至少{0}位 !'   
	    }    
	});
	
	$("#et").validatebox({
		required:true,
		missingMessage:'请填写相应信息!',
		/*invalidMessage:'警告 : 请按照正确格式填写!',*/
		/*delay:2000*/
		validType:'etoak[5]'
	});
});